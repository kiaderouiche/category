"""Package containing tools to notify in various ways.
"""

import typing
import logging

import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText


class BasicNotifier:
    """Basic notifier.

Sub-classes should inherit and implement `send` method
    """

    def __init__(self, config):
        self.config = config

    def send(self, subject: str, msg: str):
        """Send a message using the notifier.

        :param subject:  String subject (one line summary)

        :param msg:  String message to send.

        ~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-

        PURPOSE:  Basic send message. Sub-classes must override.

        """
        raise NotImplementedError


class EchoNotifier(BasicNotifier):
    """Sub-class of notifier to just print to stdout.
    """

    def send(self, subject: str, msg: str):
        logging.debug('Using notifier %s', str(self))
        print('%s\n%s' % (subject, msg))


class LogInfoNotifier(BasicNotifier):
    """Sub-class of notifier to use logging.info to notify.
    """

    def send(self, subject: str, msg: str):
        logging.debug('Using notifier %s', str(self))
        logging.info('%s\n%s', subject, msg)


class EmailNotifier(BasicNotifier):
    """Sub-class of notifier to send messages via email.
    """

    def send(self, subject, msg):
        hits = 0
        email_to = self.config.get_config_for('OX_UPDATE_EMAIL_TO').split(',')
        email_from = self.config.get_config_for('OX_UPDATE_EMAIL_FROM')
        profile = self.config.get_config_for('OX_UPDATE_SES_PROFILE', True)
        if profile is not None:
            self.send_via_ses(subject, msg, profile, email_to, email_from)
            hits += 1
        gmail_passwd = self.config.get_config_for(
            'OX_UPDATE_GMAIL_PASSWD', True)
        if gmail_passwd:
            self.send_via_gmail(subject, msg, gmail_passwd, email_to,
                                email_from)
            hits += 1
        if not hits:
            raise ValueError('Could not notify via email; no credentials')

    def send_via_gmail(self, subject: str, msg: str,
                       gmail_passwd: str, email_to: typing.List[str],
                       email_from: str):
        """Send email using gmail as a realy.

        :param subject:    String subject to send.

        :param msg:        String message to send.

        :param gmail_passwd:   String gmail password for email_from account.

        :param email_to:       List of strings to send email to.

        :param email_from:     String gmail account we send from.

        ~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-

        PURPOSE:   Send email using gmail as SMTP relay.

        """
        logging.debug('Notifying from send_via_gmail: %s', str(self))
        gmail_msg = MIMEMultipart()
        gmail_msg['From'] = email_from
        gmail_msg['To'] = ', '.join(email_to)
        gmail_msg['Subject'] = subject
        gmail_msg.attach(MIMEText(msg))

        server = smtplib.SMTP('smtp.gmail.com', 587)
        server.starttls()
        server.login(email_from, gmail_passwd)
        server.sendmail(gmail_msg['From'], gmail_msg['To'],
                        gmail_msg.as_string())

    def send_via_ses(self, subject: str, msg: str, profile_name: str,
                     email_to: typing.List[str], email_from: str, **kwargs):
        """Send email using AWS SES.

        :param subject:    String subject to send.

        :param msg:        String message to send.

        :param profile_name:  AWS profile name to use.

        :param email_to:       List of strings to send email to.

        :param email_from:     String gmail account we send from.

        ~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-

        PURPOSE:   Send email using AWS SES.

        """
        logging.debug('Notifying from send_via_ses: %s', str(self))
        try:
            import boto3
        except Exception as problem:  # pylint: disable=broad-except
            logging.error('Unable to import boto3: %s\nIs boto3 installed?',
                          str(problem))
            raise
        dev = boto3.Session(profile_name=profile_name, **kwargs)
        client = dev.client('ses')
        result = client.send_email(Destination={
            'ToAddresses': email_to}, Message={
                'Body': {'Text':
                         {'Data': msg}},
                'Subject': {'Data': subject}}, Source=email_from)
        assert result is not None


# Dictionary of notifier names and corresponding classes.
# Should only be used by make_notifier.
_NDICT = {
    'echo': EchoNotifier,
    'email': EmailNotifier,
    'loginfo': LogInfoNotifier
}


def make_notifier(ntype: str, config) -> BasicNotifier:
    """Make instance of BasicNotifier for given ntype.

    :param ntype:    String in _NDICT indicating notifier type (e.g.,
                     'echo' or 'email').

    :param config:   Instance of checker config.

    ~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-

    :return:  Instance of BasicNotifier for given ntype.

    ~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-

    PURPOSE:  Create notifier based on string type.

    """
    ncls = _NDICT[ntype]
    obj = ncls(config)
    return obj
