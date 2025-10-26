-- View for all available jeepneys sorted by route
CREATE OR REPLACE VIEW available_jeepney AS
SELECT r.route_id, d.driver_id, j.jeepney_id, r.route_name, a.full_name AS driver_name, j.license_plate, j.type AS jeepney_type
FROM operating_jeepney AS oj
	INNER JOIN driver as d
		ON oj.driver_id = d.driver_id
	INNER JOIN account as a
		ON d.account_id = a.account_id
	INNER JOIN jeepney AS j
		ON oj.jeepney_id = j.jeepney_id
	INNER JOIN route AS r
		ON j.route_id = r.route_id
WHERE oj.jeepney_id = j.jeepney_id
AND j.availability = TRUE
ORDER BY j.route_id;

SELECT * FROM available_jeepney;




