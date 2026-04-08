drop table dept;

create table dept_cas(
	dept_id int auto_increment primary key,
    dept_name varchar(50),
    emp_id int,
    project_id varchar(20)
);

create table emp_cas(
emp_id int auto_increment primary key,
emp_name varchar(20),
proj_id varchar(20),
dept_id int,
foreign key (dept_id) references dept_cas(dept_id)
on delete cascade
on update cascade
);


insert into dept_cas(dept_name, emp_id, project_id) values('HR',101,'P_01'), ('IT',102,'P_02'), ('Admin',108,'P_01'), ('Tech',105, 'P_05');

insert into emp_cas(emp_id,emp_name,proj_id,dept_id) values (101,'Ram','P_01',1);
insert into emp_cas(emp_name,proj_id,dept_id) values ('Rama','P_03',2), ('Rana','P_04',1), ('Ravi','P_02',3), ('Sunny','P_04',4);
insert into emp_cas(emp_name,proj_id,dept_id) values ('Raman','P_03',2), ('Tana','P_04',1), ('Savi','P_02',3), ('Sunny','P_06',3);
insert into emp_cas(emp_name,proj_id,dept_id) values ('Heena','P_03',2), ('Hari','P_04',1), ('Mani','P_02',4), ('Bunny','P_09',3);

select * from dept_cas;
select * from emp_cas;

-- ------------------------------------- Delete Cascade ----------------------------------------------

-- due to cascading deleting from department table will also delete values from employee table 
delete from dept_cas where dept_id = 3;

-- This command will only delete record from child table and not affect the department table 
delete from emp_cas where emp_id = 101;

-- ------------------------------------- Update Cascade ----------------------------------------------
-- due to cascading updating any value in department table will also update value in employee table 
update dept_cas set dept_id = 5 where dept_id = 2;

-- Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`data_types`.`emp_cas`, CONSTRAINT `emp_cas_ibfk_1` FOREIGN KEY (`dept_id`) REFERENCES `dept_cas` (`dept_id`) ON DELETE CASCADE ON UPDATE CASCADE)

# department Id 2 was not present in department table(parent table)
update emp_cas set dept_id = 2 where dept_id =5;

# department Id 5 was present in department table(parent table) so all the dept_id 1 were changed in employee table (child)
update emp_cas set dept_id = 5 where dept_id =1;

insert into dept_cas(dept_id,dept_name, emp_id, project_id) values(3, 'Admin',105,'P_04');

##############################------------- Cascade set null -------------#####################################
create table emp_cas_null(
emp_id int auto_increment primary key,
emp_name varchar(20),
proj_id varchar(20),
dept_id int,
foreign key (dept_id) references dept_cas(dept_id)
on delete set null
);

select * from emp_cas_null;

delete from dept_cas where dept_id = 3;


##############################------------- Cascade restrict -------------#####################################
create table emp_cas_res(
emp_id int auto_increment primary key,
emp_name varchar(20),
proj_id varchar(20),
dept_id int,
foreign key (dept_id) references dept_cas(dept_id)
on delete restrict
);

insert into emp_cas_res(emp_id,emp_name,proj_id,dept_id) values (101,'Ram','P_01',1);
insert into emp_cas_res(emp_name,proj_id,dept_id) values ('Rama','P_03',2), ('Rana','P_04',1), ('Ravi','P_02',3), ('Monny','P_04',4);
insert into emp_cas_res(emp_name,proj_id,dept_id) values ('Raman','P_03',2), ('Tana','P_04',1), ('Savi','P_02',3), ('Sunny','P_06',3);
insert into emp_cas_res(emp_name,proj_id,dept_id) values ('Heena','P_03',2), ('Hari','P_04',1), ('Mani','P_02',4), ('Bunny','P_09',3);

select * from emp_cas_res;
insert into dept_cas(dept_id,dept_name, emp_id, project_id) values(3, 'Admin',105,'P_04');



## ----- delete command will not work because the dept_id 3 is present in /related to child table emp_res
-- Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails (`data_types`.`emp_cas_res`, CONSTRAINT `emp_cas_res_ibfk_1` FOREIGN KEY (`dept_id`) REFERENCES `dept_cas` (`dept_id`) ON DELETE RESTRICT)
-- 
delete from dept_cas where dept_id = 3;


## ------- deleteing row from child table ----------
delete from emp_cas_res where dept_id = 3;

# now the delete command was able to delete rows from deptartent(parent) table as it was not related to any child table
delete from dept_cas where dept_id = 3;