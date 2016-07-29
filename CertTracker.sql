use Master
if exists 
  (Select name from sys.databases
  where name = 'CertTracker')
Begin
Drop database CertTracker
end
go
Create Database CertTracker
Go
use CertTracker
Go
Create table Person
(
  PersonKey int identity(1000,1) primary key,
  PersonLastName nvarchar(255),
  PersonFirstName nvarchar(255),
  PersonEmail nvarchar(255) unique
)

Go

Create Table Department
(
   DepartmentKey int identity (1,1) primary key,
   DepartmentName nvarchar(255),
   DepartmentOfficeNumber Nvarchar(10),
   DepartmentPhone nchar(13)
)
go
Create table Program
(
   ProgramKey int identity(1,1) primary key,
   DepartmentKey int foreign key references DepartMent(DepartmentKey),
   ProgramName nvarchar(255),
   ProgramOffice Nvarchar(10),
   ProgramPhone nchar(13)
)

Go
Create table Instructor
(
   PersonKey int primary key,
   InstructorOffice nvarchar(10),
   InstructorPhone nvarchar(13),
   Constraint FK_InstructorPerson Foreign Key
      (personKey) references Person(PersonKey)
)

go
Create table InstructorProgram
(
    PersonKey int,
	ProgramKey int,
	constraint PK_InstructorProgram primary key (personKey, ProgramKey),
	Constraint Fk_InstructorPersonb Foreign Key (personKey)
	   References Person(PersonKey),
	Constraint FK_InstructorProgram Foreign Key(programKey) 
	   References Program(ProgramKey)

)
go
Create table Course
(
   CourseKey int identity(1,1) primary key,
   CourseNumber nvarchar(5),
   CourseName nvarchar(255),
   CourseCredits int,
   CourseDescription nvarchar(255)

)
go
Create table Intent
(
  IntentKey int identity(1,1) primary key,
  IntentName nvarchar(255),
  IntentDescription nvarchar(255),
  IntentType nvarchar(11),
  Constraint ck_type check (IntentType in('Degree','Certificate'))
)
Go
Create Table IntentCourse
(
  CourseKey int Foreign key references Course(CourseKey),
  IntentKey int Foreign Key references Intent(IntentKey),
  RequiredGrade decimal(3,2),
  Constraint PK_intentCourse primary key (courseKey, intentkey),
  Constraint ck_MinGrade check(RequiredGrade between 0 and 4)
)
Go
Create table StudentStatus
(
   StudentStatusKey int identity(1,1) primary key,
   StudentStatusName nvarchar(255),
   StudentStatusDescription nvarchar(255)
)
go
Create Table Student
(
  PersonKey int primary key,
  StudentEntryDate Date,
  IntentKey int foreign key references Intent(IntentKey),
  StudentStatuskey int foreign key references StudentStatus(StudentStatusKey),
  Constraint fk_personStudent Foreign key (PersonKey)
  References Person(PersonKey)
)
Go
Create table Section
(
   SectionKey int identity(1,1) primary key,
   CourseKey int foreign key references Course(CourseKey),
   SectionQuarter nvarchar(10),
   YearKey int,
   SectionNumber int,
   PersonKey int foreign Key references Instructor(PersonKey),
   Constraint ck_Quarter check (SectionQuarter in ('Fall', 'Winter','Spring', 'Summer'))


)
Go
Create Table Enrollment
(
   Sectionkey int foreign key references Section(sectionKey),
   PersonKey int foreign key references Student(PersonKey),
   EnrollmentFinalGrade decimal(3,2),
   Constraint pk_Enrollments primary key (SectionKey, PersonKey),
   Constraint ck_finalGrade check (EnrollmentFinalGrade between 0 and 4)
)
Go
Create table Substitition
(
    SubstitutionKey int identity(1,1) primary key,
    PersonKey int foreign key references Student(personKey),
    IntentKey int, 
    CertCoursekey int,
    SubstituteCourseKey int foreign key references Course(CourseKey),
    SubstituionDate Date,
    SubstitutionApprover nvarchar(255),
    Constraint fk_Intent foreign key (IntentKey, CertCourseKey)
        references IntentCourse(IntentKey, CourseKey)
)
