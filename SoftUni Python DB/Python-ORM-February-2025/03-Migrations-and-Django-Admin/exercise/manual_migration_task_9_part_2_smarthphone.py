# Generated by Django 5.0.4 on 2025-03-01 16:10

from django.db import migrations

# Task 9 - part 2
def set_category(apps, schema_editor):
    smartphone_model = apps.get_model('main_app', 'Smartphone')
    smartphones = smartphone_model.objects.all()

    for phone in smartphones:
        phone.category = 'Expensive' if phone.price >= 750 else 'Cheap'
        phone.save()

def default_category(apps, schema_editor):
    smartphone_model = apps.get_model('main_app', 'Smartphone')
    smartphones = smartphone_model.objects.all()

    for phone in smartphones:
        phone.category = 'No category'
        phone.save()

class Migration(migrations.Migration):

    dependencies = [
        ('main_app', '0014_auto_20250301_1804'),
    ]

    operations = [
        migrations.RunPython(set_category, reverse_code=default_category),
    ]
