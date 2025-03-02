import os
from typing import List

import django
from django.db.models import Case, When, Value, QuerySet

# Set up Django
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "orm_skeleton.settings")
django.setup()

# Import your models
from main_app.models import *


# Create and check models
# Run and print your queries
# Task 1 - 1
def show_highest_rated_art() -> str:
    top_rated = ArtworkGallery.objects.all().order_by("-rating", "id").first()
    return f"{top_rated.art_name} is the highest-rated art with a {top_rated.rating} rating!"


# Task 1 - 2
def bulk_create_arts(first_art: ArtworkGallery, second_art: ArtworkGallery) -> None:
    ArtworkGallery.objects.bulk_create([first_art, second_art])


# Task 1 - 3
def delete_negative_rated_arts() -> None:
    ArtworkGallery.objects.filter(rating__lt=0).delete()


# Task 2 - 1
def show_the_most_expensive_laptop() -> str:
    top_rated = Laptop.objects.all().order_by("-price", "-id").first()
    return f"{top_rated.brand} is the most expensive laptop available for {top_rated.price}$!"


# Task 2 - 2
def bulk_create_laptops(args: List[Laptop]) -> None:
    Laptop.objects.bulk_create(args)


# Task 2 - 3
def update_to_512_GB_storage() -> None:
    Laptop.objects.filter(brand__in=[Laptop.BrandChoices.ASUS, Laptop.BrandChoices.LENOVO]).update(storage=512)


# Task 2 - 4
def update_to_16_GB_memory() -> None:
    Laptop.objects.filter(
        brand__in=[Laptop.BrandChoices.APPLE, Laptop.BrandChoices.DELL, Laptop.BrandChoices.ACER]).update(memory=16)


# Task 2 - 5
def update_operation_systems() -> None:
    Laptop.objects.update(
        operation_system=Case(
            When(brand=Laptop.BrandChoices.ASUS, then=Value(Laptop.OSChoices.WINDOWS)),
            When(brand=Laptop.BrandChoices.APPLE, then=Value(Laptop.OSChoices.MACOS)),
            When(brand=Laptop.BrandChoices.LENOVO, then=Value(Laptop.OSChoices.CHROME_OS)),
            When(brand__in=[Laptop.BrandChoices.DELL, Laptop.BrandChoices.ACER], then=Value(Laptop.OSChoices.LINUX)),
        )
    )


# Task 2 - 6
def delete_inexpensive_laptops() -> None:
    Laptop.objects.filter(price__lt=1200).delete()


# Task 3 - 1
def bulk_create_chess_players(args: List[ChessPlayer]) -> None:
    ChessPlayer.objects.bulk_create(args)


# Task 3 - 2
def delete_chess_players() -> None:
    ChessPlayer.objects.filter(title='no title').delete()


# Task 3 - 3
def change_chess_games_won() -> None:
    ChessPlayer.objects.filter(title="GM").update(games_won=30)


# Task 3 - 4
def change_chess_games_lost() -> None:
    ChessPlayer.objects.filter(title='no title').update(games_lost=25)


# Task 3- 5
def change_chess_games_drawn() -> None:
    ChessPlayer.objects.all().update(games_drawn=10)


# Task 3 - 6
def grand_chess_title_GM() -> None:
    ChessPlayer.objects.filter(rating__gte=2400).update(title="GM")


# Task 3 - 7
def grand_chess_title_IM() -> None:
    ChessPlayer.objects.filter(rating__in=range(2300, 2400)).update(title="IM")


# Task 3 - 8
def grand_chess_title_FM() -> None:
    ChessPlayer.objects.filter(rating__in=range(2200, 2300)).update(title="FM")


# Task 3 - 9
def grand_chess_title_regular_player() -> None:
    ChessPlayer.objects.filter(rating__lt=2200).update(title="regular player")


# Task 4 - 1
def set_new_chefs() -> None:
    Meal.objects.update(
        chef=Case(
            When(meal_type="Breakfast", then=Value("Gordon Ramsay")),
            When(meal_type="Lunch", then=Value("Julia Child")),
            When(meal_type="Dinner", then=Value("Jamie Oliver")),
            When(meal_type="Snack", then=Value("Thomas Keller"))
        ))


