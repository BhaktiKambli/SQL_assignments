use feb26;

########### PRIMARY TABLE - courses #########################
create table courses (
cid int auto_increment primary key,
cr_name varchar(20)
);

insert into courses(cr_name) values ('AI'), ('ML'), ('PYTHON'), ('DS'), ('BDA'), ('DAC') ;

################# SECONDARY TABLE -- students ###############
create table students (
id int,
name varchar(20),
age int,
course_id int,
foreign key (course_id) references courses(cid)
);

insert into students(id, name, age, course_id)
values (101, 'A', 20, 1), (102, 'B',21, 2), (103, 'C',22, 3), (104, 'D',20, 4), (105, 'E',25, 5);

