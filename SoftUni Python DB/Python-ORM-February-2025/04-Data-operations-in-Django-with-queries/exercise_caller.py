import os
from decimal import Decimal

import django
from django.db.models import F

from main_app.models import Pet, Artifact, Location, Car, Task, HotelRoom, Character

# Set up Django
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "orm_skeleton.settings")
django.setup()


# Import your models here

# Create queries within functions

# Task 1
def create_pet(name: str, species: str):
    new_pet = Pet(name=name, species=species)
    new_pet.save()
    return f"{new_pet.name} is a very cute {new_pet.species}!"


# Task 2 - 1
def create_artifact(name: str, origin: str, age: int, description: str, is_magical: bool):
    new_artifact = Artifact(
        name=name,
        origin=origin,
        age=age,
        description=description,
        is_magical=is_magical,
    )
    new_artifact.save()
    return f"The artifact {new_artifact.name} is {new_artifact.age} years old!"


# Task 2 - 2
def rename_artifact(artifact: Artifact, new_name: str):
    if artifact.is_magical and artifact.age > 250:
        artifact.name = new_name
        artifact.save()


# Task 2 - 3
def delete_all_artifacts():
    Artifact.objects.all().delete()


# Task 3 - 1
def show_all_locations():
    locations = Location.objects.all().order_by("-id")
    location_info = [f"{l.name} has a population of {l.population}!" for l in locations]
    return "\n".join(location_info)


# Task 3 - 2
def new_capital():
    loc = Location.objects.first()
    loc.is_capital = True
    loc.save()


# Task 3 - 3
def get_capitals():
    return Location.objects.filter(is_capital=True).values("name")


# Task 3 - 4
def delete_first_location():
    loc = Location.objects.first()
    loc.delete()


# Task 4 - 1
def apply_discount():
    cars = Car.objects.all()
    for car in cars:
        year_sum = Decimal(sum(int(char) for char in str(car.year)))
        car.price_with_discount = car.price - car.price * (year_sum / 100)
        car.save()


# Task 4 - 2
def get_recent_cars():
    return Car.objects.filter(year__gt=2020).values("model", "price_with_discount")


# Task 4 - 3
def delete_last_car():
    Car.objects.last().delete()


# Task 5 - 1
def show_unfinished_tasks():
    unfinished_tasks = Task.objects.filter(is_finished=False)
    tasks_info_list = [f"Task - {t.title} needs to be done until {t.due_date}!" for t in unfinished_tasks]
    return "\n".join(tasks_info_list)


# Task 5 - 2
def complete_odd_tasks():
    tasks = Task.objects.all()
    completed_tasks = list()

    for task in tasks:
        if task.id % 2 == 1:
            task.is_finished = True
            completed_tasks.append(task)

    Task.objects.bulk_update(completed_tasks, ['is_finished'])


# Task 5 - 3
def encode_and_replace(text: str, task_title: str):
    encoded_text = ''.join([chr(ord(char) - 3) for char in text])
    Task.objects.filter(title=task_title).update(description=encoded_text)


# Task 6 - 1
def get_deluxe_rooms():
    all_deluxe_rooms = HotelRoom.objects.filter(room_type=HotelRoom.RoomTypeChoices.DELUXE)
    all_deluxe_rooms = [room for room in all_deluxe_rooms if room.id % 2 == 0]
    return "\n".join(
        f"Deluxe room with number {r.room_number} costs {r.price_per_night}$ per night!" for r in all_deluxe_rooms)


# Task 6 - 2
def increase_room_capacity():
    rooms = HotelRoom.objects.all().order_by("id")
    rooms_to_update = list()

    for index, room in enumerate(rooms):
        if not room.is_reserved:
            continue
        if room == HotelRoom.objects.first():
            room.capacity += room.id
        else:
            room.capacity += rooms[index - 1].capacity

        rooms_to_update.append(room)

    HotelRoom.objects.bulk_update(rooms_to_update, ['capacity'])


# Task 6 - 3
def reserve_first_room():
    room = HotelRoom.objects.first()
    room.is_reserved = True
    room.save()


# Task 6 - 4
def delete_last_room():
    room = HotelRoom.objects.last()
    if not room.is_reserved:
        room.delete()


# Task 7 - 1
def update_characters():
    Character.objects.filter(class_name=Character.ClassNameChoices.MAGE).update(
        level=F("level") + 3,
        intelligence=F("intelligence") - 7
    )

    Character.objects.filter(class_name=Character.ClassNameChoices.WARRIOR).update(
        hit_points=F('hit_points') / 2,
        dexterity=F('dexterity') + 4,
    )

    Character.objects.filter(
        class_name__in=[Character.ClassNameChoices.SCOUT, Character.ClassNameChoices.ASSASSIN]).update(
        inventory="The inventory is empty"
    )


# Task 7 - 2
def fuse_characters(first_character: Character, second_character: Character):
    inventory_options = {
        str(Character.ClassNameChoices.MAGE): "Bow of the Elven Lords, Amulet of Eternal Wisdom",
        str(Character.ClassNameChoices.SCOUT): "Bow of the Elven Lords, Amulet of Eternal Wisdom",
        str(Character.ClassNameChoices.WARRIOR): "Dragon Scale Armor, Excalibur",
        str(Character.ClassNameChoices.ASSASSIN): "Dragon Scale Armor, Excalibur",
    }

    # Calculate new stats
    new_name = first_character.name + " " + second_character.name
    new_class_name = Character.ClassNameChoices.FUSION
    new_level = int((first_character.level + second_character.level) // 2)
    new_strength = int((first_character.strength + second_character.strength) * 1.2)
    new_dexterity = int((first_character.dexterity + second_character.dexterity) * 1.4)
    new_intelligence = int((first_character.intelligence + second_character.intelligence) * 1.5)
    new_hit_points = int(first_character.hit_points + second_character.hit_points)
    new_inventory = inventory_options[first_character.class_name]

    # Delete used "ingredients"
    first_character.delete()
    second_character.delete()

    # Fuse
    Character.objects.create(
        name=new_name,
        class_name=new_class_name,
        level=new_level,
        strength=new_strength,
        dexterity=new_dexterity,
        intelligence=new_intelligence,
        hit_points=new_hit_points,
        inventory=new_inventory
    )


# Task 7 - 3
def grand_dexterity():
    Character.objects.all().update(dexterity=30)


# Task 7 - 4
def grand_intelligence():
    Character.objects.all().update(intelligence=40)


# Task 7 - 5
def grand_strength():
    Character.objects.all().update(strength=50)


# Task 7 - 6
def delete_characters():
    Character.objects.filter(inventory="The inventory is empty").delete()
