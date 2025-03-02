import os
import django
from datetime import date

# Set up Django
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "orm_skeleton.settings")
django.setup()

# Import your models here
from main_app.models import Student


# Run and print your queries
# Task 1
def add_students():
    # Method 1: Create instance of student and manually save it
    student_1 = Student(
        student_id="FC5204",
        first_name="John",
        last_name="Doe",
        birth_date="1995-05-15",
        email="john.doe@university.com"
    )
    student_1.save()

    # Method 2: Directly create a student with using objects manager create()
    Student.objects.create(
        student_id='FE0054',
        first_name='Jane',
        last_name='Smith',
        birth_date=None,
        email='jane.smith@university.com'
    )

    # Method 3: Create students with one DB call with bulk_create().
    #           Pass instances of Student class or directly call the class constructor inside the list.
    student_3 = Student(
        student_id='FH2014',
        first_name='Alice',
        last_name='Johnson',
        birth_date='1998-02-10',
        email='alice.johnson@university.com'
    )

    Student.objects.bulk_create([
        student_3,
        Student(
            student_id='FH2015',
            first_name='Bob',
            last_name='Wilson',
            birth_date='1996-11-25',
            email='bob.wilson@university.com'
        )
    ])


# Task 2
def get_students_info():
    students = Student.objects.all()
    students_info = [f"Student №{s.student_id}: {s.first_name} {s.last_name}; Email: {s.email}" for s in students]
    return '\n'.join(students_info)


# Task 3
def update_students_emails():
    students = Student.objects.all()
    for student in students:
        student.email = student.email.replace('university.com', 'uni-students.com')
        student.save()


# Task 4
def truncate_students():
    Student.objects.all().delete()
