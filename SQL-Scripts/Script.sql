-- Path: Script.sql
-- ALTER TABLE department
-- ADD FOREIGN KEY (uga_id) REFERENCES faculty(faculty_id);
-- create table course_offering(
--     course_id int not null,
--     dept_id int not null,
--     semester varchar(10) not null,
--     year int not null,
--     primary key(course_id, dept_id, semester, year),
--     foreign key(course_id) references course(course_id),
--     foreign key(dept_id) references department(dept_id),
-- );
DROP DATABASE IF EXISTS squadron;
CREATE DATABASE squadron;
USE squadron;
-- department table
create table department(
    dept_id varchar(3) not null,
    dept_name varchar(255) not null,
    dept_phone VARCHAR(10),
    dept_email varchar(20),
    dept_type varchar(10),
    uga_id int not null,
    primary key(dept_id) -- foreign key(uga_id) references faculty(faculty_id)
);
-- student table
create table student(
    roll_no int not null,
    name varchar(255) not null,
    cgpa decimal(3, 2) not null,
    dob date not null,
    net_id varchar(10) not null,
    total_credits int not null,
    dept_id varchar(3) not null,
    minor_dept_id varchar(3),
    primary key(roll_no),
    foreign key(dept_id) references department(dept_id),
    foreign key(minor_dept_id) references department(dept_id)
);
-- course table
create table course(
    course_id varchar(10) not null,
    course_name varchar(255) not null,
    course_desc varchar(10000),
    course_credits int not null,
    course_medium varchar(10) not null,
    -- university, swayam
    dept_id varchar(3) not null,
    offered_in_semester varchar(10) not null,
    offered_as_uwe BOOLEAN not null,
    offered_as_me BOOLEAN not null,
    primary key(course_id),
    foreign key(dept_id) references department(dept_id) -- foreign key(offered_in_semester) references semester(semester_name),
);
-- faculty table
create TABLE faculty(
    faculty_id int not null,
    faculty_name varchar(255) not null,
    faculty_email varchar(255) not null,
    faculty_phone varchar(10) not null,
    faculty_type varchar(10) not null,
    -- professor, associate professor, assistant professor
    faculty_res VARCHAR(10) not null,
    -- resident, visiting
    dept_id varchar(3) not null,
    foreign key(dept_id) references department(dept_id),
    primary key(faculty_id)
);
-- course_student_map table
create Table Student_Course_Map(
    roll_no int not null,
    course_id varchar(10) not null,
    semester varchar(10) not null,
    -- spring2023, monsoon2023
    course_type varchar(10) not null,
    -- core, minor, uwe, me
    primary key(roll_no, course_id),
    foreign key(roll_no) references student(roll_no),
    foreign key(course_id) references course(course_id)
);
-- student_completed_course table
create table Student_Completed_Course(
    roll_no int not null,
    course_id varchar(10) not null,
    semester varchar(10) not null,
    primary key(roll_no, course_id),
    foreign key(roll_no) references student(roll_no),
    foreign key(course_id) references course(course_id)
);
-- student_pursuing_minor table
-- course_faculty_map table
create table Course_Faculty_Map(
    course_id varchar(10) not null,
    faculty_id int not null,
    primary key(course_id, faculty_id),
    foreign key(course_id) references course(course_id),
    foreign key(faculty_id) references faculty(faculty_id)
);
-- course_pre_req table
create table Course_Pre_Req(
    course_id varchar(10) not null,
    pre_req_course_id varchar(10) not null,
    primary key(course_id, pre_req_course_id),
    foreign key(course_id) references course(course_id),
    foreign key(pre_req_course_id) references course(course_id)
);
create table Minor_course_Map(
    dept_id varchar(3) not null,
    course_id varchar(10) not null,
    primary key(dept_id, course_id),
    foreign key(dept_id) references department(dept_id),
    foreign key(course_id) references course(course_id)
);
create table offered_minors(
    dept_id varchar(3) not null,
    minor_description varchar(10000),
    credits int not null,
    primary key(dept_id),
    foreign key(dept_id) references department(dept_id)
);
insert into department
values(
        "COM",
        "Communication",
        8181818181,
        "Com@snu.edu.in",
        "Minor",
        10
    );
insert into department
values(
        "DES",
        "Design",
        5151515151,
        "des@snu.edu.in",
        "Minor",
        10
    );
insert into department
values(
        "CSD",
        "Computer Science",
        9191919191,
        "CSD@snu.edu.in",
        "Major",
        11
    );insert into department
values(
        "MEC",
        "Mechanical ",
        9191919191,
        "MEC@snu.edu.in",
        "Major",
        11
    );
    insert into department
values(
        "PHY",
        "Physics",
        9191919191,
        "PHY@snu.edu.in",
        "Major",
        11
    );
insert into department
values(
        "ECE",
        "Electronics and Communication Engineering",
        2302020202,
        "ECE@snu.edu.in",
        "Major",
        11
    );
insert into course
values(
        "DES211",
        "Introduction to Design",
        "This course is an introduction to design",
        4,
        "OFFLINE",
        "DES",
        "BOTH",
        1,
        0
    );
insert into course
values(
        "COM199",
        "Image and Sound Studio",
        "A detailed course covering various technical aspects of photography and sound effects",
        4,
        "OFFLINE",
        "COM",
        "BOTH",
        1,
        0
    );
insert into course
values(
        "COM192",
        "Interpreting Cinema",
        "A detailed course covering various technical aspects of Cinema, screenplay and imagery",
        4,
        "OFFLINE",
        "COM",
        "BOTH",
        1,
        0
    );
insert into course
values(
        "COM198",
        "Cinema between two world wars",
        "This Optional course is a historical survey of cinema during a time when most
of its grammar and syntax developed",
        4,
        "OFFLINE",
        "COM",
        "BOTH",
        1,
        0
    );
