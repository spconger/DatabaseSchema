/**********************************
Chapter 10 Functions, Procedures and Triggers
Sample code
In the chapter I walked through some of the 
functions in several steps. I have only
placed the completed functions here
********************************/
CREATE OR REPLACE FUNCTION public.createpassword(
	pass character varying)
    RETURNS text
    LANGUAGE 'sql'
    COST 100
    VOLATILE 
AS $BODY$
Select crypt(pass, gen_salt('bf', 8))
$BODY$;

ALTER FUNCTION public.createpassword(character varying)
    OWNER TO postgres;


CREATE OR REPLACE FUNCTION cube(num INTEGER)
RETURNS INTEGER
AS $$
BEGIN
RETURN num * num * num;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION employeeschema.donationpercentages
(amount NUMERIC, percentage NUMERIC)
RETURNS NUMERIC 
AS $$
BEGIN
RETURN amount * percentage;
END;
$$ LANGUAGE plpgsql;

SELECT donationdate, donationamount,
employeeschema.donationpercentages(donationamount, .82) AS tocharity,
employeeschema.donationpercentages(donationamount, .18) AS toorg
FROM donation;

CREATE OR REPLACE FUNCTION employeeschema.donationpercentages
(amount NUMERIC, percentage NUMERIC)
RETURNS NUMERIC 
AS $$
BEGIN
IF percentage > 1
THEN
   RETURN amount * percentage / 100;
ELSE 
    RETURN amount * percentage;
END IF;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION makeusername
(firstname TEXT, lastname TEXT)
RETURNS TEXT
AS $$
BEGIN
RETURN LOWER(SUBSTRING(firstname, 1,1) || lastname);
END;
$$ LANGUAGE plpgsql;

SELECT personfirstname, personlastname, 
makeusername(personfirstname, personlastname) AS Username
FROM person;

CREATE OR REPLACE FUNCTION donorschema.getdonations
(donorkey integer)
RETURNS TABLE (
"Date" TIMESTAMP,
Amount NUMERIC,
validation UUID
)
AS $$
BEGIN 
RETURN QUERY 
SELECT donationDate, DonationAmount, DonationValidation 
FROM Donation 
WHERE personkey=donorkey;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM donorschema.getdonations(79);

CREATE OR REPLACE FUNCTION addperson
( firstname TEXT,
  lastname TEXT,
  email TEXT,
  phone TEXT,
  announce BOOLEAN,
  apartment TEXT,
  street TEXT,
  city TEXT,
  "state" CHAR(2),
  zipcode CHAR(11),
  passwd VARCHAR(50)
)RETURNS void
AS $$

INSERT INTO person
(personfirstname, personlastname, 
personemail, personprimaryphone, 
persondateadded, announcement)
VALUES(firstname, lastname,
email, phone,
current_timestamp, announce);  

INSERT INTO personaddress
(personkey, personaddressapt, personaddressstreet,
personaddresscity, personaddressstate,
personaddresszipcode)
VALUES (CURRVAL('person_personkey_seq'), apartment, street,
city, "state", zipcode);

INSERT INTO loginTable
(personkey, personusername, personpassword)
VALUES (CURRVAL('person_personkey_seq'), makeusername(firstname, lastname), createpassword(passwd));															  
$$ LANGUAGE sql;

SELECT addperson(
  'Joseph', 'Rodgers', 'joseph.rodgers@hotmail.com',
  '2065552010',TRUE,'641', ‘222 8th Avenue,'Seattle',
  'WA', '98001','RodgersPass'
  );

SELECT * FROM PERSON WHERE PersonLastname='Rodgers';

SELECT * FROM personaddress WHERE personkey=141;

SELECT * FROM logintable WHERE personkey=141;

CREATE OR REPLACE function EditPerson
(
  pKey INTEGER,
  firstname TEXT,
  lastname TEXT,
  email TEXT,
  phone TEXT,
  announce BOOLEAN,
  apartment TEXT,
  street TEXT,
  city TEXT,
  "state" CHAR(2),
  zipcode CHAR(11)
)RETURNS VOID 
AS	$$
UPDATE person
SET personfirstname=firstname,
personlastname=lastname,
personemail=email,
personprimaryphone=phone,
announcement=announce
WHERE personkey=pKey;

UPDATE personaddress
SET personaddressapt = apartment,
personaddressstreet=street,
personaddresscity=city,
personaddressstate="state",
personaddresszipcode=zipcode
WHERE personkey=pkey;
																						   
$$ LANGUAGE sql;

SELECT editperson(
  141,'Joseph', 'Rodgers', 'joseph.rodgers@hotmail.com',
  '2065552010',TRUE,'212', '1200 150th Street','Seattle',
  'WA', '98001
);

ALTER TABLE grantapplication
ADD isflagged BOOLEAN DEFAULT FALSE;

CREATE OR REPLACE FUNCTION flagrequest()
RETURNS TRIGGER AS
$BODY$
BEGIN												   
IF NEW.grantapplicationamount > 
   (SELECT granttypeonetimemax 
     FROM granttype 
     WHERE granttypekey=NEW.granttypekey)
THEN  
UPDATE grantapplication
SET isflagged=TRUE
WHERE grantapplicationkey=NEW.grantapplicationkey;
END IF;	
RETURN NEW;
END;									   
$BODY: LANGUAGE plpgsql;

CREATE TRIGGER Flag_over_amounts
AFTER INSERT
ON grantapplication
FOR EACH ROW
EXECUTE PROCEDURE flagrequest();

INSERT INTO grantapplication(grantapplicationdate, personkey, 
     granttypekey, grantapplicationamount, grantapplicationexplain)
VALUES(current_timestamp, 141, 1, 300.00, 'hungry');

SELECT grantapplicationkey, grantapplicationdate, 
personkey, grantapplicationamount, isflagged 
FROM grantapplication where personkey=141;

INSERT INTO grantapplication(grantapplicationdate, personkey, 
     granttypekey, grantapplicationamount, grantapplicationexplain)
VALUES(current_timestamp, 141, 1, 175.00, 'hungry');

ALTER TABLE grantapplication DISABLE TRIGGER flag_over_amounts;

ALTER TABLE grantapplication ENABLE TRIGGER flag_over_amounts;





	




