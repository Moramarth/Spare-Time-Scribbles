from django.db import models


# Create your models here.

# Task 1 - Library
class Author(models.Model):
    name = models.CharField(max_length=40)


class Book(models.Model):
    title = models.CharField(max_length=40)
    price = models.DecimalField(max_digits=5, decimal_places=2)
    author = models.ForeignKey(Author, on_delete=models.CASCADE)


# Task 2 - Music App
class Song(models.Model):
    title = models.CharField(max_length=100, unique=True)


class Artist(models.Model):
    name = models.CharField(max_length=100, unique=True)
    songs = models.ManyToManyField(Song, related_name='artists')


# Task 3 - Shop
class Product(models.Model):
    name = models.CharField(max_length=100, unique=True)


class Review(models.Model):
    description = models.TextField(max_length=200)
    rating = models.PositiveSmallIntegerField()
    product = models.ForeignKey(Product, on_delete=models.CASCADE, related_name='reviews')


# Task 4 - License
class Driver(models.Model):
    first_name = models.CharField(max_length=50)
    last_name = models.CharField(max_length=50)


class DrivingLicense(models.Model):
    license_number = models.CharField(max_length=10, unique=True)
    issue_date = models.DateField()
    driver = models.OneToOneField(
        Driver,
        on_delete=models.CASCADE,
        related_name='license'
    )


# Task 5 - Car Registration
class Owner(models.Model):
    name = models.CharField(max_length=50)


class Car(models.Model):
    model = models.CharField(max_length=50)
    year = models.PositiveIntegerField()
    owner = models.ForeignKey(Owner, on_delete=models.CASCADE, related_name='cars', null=True, blank=True)


class Registration(models.Model):
    registration_number = models.CharField(max_length=10, unique=True)
    registration_date = models.DateField(null=True, blank=True)
    car = models.OneToOneField(Car, on_delete=models.CASCADE, related_name='registration', null=True, blank=True)
