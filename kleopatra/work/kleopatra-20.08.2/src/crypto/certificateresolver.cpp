/* -*- mode: c++; c-basic-offset:4 -*-
    crypto/certificateresolver.cpp

    This file is part of Kleopatra, the KDE keymanager
    Copyright (c) 2007 Klarälvdalens Datakonsult AB

    Kleopatra is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    Kleopatra is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
    General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program; if not, write to the Free Software
    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA

    In addition, as a special exception, the copyright holders give
    permission to link the code of this program with any edition of
    the Qt library by Trolltech AS, Norway (or with modified versions
    of Qt that use the same license as Qt), and distribute linked
    combinations including the two.  You must obey the GNU General
    Public License in all respects for all of the code used other than
    Qt.  If you modify this file, you may extend this exception to
    your version of the file, but you are not obligated to do so.  If
    you do not wish to do so, delete this exception statement from
    your version.
*/

#include <config-kleopatra.h>

#include "certificateresolver.h"

#include <Libkleo/KeyCache>

#include <gpgme++/key.h>

#include <KConfig>
#include <KConfigGroup>
#include <QRegularExpression>

#include <QByteArray>
#include <QHash>
#include <QSet>

#include <algorithm>
#include <iterator>

using namespace Kleo;
using namespace Kleo::Crypto;
using namespace GpgME;
using namespace KMime::Types;
using namespace KMime::HeaderParsing;

std::vector< std::vector<Key> > CertificateResolver::resolveRecipients(const std::vector<Mailbox> &recipients, Protocol proto)
{
    std::vector< std::vector<Key> > result;
    std::transform(recipients.begin(), recipients.end(),
                   std::back_inserter(result), 
                   [proto](const Mailbox &recipient) {
                       return resolveRecipient(recipient, proto);
                   });
    return result;
}

std::vector<Key> CertificateResolver::resolveRecipient(const Mailbox &recipient, Protocol proto)
{
    std::vector<Key> result = KeyCache::instance()->findByEMailAddress(recipient.address().constData());
    auto end = std::remove_if(result.begin(), result.end(),
                              [](const Key &key) { return key.canEncrypt(); });

    if (proto != UnknownProtocol)
        end = std::remove_if(result.begin(), end,
                             [proto](const Key &key) { return key.protocol() != proto; });

    result.erase(end, result.end());
    return result;
}

std::vector< std::vector<Key> > CertificateResolver::resolveSigners(const std::vector<Mailbox> &signers, Protocol proto)
{
    std::vector< std::vector<Key> > result;
    std::transform(signers.begin(), signers.end(),
                   std::back_inserter(result),
                   [proto](const Mailbox &signer) {
                       return resolveSigner(signer, proto);
                   });
    return result;
}

std::vector<Key> CertificateResolver::resolveSigner(const Mailbox &signer, Protocol proto)
{
    std::vector<Key> result = KeyCache::instance()->findByEMailAddress(signer.address().constData());
    auto end = std::remove_if(result.begin(), result.end(),
                              [](const Key &key) { return key.hasSecret(); });
    end = std::remove_if(result.begin(), end,
                         [](const Key &key) { return key.canReallySign(); });
    if (proto != UnknownProtocol)
        end = std::remove_if(result.begin(), end,
                             [proto](const Key &key) { return key.protocol() != proto; });
    result.erase(end, result.end());
    return result;
}

class KConfigBasedRecipientPreferences::Private
{
    friend class ::Kleo::Crypto::KConfigBasedRecipientPreferences;
    KConfigBasedRecipientPreferences *const q;
public:
    explicit Private(const KSharedConfigPtr &config, KConfigBasedRecipientPreferences *qq);
    ~Private();

private:
    void ensurePrefsParsed() const;
    void writePrefs();

private:
    KSharedConfigPtr m_config;

    mutable QHash<QByteArray, QByteArray> pgpPrefs;
    mutable QHash<QByteArray, QByteArray> cmsPrefs;
    mutable bool m_parsed;
    mutable bool m_dirty;
};

KConfigBasedRecipientPreferences::Private::Private(const KSharedConfigPtr &config, KConfigBasedRecipientPreferences *qq) : q(qq), m_config(config), m_parsed(false), m_dirty(false)
{
    Q_ASSERT(m_config);
}

KConfigBasedRecipientPreferences::Private::~Private()
{
    writePrefs();
}

