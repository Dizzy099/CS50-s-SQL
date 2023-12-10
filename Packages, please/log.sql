

-- *** The Lost Letter ***


--To Find package id from the help of sender address
SELECT * FROM packages WHERE from_address_id IN (SELECT id FROM addresses WHERE address = '900 Somerville Avenue');
-- Check for package scan
SELECT * FROM scans WHERE package_id IN
    (SELECT id FROM packages WHERE from_address_id IN
         (SELECT id FROM addresses WHERE address = '900 Somerville Avenue') AND contents LIKE '%congratulatory%');

-- find driver name

SELECT name FROM drivers WHERE id IN (
    SELECT driver_id FROM scans WHERE package_id IN
           (SELECT id FROM packages WHERE from_address_id IN
                 (SELECT id FROM addresses WHERE address = '900 Somerville Avenue') AND contents LIKE '%congratulatory%'));





-- *** The Devious Delivery ***



-- Find the packages with no from_address_id

SELECT * FROM packages WHERE from_address_id IS NULL;

--DELIVERED ADDRESS


SELECT * FROM scans WHERE package_id = (SELECT id FROM packages WHERE from_address_id IS NULL);

SELECT address_id FROM scans WHERE action ='Drop' AND  package_id = ( SELECT id FROM packages WHERE from_address_id IS NULL) ;

SELECT * FROM addresses WHERE id = (SELECT address_id FROM scans WHERE action ='Drop' AND  package_id = ( SELECT id FROM packages WHERE from_address_id IS NULL) );



-- *** The Forgotten Gift ***

-- Find package id
SELECT id FROM packages WHERE from_address_id IN (SELECT id FROM addresses WHERE address = '109 Tileston Street');

-- Find information about delivered address from Scans table
SELECT * FROM scans WHERE package_id IN  (
    SELECT id FROM packages WHERE from_address_id IN (SELECT id FROM addresses WHERE address = '109 Tileston Street'));


--Driver Name
SELECT name FROM drivers  WHERE id = 17;
