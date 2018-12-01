/********************************
Chapter 6 Manipulating Data
All SQL examples use communityassistpg
as a database
*************************/
INSERT INTO person(personLastName, personfirstname, personemail,          
personprimaryphone, persondateadded)
VALUES('Mullins', 'Lynn', 'lynnmullins@gmail.com',
'2065551309',current_timestamp);

INSERT INTO personaddress(personkey, personaddressapt, 
personaddressstreet, personaddresszipcode)
VALUES(133,null,'1234 South Jackson Blvd', '98001');

INSERT INTO person(personLastName, personfirstname, 
personemail, personprimaryphone, persondateadded)
VALUES('Brady', 'Nelson', 
'NelsonBrady@gmail.com','2065557591',current_timestamp); 

INSERT INTO personaddress(personkey, personaddressapt, 
personaddressstreet, personaddresszipcode)
VALUES((SELECT MAX(personkey) FROM PERSON),null,
'1455 North Jackson Blvd', '98001');


INSERT INTO person(personLastName, personfirstname, personemail, 
personprimaryphone, persondateadded)
VALUES('Lorrine', 'Amy', 'lorrine@gmail.com',
'2065550912',current_timestamp); 

INSERT INTO personaddress(personkey, personaddressapt, 
personaddressstreet, personaddresszipcode)
VALUES(CURRVAL('person_personkey_seq'),null,'
1455 North Jackson Blvd', '98001');

INSERT INTO donation(personkey, donationamount)
VALUES(133, 500.00),
(136, 250.00),
(136,125.50);

INSERT INTO LoginTable(personkey, personusername, personpassword)
SELECT personkey, LOWER(SUBSTRING(personfirstname, 1,1)|| personlastname), 
createpassword(personlastname || 'Pass')
FROM person
WHERE personkey > 132

UPDATE PERSON
SET personLastName=’Cooper’,
personemail=’LindaCooper@gmail.com’
WHERE personkey=2;

SELECT  * INTO person2 FROM person;

UPDATE person2
SET personLastname='Smith';

DROP TABLE person2;

UPDATE granttype
SET granttypeonetimemax=granttypeonetimemax * 1.5,
granttypelifetimemax=granttypelifetimemax * 1.5;

BEGIN TRANSACTION;
UPDATE person
SET personlastname=’Smith’;
SELECT * FROM person;
ROLLBACK TRANSACTION;

DELETE FROM donation WHERE donationkey=70;

DELETE FROM person WHERE personkey=3;



