use feb26;

create table const_ex(
s_id int primary key,
s_name varchar(30) not null
);

insert into const_ex values (1, 'abd');
insert into const_ex(s_id) values (2); -- Error Code: 1364. Field 's_name' doesn't have a default value

alter table const_ex add c_name varchar(30) default 'PGCP-BDA';
alter table const_ex modify s_id int auto_increment;
alter table const_ex add c_start_date date default '2026-02-25';
alter table const_ex add login_time timestamp default current_timestamp;
alter table const_ex add marks int default 0;
alter table const_ex add phone_num int unique;

insert into const_ex(s_name) values ('ghi'); 
insert into const_ex(s_name) values ('jkl'); 

insert into const_ex(s_name, phone_num) values ('Bhakti', 3266543);
insert into const_ex(s_name, phone_num) values ('Shakti', 3266543); -- Error Code: 1062. Duplicate entry '3266543' for key 'const_ex.phone_num'

-- ALTER TABLE TableName
-- ADD CONSTRAINT UC_Name UNIQUE (ColumnName);

alter table const_ex modify phone_num int;
alter table const_ex add email varchar(100);

alter table const_ex add constraint unique_num_email unique(phone_num, email); -- this method acts as or condition, either of the 2 columns should have unique values.

select * from const_ex;


insert into const_ex(s_name,phone_num,email) values ('Shahid', 2345, 'shaa@hid.c');
insert into const_ex(s_name,phone_num,email) values ('Panchi', 2345, 'shaa@hid.c'); -- Error Code: 1062. Duplicate entry '2345' for key 'const_ex.phone_num'

insert into const_ex(s_name,phone_num,email) values ('Elon', 1234589, 'shaa@hid.c'); -- This will not give any error because one of the values is not unique.

desc const_ex;

alter table const_ex modify phone_num int not null, add unique(phone_num); -- Error Code: 1138. Invalid use of NULL value

show indexes from const_ex;

create table check_const_ex(
s_id int auto_increment primary key,
s_name varchar(20) not null,
age int not null check(age>21)
);


insert into check_const_ex(s_name,age) values('Bhakti',26);
insert into check_const_ex(s_name,age) values('Bhakti',16); -- Error Code: 3819. Check constraint 'check_const_ex_chk_1' is violated.

insert into check_const_ex(s_name,age) values('Shakti',24);

select * from check_const_ex;

alter table check_const_ex add gender char(10) check(gender in ('male','female','others') );

-- SET SQL_SAFE_UPDATES = 0 ;

update check_const_ex set gender='female' where s_name = 'Shakti';

insert into check_const_ex(s_name,age,gender) values('Aman',25, 'male');

insert into check_const_ex(s_name,age,gender) values('Naman',20, 'brother'); -- Error Code: 3819. Check constraint 'check_const_ex_chk_1' is violated.

drop table check_const_ex1;

create table check_const_ex1(
s_id int auto_increment primary key,
s_name varchar(20) not null,
age int not null,
n_num long,
gender char(10) check(gender in ('male','female','others') ),
check(char_length(s_name)>1 and age>21),
check (n_num regexp '[0-9]' and length(n_num)=10)
);

insert into check_const_ex1(s_name, age, gender, n_num) values ('BaKa',26,'female',9645786376);
-- Error Code: 3819. Check constraint 'check_const_ex1_chk_1' is violated.







    
    
    

