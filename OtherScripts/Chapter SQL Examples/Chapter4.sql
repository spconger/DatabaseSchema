/*****************************
Chapter 4 Joins sample SQL
All the SQL samples use communityassistpg
as the database, except the first two
examples which uses a simplified
color table, and the self join which
is queried from a simplified database,
code for which is provided in the chapter.
Some examples result in errors or incorrect
results as explained in the chapter
*****************************/
SELECT numbername, colorname 
FROM number
CROSS JOIN color;

SELECT numbername, colorname
FROM number, color;

SELECT employeekey, positionname
FROM employee
CROSS JOIN jobPosition;

SELECT departmentname, employeename
FROM department
INNER JOIN employee
ON department.departmentkey=employee.departmentkey
WHERE departmentName=’IT Support’;

SELECT departmentname, employeename
FROM department, employee
WHERE department.departmentkey=employee.departmentkey
AND departmentName=’IT Support’;

SELECT * FROM person
INNER JOIN employee
ON person.personkey=employee.personkey;

SELECT * FROM person
INNER JOIN employee
USING (personkey);

SELECT employeekey, personfirstname, personlastname 
FROM person
INNER JOIN employee
ON person.personkey=employee.personkey;

SELECT employeekey, personfirstname, personlastname, positionkey, employeepositionstartdate
FROM person
INNER JOIN employee
ON person.personkey=employee.personkey
INNER JOIN employeeposition
ON employee.employeekey=employeeposition.employeekey;

SELECT employee.employeekey, personfirstname, personlastname, positionkey, employeepositionstartdate
FROM person
INNER JOIN employee
ON person.personkey=employee.personkey
INNER JOIN employeeposition
ON employee.employeekey=employeeposition.employeekey;

SELECT e.employeekey, personfirstname, personlastname, positionkey, employeepositionstartdate
FROM person p
INNER JOIN employee e
ON p.personkey=e.personkey
INNER JOIN employeeposition ep
ON e.employeekey=ep.employeekey;

SELECT employee.employeekey, personfirstname, personlastname, positionname, employeepositionstartdate
FROM person 
INNER JOIN employee 
ON person.personkey=employee.personkey
INNER JOIN employeeposition 
ON employee.employeekey=employeeposition.employeekey
INNER JOIN jobposition
ON employeeposition.positionkey=jobposition.positionkey;

SELECT date_part('Year', grantapplicationdate)"Year", 
SUM(GrantApplicationamount) requested,
SUM(grantstatusfinalallocation) allocated,
SUM(GrantApplicationamount)-SUM(grantstatusfinalallocation) Difference
FROM grantapplication
INNER JOIN grantstatus
ON grantapplication.grantapplicationkey=grantstatus.grantapplicationkey
GROUP BY date_part('Year', grantapplicationdate)
ORDER BY date_part('Year', grantapplicationdate);

SELECT personaddresscity, sum(donationamount) donations
FROM personaddress
INNER JOIN Donation
ON Personaddress.personkey=donation.personkey
GROUP BY Personaddresscity;

SELECT SUM(donationamount) total FROM donation;

SELECT personaddresscity, sum(donationamount) donations
FROM personaddress
INNER JOIN Donation
ON Personaddress.personkey=donation.personkey
WHERE personaddress.personkey=7
GROUP BY Personaddresscity;

SELECT personaddresscity, sum(donationamount) donations
FROM person
INNER JOIN Donation
ON person.personkey=donation.personkey
INNER JOIN personaddress
ON Personaddress.personkey=person.personkey
WHERE personaddress.personkey=7
GROUP BY Personaddresscity;

SELECT Distinct granttypename, grantapplication.granttypekey
FROM GrantType
LEFT OUTER JOIN grantapplication
ON GrantType.granttypekey=grantapplication.granttypekey;

SELECT Distinct granttypename, grantapplication.granttypekey
FROM GrantType
LEFT OUTER JOIN grantapplication
ON GrantType.granttypekey=grantapplication.granttypekey
WHERE grantapplication.granttypekey IS NULL;

SELECT Distinct granttypename, grantapplication.granttypekey
FROM grantapplication
RIGHT OUTER JOIN grantType
ON GrantType.granttypekey=grantapplication.granttypekey
WHERE grantapplication.granttypekey IS NULL;

SELECT personlastname, personfirstname, positionname, grantreview.employeekey
FROM person
INNER JOIN employee
ON person.personkey=employee.personkey
INNER JOIN employeeposition
ON employee.employeekey=employeeposition.employeekey
INNER JOIN jobposition 
ON jobposition.positionkey=employeeposition.positionkey;

SELECT personlastname, personfirstname, positionname, grantreview.employeekey
FROM person
INNER JOIN employee
ON person.personkey=employee.personkey
INNER JOIN employeeposition
ON employee.employeekey=employeeposition.employeekey
INNER JOIN jobposition 
ON jobposition.positionkey=employeeposition.positionkey
LEFT OUTER JOIN grantreview
ON grantreview.employeekey=employee.employeekey
WHERE grantreview.employeekey IS NULL;

SELECT Distinct granttypename, grantapplication.granttypekey
FROM GrantType
FULL JOIN grantapplication
ON GrantType.granttypekey=grantapplication.granttypekey

SELECT personfirstname, personlastname, personemail,
 employeekey, personaddresscity
FROM person
NATURAL JOIN personaddress
NATURAL JOIN employee;

SELECT e2.employeename, e1.employeename supervisor
FROM Employee e1
INNER JOIN employee e2
ON e1.employeekey=e2.supervisorkey;

--creating table in database test
--to show self join
CREATE TABLE Employee
(
employeekey int primary key,
employeename text,
supervisorkey int
);

INSERT INTO employee
VALUES(1, 'John Smith', null),
(2, 'Lucy Brown',1),
(3, 'Barry Lowe', 1),
(4, 'Leah Nolen', null),
(5, 'Rober Castle', 4 );

SELECT e2.employeename, e1.employeename supervisor
FROM Employee e1
INNER JOIN employee e2
ON e1.employeekey=e2.supervisorkey;


SELECT personlastname, personfirstname, DonationDate, DonationAmount, grantapplicationDate, grantapplicationamount
FROM person
JOIN donation on person.personkey=donation.personkey
JOIN grantapplication 
ON grantapplicationdate BETWEEN donationdate AND donationdate + interval '7 day'
ORDER BY personLastName, personfirstname;










