USE pasahero_schema;

-- Get integer amount of OPERATING_JEEPNEY 
SELECT COUNT(oj.jeepney_id) AS operating_jeepney_count
FROM operating_jeepney oj
JOIN jeepney j ON oj.jeepney_id = j.jeepney_id
WHERE j.route_id = 'ROU0001';

-- Get all LANDMARKS associated with a particular route_id
SELECT landmark
FROM landmark
WHERE route_id = 'ROU0001';

-- Get all CONTACT_NUMBER associated with a driver_id
SELECT contact_number
FROM contact_detail
WHERE driver_id = 'DRI0001';

-- Get PASSWORD associated with EMAIL
SELECT password
FROM login_information
WHERE email = 'amira.delacruz@example.com';

-- Check if PASSENGER_ID has DISCOUNT_QUALIFICATION
SELECT 
    p.passenger_id,
    CASE 
        WHEN dq.passenger_id IS NOT NULL THEN 'Has Discount'
        ELSE 'No Discount'
    END AS discount_status
FROM passenger p
LEFT JOIN discount_qualification dq 
    ON p.passenger_id = dq.passenger_id
WHERE p.passenger_id = 'PAS0001';

-- Get ENTRY_TIME, EXIT_TIME, and TOTAL_DISTANCE_TRAVELED from SEATING_ID
SELECT entry_time, exit_time, total_distance_traveled
FROM travel_information
WHERE seating_id = 'AAAA0001';

-- Get COORDINATES of PASSENGER
SELECT a.coordinates
FROM passenger p
JOIN account a ON p.account_id = a.account_id
WHERE p.passenger_id = 'PAS0001';

-- Get COORDINATES of DRIVER
SELECT a.coordinates
FROM driver d
JOIN account a ON d.account_id = a.account_id
WHERE d.driver_id = 'DRI0001';

-- Get ACCOUNT_ID associated with EMAIL
SELECT account_id
FROM login_information
WHERE email = 'amira.delacruz@example.com';


