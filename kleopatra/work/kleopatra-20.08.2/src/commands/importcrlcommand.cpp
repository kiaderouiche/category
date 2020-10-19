/* -*- mode: c++; c-basic-offset:4 -*-
    commands/importcrlcommand.cpp

    This file is part of Kleopatra, the KDE keymanager
    Copyright (c) 2008 Klarälvdalens Datakonsult AB

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

#include "importcrlcommand.h"

#include "command_p.h"

#include "utils/gnupg-helper.h"

#include <QString>
#include <QByteArray>
#include <QTimer>
#include <QFileDialog>
#include <QProcess>

#include <KLocalizedString>

static const int PROCESS_TERMINATE_TIMEOUT = 5000; // milliseconds

using namespace Kleo;
using namespace Kleo::Commands;

class ImportCrlCommand::Private : Command::Private
{
    friend class ::Kleo::Commands::ImportCrlCommand;
    ImportCrlCommand *q_func() const
    {
        return static_cast<ImportCrlCommand *>(q);
    }
public:
    explicit Private(ImportCrlCommand *qq, KeyListController *c);
    ~Private();

    QString errorString() const
    {
        return stringFromGpgOutput(errorBuffer);
    }

private:
    void init();
#ifndef QT_NO_FILEDIALOG
    QStringList getFileNames()
    {
        // loadcrl can only work with DER encoded files
        //   (verified with dirmngr 1.0.3)
        const QString filter = QStringLiteral("%1 (*.crl *.arl *-crl.der *-arl.der)").arg(i18n("Certificate Revocation Lists, DER encoded"));
        return QFileDialog::getOpenFileNames(parentWidgetOrView(), i18n("Select CRL File to Import"),
                                             QString(), filter);
    }
#endif // QT_NO_FILEDIALOG

private:
    void slotProcessFinished(int, QProcess::ExitStatus);
    void slotProcessReadyReadStandardError();

private:
    QStringList files;
    QProcess process;
    QByteArray errorBuffer;
    bool canceled;
    bool firstRun;
};

ImportCrlCommand::Private *ImportCrlCommand::d_func()
{
    return static_cast<Private *>(d.get());
}
const ImportCrlCommand::Private *ImportCrlCommand::d_func() const
{
    return static_cast<const Private *>(d.get());
}

#define d d_func()
#define q q_func()

ImportCrlCommand::Private::Private(ImportCrlCommand *qq, KeyListController *c)
    : Command::Private(qq, c),
      files(),
      process(),
      errorBuffer(),
      canceled(false),
      firstRun(true)
{
    process.setProgram (gpgSmPath());
    process.setArguments(QStringList() <<
                         QStringLiteral("--call-dirmngr") <<
                         QStringLiteral("loadcrl"));
}

ImportCrlCommand::Private::~Private() {}

ImportCrlCommand::ImportCrlCommand(KeyListController *c)
    : Command(new Private(this, c))
{
    d->init();
}

ImportCrlCommand::ImportCrlCommand(QAbstractItemView *v, KeyListController *c)
    : Command(v, new Private(this, c))
{
    d->init();
}

ImportCrlCommand::ImportCrlCommand(const QStringList &files, KeyListController *c)
    : Command(new Private(this, c))
{
    d->init();
    d->files = files;
}

ImportCrlCommand::ImportCrlCommand(const QStringList &files, QAbstractItemView *v, KeyListController *c)
    : Command(v, new Private(this, c))
{
    d->init();
    d->files = files;
}

void ImportCrlCommand::Private::init()
{
    connect(&process, SIGNAL(finished(int,QProcess::ExitStatus)),
            q, SLOT(slotProcessFinished(int,QProcess::ExitStatus)));
    connect(&process, SIGNAL(readyReadStandardError()),
            q, SLOT(slotProcessReadyReadStandardError()));
}

ImportCrlCommand::~ImportCrlCommand() {}

void ImportCrlCommand::setFiles(const QStringList &files)
{
    d->files = files;
}

void ImportCrlCommand::doStart()
{

#ifndef QT_NO_FILEDIALOG
    if (d->files.empty()) {
        d->files = d->getFileNames();
    }
#endif // QT_NO_FILEDIALOG
    if (d->files.empty()) {
        Q_EMIT canceled();
        d->finished();
        return;
    }

    auto args = d->process.arguments();
    if (!d->firstRun) {
        /* remove the last file */
        args.pop_back();
    }
    args << d->files.takeFirst();

    d->process.setArguments(args);

    d->process.start();

    d->firstRun = false;

    if (!d->process.waitForStarted()) {
        d->error(i18n("Unable to start process dirmngr. "
                      "Please check your installation."),
                 i18n("Clear CRL Cache Error"));
        d->finished();
    }
}

void ImportCrlCommand::doCancel()
{
    d->canceled = true;
    if (d->process.state() != QProcess::NotRunning) {
        d->process.terminate();
        QTimer::singleShot(PROCESS_TERMINATE_TIMEOUT, &d->process, &QProcess::kill);
    }
}

void ImportCrlCommand::Private::slotProcessFinished(int code, QProcess::ExitStatus status)
{
    if (!canceled) {
        if (status == QProcess::CrashExit)
            error(i18n("The GpgSM process that tried to import the CRL file "
                       "ended prematurely because of an unexpected error. "
                       "Please check the output of gpgsm --call-dirmngr loadcrl <filename> for details."),
                  i18n("Import CRL Error"));
        else if (code)
            error(i18n("An error occurred while trying to import the CRL file. "
                       "The output from gpgsm was:\n%1", errorString()),
                  i18n("Import CRL Error"));
        else if (files.empty())
            information(i18n("CRL file imported successfully."),
                        i18n("Import CRL Finished"));
    }
    if (!files.empty()) {
        q->doStart();
        return;
    }
    finished();
}

void ImportCrlCommand::Private::slotProcessReadyReadStandardError()
{
    errorBuffer += process.readAllStandardError();
}

#undef d
#undef q

#include "moc_importcrlcommand.cpp"
