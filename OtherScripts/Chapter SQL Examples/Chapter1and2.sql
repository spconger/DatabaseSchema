/*********************
Chapter 1 SQL
All Example queries from the chapter
use communityassistpg as a database
*********************/
SELECT lastname, firstname, email 
FROM person 
WHERE lastname =’Smith';

SELECT 
   lastname, 
   firstname, 
   email 
FROM person 
WHERE lastname =’Smith';

SELECT * FROM person;

/*************************
 Chapter 2 SELECTS SQL
All Example queries from the chapter
use communityassistpg as a database
************************/
SELECT personfirstname, personlastname, personemail
FROM person;

SELECT personfirstname, personlastname, personemail
FROM person
ORDER BY personlastname;

SELECT personfirstname, personlastname, personemail
FROM person
ORDER BY personlastname, personfirstname;

SELECT personfirstname, personlastname, personemail
FROM person
ORDER BY personlastname DESC;

SELECT personfirstname, personlastname, personemail
FROM person
ORDER BY personlastname DESC, personfirstname DESC;

SELECT personfirstname, personlastname, personemail
FROM person
ORDER BY personlastname ASC, personfirstname DESC;

SELECT donationdate, donationamount
FROM donation
ORDER BY donationamount DESC

SELECT personlastname, personfirstname, personemail
FROM person
ORDER BY 1,2;

SELECT personfirstname AS “First Name”, personlastname AS “Last Name”, personemail AS “Email”
FROM person
ORDER BY personlastname, personfirstname;

SELECT personfirstname “First Name”, 
personlastname “Last Name”, 
personemail Email
FROM person
ORDER BY personlastname, personfirstname;

SELECT * 
FROM personAddress
WHERE personaddresscity='Bellevue';

SELECT * 
FROM donation
WHERE donationamount > 1000;

SELECT personfirstname, personlastname 
FROM person
WHERE personlastname > 'Martin';

SELECT grantapplicationkey, grantapplicationdate,
personkey, granttypekey, grantapplicationamount 
FROM grantapplication
WHERE granttypekey=3
AND grantapplicationamount > 400;

SELECT grantapplicationkey, grantapplicationdate,
personkey, granttypekey, grantapplicationamount 
FROM grantapplication
WHERE granttypekey=3
AND grantapplicationamount > 400
AND grantapplicationdate >= ‘1/1/2018’;

SELECT grantapplicationkey, grantapplicationdate,
personkey, granttypekey, grantapplicationamount 
FROM grantapplication
WHERE granttypekey=3
OR grantapplicationamount > 400;

SELECT *
FROM personaddress
WHERE NOT personaddresscity=’Seattle’;

SELECT grantapplicationkey, grantapplicationdate,
personkey, granttypekey, grantapplicationamount 
FROM grantapplication
WHERE granttypekey=3
AND NOT grantapplicationamount > 400
OR grantapplicationdate >= ‘1/1/2018’;

SELECT * 
FROM donation
WHERE donationamount >=500 
AND donationamount <=1000;

SELECT * 
FROM donation
WHERE donationamount BETWEEN 500 AND 1000;

SELECT *
FROM donation
WHERE donationdate BETWEEN ‘3/1/2018’ AND ‘3/31/2018’;

SELECT *
FROM personaddress
WHERE personaddressapt IS NULL;

SELECT *
FROM personaddress
WHERE personaddressapt IS NOT NULL;

SELECT *
FROM person
WHERE personemail LIKE ‘%msn.com’;

SELECT personlastname, personfirstname
FROM person
WHERE personlastname LIKE ‘R%’;

SELECT personlastname, personfirstname
FROM person
WHERE personfirstname LIKE 'J%y';

SELECT personlastname, personfirstname
FROM person
WHERE personfirstname LIKE ‘_ill’;

SELECT employeekey 
FROM grantreview;

SELECT DISTINCT employeekey 
FROM grantreview;

SELECT DISTINCT ON(employeekey) employeekey, 
grantapplicationkey, grantreviewdate
FROM grantreview;




