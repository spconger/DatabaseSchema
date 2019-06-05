Drop table test;

Create table JsonTest
(
	 testID serial primary key,
	 test Json
);

Insert into JsonTest(test)
Values('{"testname" : "testOne", "testDate" : "today", "testdate" :123}'),
('{"testname" : "testtwo", "testDate" : "today", "testdate" :546}'),
('{"testname" : "testthree", "testDate" : "today", "testdate" :789}');

Select * from JsonTest;

Select test ->>'testname' as "name" from jsontest;

Select Json_each(test) from Jsontest;
Select Distinct Json_object_keys(test) from jsontest;

Select sum(cast (test ->> testdate as integer)) from Jsontest;