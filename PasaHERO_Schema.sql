DROP SCHEMA IF EXISTS pasahero_schema;
CREATE SCHEMA pasahero_schema;
USE pasahero_schema;

-- ACCOUNT TABLE
CREATE TABLE account (
  account_id VARCHAR(7) PRIMARY KEY, 
  full_name VARCHAR(64) NOT NULL,
  gender ENUM('Male', 'Female', 'Other') NOT NULL,
  gcash_number VARCHAR(16),
  coordinates VARCHAR(255)
);

-- LOGIN INFORMATION TABLE
CREATE TABLE login_information (
  account_id VARCHAR(7) PRIMARY KEY,
  email VARCHAR(255) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  FOREIGN KEY (account_id) REFERENCES account(account_id)
    ON DELETE CASCADE ON UPDATE CASCADE
);


-- ROUTE TABLE
CREATE TABLE route (
  route_id VARCHAR(7) PRIMARY KEY, 
  route_name VARCHAR(64) NOT NULL,
  city VARCHAR(16),
  available_jeepney_count INT,
  total_distance DECIMAL(5,2)
);

-- FARE TABLE
CREATE TABLE fare (
  route_id VARCHAR(7) PRIMARY KEY,
  standard_amount DECIMAL(5,2) NOT NULL,
  distance_threshold DECIMAL(5,2),
  FOREIGN KEY (route_id) REFERENCES route(route_id)
    ON DELETE CASCADE ON UPDATE CASCADE
);

-- LANDMARK TABLE
CREATE TABLE landmark (
  route_id VARCHAR(7) NOT NULL,
  landmark_name VARCHAR(64) NOT NULL,
  PRIMARY KEY (route_id, landmark_name),
  FOREIGN KEY (route_id) REFERENCES route(route_id)
    ON DELETE CASCADE ON UPDATE CASCADE
);


-- DRIVER TABLE
CREATE TABLE driver (
  driver_id VARCHAR(7) PRIMARY KEY, 
  account_id VARCHAR(7) NOT NULL,
  FOREIGN KEY (account_id) REFERENCES account(account_id)
    ON DELETE CASCADE ON UPDATE CASCADE
);

-- CONTACT DETAIL TABLE
CREATE TABLE contact_detail (
  account_id VARCHAR(7) NOT NULL,
  contact_number VARCHAR(32) NOT NULL,
  PRIMARY KEY(account_id, contact_number),
  FOREIGN KEY (account_id) REFERENCES account(account_id)
    ON DELETE CASCADE ON UPDATE CASCADE
);


-- JEEPNEY TABLE
CREATE TABLE jeepney (
  jeepney_id VARCHAR(7) PRIMARY KEY, 
  license_plate VARCHAR(7) NOT NULL,
  type ENUM('trad', 'modern') NOT NULL,
  route_id VARCHAR(7),
  availability BOOLEAN DEFAULT TRUE,
  FOREIGN KEY (route_id) REFERENCES route(route_id)
    ON DELETE SET NULL ON UPDATE CASCADE
);

-- OPERATING JEEPNEY TABLE
CREATE TABLE operating_jeepney (
  driver_id VARCHAR(7) NOT NULL,
  jeepney_id VARCHAR(7) NOT NULL,
  PRIMARY KEY (driver_id, jeepney_id),
  FOREIGN KEY (driver_id) REFERENCES driver(driver_id)
    ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (jeepney_id) REFERENCES jeepney(jeepney_id)
    ON DELETE CASCADE ON UPDATE CASCADE
);


-- PASSENGER TABLE
CREATE TABLE passenger (
  account_id VARCHAR(7) PRIMARY KEY,
  auto_pay_enabled BOOLEAN DEFAULT TRUE,
  discount_type ENUM('student', 'senior', 'disability'),
  FOREIGN KEY (account_id) REFERENCES account(account_id)
    ON DELETE CASCADE ON UPDATE CASCADE
);

-- -- DISCOUNT QUALIFICATION TABLE
-- CREATE TABLE discount_qualification (
--   passenger_id VARCHAR(7) PRIMARY KEY,
--   type ENUM('student', 'senior', 'disability') VARCHAR(32),
--   FOREIGN KEY (passenger_id) REFERENCES passenger(passenger_id)
--     ON DELETE CASCADE ON UPDATE CASCADE
-- );


-- SEATING TABLE
CREATE TABLE seating (
  seating_id VARCHAR(8) PRIMARY KEY, 
  account_id VARCHAR(7),
  jeepney_id VARCHAR(7),
  no_charge BOOLEAN DEFAULT FALSE,
  FOREIGN KEY (account_id) REFERENCES passenger(account_id)
    ON DELETE SET NULL ON UPDATE CASCADE,
  FOREIGN KEY (jeepney_id) REFERENCES jeepney(jeepney_id)
    ON DELETE SET NULL ON UPDATE CASCADE
);

-- PAYMENT TABLE
CREATE TABLE payment (
  seating_id VARCHAR(8) PRIMARY KEY,
  gcash_reference_number VARCHAR(16),
  time_paid DATETIME,
  amount DECIMAL(5,2),
  FOREIGN KEY (seating_id) REFERENCES seating(seating_id)
    ON DELETE CASCADE ON UPDATE CASCADE
);

-- TRAVEL INFORMATION TABLE
CREATE TABLE travel_information (
  seating_id VARCHAR(8) PRIMARY KEY,
  entry_time DATETIME,
  entry_coordinate VARCHAR(255),
  exit_time DATETIME,
  exit_coordinate VARCHAR(255),
  total_distance_traveled DECIMAL(5,2),
  FOREIGN KEY (seating_id) REFERENCES seating(seating_id)
    ON DELETE CASCADE ON UPDATE CASCADE
);


