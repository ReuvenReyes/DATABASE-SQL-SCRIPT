USE pasahero_schema;

-- SAMPLE DATA INSERTS

-- Accounts
INSERT INTO account (account_id, full_name, gender, gcash_number, coordinates)
VALUES
('AMR0001', 'Amira Dela Cruz', 'Female', '09170001122', '-14.6000, 120.9850'),
('NOA0002', 'Noah Villanueva', 'Male', '09285553344', '-14.6011, 121.0001'),
('SOF0003', 'Sofia Lim', 'Female', '09181234567', '-14.6035, 121.0025'),
('KEN0004', 'Kenji Morales', 'Male', '09997778899', '-14.6045, 121.0042'),
('ELL0005', 'Ella Ramos', 'Female', '09081239876', '-14.6060, 121.0060');

-- Login information
INSERT INTO login_information (account_id, email, password)
VALUES
('AMR0001', 'amira.delacruz@example.com', 'amira123'),
('NOA0002', 'noah.villanueva@example.com', 'noah123'),
('SOF0003', 'sofia.lim@example.com', 'sofia123'),
('KEN0004', 'kenji.morales@example.com', 'kenji123'),
('ELL0005', 'ella.ramos@example.com', 'ella123');

-- Route
INSERT INTO route (route_id, route_name, city, operating_jeepney_count, total_distance)
VALUES
('ROU0001', 'Cubao to Marikina', 'Quezon City', 15, 4.00);

-- Fare
INSERT INTO fare (route_id, standard_amount, distance_threshold)
VALUES
('ROU0001', 13.00, 4.00);

-- Landmarks
INSERT INTO landmark (route_id, landmark)
VALUES
('ROU0001', 'Gateway Mall'),
('ROU0001', 'Katipunan Station'),
('ROU0001', 'Marikina Riverbanks');

-- Jeepneys
INSERT INTO jeepney (jeepney_id, license_plate, route_id, availability)
VALUES
('JEP0001', 'JPN1234', 'ROU0001', TRUE),
('JEP0002', 'QWE5678', 'ROU0001', TRUE),
('JEP0003', 'MNL9012', 'ROU0001', FALSE),
('JEP0004', 'CAB1122', 'ROU0001', TRUE);

-- Drivers
INSERT INTO driver (driver_id, account_id)
VALUES
('DRI0001', 'NOA0002'),
('DRI0002', 'KEN0004');

-- Driver contact
INSERT INTO contact_detail (driver_id, contact_number)
VALUES
('DRI0001', '09509751004'),
('DRI0002', '09990000002');

-- Operating jeepney
INSERT INTO operating_jeepney (driver_id, jeepney_id)
VALUES
('DRI0001', 'JEP0001'),
('DRI0002', 'JEP0002');

-- Passengers
INSERT INTO passenger (passenger_id, account_id, auto_pay_enabled)
VALUES
('PAS0001', 'AMR0001', TRUE),
('PAS0002', 'SOF0003', TRUE),
('PAS0003', 'ELL0005', FALSE);

-- Seating
INSERT INTO seating (seating_id, passenger_id, jeepney_id, no_charge)
VALUES
('AAAA0001', 'PAS0001', 'JEP0001', FALSE),
('AAAA0002', 'PAS0002', 'JEP0002', FALSE),
('AAAA0003', 'PAS0003', 'JEP0003', TRUE);

-- Payment
INSERT INTO payment (seating_id, gcash_reference_number, time_paid, amount)
VALUES
('AAAA0001', 'GCREF111111', NOW(), 13.00),
('AAAA0002', 'GCREF222222', NOW(), 13.00),
('AAAA0003', 'GCREF333333', NOW(), 0.00);

-- Travel information
INSERT INTO travel_information (seating_id, entry_time, entry_coordinate, exit_time, exit_coordinate, total_distance_traveled)
VALUES
('AAAA0001', NOW(), '-14.6000, 120.9850', NOW(), '-14.6069, 121.0005', 3.5),
('AAAA0002', NOW(), '-14.6035, 121.0025', NOW(), '-14.6069, 121.0005', 3.8),
('AAAA0003', NOW(), '-14.6060, 121.0060', NOW(), '-14.6069, 121.0005', 4.0);

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

