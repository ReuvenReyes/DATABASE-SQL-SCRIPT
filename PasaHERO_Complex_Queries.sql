USE pasahero_schema;

-- Get integer amount of OPERATING_JEEPNEY 
SELECT COUNT(oj.jeepney_id) AS available_jeepney_count
FROM operating_jeepney oj
JOIN jeepney j ON oj.jeepney_id = j.jeepney_id
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
SELECT landmark
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
as discount_legible;

-- Get ENTRY_TIME, EXIT_TIME, and TOTAL_DISTANCE_TRAVELED from SEATING_ID
SELECT entry_time, exit_time, total_distance_traveled
FROM travel_information
WHERE seating_id = 'AAAA0001';

-- Get COORDINATES of PASSENGER
SELECT coordinates
FROM account
WHERE account_id = 'AAA0001';

-- Get COORDINATES from driver_id
SELECT a.coordinates
FROM driver d
JOIN account a ON d.account_id = a.account_id
WHERE d.driver_id = 'DAA0001';

-- Get ACCOUNT_ID from email
SELECT account_id
FROM login_information
WHERE email = 'amira.delacruz@example.com';




