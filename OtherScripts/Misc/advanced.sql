--set operators
Select lastname, firstname, email, 'section 1'as sectionNumber
from person
join student using(personkey)
Join roster using(studentkey)
Where sectionkey=1
Union
Select lastname, firstname, email, 'section 2'
from person
join student using(personkey)
Join roster using(studentkey)
Where sectionkey=2;

--set operators
Select lastname, firstname, email
from person
join student using(personkey)
Join roster using(studentkey)
Join coursesection using (sectionkey)
where quarterkey=1
Intersect
Select lastname, firstname, email
from person
join student using(personkey)
Join roster using(studentkey)
join coursesection using (sectionkey)
Where quarterkey=2;

Select lastname, firstname, email
from person
join student using(personkey)
Join roster using(studentkey)
Join coursesection using (sectionkey)
where quarterkey=1
Except
Select lastname, firstname, email
from person
join student using(personkey)
Join roster using(studentkey)
join coursesection using (sectionkey)
Where quarterkey=2;

--windows functions
Select quarterkey,studentkey, finalgrade, avg(finalgrade) over(partition by SectionYear Order by quarterkey)
From coursesection 
join roster using (sectionkey)
Where sectionyear =2018

--row number --but just for one section
--row number sorted
--select middle rows
--rank and dense rank with just one section
--first, last also with just one section

--pivot

Select distinct sectionyear from coursesection;

Create temp table quartergrades
(
	"Year" integer,
	quarter integer,
    avggrade numeric
);

Insert into quartergrades
Select sectionyear, quarterkey, avg(finalgrade)
from coursesection
join roster using (sectionkey)
group by sectionyear, quarterkey;

select * from quartergrades;
CREATE extension tablefunc;
Select * from
CrossTab ('Select "Year", quarter, round(avggrade,2) from quartergrades order by 1,2')
As Final_result("Year" Integer, "1" numeric, "2" numeric, "3" numeric, "4" numeric);

Select * from
CrossTab ('Select quarter, "Year", round(avggrade,2) from quartergrades order by 1,2')
As Final_result(quarter Integer, "2017" numeric, "2018" numeric, "2019" numeric);

