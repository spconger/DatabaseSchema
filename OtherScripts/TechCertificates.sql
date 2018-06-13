Create table person
(
	 personkey serial primary key,
     lastname text not null,
     firstname text null,
	 email text not null,
     address text,
     city text,
     state char(2),
	 postalcode text,
	 phone char(14),
     dateadded Date
);


Create table status
(
	statuskey serial primary key,
	statusname text not null
);

create table instructor
(
	instructorKey serial primary key,
	personkey int references person(personkey),
    hiredate date not null,
	statuskey int references status(statuskey)
);

Create table instructionalarea
(
	instructionalareakey serial primary key,
	areaname text not null,
	description text
);

create table InstructorArea
(
    instructionalareakey int references instructionalarea(instructionalareakey),
	instructorkey int references instructor(instructorkey),
	constraint pk_InstructorArea Primary key (instructionalareakey, instructorkey)
);

Create table course
(
	coursekey serial primary key,
    courseName text not null,
    credits int not null,
    coursedescription text
);

create table certificate
(
	certificatekey serial primary key,
	certificatename text not null,
    certificatedescription text
);

create table certificatecourse
(
	certificatekey int references Certificate(certificateKey),
	coursekey int references course(coursekey),
	minimumgrade decimal not null,
	constraint pk_certificatecourse primary key(certificatekey, coursekey)
);

Create table Student
(
	studentkey serial primary key,
	personkey int references person(personkey),
	studentStartDate Date not null,
	statuskey int references status(statuskey)
);

Create table CertAdmin
(
	certadminkey serial primary key,
	personkey int references person(personkey),
	statuskey int references status(statuskey)
);

create table substitution
(
    substitutionkey serial primary key,
	Certificatekey int references Certificate(certificatekey),
    coursekey int references Course(coursekey),
	substitutekey int references Course(courseKey),
    Studentkey int references student(studentKey),
    certadminkey int references certadmin(certadminkey)

);

create table coursesection
(
	sectionkey serial primary key,
	coursekey int references course(coursekey),
	instructorkey int references instructor(instructorkey),
	quarter int not null,
	sectionyear int not null
	
);

create table roster
(
	rosterkey serial primary key,
	sectionkey int references coursesection(sectionkey),
	studentkey int references student(studentkey),
	finalgrade decimal null
);

