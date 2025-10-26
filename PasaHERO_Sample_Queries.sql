USE pasahero_schema;

-- Get account_id, password from email
SELECT account_id, password
FROM login_information
WHERE email = 'amira.delacruz@example.com';

-- Get account row based on account_id
SELECT * 
FROM account 
WHERE account_id = 'AAA0001';

SELECT * 
FROM login_information 
WHERE account_id = 'AMR0001';

DELETE FROM account WHERE account_id = 'AMR0001';

UPDATE account SET full_name = 'Noah S. Villanueva' WHERE account_id = 'PAA0002';

DELETE FROM seating WHERE seating_id = 'AAAA0001';
