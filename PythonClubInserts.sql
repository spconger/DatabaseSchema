use pythonclub;

Insert into members(MembersFirstName,MembersLastName,MembersEmail,MemberOffice)
values ('Nichole','Kennedy','nichole.kennedy@gmail.com', 1),
('Morgan','Taylor','morgan.taylor@gmail.com',0),
('Jeff', 'Stevens','jeff.stevens@gmail.com',1),
('Lisa','Brown','lisa.brown@gmail.com',0),
('Mike','Nelson','mike.nelson.@gmail.com',0);

Insert into places(PlaceName,PlaceAddress,PlaceCity,PlaceState,PlaceZipCode,PlacesPhone)
Values('Central','1201 Broadway','Seattle','WA','98112','2065551234'),
('Seattle U','1800 Broadway','Seattle', 'Wa','98113', '2065552345'),
('Convention Center','800 Pike','Seattle', 'Wa','98114', '2065553456'),
('Bills','1200 Broadway','Seattle', 'Wa','98113', '2065554567');

Insert into speaker(SpeakerFirstName,SpeakerLastName,SpeakerPhone,SpeakerEmail,SpeakerPosition)
values('John','Anderson','2065559876','john.adams@gmail.com', 'Python Expert at Amazon'),
('Leah','Moore','2065559877','leah.moore@gmail.com', 'Data,Analytics with Python'),
('Roger','Tillerson','2065558967','roger.tillerson@gmail.com','Python in visual studio');



Insert into meetings(MeetingsDate, MeetingTime,Places_idPlaces)
values('2017-06-21','18:00:00',1),
('2017-7-21','18:00:00',4),
('2017-8-21','18:00:00',1);


Insert into meetingnotes(idMeetingNotes,Meetings_idMeetings,MeetingMinutes)
values(1,1, 'The meeting began on time with all members present and we discussed the future of python in artifical intellegence.'),
(2,2, 'The meeting was to determine officers for next year');

Insert into membersmeeting(Members_idMembers,MeetingNotes_idMeetingNotes)
Values(1,1),
(2,1),
(3,1),
(4,1),
(5,1),
(1,2),
(3,2),
(4,2);

Insert into announcements(idAnnouncements,AnnouncementsTitle, AnnouncementsText,AnnouncementDate,Members_idMembers)
Values(1,'Important meeting August 21','At the next meeting we choose new officers', '2017-8-10',1),
(2, 'Speaker on DataAnalytics','Fascinating speaker August 21st', '2017-8-12',3);


Insert into announcements(idAnnouncements,AnnouncementsTitle, AnnouncementsText,AnnouncementDate,Members_idMembers)
Values(3,'Important meetup','Python hackathon on august 30th', '2017-8-13',4);

Insert into events(EventsDate,EventTime,Places_idPlaces,Announcements_idAnnouncements)
values('2017-8-30','19:00:00',2,3);

Insert into presentations(idPresentations,PresentationDate,Places_idPlaces,Announcements_idAnnouncements)
values(1,'2017-8-21',2,2);

Insert into presentationdetails(idPresentationDetails, PresentationDetailsTime, Presentations_idPresentations, Speaker_idSpeaker, PresentationTopic)
values(1,'18:00:00',1,2,'Data Analytics with Python');

Insert into ResourceType(idRecourceType,RecourceTypeName)
Values(1,'Web tutorial'),
(2,'book'),
(3,'Video'),
(4,'Code repository');

Insert into Resources(idResources, ResourcesName, ResourceLink, ResourceDescription, ResourceDateAdded, Members_idMembers, RecourceType_idRecourceType)
Values(1,'Joes Web Tutorial', 'http://www.JoesStuff.com', 'Web tutorials', '2017-7-12',2,1);

Insert into Resources(idResources, ResourcesName, ResourceLink, ResourceDescription, ResourceDateAdded, Members_idMembers, RecourceType_idRecourceType)
Values(2,'Python videos', 'http://YouTube.com/pythonTutorials', 'Your tube tutorials', '2017-8-12',1,3);

Insert into comments(idComments, Resources_idResources, CommentText, CommentRating, Members_idMembers)
values(1,1,'Not as good as I hoped',3,1),
(2,1,'Very basic',2,4),
(3,2,'Really a valuable resource',4,5),
(4,2,'Uneven, but some really useful stuff',4,2)
