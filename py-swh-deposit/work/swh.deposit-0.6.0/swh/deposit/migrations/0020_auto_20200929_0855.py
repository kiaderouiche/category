# -*- coding: utf-8 -*-
# Generated by Django 1.11.23 on 2020-09-29 08:55
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ("deposit", "0019_auto_20200519_1035"),
    ]

    operations = [
        migrations.RenameField(
            model_name="deposit", old_name="swh_id", new_name="swhid",
        ),
        migrations.RenameField(
            model_name="deposit", old_name="swh_id_context", new_name="swhid_context",
        ),
    ]
