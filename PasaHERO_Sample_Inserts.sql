USE pasahero_schema;

-- SAMPLE DATA INSERTS

-- Accounts
INSERT INTO account (account_id, full_name, gender, gcash_number, coordinates)
VALUES
('AAA0001', 'Amira Dela Cruz', 'Female', '09170001122', '-14.6000, 120.9850'),
('AAA0002', 'Sofia Lim', 'Female', '09181234567', '-14.6035, 121.0025'),
('AAA0003', 'Ella Ramos', 'Female', '09081239876', '-14.6060, 121.0060'),
('AAA0004', 'Noah Villanueva', 'Male', '09509751004', '-14.6011, 121.0001'),
('AAA0005', 'Kenji Morales', 'Male', '09509071003', '-14.6045, 121.0042'),
('AAA0006', 'Wally Kanluran', 'Male', '09489657130', '-14.6006, 121.0007'),
('AAA0007', 'Bartolome Alan', 'Male', '09990000002', '-14.6021, 120.9870');

-- Login information
INSERT INTO login_information (account_id, email, password)
VALUES
('AAA0001', 'amira.delacruz@example.com', 'amira123'),
('AAA0002', 'sofia.lim@example.com', 'sofia123'),
('AAA0003', 'ella.ramos@example.com', 'ella123'),
('AAA0004', 'noah.villanueva@example.com', 'noah123'),
('AAA0005', 'kenji.morales@example.com', 'kenji123'),
('AAA0006', 'wally.kanluran@example.com', 'wally123'),
('AAA0007', 'bartoleme.alan@example.com', 'barry123');

-- Route
INSERT INTO route (route_id, route_name, city, available_jeepney_count, total_distance)
VALUES
('RAA0001', 'Lucena City Proper - Calmar Homes', 'Lucena', 0, 5.10),
('RAA0002', 'Lucena City Proper - Gulang - Gulang', 'Lucena', 0, 4.90),
('RAA0003', 'Lucena City Proper - Site', 'Lucena', 0, 4.70),
('RAA0004', 'Lucena - Lucban', 'Lucena', 0, 22.2),
('RAA0005', 'Cubao - Marikina', 'Quezon', 0, 4.00);
-- Fare
-- ?REMOVE?
INSERT INTO fare (route_id, standard_amount, distance_threshold)
VALUES
('RAA0001', 13.00, 4),
('RAA0002', 13.00, 4),
('RAA0003', 13.00, 4),
('RAA0004', 13.00, 4),
('RAA0005', 13.00, 4);

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
('JMA0002', 'TOU0012', 'modern', 'RAA0001', FALSE);

-- Driver
INSERT INTO driver (driver_id, account_id)
VALUES
('DAA0001', 'AAA0004'),
('DAA0002', 'AAA0005'),
('DAA0003', 'AAA0006'),
('DAA0004', 'AAA0007');

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
('DAA0004', 'JMA0001');

-- Passenger
INSERT INTO passenger (account_id, auto_pay_enabled, discount_type)
VALUES
('AAA0001', TRUE, NULL),
('AAA0002', TRUE, 'student'),
('AAA0003', FALSE, NULL);

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
('AAAA0004', 'AAA0003', 'JTA0002', TRUE);

-- Payment
INSERT INTO payment (seating_id, gcash_reference_number, time_paid, amount)
VALUES
('AAAA0001', NULL, NULL, 13.00),
('AAAA0002', '912834745', NOW(), 13.00),
('AAAA0003', '413934832', NOW(), 11.00),
('AAAA0004', NULL, NOW(), 0.00);

-- Travel information
INSERT INTO travel_information (seating_id, entry_time, entry_coordinate, exit_time, exit_coordinate, total_distance_traveled)
VALUES
('AAAA0001', NOW(), '-14.6000, 120.9850', NULL, NULL, 1.5),
('AAAA0002', NOW(), '-14.6035, 121.0025', NOW(), '-14.6069, 121.0005', 3.8),
('AAAA0003', NOW(), '-14.6060, 121.0060', NULL, NULL, 1.3),
('AAAA0004', NOW(), '-14.6060, 121.0060', NULL, NULL, 1.3);


-- UPDATE ROUTE.available_jeepney_count
UPDATE ROUTE
SET available_jeepney_count = (
	SELECT COUNT(oj.jeepney_id)
	FROM operating_jeepney oj
	JOIN jeepney j ON oj.jeepney_id = j.jeepney_id
	WHERE j.route_id = 'ROU0001'
	AND j.availability = TRUE)
WHERE route_id = 'ROU0001';
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
SELECT * FROM travel_information;
SELECT * FROM fare;
SELECT * FROM landmark;

