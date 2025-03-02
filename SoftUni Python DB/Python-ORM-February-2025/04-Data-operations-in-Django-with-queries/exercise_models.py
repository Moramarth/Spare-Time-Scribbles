from django.db import models
from django.db.models import PositiveIntegerField


# Create your models here.
# Task 1
class Pet(models.Model):
    name = models.CharField(max_length=40)
    species = models.CharField(max_length=40)


# Task 2
class Artifact(models.Model):
    name = models.CharField(max_length=70)
    origin = models.CharField(max_length=70)
    age = PositiveIntegerField()
    description = models.TextField()
    is_magical = models.BooleanField(default=False)


# Task 3
class Location(models.Model):
    name = models.CharField(max_length=100)
    region = models.CharField(max_length=50)
    population = models.PositiveIntegerField()
    description = models.TextField()
    is_capital = models.BooleanField(default=False)


# Task 4
class Car(models.Model):
    model = models.CharField(max_length=40)
    year = models.PositiveIntegerField()
    color = models.CharField(max_length=40)
    price = models.DecimalField(decimal_places=2, max_digits=10, default=0)
    price_with_discount = models.DecimalField(decimal_places=2, max_digits=10, default=0)


# Task 5
class Task(models.Model):
    title = models.CharField(max_length=25)
    description = models.TextField()
    due_date = models.DateField()
    is_finished = models.BooleanField(default=False)


# Task 6
class HotelRoom(models.Model):
    class RoomTypeChoices(models.TextChoices):
        STANDARD = 'Standard', 'Standard'
        DELUXE = 'Deluxe', 'Deluxe'
        SUITE = 'Suite', 'Suite'

    room_number = models.PositiveIntegerField()
    room_type = models.CharField(max_length=10, choices=RoomTypeChoices)
    capacity = models.PositiveIntegerField()
    amenities = models.TextField()
    price_per_night = models.DecimalField(decimal_places=2, max_digits=10)
    is_reserved = models.BooleanField(default=False)


# Task 7
class Character(models.Model):
    class ClassNameChoices(models.TextChoices):
        MAGE = 'Mage', 'Mage'
        WARRIOR = 'Warrior', 'Warrior'
        ASSASSIN = 'Assassin', 'Assassin'
        SCOUT = 'Scout', 'Scout'
        FUSION = 'Fusion', 'Fusion'

    name = models.CharField(max_length=100)
    class_name = models.CharField(max_length=20, choices=ClassNameChoices)
    level = models.PositiveIntegerField()
    strength = models.PositiveIntegerField()
    dexterity = models.PositiveIntegerField()
    intelligence = models.PositiveIntegerField()
    hit_points = models.PositiveIntegerField()
    inventory = models.TextField()
