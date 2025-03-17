import os
from datetime import timedelta, date

import django

# Set up Django
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "orm_skeleton.settings")
django.setup()

# Import your models here
from main_app.models import Author, Book, Song, Artist, Product, Review, DrivingLicense, Driver, Owner, Registration, \
    Car


# Create queries within functions

# Task 1 - Library
def show_all_authors_with_their_books():
    authors = Author.objects.all().order_by("id")

    output = list()
    for a in authors:
        books = a.book_set.all()
        if len(books) == 0:
            continue
        author_info = f"{a.name} has written - {', '.join(b.title for b in books)}!"
        output.append(author_info)

    return "\n".join(output)


def delete_all_authors_without_books():
    Author.objects.filter(book=None).delete()


# Task 2 - Music App
def add_song_to_artist(artist_name: str, song_title: str):
    artist = Artist.objects.get(name=artist_name)
    song = Song.objects.get(title=song_title)

    artist.songs.add(song)


def get_songs_by_artist(artist_name: str):
    artist = Artist.objects.get(name=artist_name)
    return artist.songs.all().order_by("-id")


def remove_song_from_artist(artist_name: str, song_title: str):
    artist = Artist.objects.get(name=artist_name)
    song = Song.objects.get(title=song_title)

    artist.songs.remove(song)


# Task 3 - Shop
def calculate_average_rating_for_product_by_name(product_name: str):
    reviews = Product.objects.get(name=product_name).reviews.all()
    return sum(r.rating for r in reviews) / len(reviews)


def get_reviews_with_high_ratings(threshold: int):
    return Review.objects.filter(rating__gte=threshold)


def get_products_with_no_reviews():
    return Product.objects.filter(reviews__isnull=True).order_by("-name")


def delete_products_without_reviews():
    Product.objects.filter(reviews__isnull=True).delete()


# Task 4 - License
def calculate_licenses_expiration_dates():
    licenses = DrivingLicense.objects.all().order_by("-license_number")
    output = list()
    for l in licenses:
        output.append(f"License with number: {l.license_number} expires on {l.issue_date + timedelta(days=365)}!")
    return "\n".join(output)


def get_drivers_with_expired_licenses(due_date: date):
    issue_date_to_expire = due_date - timedelta(days=365)
    return Driver.objects.filter(license__issue_date__lt=issue_date_to_expire)


# Task 5 - Car Registration
def register_car_by_owner(owner: Owner):
    registration = Registration.objects.filter(car__isnull=True).first()
    car = Car.objects.filter(registration__isnull=True).first()

    registration.registration_date = date.today()

    car.owner = owner
    car.registration = registration

    registration.save()
    car.save()

    return f"Successfully registered {car.model} to {owner.name} with registration number {registration.registration_number}."

