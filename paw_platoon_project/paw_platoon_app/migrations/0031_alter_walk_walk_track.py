# Generated by Django 4.0.6 on 2022-08-30 17:21

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('paw_platoon_app', '0030_alter_walk_walk_track'),
    ]

    operations = [
        migrations.AlterField(
            model_name='walk',
            name='walk_track',
            field=models.JSONField(blank=True, default=dict),
        ),
    ]
