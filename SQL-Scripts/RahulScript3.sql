use sql12657494;
delimiter // create procedure insertIntoMinorMap(
    in dept_id varchar(3),
    in course_id varchar(10)
) BEGIN
insert into Minor_Course_Map
values(dept_id, course_id);
end;
// delimiter;
call insertIntoCourse (
    "CSD317",
    "Introduction to Database Management Systems",
    "This course is an introduction to DBMS and SQL",
    4,
    "OFFLINE",
    "CSD",
    "BOTH",
    1,
    0
);
call insertIntoMinorMap('CSD', 'CSD101');
call insertIntoMinorMap('CSD', 'CSD102');
call insertIntoMinorMap('CSD', 'CSD204');
call insertIntoMinorMap('CSD', 'CSD205');
call insertIntoMinorMap('CSD', 'CSD311');
call insertIntoMinorMap('CSD', 'CSD317');
call insertIntoMinorMap('COM', 'COM191');
call insertIntoMinorMap('COM', 'COM192');
call insertIntoMinorMap('COM', 'COM198');
call insertIntoMinorMap('COM', 'COM199');
call insertIntoMinorMap('COM', 'COM195');
call insertIntoMinorMap('DES', 'DES101');
call insertIntoMinorMap('DES', 'DES102');
call insertIntoMinorMap('DES', 'DES121');
call insertIntoMinorMap('DES', 'DES211');
call insertIntoMinorMap('DES', 'DES502');