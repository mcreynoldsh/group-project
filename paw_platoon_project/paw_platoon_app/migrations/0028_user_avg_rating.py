# Generated by Django 4.0.6 on 2022-08-29 22:11

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('paw_platoon_app', '0027_rating'),
    ]

    operations = [
        migrations.AddField(
            model_name='user',
            name='avg_rating',
            field=models.PositiveSmallIntegerField(blank=True, default=0),
        ),
    ]
