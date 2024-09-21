-- Create the demo schema
CREATE SCHEMA IF NOT EXISTS demo;

-- Create the register table
CREATE TABLE IF NOT EXISTS demo.registers (
    user_id INTEGER,
    event_time TIMESTAMP
);

-- Create the login table
CREATE TABLE IF NOT EXISTS demo.logins (
    user_id INTEGER,
    event_time TIMESTAMP
);

-- Create the transaction table
CREATE TABLE IF NOT EXISTS demo.transactions (
    user_id INTEGER,
    event_time TIMESTAMP,
    amount DECIMAL(10, 2)
);

-- Load data into the register table
COPY demo.registers FROM 'register.csv' (HEADER, DELIMITER ',', TIMESTAMPFORMAT '%Y-%m-%d %H:%M:%S');

-- Load data into the login table
COPY demo.logins FROM 'login.csv' (HEADER, DELIMITER ',', TIMESTAMPFORMAT '%Y-%m-%d %H:%M:%S');

-- Load data into the transaction table
COPY demo.transactions FROM 'transaction.csv' (HEADER, DELIMITER ',', TIMESTAMPFORMAT '%Y-%m-%d %H:%M:%S');
