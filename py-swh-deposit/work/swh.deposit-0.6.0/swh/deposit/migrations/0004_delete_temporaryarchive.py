# -*- coding: utf-8 -*-
# Generated by Django 1.10.7 on 2017-10-18 09:03
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ("deposit", "0003_temporaryarchive"),
    ]

    operations = [
        migrations.DeleteModel(name="TemporaryArchive",),
    ]
