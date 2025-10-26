USE pasahero_schema;

-- SAMPLE DATA INSERTS

-- Accounts
INSERT INTO account (account_id, full_name, gender, gcash_number, coordinates)
VALUES
('AAA0001', 'Amira C. Dela Cruz', 'Female', '09170001122', '-14.6000, 120.9850'),
('AAA0002', 'Sofia F. Lim', 'Female', '09181234567', '-14.6035, 121.0025'),
('AAA0003', 'Ella Ramos', 'Female', '09081239876', '-14.6060, 121.0060'),
('AAA0004', 'Noah V. Villanueva', 'Male', '09509751004', '-14.6011, 121.0001'),
('AAA0005', 'Kenji Morales', 'Male', '09509071003', '-14.6045, 121.0042'),
('AAA0006', 'Wally Kanluran', 'Male', '09489657130', '-14.6006, 121.0007'),
('AAA0007', 'Bartolome Alan', 'Male', '09990000002', '-14.6021, 120.9870'),
('AAA0008', 'Pedro Perez', 'Male', '090896712240', '-14.6001, 120.9820'),
('AAA0009', 'Kaiya Rosas', 'Female', '090869521204', '-14.6050, 120.9903'),
('AAA0010', 'Elle Hinatsu', 'Other', '097693412670', '-14.6991, 120.9090');

-- Login information
INSERT INTO login_information (account_id, email, password)
VALUES
('AAA0001', 'amira.delacruz@example.com', 'amira123'),
('AAA0002', 'sofia.lim@example.com', 'sofia123'),
('AAA0003', 'ella.ramos@example.com', 'ella123'),
('AAA0004', 'noah.villanueva@example.com', 'noah123'),
('AAA0005', 'kenji.morales@example.com', 'kenji123'),
('AAA0006', 'wally.kanluran@example.com', 'wally123'),
('AAA0007', 'bartoleme.alan@example.com', 'barry123'),
('AAA0008', 'pedro.perez@example.com', 'pedro123'),
('AAA0009', 'kaiya.rosas@example.com', 'kaiya123'),
('AAA0010', 'elle.hinatsu@example.com', 'elle123');

-- Route
INSERT INTO route (route_id, route_name, city, available_jeepney_count, total_distance)
VALUES
('RAA0001', 'Lucena City Proper - Calmar Homes', 'Lucena', 0, 5.10),
('RAA0002', 'Lucena City Proper - Gulang - Gulang', 'Lucena', 0, 4.90),
('RAA0003', 'Lucena City Proper - Site', 'Lucena', 0, 4.70),
('RAA0004', 'Lucena - Lucban', 'Lucena', 0, 22.2),
('RAA0005', 'Cubao - Marikina', 'Quezon', 0, 4.00);

-- Landmarks
INSERT INTO landmark (route_id, landmark_name)
VALUES
('RAA0001', 'Gateway Mall'),
('RAA0001', 'Katipunan Station'),
('RAA0001', 'Marikina Riverbanks'),
('RAA0002', 'Lucena MMG Hospital'),
('RAA0002', 'SM City Lucena'),
('RAA0002', 'Dumaca River'),
('RAA0002', 'STI College'),
('RAA0002', 'New Lucena City Public Market'),
('RAA0003', 'Lucena Diversion Road'),
('RAA0003', 'Southern Luzon Command'),
('RAA0003', 'Puregold Gulang-Gulang'),
('RAA0003', 'Quezon Medical Center'),
('RAA0004', 'Enverga University'),
('RAA0004', 'SM City Lucena'),
('RAA0004', 'Dumaca River'),
('RAA0004', 'STI College'),
('RAA0004', 'New Lucena City Public Market'),
('RAA0005', 'Kamayan sa Palaisdaan'),
('RAA0005', 'Kamay ni Hesus'),
('RAA0005', 'Lucban MMG Hospital'),
('RAA0005', 'Southern Luzon State University'),
('RAA0005', 'Pamilihang Bayan ng Lucban');

-- Jeepney
INSERT INTO jeepney (jeepney_id, license_plate, type, route_id, availability)
VALUES
('JTA0001', 'JPN1234', 'trad', 'RAA0001', TRUE),
('JTA0002', 'QWE5678', 'trad', 'RAA0001', TRUE),
('JTA0003', 'MNL9012', 'trad', 'RAA0001', FALSE),
('JTA0004', 'CAB1122', 'trad', 'RAA0001', TRUE),
('JMA0001', 'KAI1400', 'modern', 'RAA0001', TRUE),
('JMA0002', 'TOU0012', 'modern', 'RAA0001', FALSE),
('JMA0003', 'AKA0001', 'modern', 'RAA0002', TRUE);

