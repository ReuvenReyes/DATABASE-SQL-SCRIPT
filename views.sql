-- View for all available JEEPNEY sorted by route_id
CREATE OR REPLACE VIEW available_jeepney AS
SELECT j.route_id, j.jeepney_id, j.license_plate, j.type
FROM operating_jeepney AS oj, jeepney AS j
WHERE oj.jeepney_id = j.jeepney_id
AND j.availability = TRUE
ORDER BY route_id;

SELECT * FROM available_jeepney;

-- View for all available JEEPNEY with a specific route_id
CREATE OR REPLACE VIEW available_jeepney_RAA0001 AS
SELECT jeepney_id, license_plate, type
FROM available_jeepney
WHERE route_id = 'RAA0001';

SELECT * FROM available_jeepney_RAA0001;

-- View for all SEATING and PAYMENT status with a specific jeepney_id and are still in the JEEPNEY
CREATE OR REPLACE VIEW seating_and_payment_status_JTA0002 AS
SELECT a.full_name, p.amount_due, p.time_paid
FROM seating AS s 
	INNER JOIN payment AS p
		ON s.seating_id = p.seating_id
    INNER JOIN boarding_information as bi
		ON s.seating_id = bi.seating_id
	INNER JOIN account as a
		ON s.account_id = a.account_id
WHERE s.jeepney_id = 'JTA0002'
AND bi.exit_time IS NULL
ORDER BY time_paid;

-- 

SELECT * FROM seating_and_payment_status_JTA0002;