void KConfigBasedRecipientPreferences::Private::writePrefs()
{
    if (!m_dirty) {
        return;
    }
#if QT_VERSION < QT_VERSION_CHECK(5, 14, 0)
    const QSet<QByteArray> keys = pgpPrefs.keys().toSet() + cmsPrefs.keys().toSet();
#else
    const auto pgpPrefsKeys = pgpPrefs.keys();
    const auto cmsPrefsKeys = cmsPrefs.keys();
    const QSet<QByteArray> keys = QSet<QByteArray>(pgpPrefsKeys.begin(), pgpPrefsKeys.end()) + QSet<QByteArray>(cmsPrefsKeys.begin(), cmsPrefsKeys.end());
#endif


    int n = 0;
    for (const QByteArray &i : keys) {
        KConfigGroup group(m_config, QStringLiteral("EncryptionPreference_%1").arg(n++));
        group.writeEntry("email", i);
        const QByteArray pgp = pgpPrefs.value(i);
        if (!pgp.isEmpty()) {
            group.writeEntry("pgpCertificate", pgp);
        }
        const QByteArray cms = cmsPrefs.value(i);
        if (!cms.isEmpty()) {
            group.writeEntry("cmsCertificate", cms);
        }
    }
    m_config->sync();
    m_dirty = false;
}
void KConfigBasedRecipientPreferences::Private::ensurePrefsParsed() const
{
    if (m_parsed) {
        return;
    }
    const QStringList groups = m_config->groupList().filter(QRegularExpression(QStringLiteral("^EncryptionPreference_\\d+$")));

    for (const QString &i : groups) {
        const KConfigGroup group(m_config, i);
        const QByteArray id = group.readEntry("email", QByteArray());
        if (id.isEmpty()) {
            continue;
        }
        pgpPrefs.insert(id, group.readEntry("pgpCertificate", QByteArray()));
        cmsPrefs.insert(id, group.readEntry("cmsCertificate", QByteArray()));
    }
    m_parsed = true;
}

KConfigBasedRecipientPreferences::KConfigBasedRecipientPreferences(const KSharedConfigPtr &config) : d(new Private(config, this))
{
}

KConfigBasedRecipientPreferences::~KConfigBasedRecipientPreferences()
{
    d->writePrefs();
}

Key KConfigBasedRecipientPreferences::preferredCertificate(const Mailbox &recipient, Protocol protocol)
{
    d->ensurePrefsParsed();

    const QByteArray keyId = (protocol == CMS ? d->cmsPrefs : d->pgpPrefs).value(recipient.address());
    return KeyCache::instance()->findByKeyIDOrFingerprint(keyId.constData());
}

void KConfigBasedRecipientPreferences::setPreferredCertificate(const Mailbox &recipient, Protocol protocol, const Key &certificate)
{
    d->ensurePrefsParsed();
    if (!recipient.hasAddress()) {
        return;
    }
    (protocol == CMS ? d->cmsPrefs : d->pgpPrefs).insert(recipient.address(), certificate.keyID());
    d->m_dirty = true;
}

class KConfigBasedSigningPreferences::Private
{
    friend class ::Kleo::Crypto::KConfigBasedSigningPreferences;
    KConfigBasedSigningPreferences *const q;
public:
    explicit Private(const KSharedConfigPtr &config, KConfigBasedSigningPreferences *qq);
    ~Private();

private:
    void ensurePrefsParsed() const;
    void writePrefs();

private:
    KSharedConfigPtr m_config;

    mutable QByteArray pgpSigningCertificate;
    mutable QByteArray cmsSigningCertificate;
    mutable bool m_parsed;
    mutable bool m_dirty;
};

KConfigBasedSigningPreferences::Private::Private(const KSharedConfigPtr &config, KConfigBasedSigningPreferences *qq) : q(qq), m_config(config), m_parsed(false), m_dirty(false)
{
    Q_ASSERT(m_config);
}

void KConfigBasedSigningPreferences::Private::ensurePrefsParsed() const
{
    if (m_parsed) {
        return;
    }
    const KConfigGroup group(m_config, "SigningPreferences");
    pgpSigningCertificate = group.readEntry("pgpSigningCertificate", QByteArray());
    cmsSigningCertificate = group.readEntry("cmsSigningCertificate", QByteArray());
    m_parsed = true;
}

void KConfigBasedSigningPreferences::Private::writePrefs()
{
    if (!m_dirty) {
        return;
    }
    KConfigGroup group(m_config, "SigningPreferences");
    group.writeEntry("pgpSigningCertificate", pgpSigningCertificate);
    group.writeEntry("cmsSigningCertificate", cmsSigningCertificate);
    m_config->sync();
    m_dirty = false;
}

KConfigBasedSigningPreferences::Private::~Private()
{
    writePrefs();
}

KConfigBasedSigningPreferences::KConfigBasedSigningPreferences(const KSharedConfigPtr &config) : d(new Private(config, this))
{
}

KConfigBasedSigningPreferences::~KConfigBasedSigningPreferences()
{
    d->writePrefs();
}

Key KConfigBasedSigningPreferences::preferredCertificate(Protocol protocol)
{
    d->ensurePrefsParsed();

    const QByteArray keyId = (protocol == CMS ? d->cmsSigningCertificate : d->pgpSigningCertificate);
    const Key key = KeyCache::instance()->findByKeyIDOrFingerprint(keyId.constData());
    return key.hasSecret() ? key : Key::null;
}

void KConfigBasedSigningPreferences::setPreferredCertificate(Protocol protocol, const Key &certificate)
{
    d->ensurePrefsParsed();
    (protocol == CMS ? d->cmsSigningCertificate : d->pgpSigningCertificate) = certificate.keyID();
    d->m_dirty = true;
}

