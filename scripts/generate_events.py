import csv
from datetime import datetime, timedelta
from faker import Faker
import random

fake = Faker()

# Generate data
num_users = 1000
start_date = datetime(2023, 1, 1)
end_date = datetime(2024, 1, 1)

def random_date(start, end):
    return start + timedelta(seconds=random.randint(0, int((end - start).total_seconds())))

# Generate registration data
registrations = []
for user_id in range(1, num_users + 1):
    registration_date = random_date(start_date, end_date)
    registrations.append((user_id, registration_date))

# Generate login data
logins = []
for user_id, registration_date in registrations:
    num_logins = random.randint(200, 500)
    for _ in range(num_logins):
        login_date = random_date(registration_date, end_date)
        logins.append((user_id, login_date))

# Generate transaction data
transactions = []
for user_id, registration_date in registrations:
    num_transactions = random.randint(0, 20)
    for _ in range(num_transactions):
        transaction_date = random_date(registration_date, end_date)
        amount = round(random.uniform(1, 1000), 2)
        transactions.append((user_id, transaction_date, amount))

# Write data to CSV files
def write_csv(filename, data, headers):
    with open(filename, 'w', newline='') as f:
        writer = csv.writer(f)
        writer.writerow(headers)
        writer.writerows(data)

write_csv('register.csv', registrations, ['user_id', 'event_time'])
write_csv('login.csv', logins, ['user_id', 'event_time'])
write_csv('transaction.csv', transactions, ['user_id', 'event_time', 'amount'])

print("Data generation complete. CSV files have been created.")