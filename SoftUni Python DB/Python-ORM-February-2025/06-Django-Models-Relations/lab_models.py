from django.db import models
from django.utils import timezone


# Create your models here.
class Lecturer(models.Model):
    first_name = models.CharField(max_length=100)
    last_name = models.CharField(max_length=100)

    def __str__(self):
        return f"{self.first_name} {self.last_name}"


class Subject(models.Model):
    name = models.CharField(max_length=100)
    code = models.CharField(max_length=10)
    lecturer = models.ForeignKey(Lecturer, on_delete=models.SET_NULL, null=True, blank=True)


class Student(models.Model):
    student_id = models.CharField(max_length=10, primary_key=True)
    first_name = models.CharField(max_length=100)
    last_name = models.CharField(max_length=100)
    birth_date = models.DateField()
    email = models.EmailField(unique=True)
    subjects = models.ManyToManyField(Subject, through="StudentEnrollment")


class StudentEnrollment(models.Model):
    class GradeChoices(models.TextChoices):
        A = "A", "A"
        B = "B", "B"
        C = "C", "C"
        D = "D", "D"
        F = "F", "F"

    student = models.ForeignKey(Student, on_delete=models.CASCADE)
    subject = models.ForeignKey(Subject, on_delete=models.CASCADE)
    enrollment_date = models.DateField(default=timezone.now)
    grade = models.CharField(max_length=1, choices=GradeChoices)

    def __str__(self):
        return f"{self.student.first_name} {self.student.last_name} is enrolled in {self.subject.name}."


class LecturerProfile(models.Model):
    lecturer = models.OneToOneField(Lecturer, on_delete=models.CASCADE)
    email = models.EmailField(unique=True)
    bio = models.TextField()
    office_location = models.CharField(max_length=100, null=True, blank=True)
