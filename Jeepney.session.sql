DROP DATABASE IF EXISTS jeepney_system;
CREATE DATABASE jeepney_system;
USE jeepney_system;

-- ACCOUNT TABLE
CREATE TABLE account (
  account_id VARCHAR(8) PRIMARY KEY, 
  full_name VARCHAR(100) NOT NULL,
  gender ENUM('Male','Female','Other') NOT NULL,
  gcash_number VARCHAR(30),
  coordinates VARCHAR(100)
);

-- LOGIN INFORMATION TABLE
CREATE TABLE login_information (
  account_id VARCHAR(8) PRIMARY KEY,
  email VARCHAR(100) NOT NULL UNIQUE,
  password VARCHAR(100) NOT NULL,
  FOREIGN KEY (account_id) REFERENCES account(account_id)
    ON DELETE CASCADE ON UPDATE CASCADE
);

-- ROUTE TABLE
CREATE TABLE route (
  route_id VARCHAR(8) PRIMARY KEY, 
  route_name VARCHAR(100) NOT NULL,
  city VARCHAR(50),
  operating_jeepney_count INT,
  total_distance DECIMAL(6,2)
);

-- JEEPNEY TABLE
CREATE TABLE jeepney (
  jeepney_id VARCHAR(8) PRIMARY KEY, 
  license_plate VARCHAR(20) NOT NULL,
  route_id VARCHAR(8),
  availability BOOLEAN DEFAULT TRUE,
  is_full BOOLEAN DEFAULT FALSE,
  FOREIGN KEY (route_id) REFERENCES route(route_id)
    ON DELETE SET NULL ON UPDATE CASCADE
);

-- DRIVER TABLE
CREATE TABLE driver (
  driver_id VARCHAR(8) PRIMARY KEY, 
  account_id VARCHAR(8) NOT NULL,
  FOREIGN KEY (account_id) REFERENCES account(account_id)
    ON DELETE CASCADE ON UPDATE CASCADE
);

-- CONTACT DETAIL TABLE
CREATE TABLE contact_detail (
  driver_id VARCHAR(8) PRIMARY KEY,
  contact_number VARCHAR(20) NOT NULL,
  FOREIGN KEY (driver_id) REFERENCES driver(driver_id)
    ON DELETE CASCADE ON UPDATE CASCADE
);

-- OPERATING JEEPNEY TABLE
CREATE TABLE operating_jeepney (
  driver_id VARCHAR(8) NOT NULL,
  jeepney_id VARCHAR(8) NOT NULL,
  PRIMARY KEY (driver_id, jeepney_id),
  FOREIGN KEY (driver_id) REFERENCES driver(driver_id)
    ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (jeepney_id) REFERENCES jeepney(jeepney_id)
    ON DELETE CASCADE ON UPDATE CASCADE
);

-- PASSENGER TABLE
CREATE TABLE passenger (
  passenger_id VARCHAR(8) PRIMARY KEY, 
  account_id VARCHAR(8) NOT NULL,
  auto_pay_enabled BOOLEAN DEFAULT TRUE,
  FOREIGN KEY (account_id) REFERENCES account(account_id)
    ON DELETE CASCADE ON UPDATE CASCADE
);

-- DISCOUNT QUALIFICATION TABLE
CREATE TABLE discount_qualification (
  passenger_id VARCHAR(8) PRIMARY KEY,
  type VARCHAR(50),
  FOREIGN KEY (passenger_id) REFERENCES passenger(passenger_id)
    ON DELETE CASCADE ON UPDATE CASCADE
);

-- SEATING TABLE
CREATE TABLE seating (
  seating_id VARCHAR(8) PRIMARY KEY, 
  passenger_id VARCHAR(8),
  jeepney_id VARCHAR(8),
  no_charge BOOLEAN DEFAULT FALSE,
  FOREIGN KEY (passenger_id) REFERENCES passenger(passenger_id)
    ON DELETE SET NULL ON UPDATE CASCADE,
  FOREIGN KEY (jeepney_id) REFERENCES jeepney(jeepney_id)
    ON DELETE SET NULL ON UPDATE CASCADE
);

-- PAYMENT TABLE
CREATE TABLE payment (
  seating_id VARCHAR(8) PRIMARY KEY,
  gcash_reference_number VARCHAR(50),
  time_paid DATETIME,
  amount DECIMAL(10,2),
  is_paid BOOLEAN DEFAULT FALSE,
  FOREIGN KEY (seating_id) REFERENCES seating(seating_id)
    ON DELETE CASCADE ON UPDATE CASCADE
);

-- TRAVEL INFORMATION TABLE
CREATE TABLE travel_information (
  seating_id VARCHAR(8) PRIMARY KEY,
  entry_time DATETIME,
  entry_coordinate VARCHAR(100),
  exit_time DATETIME,
  exit_coordinate VARCHAR(100),
  total_distance_traveled DECIMAL(6,2),
  FOREIGN KEY (seating_id) REFERENCES seating(seating_id)
    ON DELETE CASCADE ON UPDATE CASCADE
);

