
Select firstname || ' ' || lastname as studentname, 
address, city, "state", postalcode
From Person
Join student using(personkey);

Select coursename from course;

Select firstname || ' ' || lastname as instructorname from person
join instructor
using (personkey);

Select certificatename as certname from certificate;

Select distinct quartername, sectionyear as quarteryear
from quarter
join coursesection 
using (quarterkey);


Select student.studentkey as student_id,
course.coursekey as course_id,
Instructor.Instructorkey as instructor_key,
certificate.certificatekey as cert_id,
quarter.quarterkey as quarter_id,
finalgrade as avg_grade,
credits
From student
join roster using(studentkey)
join coursesection using (sectionkey)
join instructor using (instructorkey)
join course using (coursekey)
join quarter using (quarterkey)
Join certificatecourse using (coursekey)
join certificate using (certificatekey)
Where finalgrade is not null;
