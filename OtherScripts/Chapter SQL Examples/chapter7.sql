/******************************
Chapter 7 tables sample SQL
******************************/

-- DROP TABLE public.donation;

CREATE TABLE public.donation
(
    donationkey integer NOT NULL DEFAULT nextval('donation_donationkey_seq'::regclass),
    personkey integer,
    donationamount numeric NOT NULL,
    donationdate timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    donationvalidation uuid DEFAULT uuid_generate_v4(),
    CONSTRAINT donation_pkey PRIMARY KEY (donationkey),
    CONSTRAINT donation_personkey_fkey FOREIGN KEY (personkey)
        REFERENCES public.person (personkey) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.donation
    OWNER to postgres;


CREATE TABLE location
(
              locationkey SERIAL PRIMARY KEY,
              locationname TEXT NOT NULL,
              locationaddress TEXT NOT NULL,
              locationcity TEXT DEFAULT 'Seattle',
              locationstate CHAR(2) DEFAULT 'WA',
              locationzip VARCHAR(11) NOT NULL,
              locationphone VARCHAR(13) NOT NULL,
              locationemail TEXT NOT NULL UNIQUE,
              locationURL TEXT
);

CREATE TABLE "event"
(
   eventkey SERIAL PRIMARY KEY,
   eventname TEXT NOT NULL,
   eventdate DATE Not Null,
   eventtime TIME NOT NULL,
   eventdescription TEXT,
   employeekey INT REFERENCES employee(Employeekey)
);

CREATE TABLE locationroom
(  
     locationroomkey SERIAL,
     locationkey INT,
     roomnumber int NOT NULL,  
     eventkey INT 
);

ALTER TABLE locationroom
ADD PRIMARY KEY (locationroomkey);

ALTER TABLE locationroom
ADD CONSTRAINT fk_location FOREIGN KEY (locationkey) 
   REFERENCES location(locationkey);

ALTER TABLE locationroom
ADD CONSTRAINT fk_event FOREIGN KEY (eventkey) 
   REFERENCES event(eventkey);

CREATE TABLE personevent
(
    personkey INT NOT NULL,
    eventkey INT NOT NULL
);

ALTER TABLE personevent
ADD CONSTRAINT pk_personevent PRIMARY KEY(personkey, eventkey);

ALTER TABLE personevent
ADD CONSTRAINT fk_personevent_person FOREIGN KEY (personkey)
   REFERENCES person(personkey),
ADD CONSTRAINT fk_personevent_even FOREIGN KEY (eventkey)
   REFERENCES event(eventkey);

ALTER TABLE person
ADD anouncement BOOLEAN DEFAULT TRUE;

ALTER TABLE person
DROP COLUMN anouncement;

ALTER TABLE person
ADD announcement BOOLEAN DEFAULT TRUE;

ALTER TABLE roster
ADD CONSTRAINT chk_grade CHECK (finalgrade BETWEEN 0 AND 4);

ALTER TABLE coursesection
ADD CONSTRAINT chk_quarter CHECK (quarter IN(‘Fall’, ‘Winter’, ‘Spring’, ‘Summer’))

CREATE TEMP TABLE emailList
(
    lastname text,
    firstname text,
    email text
);

INSERT INTO emailList(lastname, firstname, email)
SELECT personlastname, personfirstname, personemail
FROM person;

DROP TABLE emailList;
SELECT personlastname, personfirstname, personemail INTO TEMP EmailList
FROM person;