-- Driver
INSERT INTO driver (driver_id, account_id)
VALUES
('DAA0001', 'AAA0004'),
('DAA0002', 'AAA0005'),
('DAA0003', 'AAA0006'),
('DAA0004', 'AAA0007'),
('DAA0005', 'AAA0008');

-- Driver contact
INSERT INTO contact_detail (account_id, contact_number)
VALUES
('AAA0004', '09285553344'),
('AAA0004', '0421719089'),
('AAA0006', '0423731748');

-- Operating jeepney
INSERT INTO operating_jeepney (driver_id, jeepney_id)
VALUES
('DAA0001', 'JTA0001'),
('DAA0002', 'JTA0002'),
('DAA0003', 'JTA0004'),
('DAA0004', 'JMA0001'),
('DAA0005', 'JMA0003');

-- Passenger
INSERT INTO passenger (account_id, auto_pay_enabled, discount_type)
VALUES
('AAA0001', TRUE, NULL),
('AAA0002', TRUE, 'student'),
('AAA0003', FALSE, NULL),
('AAA0009', TRUE, 'student'),
('AAA0010', TRUE, 'student');

-- -- Discount qualification
-- INSERT INTO discount_qualification (passenger_id, type)
-- VALUES
-- ('PAAA0002', 'student')

-- Seating
INSERT INTO seating (seating_id, account_id, jeepney_id, no_charge)
VALUES
('AAAA0001', 'AAA0001', 'JTA0001', FALSE),
('AAAA0002', 'AAA0001', 'JTA0002', FALSE),
('AAAA0003', 'AAA0002', 'JTA0002', FALSE),
('AAAA0004', 'AAA0003', 'JTA0002', TRUE),
('AAAA0005', 'AAA0009', 'JTA0002', FALSE),
('AAAA0006', 'AAA0010', 'JTA0002', FALSE);

-- Payment
INSERT INTO payment (seating_id, gcash_reference_number, time_paid, amount_due)
VALUES
('AAAA0001', NULL, NULL, 13.00),
('AAAA0002', NULL, NULL, 13.00),
('AAAA0003', '413934832', NOW(), 11.00),
('AAAA0004', NULL, NOW(), 0.00),
('AAAA0005', '912834745', NOW(), 13.00),
('AAAA0006', NULL, NULL, 13.00);

-- Boarding information
INSERT INTO boarding_information (seating_id, entry_time, entry_coordinate, exit_time, exit_coordinate)
VALUES
('AAAA0001', NOW(), '-14.6000, 120.9850', NOW(), '-14.2001, 121.0456'),
('AAAA0002', NOW(), '-14.6000, 120.9850', NULL, NULL),
('AAAA0003', NOW(), '-14.6060, 121.0060', NOW(), '-14.6960, 121.0050'),
('AAAA0004', NOW(), '-14.6060, 121.0060', NULL, NULL),
('AAAA0005', NOW(), '-14.6035, 121.0025', NOW(), '-14.6069, 121.0005'),
('AAAA0006', NOW(), '-14.6035, 121.0025', NULL, NULL);

-- Travel distance
INSERT INTO travel_distance (seating_id, total_distance_traveled) 
VALUES
('AAAA0001', 2.30),
('AAAA0002', 1.35),
('AAAA0003', 0.85),
('AAAA0004', 1.20),
('AAAA0005', 1.55),
('AAAA0006', 1.55);

-- UPDATE all ROUTE.available_jeepney_count to get proper count
SET SQL_SAFE_UPDATES = 0;
UPDATE ROUTE as r
SET available_jeepney_count = (
	SELECT COUNT(oj.jeepney_id)
	FROM operating_jeepney oj
	JOIN jeepney j ON oj.jeepney_id = j.jeepney_id
	WHERE j.route_id = r.route_id
	AND j.availability = TRUE);
SET SQL_SAFE_UPDATES = 1;

-- UPDATE all ACCOUNT.password to be encrypted
SET SQL_SAFE_UPDATES = 0;
UPDATE login_information
SET password = SHA(password);
SET SQL_SAFE_UPDATES = 1;

-- Check data

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
SELECT * FROM boarding_information;
SELECT * FROM travel_distance;
SELECT * FROM landmark;

