USE pasahero_schema;

-- Get account_id, password from email
SELECT account_id, password
FROM login_information
WHERE email = 'amira.delacruz@example.com';

-- Get ACCOUNT row from account_id
SELECT * 
FROM account 
WHERE account_id = 'AAA0001';

-- Get login information of account
SELECT * 
FROM login_information 
WHERE account_id = 'AAA0001';

-- Get integer amount of OPERATING_JEEPNEY 
SELECT COUNT(oj.jeepney_id) AS available_jeepney_count
FROM operating_jeepney AS oj
JOIN jeepney AS j ON oj.jeepney_id = j.jeepney_id
WHERE j.route_id = 'RAA0001'
AND j.availability = TRUE;

-- Get account row associated with email, password
SELECT *
FROM account
WHERE account_id = (
	SELECT account_id
    FROM login_information
    WHERE email = 'bartoleme.alan@example.com'
    AND password = 'barry123');

-- Get all LANDMARK associated with a route_id
SELECT landmark_name
FROM landmark
WHERE route_id = 'RAA0001';

-- Get all CONTACT_NUMBER associated with account_id
SELECT contact_number
FROM contact_detail
WHERE account_id = 'AAA0004';

-- Get PASSWORD associated with EMAIL
SELECT password
FROM login_information
WHERE email = 'amira.delacruz@example.com';

-- Check if PASSENGER_ID 
SELECT EXISTS(
	SELECT 1
	FROM passenger
	WHERE account_id = 'AAA0001'
	AND discount_type <> NULL) 
AS discount_legible;

-- Get ENTRY_TIME, EXIT_TIME, and TOTAL_DISTANCE_TRAVELED from SEATING_ID
SELECT bi.entry_time, bi.exit_time, td.total_distance_traveled
FROM boarding_information as bi, travel_distance AS td
WHERE seating_id = 'AAAA0001';

-- Get COORDINATES of PASSENGER
SELECT coordinates
FROM account
WHERE account_id = 'AAA0001';

-- Get COORDINATES from driver_id
SELECT a.coordinates
FROM driver AS d
JOIN account AS a ON d.account_id = a.account_id
WHERE d.driver_id = 'DAA0001';

-- Get ACCOUNT_ID from email
SELECT account_id
FROM login_information
WHERE email = 'amira.delacruz@example.com';




