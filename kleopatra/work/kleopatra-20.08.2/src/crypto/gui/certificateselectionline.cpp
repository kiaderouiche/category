/*  crypto/gui/certificateselectionline.cpp

    This file is part of Kleopatra, the KDE keymanager
    Copyright (c) 2009 Klarälvdalens Datakonsult AB
                  2016 by Bundesamt für Sicherheit in der Informationstechnik
    Software engineering by Intevation GmbH

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
#include "certificateselectionline.h"

#include <QToolButton>
#include <QLabel>
#include <QStackedWidget>
#include <QComboBox>
#include <QStylePainter>
#include <QStyleOptionComboBox>
#include <QStyle>

#include "utils/kleo_assert.h"

#include <KLocalizedString>

#include <Libkleo/Formatting>
#include <Libkleo/Predicates>

using namespace Kleo;
using namespace GpgME;

Q_DECLARE_METATYPE(GpgME::Key)

namespace
{

static QString make_initial_text(const std::vector<Key> &keys)
{
    if (keys.empty()) {
        return i18n("(no matching certificates found)");
    } else {
        return i18n("Please select a certificate");
    }
}

// A QComboBox with an initial text (as known from web browsers)
//
// only works with read-only QComboBoxen, doesn't affect sizeHint
// as it should...
//
class ComboBox : public QComboBox
{
    Q_OBJECT
    Q_PROPERTY(QString initialText READ initialText WRITE setInitialText)
    Q_PROPERTY(QIcon initialIcon READ initialIcon WRITE setInitialIcon)
public:
    explicit ComboBox(QWidget *parent = nullptr)
        : QComboBox(parent),
          m_initialText(),
          m_initialIcon()
    {

    }

    explicit ComboBox(const QString &initialText, QWidget *parent = nullptr)
        : QComboBox(parent),
          m_initialText(initialText),
          m_initialIcon()
    {

    }

    explicit ComboBox(const QIcon &initialIcon, const QString &initialText, QWidget *parent = nullptr)
        : QComboBox(parent),
          m_initialText(initialText),
          m_initialIcon(initialIcon)
    {

    }

    QString initialText() const
    {
        return m_initialText;
    }
    QIcon initialIcon() const
    {
        return m_initialIcon;
    }

public Q_SLOTS:
    void setInitialText(const QString &txt)
    {
        if (txt == m_initialText) {
            return;
        }
        m_initialText = txt;
        if (currentIndex() == -1) {
            update();
        }
    }
    void setInitialIcon(const QIcon &icon)
    {
        if (icon.cacheKey() == m_initialIcon.cacheKey()) {
            return;
        }
        m_initialIcon = icon;
        if (currentIndex() == -1) {
            update();
        }
    }

protected:
    void paintEvent(QPaintEvent *) override
    {
        QStylePainter p(this);
        p.setPen(palette().color(QPalette::Text));
        QStyleOptionComboBox opt;
        initStyleOption(&opt);
        p.drawComplexControl(QStyle::CC_ComboBox, opt);

        if (currentIndex() == -1)
        {
            opt.currentText = m_initialText;
            opt.currentIcon = m_initialIcon;
        }
        p.drawControl(QStyle::CE_ComboBoxLabel, opt);
    }

private:
    QString m_initialText;
    QIcon m_initialIcon;
};
} // anonymous namespace

class Kleo::KeysComboBox : public ComboBox
{
    Q_OBJECT
public:
    explicit KeysComboBox(QWidget *parent = nullptr)
        : ComboBox(parent) {}
    explicit KeysComboBox(const QString &initialText, QWidget *parent = nullptr)
        : ComboBox(initialText, parent) {}
    explicit KeysComboBox(const std::vector<Key> &keys, QWidget *parent = nullptr)
        : ComboBox(make_initial_text(keys), parent)
    {
        setKeys(keys);
    }

    void setKeys(const std::vector<Key> &keys)
    {
        clear();
        for (const Key &key : keys) {
            addItem(Formatting::formatForComboBox(key), QVariant::fromValue(key));
        }
    }

    std::vector<Key> keys() const
    {
        std::vector<Key> result;
        result.reserve(count());
        for (int i = 0, end = count(); i != end; ++i) {
            result.push_back(qvariant_cast<Key>(itemData(i)));
        }
        return result;
    }

    int findOrAdd(const Key &key)
    {
        for (int i = 0, end = count(); i != end; ++i)
            if (_detail::ByFingerprint<std::equal_to>()(key, qvariant_cast<Key>(itemData(i)))) {
                return i;
            }
        insertItem(0, Formatting::formatForComboBox(key), QVariant::fromValue(key));
        return 0;
    }

    void addAndSelectCertificate(const Key &key)
    {
        setCurrentIndex(findOrAdd(key));
    }

    Key currentKey() const
    {
        return qvariant_cast<Key>(itemData(currentIndex()));
    }

};

CertificateSelectionLine::CertificateSelectionLine(const QString &toFrom, const QString &mailbox, const std::vector<Key> &pgp, bool pgpAmbig, const std::vector<Key> &cms, bool cmsAmbig, QWidget *q, QGridLayout &glay)
        : pgpAmbiguous(pgpAmbig),
          cmsAmbiguous(cmsAmbig),
          mToFromLB(new QLabel(toFrom, q)),
          mMailboxLB(new QLabel(mailbox, q)),
          mSbox(new QStackedWidget(q)),
          mPgpCB(new KeysComboBox(pgp, mSbox)),
          mCmsCB(new KeysComboBox(cms, mSbox)),
          noProtocolCB(new KeysComboBox(i18n("(please choose between OpenPGP and S/MIME first)"), mSbox)),
          mToolTB(new QToolButton(q))
{
    QFont bold;
    bold.setBold(true);
    mToFromLB->setFont(bold);

    mMailboxLB->setTextFormat(Qt::PlainText);
    mToolTB->setText(i18n("..."));

    mPgpCB->setEnabled(!pgp.empty());
    mCmsCB->setEnabled(!cms.empty());
    noProtocolCB->setEnabled(false);

    mPgpCB->setKeys(pgp);
    if (pgpAmbiguous) {
        mPgpCB->setCurrentIndex(-1);
    }

    mCmsCB->setKeys(cms);
    if (cmsAmbiguous) {
        mCmsCB->setCurrentIndex(-1);
    }

    mSbox->addWidget(mPgpCB);
    mSbox->addWidget(mCmsCB);
    mSbox->addWidget(noProtocolCB);
    mSbox->setCurrentWidget(noProtocolCB);

    const int row = glay.rowCount();
    int col = 0;
    glay.addWidget(mToFromLB,  row, col++);
    glay.addWidget(mMailboxLB, row, col++);
    glay.addWidget(mSbox,    row, col++);
    glay.addWidget(mToolTB,    row, col++);
    Q_ASSERT(col == NumColumns);

    q->connect(mPgpCB, SIGNAL(currentIndexChanged(int)), SLOT(slotCompleteChanged()));
    q->connect(mCmsCB, SIGNAL(currentIndexChanged(int)), SLOT(slotCompleteChanged()));
    q->connect(mToolTB, SIGNAL(clicked()), SLOT(slotCertificateSelectionDialogRequested()));
}

QString CertificateSelectionLine::mailboxText() const
{
    return mMailboxLB->text();
}

void CertificateSelectionLine::addAndSelectCertificate(const Key &key) const
{
    if (KeysComboBox *const cb = comboBox(key.protocol())) {
        cb->addAndSelectCertificate(key);
        cb->setEnabled(true);
    }
}

void CertificateSelectionLine::showHide(Protocol proto, bool &first, bool showAll, bool op) const
{
    if (op && (showAll || wasInitiallyAmbiguous(proto))) {

        mToFromLB->setVisible(first);
        first = false;

        QFont font = mMailboxLB->font();
        font.setBold(wasInitiallyAmbiguous(proto));
        mMailboxLB->setFont(font);

        mSbox->setCurrentIndex(proto);

        mMailboxLB->show();
        mSbox->show();
        mToolTB->show();
    } else {
        mToFromLB->hide();
        mMailboxLB->hide();
        mSbox->hide();
        mToolTB->hide();
    }

}

bool CertificateSelectionLine::wasInitiallyAmbiguous(Protocol proto) const
{
    return (proto == OpenPGP && pgpAmbiguous)
           || (proto == CMS     && cmsAmbiguous);
}

bool CertificateSelectionLine::isStillAmbiguous(Protocol proto) const
{
    kleo_assert(proto == OpenPGP || proto == CMS);
    const KeysComboBox *const cb = comboBox(proto);
    return cb->currentIndex() == -1;
}

Key CertificateSelectionLine::key(Protocol proto) const
{
    kleo_assert(proto == OpenPGP || proto == CMS);
    const KeysComboBox *const cb = comboBox(proto);
    return cb->currentKey();
}

const QToolButton *CertificateSelectionLine::toolButton() const
{
    return mToolTB;
}

void CertificateSelectionLine::kill()
{
    delete mToFromLB;
    delete mMailboxLB;
    delete mSbox;
    delete mToolTB;
}

KeysComboBox *CertificateSelectionLine::comboBox(Protocol proto) const
{
    if (proto == OpenPGP) {
        return mPgpCB;
    }
    if (proto == CMS) {
        return mCmsCB;
    }
    return nullptr;
}

#include "certificateselectionline.moc"
