USE pasahero_schema;

-- Get account information from login credentials
SELECT *
FROM account
WHERE account_id = (
	SELECT li.account_id
    FROM login_information AS li
    WHERE email = 'kaiya.rosas@example.com'
    AND password = 'kaiya123');

-- Get integer amount of available jeepneys in a specific route
-- used in the sample insert script to fill available_jeepney_count column of route table
SELECT COUNT(oj.jeepney_id) AS available_jeepney_count
FROM operating_jeepney AS oj
JOIN jeepney AS j ON oj.jeepney_id = j.jeepney_id
WHERE j.route_id = 'RAA0001'
AND j.availability = TRUE;

-- Get all landmarks associated with a route
SELECT landmark_name
FROM landmark
WHERE route_id = 'RAA0001';

-- Get all contact numbers associated with an account
SELECT contact_number
FROM contact_detail
WHERE account_id = 'AAA0004';

-- Check if passenger is legible for discount
SELECT EXISTS(
	SELECT 1
	FROM passenger
	WHERE account_id = 'AAA0001'
	AND discount_type IS NOT NULL) 
AS discount_legible;

-- Get travel information (entry and exit time, total distance traveled) for specific seating
SELECT bi.entry_time, bi.exit_time, td.total_distance_traveled
FROM boarding_information AS bi 
	INNER JOIN travel_distance AS td
		ON bi.seating_id = td.seating_id
WHERE bi.seating_id = 'AAAA0001';

-- Get someone's coordinates
SELECT coordinates
FROM account
WHERE account_id = 'AAA0001';

-- Get jeepney's coordinates
SELECT a.coordinates
FROM jeepney as j
	INNER JOIN operating_jeepney as oj
		ON oj.jeepney_id = j.jeepney_id
	INNER JOIN driver as d
		ON d.driver_id = oj.driver_id
	INNER JOIN account AS a 
		ON d.account_id = a.account_id
WHERE j.jeepney_id = 'JTA0001';