insert into course
values(
        "COM195",
        "Editing and post production",
        "Movies lets go",
        6,
        "OFFLINE",
        "COM",
        "BOTH",
        1,
        0
    );
-- Insert Computer Science department courses
insert into course
values (
        "CSD101",
        "Introduction to Computing and Programming (3:0:1)",
        "An introductory course in programming and computing concepts.",
        4,
        "OFFLINE",
        "CSD",
        "BOTH",
        1,
        0
    );
insert into course
values (
        "CSD102",
        "Data Structures (3:0:1)",
        "A course on data structures and algorithms.",
        4,
        "OFFLINE",
        "CSD",
        "BOTH",
        1,
        0
    );
insert into course
values (
        "CSD211",
        "Computer Organization (3:1:0)",
        "An overview of computer organization and architecture.",
        4,
        "OFFLINE",
        "CSD",
        "MONSOON",
        1,
        0
    );
insert into course
values (
        "CSD204",
        "Operating Systems (3:0:1)",
        "An introduction to operating systems principles and concepts.",
        4,
        "OFFLINE",
        "CSD",
        "SPRING",
        1,
        0
    );
insert into course
values (
        "CSD105",
        "Software Engineering (3:0:1)",
        "Choose one of the following courses: Software Engineering, Computer Networks, Design and Analysis of Computer Algorithms, or Database Systems.",
        4,
        "OFFLINE",
        "CSD",
        "BOTH",
        1,
        0
    );
insert into course
values (
        "CSD319",
        "Design and analysis of algorithms",
        "A course on the design and analysis of algorithms.",
        4,
        "OFFLINE",
        "CSD",
        "BOTH",
        1,
        0
    );
insert into course
values (
        "CSD400",
        "Theory of Computation",
        "A course on the theory of computation.",
        4,
        "OFFLINE",
        "CSD",
        "BOTH",
        0,
        0
    );
insert into course
values (
        "CSD210",
        "Introduction to Probability and Statistics",
        "An introductory course on probability and statistics.",
        4,
        "OFFLINE",
        "CSD",
        "BOTH",
        0,
        0
    );
insert into course
values (
        "CSD205",
        "Discrete Mathematics",
        "A course on discrete mathematics.",
        4,
        "OFFLINE",
        "CSD",
        "BOTH",
        1,
        0
    );
insert into course
values (
        "CSD307",
        "Software Design Lab",
        "A lab-based course on software design.",
        4,
        "OFFLINE",
        "CSD",
        "BOTH",
        0,
        0
    );
insert into course
values (
        "CSD311",
        "Artificial Intelligence",
        "A course on artificial intelligence.",
        4,
        "OFFLINE",
        "CSD",
        "BOTH",
        1,
        0
    );
insert into course
values (
        "CSD451",
        "Applied Cryptography",
        "A course on applied cryptography.",
        4,
        "OFFLINE",
        "CSD",
        "BOTH",
        0,
        1
    );
insert into course
values (
        "CSD456",
        "Introduction to Machine Learning",
        "An introduction to machine learning concepts and techniques.",
        4,
        "OFFLINE",
        "CSD",
        "BOTH",
        0,
        1
    );
insert into course
values (
        "CSD391",
        "Image processing",
        "An introduction to image processing concepts and techniques.",
        4,
        "OFFLINE",
        "CSD",
        "BOTH",
        0,
        1
    );
insert into offered_minors
values(
        "DES",
        "In the background of rapidly changing global economy Industrial Design is playing positive role.
     By introducing Design Minor at SNU for the undergraduate the university will provide excellent opportunity in wider range of 
     placement for the undergraduate students. Design being an interdisciplinary discipline it provides much broader vision and professional exposure.",
        20
    );
insert into offered_minors
values(
        "COM",
        "The Minor in Communication offered by the Department of Communication is structured in a way that takes the student on the 
        journey a story takes till it manifests itself on screen; from Ideation and Writing, Basic Photography and Sound Recording.This is divided between six courses, 
         three compulsory and three optional.The student should complete 18 credits out of a possible 24.",
        18
    );
insert into offered_minors
values(
        "CSD",
        "Undergraduate students of Shiv Nadar University who are not majoring in Computer Science & Engineering (CSE) 
    have the option to take a Minor in CSE.Students have to acquire a minimum of 19 credits from the minor courses offered by the Department of CSE. For Non Engineering majors, 
    you have to acquire a minimum of 23 credits.",
        19
    );
use squadron;
insert into department
values(
        "MEC",
        "Mechanical Engineering",
        9191919191,
        "mec@snu.edu.in",
        "Major",
        11
    );
insert into department
values(
        "PHY",
        "Physics",
        9191919191,
        "phy@snu.edu.in",
        "Major",
        11
    );
insert into offered_minors
values(
        "MEC",
        " Minor in Mechanical Engineering would be offered to those Students who 
have cleared the Physics, and Maths courses from the Basic Sciences and Engineering 
Graphics, Engineering Mechanics/Static and Dynamics and Manufacturing Processes from 
Engineering Sciences categories",
        18
    );
insert into offered_minors
values(
        "PHY",
        " The physics department offers undergraduate students at SNU an opportunity of obtaining a 
minor in physics. A minor in physics has two aspects to it. First, it ensures that a student is 
well versed with the central core of physics, and secondly it will allow the student to learn 
more advanced aspects of the subject according to his or her interests. A minor in physics 
will equip a student to engage in challenging multi-disciplinary problems. It will be equally 
valuable for students seeking employment in industry or finance, where physicist skills of 
making quantitative models of complex situations are welcomed",
        18
    );