# -*- coding: utf-8 -*-
# Generated by Django 1.11.23 on 2020-05-19 10:35
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ("deposit", "0018_migrate_swhids"),
    ]

    operations = [
        migrations.RemoveField(model_name="deposit", name="swh_anchor_id",),
        migrations.RemoveField(model_name="deposit", name="swh_anchor_id_context",),
    ]
