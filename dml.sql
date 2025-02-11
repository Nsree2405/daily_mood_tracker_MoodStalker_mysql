desc users;

insert into users values(16,'Jai','Jai123@gmail.com','2003-06-12','M',NULL,'jojo');
insert into users(uid,uname,email,dob,gender,passkey) values(18,'Sreesh','Sreesh@gmail.com','2004-01-01','M','sree');
insert into users values(20,'Vaishnavi','Vaish9171@gmail.com','2006-08-02','F',NULL,'vaishu');
insert into users values(24,'Uma','Umauneek@gmail.com','2000-05-05','M',NULL,'uneekuma');
insert into users values(27,'Om','omi4u@gmail.com','2005-05-24','M',NULL,'omsriom');
insert into users values(45,'Guru','GuruGuru@gmail.com','2004-04-18','M',NULL,'oye guru');
insert into users values(48,'kanna','Kannamma@gmail.com','2004-04-24','M',NULL,'krishna');
insert into users values(49,'Mai','maaiam@gmail.com','2005-11-15','F',NULL,'miami');
insert into users values(90,'Vaidevi','Vaidevi143@gmail.com','2002-06-15','F',NULL,'VD#love');


select * from users;

desc moods;

insert into moods values(1624,'Angry','negative',-8,'Cool down.Breathe in Breathe out.Relax your mind and listen to your heartbeat.');
insert into moods values(1824,'Happy','positive',7,'Talk to your loved ones,share your happiness.');
insert into moods values(2416,'Sad','negative',-3,'Just think positive, listen to your heartbeat,put up some pitched music.');
insert into moods values(2424,'Joy','positive',9,'listen to your heart,feel the positive vibes.');
insert into moods values(5245,'Fine','neutral',0,'Focus on your goals.Enjoy your present and make a better future out of it.');

update moods set booster = -5 where type='negative';
update moods set booster = 5 where type='positive';
update moods set booster = 10 where mname='Joy';
update moods set booster = -10 where mid=1624;

select * from moods;

desc feels;

insert into feels values(18,2416,'2022-05-05',5,'Break up');
insert into feels values(20,1624,'2022-05-05',3,'Didnt let me in a party');
insert into feels values(24,2424,'2022-05-05',4,'Birthday special');
insert into feels values(48,2424,'2022-05-05',3,'My brothers birthday');
insert into feels values(27,1624,'2022-05-05',3,'Got into fight with my friend');
insert into feels values(49,1824,'2022-05-05',4,'Aniversary');
insert into feels values(90,5245,'2022-05-05',3,'Nothing special');


select * from feels;


-- all tables
select * from users;
select * from moods;
select * from feels;

--my deletions
DELETE from users;
DELETE from moods;
DELETE from feels;

DELETE from users where passkey is null;

