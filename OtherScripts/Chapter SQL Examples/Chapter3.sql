/*****************************
Chapter 3 Calculations and Built in Functions
All SQL examples us communityassitpg 
for the database
******************************/
SELECT 12 * 3 /4 + 10;

SELECT donationamount, 
donationamount * .75 AS "For Grants",
donationamount *.25 AS "For Maintenance"
FROM donation;

SELECT donationamount, donationamount /9 AS charity
FROM Donation;

SELECT donationamount,ROUND(donationamount /9, 2) AS charity
FROM Donation;

SELECT donationamount,CEILING(donationamount /9) AS charity
FROM Donation;

SELECT donationamount,FLOOR(donationamount /9) AS charity
FROM Donation;

SELECT donationamount,to_char(donationamount /9,'$9,999.99') AS charity
FROM Donation;

SELECT RANDOM() ;

SELECT * FROM person WHERE personkey=FLOOR(RANDOM() * ((132-1) + 1 )+1);

SELECT CRYPT('SmithPass', GEN_SALT('bf', 8)) AS "Password";

CREATE EXTENSION pgcrypto;

SELECT * 
FROM LoginTable 
WHERE PersonUserName ='janderson'
AND PersonPassword=CRYPT('AndersonPass',PersonPassword);

SELECT current_date; 

SELECT current_time;	

SELECT current_timestamp;

Select age(timestamp '2/5/1994');

SELECT employeekey, employeepositionstartdate, 
age(employeepositionstartdate)
FROM employeeposition
ORDER BY employeepositionstartdate;

SELECT grantapplicationkey, 
grantapplicationdate, 
grantapplicationdate + interval '2 days' as "Review By"
FROM grantapplication;

SELECT grantapplicationkey,
grantapplicationdate, 
grantapplicationdate + interval '48 hours' as "Review By"
FROM grantapplication;

SELECT donationdate, extract(year from donationdate ) AS "Year"
FROM donation;

SELECT personfirstname ||' ' || personlastname AS "Name"
FROM person;

SELECT donationkey, 'Donation: ' || donationamount AS "Amount"
FROM donation;

SELECT position('@' in personemail)
FROM person;

SELECT substring(personemail FROM 1 FOR position('@' IN personemail)-1) 
AS "UserName"
FROM person;

SELECT upper(personfirstname) AS FirstName 
FROM person;

SELECT AVG(Coalesce(grantapplicationamount,0)) as Average
FROM grantapplication;

SELECT SUM(donationamount) AS Total
FROM donation;

SELECT AVG(donationamount) AS Average
FROM donation;

SELECT count(personkey) AS "Number of Donors"
FROM donation;

SELECT COUNT(DISTINCT personkey) AS "Unique Donors"
FROM donation;

SELECT EXTRACT(YEAR FROM donationdate) AS "Year",
SUM(donationamount) AS Total,
AVG(donationamount) AS Average
FROM donation
GROUP BY EXTRACT(YEAR FROM donationdate);

SELECT EXTRACT(YEAR FROM donationdate) AS "Year",
to_char(SUM(donationamount), '$ 999,999.99') AS Total,
to_char(AVG(donationamount),'$ 9,999.99')  AS Average
FROM donation
GROUP BY EXTRACT(YEAR FROM donationdate);

SELECT EXTRACT(YEAR FROM grantapplicationdate) AS "Year",
granttypekey,
SUM(grantapplicationamount) AS Total,
AVG(grantapplicationamount) AS Average
FROM grantapplication
GROUP BY EXTRACT(YEAR FROM grantapplicationdate), granttypekey
ORDER BY EXTRACT(YEAR FROM grantapplicationdate), granttypekey;


SELECT EXTRACT(YEAR FROM grantapplicationdate) AS "Year",
granttypekey,
SUM(grantapplicationamount) AS Total,
AVG(grantapplicationamount) AS Average
FROM grantapplication
WHERE EXTRACT(YEAR FROM grantapplicationdate)=2018
GROUP BY EXTRACT(YEAR FROM grantapplicationdate), granttypekey;

SELECT EXTRACT(YEAR FROM grantapplicationdate) AS "Year",
granttypekey,
SUM(grantapplicationamount) AS Total,
AVG(grantapplicationamount) AS Average
FROM grantapplication
WHERE EXTRACT(YEAR FROM grantapplicationdate)=2018
AND AVG(grantapplicationamount) >= 500
GROUP BY EXTRACT(YEAR FROM grantapplicationdate), granttypekey;

SELECT EXTRACT(YEAR FROM grantapplicationdate) AS "Year",
granttypekey,
SUM(grantapplicationamount) AS Total,
AVG(grantapplicationamount) AS Average
FROM grantapplication
WHERE EXTRACT(YEAR FROM grantapplicationdate)=2018
GROUP BY EXTRACT(YEAR FROM grantapplicationdate), granttypekey
HAVING AVG(grantapplicationamount) >= 500;


















