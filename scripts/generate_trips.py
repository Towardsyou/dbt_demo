import csv
import random
from datetime import datetime, timedelta

from faker import Faker

Faker.seed(1)
fake = Faker()


header = [
    "trip_id",
    "provider_id",
    "device_id",
    "trip_start_ts",
    "trip_start_x",
    "trip_start_y",
    "trip_start_city",
    "trip_end_ts",
    "trip_end_x",
    "trip_end_y",
    "trip_end_city",
]

with open("eggs.csv", "w", newline="") as csvfile:
    w = csv.writer(csvfile, quoting=csv.QUOTE_MINIMAL)
    w.writerow(header)
    for _ in range(100000):
        start_y, start_x, start_city_name, _, _ = fake.local_latlng("FR")
        end_y, end_x, end_city_name, _, _ = fake.local_latlng("FR")
        provider_id = random.randint(1, 3)
        start_time = fake.date_time_between(
            start_date=datetime(2023, 1, 1),
            end_date=datetime(2023, 12, 31, 23, 59, 59, 999),
        )
        w.writerow(
            [
                fake.uuid4(),
                provider_id,
                provider_id * 10 + random.randint(0, 9),
                start_time.isoformat(),
                start_x,
                start_y,
                start_city_name,
                (start_time + timedelta(minutes=random.randint(0, 720))).isoformat(),
                end_x,
                end_y,
                end_city_name,
            ]
        )