# Task 4 - 2
def set_new_preparation_times() -> None:
    Meal.objects.update(
        preparation_time=Case(
            When(meal_type="Breakfast", then=Value("10 minutes")),
            When(meal_type="Lunch", then=Value("12 minutes")),
            When(meal_type="Dinner", then=Value("15 minutes")),
            When(meal_type="Snack", then=Value("5 minutes"))
        ))


# Task 4 - 3
def update_low_calorie_meals() -> None:
    Meal.objects.filter(meal_type__in=["Breakfast", "Dinner"]).update(calories=400)


# Task 4 - 4
def update_high_calorie_meals() -> None:
    Meal.objects.filter(meal_type__in=["Lunch", "Snack"]).update(calories=700)


# Task 4 - 5
def delete_lunch_and_snack_meals() -> None:
    Meal.objects.filter(meal_type__in=["Lunch", "Snack"]).delete()


# Task 5 - 1
def show_hard_dungeons() -> str:
    dungeons = Dungeon.objects.filter(difficulty="Hard").order_by("-location")
    return "\n".join(f"{d.name} is guarded by {d.boss_name} who has {d.boss_health} health points!" for d in dungeons)


# Task 5 - 2
def bulk_create_dungeons(args: List[Dungeon]) -> None:
    Dungeon.objects.bulk_create(args)


# Task 5 - 3
def update_dungeon_names() -> None:
    Dungeon.objects.update(
        name=Case(
            When(difficulty="Easy", then=Value("The Erased Thombs")),
            When(difficulty="Medium", then=Value("The Coral Labyrinth")),
            When(difficulty="Hard", then=Value("The Lost Haunt")),
        )
    )


# Task 5 - 4
def update_dungeon_bosses_health() -> None:
    Dungeon.objects.exclude(difficulty="Easy").update(boss_health=500)


# Task 5 - 5
def update_dungeon_recommended_levels() -> None:
    Dungeon.objects.update(
        recommended_level=Case(
            When(difficulty="Easy", then=Value(25)),
            When(difficulty="Medium", then=Value(50)),
            When(difficulty="Hard", then=Value(75)),
        )
    )


# Task 5 - 6
def update_dungeon_rewards() -> None:
    Dungeon.objects.filter(boss_health=500).update(reward="1000 Gold")

    Dungeon.objects.filter(location__startswith="E").update(reward="New dungeon unlocked")

    Dungeon.objects.filter(location__endswith="s").update(reward="Dragonheart Amulet")


# Task 5- 7
def set_new_locations() -> None:
    Dungeon.objects.update(
        location=Case(
            When(recommended_level=25, then=Value("Enchanted Maze")),
            When(recommended_level=50, then=Value("Grimstone Mines")),
            When(recommended_level=75, then=Value("Shadowed Abyss")),
        )
    )


# Task 6 - 1
def show_workouts() -> str:
    filtered_workouts = Workout.objects.filter(workout_type__in=["Calisthenics", "CrossFit"]).order_by("id")
    return "\n".join(f"{w.name} from {w.workout_type} type has {w.difficulty} difficulty!" for w in filtered_workouts)


# Task 6 - 2
def get_high_difficulty_cardio_workouts() -> QuerySet:
    return Workout.objects.filter(workout_type="Cardio", difficulty="High").order_by("instructor")


# Task 6 - 3
def set_new_instructors() -> None:
    Workout.objects.update(
        instructor=Case(
            When(workout_type="Cardio", then=Value("John Smith")),
            When(workout_type="Strength", then=Value("Michael Williams")),
            When(workout_type="Yoga", then=Value("Emily Johnson")),
            When(workout_type="CrossFit", then=Value("Sarah Davis")),
            When(workout_type="Calisthenics", then=Value("Chris Heria")),
        )
    )


# Task 6 - 4
def set_new_duration_times() -> None:
    Workout.objects.update(
        duration=Case(
            When(instructor="John Smith", then=Value("15 minutes")),
            When(instructor="Sarah Davis", then=Value("30 minutes")),
            When(instructor="Chris Heria", then=Value("45 minutes")),
            When(instructor="Michael Williams", then=Value("1 hour")),
            When(instructor="Emily Johnson", then=Value("1 hour and 30 minutes")),
        )
    )


# Task 6 - 5
def delete_workouts() -> None:
    Workout.objects.exclude(workout_type__in=["Calisthenics", "Strength"]).delete()
