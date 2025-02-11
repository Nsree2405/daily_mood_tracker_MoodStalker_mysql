-- creation of user table and its modifications
create table user(
    uid int,
    uname varchar(20),
    email varchar(30)
);

alter table user add(dob date);

alter table user add(gender varchar(1));

alter table user add (points int);

rename table user to users;

alter table users  rename column points to pts;

alter table users add(passkey varchar(8));

desc users;--display user table

--creation of mood table and its modifications
create table mood(
    mid int,
    name varchar(10),
    type varchar(10),
    booster int(1),
    activity varchar(20)
);

alter table mood rename column name to mname;
alter table mood modify column booster int(2);
alter table mood modify column activity text; 

rename table mood to moods;

desc moods;--display mood TABLE

--creation of feel table and modifications 
create table feel(
    uid int,
    mid int,
    date date,
    scale int(1)
);

alter table feel add(cause text);

alter table feel rename column date to day;
rename table feel to feels;

desc feels;--display feels relation


--display all tables 
desc users;
desc moods;
desc feels;

--my deletions and drops

DROP TABLE users;
DROP TABLE moods;
DROP TABLE feels;




