/***************************************
Sample Code for Chapter 8 Schema and Views
*****************************************/
CREATE SCHEMA test;

DROP SCHEMA test;

CREATE SCHEMA employeeschema;
CREATE SCHEMA donorschema;
CREATE SCHEMA clientschema;

CREATE VIEW numberserved
AS
SELECT EXTRACT(YEAR FROM grantapplicationdate) AS "Year", 
       COUNT(grantapplicationkey) AS "Number",
       SUM(grantapplicationamount) AS Total
FROM Grantapplication
GROUP BY EXTRACT(YEAR FROM grantapplicationdate);

SELECT * FROM numberserved;

CREATE OR REPLACE VIEW numberserved
AS
SELECT EXTRACT(YEAR FROM grantapplicationdate) AS "Year", 
       COUNT(grantapplicationkey) AS "Number",
       SUM(grantapplicationamount) AS Total
FROM Grantapplication
GROUP BY EXTRACT(YEAR FROM grantapplicationdate);

--Or:

ALTER VIEW numberserved
AS
SELECT EXTRACT(YEAR FROM grantapplicationdate) AS "Year", 
       COUNT(grantapplicationkey) AS "Number",
       SUM(grantapplicationamount) AS Total
FROM Grantapplication
GROUP BY EXTRACT(YEAR FROM grantapplicationdate);

CREATE OR REPLACE VIEW numberserved
AS
SELECT EXTRACT(YEAR FROM grantapplicationdate) AS "Year", 
       COUNT(grantapplicationkey) AS "Number",
       SUM(grantapplicationamount) AS Total
FROM Grantapplication
GROUP BY EXTRACT(YEAR FROM grantapplicationdate)
ORDER BY EXTRACT(YEAR FROM grantapplicationdate);

SELECT Year, Number FROM numberserved;

CREATE VIEW employeeschema.employeeview
AS
SELECT personfirstname AS firstname,
personlastname AS lastname,
personemail AS email,
positionname AS "position",
employeepositionstartdate as startdate
FROM person
INNER JOIN employee
ON person.personkey=employee.personkey
INNER JOIN employeeposition
ON employee.employeekey=employeeposition.employeekey
INNER JOIN jobposition
ON jobposition.positionkey=employeeposition.positionkey;

SELECT * FROM employeeschema.employeeview;

CREATE VIEW people
AS
SELECT personkey AS "ID",
personfirstname AS FirstName,
personlastname AS LastName,
personemail AS Email,
personprimaryphone AS Phone,
persondateadded AS DateAdded
FROM person
ORDER BY persondateadded;


UPDATE people
SET phone='2065554231'
Where "ID" =9;

UPDATE people
SET phone='2065554231'
Where "ID" =13;

INSERT INTO people(firstname, lastname, email, phone, dateadded)
VALUES ('Katy', 'Henderson', 'khenderson01@gmail.com', '2065559787', current_timestamp);

CREATE VIEW employeeschema.seattleaddresses
AS
SELECT
Personkey,
personaddressapt AS apartment,
personaddressstreet AS street,
personaddresscity AS city,
personaddressstate AS "state",
personaddresszipcode AS postalcode
FROM personaddress
WHERE personaddresscity='Seattle';

SELECT * from employeeschema.seattleaddresses;

Insert into employeeschema.seattleaddresses
(personkey, apartment, street, city, "state", postalcode)
VALUES(12,'721B', '24thNW', 'Bellevue', 'WA', '98001');


CREATE OR REPLACE VIEW employeeschema.seattleaddresses
AS
SELECT
Personkey,
personaddressapt AS apartment,
personaddressstreet AS street,
personaddresscity AS city,
personaddressstate AS "state",
personaddresszipcode AS postalcode
FROM personaddress
WHERE personaddresscity='Seattle'
WITH CHECK OPTION;

Insert into employeeschema.seattleaddresses
(personkey, apartment, street, city, "state", postalcode)
VALUES(13,'721B', '24thNW', 'Seattle', 'WA', '98001');

CREATE MATERIALIZED VIEW donorschema.topdonors
AS
SELECT personlastName AS lastname,
personfirstname AS firstname,
donationdate,
donationamount AS amount
FROM person
Inner JOIN donation
ON person.personkey=donation.personkey
ORDER BY donationamount desc
LIMIT 10
WITH DATA;

SELECT * FROM donorschema.topdonors;

INSERT INTO donation(personkey, donationamount, donationdate)
VALUES(79,10100.00,current_timestamp);

REFRESH MATERIALIZED VIEW donorschema.topdonors;
