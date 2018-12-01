/***********************
Chapter 5 Subqueries SQL
All examples use communityassistpg
as the database
************************/
SELECT MAX(donationamount) AS largest 
FROM donation;

SELECT donationkey, personlastname, personfirstname, 
donationdate, MAX(donationamount)
FROM person
INNER JOIN donation
ON person.personkey=donation.personkey
GROUP BY donationkey, personlastname, personfirstname, 
donationdate;

SELECT donationkey, personlastname, personfirstname, 
donationdate, donationamount
FROM person
INNER JOIN donation
ON person.personkey=donation.personkey
WHERE donationamount=
          (SELECT MAX(donationamount) FROM donation);

SELECT DISTINCT personfirstname, personlastname
FROM person
INNER JOIN employee
ON person.personkey = employee.personkey
INNER Join grantreview
ON employee.employeekey=grantreview.employeekey;

SELECT personfirstname, personlastname
FROM person
WHERE personkey IN
             (SELECT personkey 
                FROM employee
                  WHERE employeekey IN
                           (SELECT employeekey 
                               FROM grantreview));

SELECT granttypename
FROM granttype
WHERE granttypekey NOT IN
(SELECT granttypekey from grantapplication);

SELECT EXTRACT(YEAR FROM grantapplicationdate) AS "year",
grantTypeName, SUM(grantApplicationAmount) AS Subtotal,
AVG(grantapplicationamount) AS "average"
FROM grantapplication
INNER JOIN granttype
ON granttype.granttypekey=grantapplication.granttypekey
WHERE EXTRACT(YEAR FROM grantapplicationdate)=2018
GROUP BY EXTRACT(YEAR FROM grantapplicationdate), granttypename
ORDER BY EXTRACT(YEAR FROM grantapplicationdate), granttypename;

SELECT EXTRACT(YEAR FROM grantapplicationdate) AS "year",
grantTypeName, SUM(grantApplicationAmount) AS Subtotal,
AVG(grantapplicationamount) AS "average",
(SELECT SUM(grantapplicationamount) 
       FROM grantapplication
       WHERE EXTRACT(YEAR FROM grantapplicationdate)=2018) AS "total"
FROM grantapplication
INNER JOIN granttype
ON granttype.granttypekey=grantapplication.granttypekey
WHERE EXTRACT(YEAR FROM grantapplicationdate)=2018
GROUP BY EXTRACT(YEAR FROM grantapplicationdate), granttypename
ORDER BY EXTRACT(YEAR FROM grantapplicationdate), granttypename;

SELECT EXTRACT(YEAR FROM grantapplicationdate) AS "year",
grantTypeName,SUM(grantApplicationAmount) AS Subtotal,
AVG(grantapplicationamount) AS "average",
(SELECT SUM(grantapplicationamount) 
    FROM grantapplication
    WHERE EXTRACT(YEAR FROM grantapplicationdate)=2018) AS "total",
(SUM (grantapplicationamount)/
(SELECT SUM(grantapplicationAmount) 
    FROM grantapplication
    WHERE EXTRACT(YEAR FROM grantapplicationdate)=2018) * 100)AS Percent
FROM grantapplication
INNER JOIN granttype
ON granttype.granttypekey=grantapplication.granttypekey
WHERE EXTRACT(YEAR FROM grantapplicationdate)=2018
GROUP BY EXTRACT(YEAR FROM grantapplicationdate), granttypename
ORDER BY EXTRACT(YEAR FROM grantapplicationdate), granttypename;

SELECT EXTRACT(YEAR FROM grantapplicationdate) AS "year",
grantTypeName,To_Char(SUM(grantApplicationAmount),'$9,999.99') AS Subtotal,
to_char(AVG(grantapplicationamount),'$9,999.99')  AS "average",
to_Char((SELECT SUM(grantapplicationamount) 
    FROM grantapplication
    WHERE EXTRACT(YEAR FROM grantapplicationdate)=2018),'$99,999.99') AS "total",
to_char((SUM (grantapplicationamount)/
(SELECT SUM(grantapplicationAmount) 
    FROM grantapplication
     WHERE EXTRACT(YEAR FROM grantapplicationdate)=2018) * 100), '999.99 %')AS Percent
FROM grantapplication
INNER JOIN granttype
ON granttype.granttypekey=grantapplication.granttypekey
WHERE EXTRACT(YEAR FROM grantapplicationdate)=2018
GROUP BY EXTRACT(YEAR FROM grantapplicationdate), granttypename
ORDER BY EXTRACT(YEAR FROM grantapplicationdate), granttypename;

SELECT firstname, lastname, donationdate, amount
FROM (SELECT personfirstname AS firstname,
      personlastname AS lastname,
      donationdate,
      donationamount AS amount
      FROM person
      INNER JOIN donation
      ON person.personkey=donation.personkey) AS donations;


SELECT "year", "month", total
FROM (SELECT 
       EXTRACT('Year' FROM donationdate) AS "year",
       EXTRACT('month' FROM donationdate) AS "month"
       SUM(donationamount) AS total
       FROM donation
       GROUP BY 
          EXTRACT('Year' FROM donationdate),
          EXTRACT('month' FROM donationdate)) as totals
ORDER BY "year";

SELECT "year", "month", total
FROM (SELECT 
       EXTRACT('Year' FROM donationdate) AS "year",
       EXTRACT('month' FROM donationdate) AS "month"
       SUM(donationamount) AS total
       FROM donation
       GROUP BY 
          EXTRACT('Year' FROM donationdate),
          EXTRACT('month' FROM donationdate)) as totals
WHERE total > 5000;
ORDER BY "year"

WITH totals AS
(
    SELECT 
             EXTRACT('Year' FROM donationdate) AS "year",
             EXTRACT('month' FROM donationdate) AS "month",
             SUM(donationamount) AS total
              FROM donation	 
             GROUP BY 
             EXTRACT('Year' FROM donationdate),
             EXTRACT('month' FROM donationdate)
)
SELECT "year", "month", total
FROM totals
WHERE total > 5000;

WITH citydonations AS
(
        SELECT DISTINCT ON(donationkey) donationkey, 
       personaddresscity AS city,
       donationamount AS total
       FROM donation
       INNER JOIN personaddress
       ON donation.personkey=personaddress.personkey
       ORDER BY donationkey, donationdate
)
SELECT city, SUM(total) as total 
FROM citydonations
GROUP BY city;

SELECT grantapplicationKey, granttypekey, grantapplicationamount
FROM grantapplication
WHERE grantapplicationamount > 
         (SELECT Avg(grantapplicationamount) FROM grantapplication);

SELECT grantapplicationKey, granttypekey, grantapplicationamount
FROM grantapplication g1
WHERE grantapplicationamount > 
         (SELECT Avg(grantapplicationamount) FROM grantapplication g2
            WHERE g1.granttypekey=g2.granttypekey)
ORDER BY granttypekey;




