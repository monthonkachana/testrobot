import json

list_of_cars = json.load("Getuser101.json")

[car_type] = [car.get("type") for car in list_of_cars if car.get("name") == "Focus"]