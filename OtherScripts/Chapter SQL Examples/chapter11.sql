/****************************
chapter 11 Administrative Commands
*******************************/

SELECT * FROM INFORMATION_SCHEMA.tables;

SELECT Column_name, data_type FROM information_schema.columns  
WHERE table_name='grantapplication';

SELECT table_schema, table_name, is_updatable FROM information_schema.views  
WHERE NOT table_schema ='pg_catalog'  
AND NOT table_schema='information_schema';

SELECT Column_name, data_type,  
constraint_name, constraint_type 
FROM information_schema.columns 
INNER JOIN information_schema.table_constraints 
ON information_schema.columns.table_name= 
information_schema.table_constraints.table_name 
WHERE information_schema.columns.table_name='grantapplication' 
ORDER BY column_name; 

CREATE INDEX ON person(personlastname); 

SELECT tablename, indexname, indexdef FROM pg_indexes WHERE tablename='person';

CREATE UNIQUE INDEX ON person(personprimaryphone);

CREATE INDEX ON grantapplication(granttypekey, personkey);

CREATE INDEX ON donation(donationamount) 
WHERE donationamount > 500;

--these commands are executed in the Windows command line

cd\ 
cd program files\Postgresql\10\bin

C:\program files\Postgresql\10\bin>

pg_dump -U postgres -F p communityassistpg > c:\pgbackups\communityassistpg.sql

pg_dump -U postgres -F t communityassistpg > c:\pgbackups\communityassistpg.tar

pg_dumpall -U postgres > c:\pgbackups\all.sql

pg_dumpall --schema-only > c:\pgbackups\schemaonly.sql

psql -U postgres -d communityassistpg_copy -f c:\pgbackups\communityassitpg.sql

pg_restore --dbname=communityassigpg_copy --verbose c:\pgbackups\communityassistpg.tar

pg_restore --dbname=communityassistpg --create --verbose c:\pgbackups\communityassistpg.tar

--done command line

CREATE USER newadmin WITH 
LOGIN 
SUPERUSER 
CREATEDB 
CREATEROLE 
INHERIT 
REPLICATION 
CONNECTION LIMIT -1 
PASSWORD 'xxxxxx'; 

CREATE ROLE employeerole;

GRANT CONNECT ON DATABASE communityassistpg TO employeerole;

GRANT USAGE ON SCHEMA public TO employeerole;

GRANT SELECT ON ALL TABLES IN SCHEMA public TO employeerole; 

GRANT UPDATE ON ALL TABLES IN SCHEMA public TO employeerole; 

GRANT INSERT ON ALL TABLES IN SCHEMA public TO employeerole; 

GRANT EXECUTE ON ALL FUNCTIONS in SCHEMA public TO employeerole;

GRANT USAGE ON SCHEMA employeeschema TO employeerole; 

GRANT SELECT ON ALL TABLES IN SCHEMA employeeschema TO employeerole; 

GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA employeeschema TO employeerole;  


SELECT Personlastname, personfirstname, employeekey 
FROM person  
JOIN employee USING(personkey); 

CREATE ROLE janderson WITH PASSWORD 'P@ssw0rd1' LOGIN, INHERIT;

GRANT employeerole TO janderson;

SELECT * FROM person;  

SELECT * FROM employeeSchema.employeeview; 

SELECT donationamount, employeeschema.donationpercentages(donationamount, 85) 
FROM donation; 

UPDATE person 
SET personfirstname='Jason' 
WHERE personkey=3; 

CREATE ROLE approle WITH PASSWORD 'P@ssw0rd1' LOGIN;

GRANT CONNECT TO DATABASE communityassistpg TO approle;

GRANT USAGE ON SCHEMA public to approle; 

GRANT USAGE ON SCHEMA donorschema TO approle; 

GRANT USAGE ON SCHEMA clientschema TO approle; 

GRANT EXECUTE ON ALL FUNCTIONS in SCHEMA donorschema TO approle; 

GRANT EXECUTE ON ALL FUNCTIONS in SCHEMA clientschema TO applrole; 

GRANT SELECT ON ALL SEQUENCES in SCHEMA public TO approle; 

GRANT USAGE ON ALL SEQUENCES IN SCHEMA public TO approle; 

GRANT SELECT ON TABLE granttype TO approle; 

GRANT SELECT ON TABLE person TO approle; 

GRANT SELECT ON TABLE personaddress TO approle; 

GRANT INSERT ON TABLE person TO approle; 

GRANT INSERT ON TABLE personaddress TO approle; 

GRANT INSERT ON TABLE logintable TO approle; 

GRANT SELECT ON TABLE Logintable TO approle; 

GRANT INSERT ON TABLE loginhistory TO approle; 

GRANT EXECUTE ON FUNCTION addperson TO approle; 

GRANT EXECUTE ON FUNCTION validatelogin TO approle; 

Select addperson 
('Lynette',  
'Taylor',  
'ltaylor@hotmail.com',  
'2065553043', 
True, 
null, 
'123 West Brook Avenue', 
'Seattle',  
'Wa', 
'98012',  
'TaylorPass'); 

SELECT personkey, personusername, personpassword  
FROM logintable  
WHERE personusername='ltaylor'  
ANd loginkey= validateLogin(personusername, 'TaylorPass') ; 

SELECT personkey, personusername, personpassword  
FROM logintable  
WHERE personusername='ltaylor'  
ANd loginkey= validateLogin(personusername, 'TaylorPass') ; 

REVOKE CONNECT ON DATABASE communityassistpg FROM employeerole; 

REVOKE USAGE ON SCHEMA public FROM employeerole; 

REVOKE SELECT ON ALL TABLES IN SCHEMA public FROM employeerole; 

REVOKE SELECT ON ALL SEQUENCES IN SCHEMA public FROM employeerole; 

REVOKE UPDATE ON ALL TABLES IN SCHEMA public FROM employeerole; 

REVOKE INSERT ON ALL TABLES IN SCHEMA public FROM employeerole; 

REVOKE EXECUTE ON ALL FUNCTIONS in SCHEMA public FROM employeerole; 

REVOKE USAGE ON SCHEMA employeeschema FROM employeerole; 

REVOKE SELECT ON ALL TABLES IN SCHEMA employeeschema FROM employeerole; 

REVOKE SELECT ON ALL SEQUENCES IN SCHEMA employeeschema FROM employeerole; 

REVOKE EXECUTE ON ALL FUNCTIONS IN SCHEMA employeeschema FROM employeerole; 

 

DROP ROLE employeerole; 

