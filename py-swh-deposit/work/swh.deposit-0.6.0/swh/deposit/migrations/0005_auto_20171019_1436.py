# -*- coding: utf-8 -*-
# Generated by Django 1.10.7 on 2017-10-19 14:36
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ("deposit", "0004_delete_temporaryarchive"),
    ]

    operations = [
        migrations.AlterField(
            model_name="deposit",
            name="status",
            field=models.TextField(
                choices=[
                    ("partial", "partial"),
                    ("expired", "expired"),
                    ("ready-for-checks", "ready-for-checks"),
                    ("ready", "ready"),
                    ("rejected", "rejected"),
                    ("injecting", "injecting"),
                    ("success", "success"),
                    ("failure", "failure"),
                ],
                default="partial",
            ),
        ),
    ]
