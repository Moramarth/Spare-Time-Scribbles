import os
import django
from django.db.models import QuerySet

# Set up Django
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "orm_skeleton.settings")
django.setup()

# Import your models
from main_app.models import Author, Book, Review


# Create and check models
def add_records_to_database():
    authors = [
        Author(first_name="John", last_name="Smith", birth_date="1980-05-15", nationality="American"),
        Author(first_name="Jane", last_name="Johnson", nationality="British",
               biography="Jane Johnson is a renowned fantasy writer, famous for her epic fantasy series."),
        Author(first_name="Michael", last_name="Brown", birth_date="1990-02-10",
               biography="Michael Brown is a science fiction author with a passion for space exploration."),
        Author(first_name="Sarah", last_name="Lee", nationality="Australian",
               biography="Sarah Lee is a best-selling author of romantic novels."),
        Author(first_name="Maria", last_name="Garcia",
               biography="Maria Garcia is a poet and writer, celebrated for her lyrical style."),
        Author(first_name="Emily", last_name="White", birth_date="1992-03-12", nationality="American",
               biography="Emily White is a young adult fiction author, known for her coming-of-age stories."),
        Author(first_name="Laura", last_name="Hall", birth_date="1982-08-04", nationality="American"),
        Author(first_name="John", last_name="Grisham", birth_date="1955-02-08", nationality="American"),
        Author(first_name="John", last_name="Steinbeck",
               biography="John Steinbeck was a renowned American author, famous for his classic novels."),
        Author(first_name="Robert", last_name="Miller", birth_date="1970-12-18", nationality="British",
               biography="Robert Miller is a historical fiction writer, often exploring medieval themes."),
    ]

    books = [
        Book(title="The Mystery of the Lost Key", author="John Smith", publication_year=2010, genre="Mystery",
             language="English", page_count=320),
        Book(title="Fantasy World: The Quest Begins", author="Jane Johnson", publication_year=2005, genre="Fantasy",
             language="English", page_count=450),
        Book(title="The Red Planet Expedition", author="Michael Brown", publication_year=2021, genre="Science Fiction",
             language="English", page_count=280),
        Book(title="The Alchemist", author="Paulo Coelho", publication_year=1988, genre="Fiction",
             language="Portuguese", page_count=197),
        Book(title="Pride and Prejudice", author="Jane Austen", publication_year=1813, genre="Romance"),
        Book(title="Love in Paris", author="Sarah Lee", publication_year=2012, genre="Romance", language="English",
             page_count=280),
        Book(title="Poems of the Heart", author="Maria Garcia", publication_year=2008, genre="Poetry",
             language="Spanish", page_count=120),
        Book(title="Soulful Verses", author="Maria Garcia", publication_year=2015, genre="Poetry", language="Spanish",
             page_count=150),
        Book(title="Whispers in the Wind", author="Maria Garcia", publication_year=2018, genre="Poetry",
             language="Spanish", page_count=180),
        Book(title="The Enigmatic Riddle", author="John Smith", publication_year=2013, genre="Mystery",
             language="English", page_count=320),
        Book(title="Murder in the Mansion", author="Jane Johnson", publication_year=2016, genre="Mystery",
             language="English", page_count=380),
        Book(title="The Magic Kingdom", author="Alice Roberts", publication_year=2019, genre="Fantasy",
             language="English", page_count=420),
        Book(title="To Kill a Mockingbird", author="Harper Lee", publication_year=2022, language="English"),
        Book(title="1984", author="Anonymous Writer", publication_year=2021, language="English", page_count=300),
    ]

    reviews = [
        Review(reviewer_name="Alice Johnson", book_title="The Mystery of the Lost Key", author_name="John Smith",
               rating=5, comment="A thrilling mystery that kept me guessing until the end."),
        Review(reviewer_name="Bob Wilson", book_title="Fantasy World: The Quest Begins", author_name="Jane Johnson",
               rating=4, comment="A captivating fantasy world with well-developed characters."),
        Review(reviewer_name="Alice Johnson", book_title="Fantasy World: The Quest Begins", author_name="Jane Johnson",
               rating=5, comment="A magical adventure that transported me to another world."),
        Review(reviewer_name="Samuel White", book_title="To Kill a Mockingbird", author_name="Harper Lee", rating=5,
               comment="An absolute classic that explores important themes with depth and compassion."),
        Review(reviewer_name="Alice Johnson", book_title="To Kill a Mockingbird", author_name="Harper Lee", rating=4),
        Review(reviewer_name="Alice Johnson", book_title="Love in Paris", author_name="Sarah Lee", rating=1),
        Review(reviewer_name="Carol Adams", book_title="The Mystery of the Lost Key", author_name="John Smith",
               rating=4, comment="An intriguing mystery with clever twists and turns.", ),
        Review(reviewer_name="Daniel Harris", book_title="Love in Paris", author_name="Sarah Lee", rating=4,
               comment="A delightful read with charming characters and a romantic backdrop."),
        Review(reviewer_name="Samuel White", book_title="Fantasy World: The Quest Begins", author_name="Jane Johnson",
               rating=2),
    ]

    Author.objects.bulk_create(authors)
    Book.objects.bulk_create(books)
    Review.objects.bulk_create(reviews)
    return "Records added to tables Authors, Books and Reviews"


# Run and print your queries
# print(add_records_to_database())

# Task 1
def find_books_by_genre_and_language(genre: str, language: str) -> QuerySet:
    return Book.objects.filter(genre=genre, language=language)


# Task 2
def find_authors_nationalities() -> str:
    authors = Author.objects.filter(nationality__isnull=False)
    return "\n".join(f"{a.first_name} {a.last_name} is {a.nationality}" for a in authors)


# Task 3
def order_books_by_year() -> str:
    ordered_books = Book.objects.order_by("publication_year", "title")
    return "\n".join(f"{b.publication_year} year: {b.title} by {b.author}" for b in ordered_books)


# Task 4
def delete_review_by_id(review_id: int) -> str or None:
    review = Review.objects.get(pk=review_id)
    if review:
        review.delete()
        return f"Review by {review.reviewer_name} was deleted"


# Task 5
def filter_authors_by_nationalities(nationality: str) -> str:
    selected_authors = Author.objects.filter(nationality=nationality).order_by("first_name", "last_name")
    return '\n'.join(f"{a.biography}" if a.biography else f"{a.first_name} {a.last_name}" for a in selected_authors)


# Task 6
def filter_authors_by_birth_year(start_year: int, end_year: int) -> str:
    selected_authors = Author.objects.filter(
        birth_date__year__in=range(start_year, end_year + 1)).order_by("-birth_date")
    return "\n".join(f"{a.birth_date}: {a.first_name} {a.last_name}" for a in selected_authors)


# Task 7
def change_reviewer_name(reviewer_name: str, new_name: str) -> QuerySet:
    Review.objects.filter(reviewer_name=reviewer_name).update(reviewer_name=new_name)
    return Review.objects.all()
