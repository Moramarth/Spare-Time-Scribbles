from django.db import models


# Create your models here.

# Predetermined - Task 3
class ChessPlayer(models.Model):
    username = models.CharField(max_length=100, unique=True)
    title = models.CharField(max_length=100, default="no title")
    rating = models.PositiveIntegerField(default=1500)
    games_played = models.PositiveIntegerField(default=0)
    games_won = models.PositiveIntegerField(default=0)
    games_lost = models.PositiveIntegerField(default=0)
    games_drawn = models.PositiveIntegerField(default=0)


# Predetermined - Task 4
class Meal(models.Model):
    MEAL_TYPE_CHOICES = (
        ('Breakfast', 'Breakfast'),
        ('Lunch', 'Lunch'),
        ('Dinner', 'Dinner'),
        ('Snack', 'Snack'),
    )

    name = models.CharField(max_length=100)
    meal_type = models.CharField(max_length=10, choices=MEAL_TYPE_CHOICES)
    preparation_time = models.CharField(max_length=30)
    difficulty = models.PositiveIntegerField()
    calories = models.PositiveIntegerField()
    chef = models.CharField(max_length=100)


# Predetermined - Task 5
class Dungeon(models.Model):
    DIFFICULTY_CHOICES = (
        ('Easy', 'Easy'),
        ('Medium', 'Medium'),
        ('Hard', 'Hard'),
    )

    name = models.CharField(max_length=100)
    difficulty = models.CharField(max_length=10, choices=DIFFICULTY_CHOICES)
    location = models.CharField(max_length=100)
    boss_name = models.CharField(max_length=100)
    recommended_level = models.PositiveIntegerField()
    boss_health = models.PositiveIntegerField()
    reward = models.TextField()


# Predetermined - Task 6
class Workout(models.Model):
    WORKOUT_TYPE_CHOICES = (
        ('Cardio', 'Cardio'),
        ('Strength', 'Strength'),
        ('Yoga', 'Yoga'),
        ('CrossFit', 'CrossFit'),
        ('Calisthenics', 'Calisthenics'),
    )

    name = models.CharField(max_length=200)
    workout_type = models.CharField(max_length=20, choices=WORKOUT_TYPE_CHOICES)
    duration = models.CharField(max_length=30)
    difficulty = models.CharField(max_length=50)
    calories_burned = models.PositiveIntegerField()
    instructor = models.CharField(max_length=100)


# Task 1
class ArtworkGallery(models.Model):
    artist_name = models.CharField(max_length=100)
    art_name = models.CharField(max_length=100)
    rating = models.IntegerField()
    price = models.DecimalField(max_digits=10, decimal_places=2)


# Task 2
class Laptop(models.Model):
    class BrandChoices(models.TextChoices):
        ASUS = "Asus", "Asus"
        ACER = "Acer", "Acer"
        APPLE = "Apple", "Apple"
        LENOVO = "Lenovo", "Lenovo"
        DELL = "Dell", "Dell"

    class OSChoices(models.TextChoices):
        WINDOWS = "Windows", "Windows"
        MACOS = "MacOS", "MacOS"
        LINUX = "Linux", "Linux"
        CHROME_OS = "Chrome OS", "Chrome OS"

    brand = models.CharField(max_length=20, choices=BrandChoices)
    processor = models.CharField(max_length=100)
    memory = models.PositiveIntegerField(help_text="Memory in GB")
    storage = models.PositiveIntegerField(help_text="Storage in GB")
    operation_system = models.CharField(max_length=20, choices=OSChoices)
    price = models.DecimalField(max_digits=10, decimal_places=2)
