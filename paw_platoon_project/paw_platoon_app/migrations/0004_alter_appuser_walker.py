# Generated by Django 4.0.6 on 2022-08-07 16:39

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('paw_platoon_app', '0003_alter_pet_owner'),
    ]

    operations = [
        migrations.AlterField(
            model_name='appuser',
            name='walker',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='paw_platoon_app.walker'),
        ),
    ]
