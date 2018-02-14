-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema PythonClub
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema PythonClub
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `PythonClub` DEFAULT CHARACTER SET utf8 ;
USE `PythonClub` ;

-- -----------------------------------------------------
-- Table `PythonClub`.`Person`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PythonClub`.`Person` (
  `idPerson` INT NOT NULL AUTO_INCREMENT,
  `FirstName` VARCHAR(255) NULL,
  `Lastname` VARCHAR(255) NOT NULL,
  `Email` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`idPerson`),
  UNIQUE INDEX `Email_UNIQUE` (`Email` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PythonClub`.`Member`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PythonClub`.`Member` (
  `idMember` INT NOT NULL AUTO_INCREMENT,
  `Person_idPerson` INT NOT NULL,
  `JoinDate` DATE NOT NULL,
  PRIMARY KEY (`idMember`),
  INDEX `fk_Member_Person_idx` (`Person_idPerson` ASC),
  CONSTRAINT `fk_Member_Person`
    FOREIGN KEY (`Person_idPerson`)
    REFERENCES `PythonClub`.`Person` (`idPerson`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PythonClub`.`Location`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PythonClub`.`Location` (
  `idLocation` INT NOT NULL AUTO_INCREMENT,
  `RoomName` VARCHAR(255) NULL,
  `StreetAddress` VARCHAR(255) NOT NULL,
  `City` VARCHAR(255) NULL DEFAULT 'Seattle',
  `State` CHAR(2) NULL DEFAULT 'WA',
  `Zipcode` VARCHAR(45) NOT NULL,
  `Phone` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idLocation`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PythonClub`.`Presentation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PythonClub`.`Presentation` (
  `idPresentation` INT NOT NULL AUTO_INCREMENT,
  `PresentationDate` DATE NOT NULL,
  `PresentationTime` TIME(6) NOT NULL,
  `Topic` VARCHAR(255) NOT NULL,
  `Location_idLocation` INT NOT NULL,
  PRIMARY KEY (`idPresentation`),
  INDEX `fk_Presentation_Location1_idx` (`Location_idLocation` ASC),
  CONSTRAINT `fk_Presentation_Location1`
    FOREIGN KEY (`Location_idLocation`)
    REFERENCES `PythonClub`.`Location` (`idLocation`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PythonClub`.`Speaker`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PythonClub`.`Speaker` (
  `idSpeaker` INT NOT NULL AUTO_INCREMENT,
  `Person_idPerson` INT NOT NULL,
  `idPresentation` INT NOT NULL,
  PRIMARY KEY (`idSpeaker`),
  INDEX `fk_Speaker_Person1_idx` (`Person_idPerson` ASC),
  INDEX `fk_Presentation_idx` (`idPresentation` ASC),
  CONSTRAINT `fk_Speaker_Person1`
    FOREIGN KEY (`Person_idPerson`)
    REFERENCES `PythonClub`.`Person` (`idPerson`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Presentation`
    FOREIGN KEY (`idPresentation`)
    REFERENCES `PythonClub`.`Presentation` (`idPresentation`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PythonClub`.`Meeting`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PythonClub`.`Meeting` (
  `idMeeting` INT NOT NULL AUTO_INCREMENT,
  `MeetingDate` DATE NOT NULL,
  `MeetingTime` TIME(6) NOT NULL,
  `Topic` VARCHAR(45) NOT NULL,
  `Location_idLocation` INT NOT NULL,
  PRIMARY KEY (`idMeeting`),
  INDEX `fk_Meeting_Location1_idx` (`Location_idLocation` ASC),
  CONSTRAINT `fk_Meeting_Location1`
    FOREIGN KEY (`Location_idLocation`)
    REFERENCES `PythonClub`.`Location` (`idLocation`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PythonClub`.`MeetingMinutes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PythonClub`.`MeetingMinutes` (
  `idMeetingMinutes` INT NOT NULL AUTO_INCREMENT,
  `MeetingNotes` MEDIUMTEXT NOT NULL,
  `Actions` VARCHAR(255) NULL,
  `Summary` VARCHAR(255) NULL,
  `Meeting_idMeeting` INT NOT NULL,
  PRIMARY KEY (`idMeetingMinutes`),
  INDEX `fk_MeetingMinutes_Meeting1_idx` (`Meeting_idMeeting` ASC),
  CONSTRAINT `fk_MeetingMinutes_Meeting1`
    FOREIGN KEY (`Meeting_idMeeting`)
    REFERENCES `PythonClub`.`Meeting` (`idMeeting`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PythonClub`.`MeetingAttendance`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PythonClub`.`MeetingAttendance` (
  `Member_idMember` INT NOT NULL,
  `Meeting_idMeeting` INT NOT NULL,
  INDEX `fk_MeetingAttendance_Member1_idx` (`Member_idMember` ASC),
  INDEX `fk_MeetingAttendance_Meeting1_idx` (`Meeting_idMeeting` ASC),
  CONSTRAINT `fk_MeetingAttendance_Member1`
    FOREIGN KEY (`Member_idMember`)
    REFERENCES `PythonClub`.`Member` (`idMember`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_MeetingAttendance_Meeting1`
    FOREIGN KEY (`Meeting_idMeeting`)
    REFERENCES `PythonClub`.`Meeting` (`idMeeting`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PythonClub`.`Resources`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PythonClub`.`Resources` (
  `idResources` INT NOT NULL AUTO_INCREMENT,
  `idMember` INT NOT NULL,
  `ResourceType` VARCHAR(45) NOT NULL,
  `ResourceName` VARCHAR(45) NOT NULL,
  `ResourceLink` VARCHAR(45) NULL,
  `ResourceLocation` VARCHAR(45) NULL,
  PRIMARY KEY (`idResources`),
  INDEX `Fk_Member_Resource_idx` (`idMember` ASC),
  CONSTRAINT `Fk_Member_Resource`
    FOREIGN KEY (`idMember`)
    REFERENCES `PythonClub`.`Member` (`idMember`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PythonClub`.`ResourceComments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PythonClub`.`ResourceComments` (
  `idResourceComments` INT NOT NULL AUTO_INCREMENT,
  `Rating` INT NOT NULL,
  `Comment` MEDIUMTEXT NULL,
  `Resources_idResources` INT NOT NULL,
  `Member_idMember` INT NOT NULL,
  PRIMARY KEY (`idResourceComments`),
  INDEX `fk_ResourceComments_Resources1_idx` (`Resources_idResources` ASC),
  INDEX `fk_ResourceComments_Member1_idx` (`Member_idMember` ASC),
  CONSTRAINT `fk_ResourceComments_Resources1`
    FOREIGN KEY (`Resources_idResources`)
    REFERENCES `PythonClub`.`Resources` (`idResources`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ResourceComments_Member1`
    FOREIGN KEY (`Member_idMember`)
    REFERENCES `PythonClub`.`Member` (`idMember`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PythonClub`.`ClubRoles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PythonClub`.`ClubRoles` (
  `idClubRoles` INT NOT NULL AUTO_INCREMENT,
  `ClubRoleName` VARCHAR(45) NOT NULL,
  `ClubRoleDescription` VARCHAR(255) NULL,
  PRIMARY KEY (`idClubRoles`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PythonClub`.`MemberRole`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PythonClub`.`MemberRole` (
  `ClubRoles_idClubRoles` INT NOT NULL,
  `Member_idMember` INT NOT NULL,
  `MemberRoleDateAssigned` DATE NOT NULL,
  PRIMARY KEY (`ClubRoles_idClubRoles`, `Member_idMember`),
  INDEX `fk_MemberRole_Member1_idx` (`Member_idMember` ASC),
  CONSTRAINT `fk_MemberRole_ClubRoles1`
    FOREIGN KEY (`ClubRoles_idClubRoles`)
    REFERENCES `PythonClub`.`ClubRoles` (`idClubRoles`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_MemberRole_Member1`
    FOREIGN KEY (`Member_idMember`)
    REFERENCES `PythonClub`.`Member` (`idMember`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


insert into location(RoomName,StreetAddress,City,State,Zipcode,Phone)
Values('BallRoom','1001 Pine','Seattle','WA','98122','2065551234'),
('3211','2010 Willis Ave','Seattle','WA', '98100','2065552134'),
('BE414','1600 Broadway','Seattle','WA', '98122','2065552543'),
('SA400','21608 Broadway Ave','Seattle','WA', '98100','2065554567');

Insert into Person(FirstName, LastName, Email)
Values('John','Right','john.Right@gmail.com'),
('Marianne','Johnson','Marianne.Johnson@gmail.com'),
('Bradly','Wrong','bradley.wrong@gmail.com'),
('Jennifer', 'Manning','jennifermanning@gmail.com'),
('Lisa', 'Manning','Lisamanning@gmail.com'),
('Carol', 'Peterson','carol.peterson@gmail.com'),
('David', 'Taylor','jdTaylor@gmail.com'),
('Morgan', 'Lewis','mLewis@gmail.com'),
('Larry', 'Brown','larryBrown@gmail.com'),
('Hannah', 'Nelson','Hanna@gmail.com');


Insert into Member(Person_idPerson,JoinDate)
values(1,'2016-2-1'),
(3,'2016-2-1'),
(4,'2017-3-1'),
(6,'2017-3-1'),
(8,'2018-8-10'),
(9,'2018-10-1'),
(10,'2018-10-5');


Insert into clubRoles(ClubRoleName)
Values('President'),
('Vice President'),
('Secretary'),
('Treasurer'),
('Member');



Insert into memberrole(ClubRoles_idClubRoles,Member_idMember,MemberRoleDateAssigned)
Values(1,1,'2018-01-02'),
(2,2,'2018-01-02'),
(4,3,'2018-01-02'),
(5,4,'2018-01-02'),
(5,5,'2018-01-02'),
(5,6,'2018-01-02'),
(5,7,'2018-01-02');


Insert into Meeting(MeetingDate,MeetingTime,Topic,Location_idLocation)
Values('2018-01-02','16:00:00','Election of officers',3),
('2018-02-05','16:00:00','Agenda for quarter',3),
('2018-02-14','16:00:00','Planning and up coming events',3),
('2018-03-10','16:00:00','Review of events',3);

Insert into meetingattendance(Member_idMember,Meeting_idMeeting)
Values(1,1),
(2,1),
(3,1),
(4,1),
(5,1),
(6,1),
(7,1),
(1,2),
(2,2),
(3,2),
(4,2),
(6,2),
(1,3),
(2,3),
(3,3),
(5,3),
(7,3),
(1,4),
(2,4),
(4,4),
(5,4),
(6,4),
(7,4);

Insert into meetingminutes(MeetingNotes, Actions, Summary, Meeting_idMeeting)
values('Officers were elected For the coming year','Set date for next meeting','Elections and planning',1),
('Several events were proposed for the upcoming year','Pursue speakers, find rooms','event planning',2),
('Events and speakers scheduled','put dates in database and web site','Event planning',3),
('Review and evaluation of events','Set date for next meeting','Evaluation',4);



Insert into presentation(PresentationDate, PresentationTime, Topic, Location_idLocation)
Values('2018-03-02','18:00:00','Python in Data Analytics', 2),
('2018-03-08','18:00:00','Python game development', 2);

Insert into speaker(Person_idPerson, idPresentation)
values(2,1),
(5,1);

Insert into resources(idMember, ResourceType, ResourceName, ResourceLink, ResourceLocation)
values(1,'tutorial','Python 101','http://python101,com','Web'),
(4,'Video','Python 101','http://YourTube.com/41289124981','Web');

Insert into resourcecomments(Rating, Comment, Resources_idResources, Member_idMember)
values(4, 'Great site',1,3),
(3, 'Good, but a bit too simple',1,7),
(2, 'OK, but too elementary',1,5),
(5, 'Very useful video',2,3);