-- FARE TABLE
CREATE TABLE fare (
  route_id VARCHAR(8) PRIMARY KEY,
  standard_amount DECIMAL(10,2) NOT NULL,
  distance_threshold DECIMAL(6,2),
  FOREIGN KEY (route_id) REFERENCES route(route_id)
    ON DELETE CASCADE ON UPDATE CASCADE
);

-- LANDMARK TABLE
CREATE TABLE landmark (
  route_id VARCHAR(8) NOT NULL,
  landmark VARCHAR(100) NOT NULL,
  PRIMARY KEY (route_id, landmark),
  FOREIGN KEY (route_id) REFERENCES route(route_id)
    ON DELETE CASCADE ON UPDATE CASCADE
);

-- SAMPLE DATA INSERTS

-- Accounts
INSERT INTO account (account_id, full_name, gender, gcash_number, coordinates)
VALUES
('AMRI0001', 'Amira Dela Cruz', 'Female', '09170001122', '-14.6000, 120.9850'),
('NOAH0002', 'Noah Villanueva', 'Male', '09285553344', '-14.6011, 121.0001'),
('SOFI0003', 'Sofia Lim', 'Female', '09181234567', '-14.6035, 121.0025'),
('KENJ0004', 'Kenji Morales', 'Male', '09997778899', '-14.6045, 121.0042'),
('ELLA0005', 'Ella Ramos', 'Female', '09081239876', '-14.6060, 121.0060');

-- Login information
INSERT INTO login_information (account_id, email, password)
VALUES
('AMRI0001', 'amira.delacruz@example.com', 'amira123'),
('NOAH0002', 'noah.villanueva@example.com', 'noah123'),
('SOFI0003', 'sofia.lim@example.com', 'sofia123'),
('KENJ0004', 'kenji.morales@example.com', 'kenji123'),
('ELLA0005', 'ella.ramos@example.com', 'ella123');

-- Route
INSERT INTO route (route_id, route_name, city, operating_jeepney_count, total_distance)
VALUES
('ROU00001', 'Cubao to Marikina', 'Quezon City', 15, 4.00);

-- Jeepneys
INSERT INTO jeepney (jeepney_id, license_plate, route_id, availability, is_full)
VALUES
('JEP00001', 'JPN1234', 'ROU00001', TRUE, FALSE),
('JEP00002', 'QWE5678', 'ROU00001', TRUE, FALSE),
('JEP00003', 'MNL9012', 'ROU00001', TRUE, FALSE),
('JEP00004', 'CAB1122', 'ROU00001', TRUE, TRUE);

-- Drivers
INSERT INTO driver (driver_id, account_id)
VALUES
('DRI00001', 'NOAH0002'),
('DRI00002', 'KENJ0004');

-- Driver contact
INSERT INTO contact_detail (driver_id, contact_number)
VALUES
('DRI00001', '09280000001'),
('DRI00002', '09990000002');

-- Operating jeepney
INSERT INTO operating_jeepney (driver_id, jeepney_id)
VALUES
('DRI00001', 'JEP00001'),
('DRI00002', 'JEP00002');

-- Passengers
INSERT INTO passenger (passenger_id, account_id, auto_pay_enabled)
VALUES
('PAS00001', 'AMRI0001', TRUE),
('PAS00002', 'SOFI0003', TRUE),
('PAS00003', 'ELLA0005', FALSE);

-- Seating
INSERT INTO seating (seating_id, passenger_id, jeepney_id, no_charge)
VALUES
('SEA00001', 'PAS00001', 'JEP00001', FALSE),
('SEA00002', 'PAS00002', 'JEP00002', FALSE),
('SEA00003', 'PAS00003', 'JEP00003', TRUE);

-- Payment
INSERT INTO payment (seating_id, gcash_reference_number, time_paid, amount, is_paid)
VALUES
('SEA00001', 'GCREF111111', NOW(), 13.00, TRUE),
('SEA00002', 'GCREF222222', NOW(), 13.00, TRUE),
('SEA00003', 'GCREF333333', NOW(), 0.00, TRUE);

-- Travel information
INSERT INTO travel_information (seating_id, entry_time, entry_coordinate, exit_time, exit_coordinate, total_distance_traveled)
VALUES
('SEA00001', NOW(), '-14.6000, 120.9850', NOW(), '-14.6069, 121.0005', 3.5),
('SEA00002', NOW(), '-14.6035, 121.0025', NOW(), '-14.6069, 121.0005', 3.8),
('SEA00003', NOW(), '-14.6060, 121.0060', NOW(), '-14.6069, 121.0005', 4.0);

-- Fare
INSERT INTO fare (route_id, standard_amount, distance_threshold)
VALUES
('ROU00001', 13.00, 4.00);

-- Landmarks
INSERT INTO landmark (route_id, landmark)
VALUES
('ROU00001', 'Gateway Mall'),
('ROU00001', 'Katipunan Station'),
('ROU00001', 'Marikina Riverbanks');

-- CHECK DATA
SELECT * FROM account;
SELECT * FROM login_information;
SELECT * FROM driver;
SELECT * FROM contact_detail;
SELECT * FROM route;
SELECT * FROM jeepney;
SELECT * FROM operating_jeepney;
SELECT * FROM passenger;
SELECT * FROM seating;
SELECT * FROM payment;
SELECT * FROM travel_information;
SELECT * FROM fare;
SELECT * FROM landmark;
