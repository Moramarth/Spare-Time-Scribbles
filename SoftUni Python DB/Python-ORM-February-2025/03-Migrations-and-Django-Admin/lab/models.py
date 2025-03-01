from django.db import models


class Product(models.Model):
    name = models.CharField(max_length=500)
    description = models.TextField(null=True, blank=True)
    price = models.DecimalField(max_digits=10, decimal_places=2)
    # Updated category and supplier in task 1
    category = models.CharField(max_length=100, null=False, blank=False)
    supplier = models.CharField(max_length=150, null=False, blank=False)
    # New fields from task 1
    created_on = models.DateTimeField(auto_now_add=True, editable=False)
    last_edited_on = models.DateTimeField(auto_now=True, editable=False)
    # Count removed by reversing migration
    # count = models.PositiveIntegerField(default=0)

    # New fields from task 2
    barcode = models.IntegerField()
