from datetime import date

from django.core.exceptions import ValidationError
from django.db import models


# Create your models here.

# Task 1 - Zoo Animals
class Animal(models.Model):
    name = models.CharField(max_length=100)
    species = models.CharField(max_length=100)
    birth_date = models.DateField()
    sound = models.CharField(max_length=100)

    # Task 6 - Animal's age
    @property
    def age(self):
        return (date.today() - self.birth_date).days // 365

# Task 1 - Zoo Animals
class Mammal(Animal):
    fur_color = models.CharField(max_length=50)

# Task 1 - Zoo Animals
class Bird(Animal):
    wing_span = models.DecimalField(max_digits=5, decimal_places=2)

# Task 1 - Zoo Animals
class Reptile(Animal):
    scale_type = models.CharField(max_length=50)


# Task 2 - Zoo Employees
class Employee(models.Model):
    class Meta:
        abstract = True

    first_name = models.CharField(max_length=50)
    last_name = models.CharField(max_length=50)
    phone_number = models.CharField(max_length=10)

# Task 2 - Zoo Employees
class ZooKeeper(Employee):
    class SpecialityChoices(models.TextChoices):
        MAMMALS = "Mammals", "Mammals"
        BIRDS = "Birds", "Birds"
        REPTILES = "Reptiles", "Reptiles"
        OTHERS = "Others", "Others"

    specialty = models.CharField(max_length=10, choices=SpecialityChoices)
    managed_animals = models.ManyToManyField(Animal)

    # Task 4 - Zookeeper's Speciality
    def clean(self):
        if self.specialty not in self.SpecialityChoices:
            raise ValidationError("Specialty must be a valid choice.")

# Task 7 - Veterinarian Availability
class BooleanChoiceField(models.BooleanField):
    def __init__(self, *args, **kwargs):
        kwargs['choices'] = [
            (True, 'Available'),
            (False, 'Not Available')
        ]
        kwargs['default'] = True
        super(BooleanChoiceField, self).__init__(*args, **kwargs)

# Task 2 - Zoo Employees
class Veterinarian(Employee):
    license_number = models.CharField(max_length=10)

    # Task 7 - Veterinarian Availability
    availability = BooleanChoiceField()


# Task 3 - Animal Display System
class ZooDisplayAnimal(Animal):
    class Meta:
        proxy = True

    # Task 5 - Animal Display System Logic
    def display_info(self):
        return f"Meet {self.name}! Species: {self.species}, born {self.birth_date}. It makes a noise like '{self.sound}'."

    def is_endangered(self):
        if self.species in ["Cross River Gorilla", "Orangutan", "Green Turtle"]:
            return f"{self.species} is at risk!"
        return f"{self.species} is not at risk."
