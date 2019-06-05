Create table dimstudent
(
	student_id serial,
	studentName text,
    address text,
	city text,
	"state" text,
    postalcode text
);

Create table dimcourse
(
	course_id serial,
	coursename text
);

create table diminstructor
(
	instructor_id serial,
	instructorname text	
);


create table dimcert
(
	cert_id serial,
	certname text
);

create table dimquarter
(
	quarter_id serial,
	quartername text,
	quarteryear int
);

create table schoolfact
(
	schoolfact_id serial,
    student_id int,
    course_id int,
    instructor_id int,
	cert_id int,
    quarter_id int,
    avg_grade numeric,
    credits int
   
  
);

alter table dimstudent
add constraint pk_dimstudent primary key (student_id);

alter table dimcourse
add constraint pk_dimcourse primary key (course_id);

alter table diminstructor
add constraint pk_diminstructor primary key (Instructor_id);

alter table dimcert
add constraint pk_dimcert primary key (cert_id);

alter table dimquarter
add constraint pk_dimquarter primary key (quarter_id);

Alter table schoolfact
add constraint pk_schookFact primary key(schoolfact_id, student_id, course_id, instructor_id, cert_id, quarter_id);

Alter table schoolfact
add foreign key (student_id) references dimstudent(student_id),
add foreign key (course_id) references dimcourse(course_id),
add foreign key (instructor_id) references diminstructor(instructor_id),
add foreign key (cert_id) references dimcert(cert_id),
add foreign key (quarter_id) references dimquarter (quarter_id);