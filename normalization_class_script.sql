drop database joins_db;
create database joins_db;
use joins_db;


-- CREATE TABLE Department_jn (
--     dept_id INT PRIMARY KEY,
--     manager_id INT,
--     department_name VARCHAR(50)
-- );

-- CREATE TABLE Employee_jn (
--     emp_id INT PRIMARY KEY,
--     e_name VARCHAR(50),
--     salary DECIMAL(10, 2),
--     department_id INT,
--     FOREIGN KEY (department_id) REFERENCES Department_jn(dept_id)
-- );


-- INSERT INTO Department_jn (dept_id, manager_id, department_name) 
-- VALUES
--     (1, 101, 'Engineering'),
--     (2, 102, 'Sales'),
--     (3, 103, 'Marketing'),
--     (4, 104, 'Other');

-- drop table department_jn;
CREATE TABLE Department_jn (
    dept_id INT PRIMARY KEY,
    manager_id INT,
    department_name VARCHAR(50)
);

-- drop table  employee_jn;
CREATE TABLE Employee_jn (
    emp_id INT PRIMARY KEY,
    e_name VARCHAR(50),
    salary DECIMAL(10, 2),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Department_jn(dept_id)
);


INSERT INTO Department_jn (dept_id, manager_id, department_name) 
VALUES
    (1, 101, 'Engineering'),
    (2, 102, 'Sales'),
    (3, 103, 'Marketing'),
    (4, 104, 'Other');


INSERT INTO Employee_jn (emp_id, e_name, salary, department_id) 
VALUES
    (201, 'John Doe', 60000.00, 1),
    (202, 'Jane Smith', 55000.00, 1),
    (203, 'Michael Johnson', 62000.00, 2),
    (204, 'Emily Davis', 58000.00, 2),
    (205, 'Chris Brown', 63000.00, 3),
    (206, 'Amanda Wilson', 60000.00, 3);


show tables;

SELECT D.DEPT_ID, D.department_name, E.EMP_ID, E.E_NAME FROM department_jn D
LEFT JOIN EMPLOYEE_JN E
ON D.DEPT_ID = E.department_id;


select * from department_jn;

select * from employee_jn;

SELECT * FROM employee_jn E 
INNER JOIN department_jn D
ON E.department_id = D.dept_id;


select e.emp_id, e.e_name, j.dept_id, j.department_name from employee_jn e
inner join
department_jn j on e.department_id = j.dept_id;

use northwind;
select c.first_name, c.city, o.shipped_date, o.order_date 
from
orders o inner join customers c 
on c.id=o.customer_id;



use hr;

show tables;

desc locations;  
SELECT * FROM LOCATIONS;
desc countries;
SELECT * FROM COUNTRIES;
desc regions;
SELECT * FROM REGIONS;
SELECT * FROM DEPARTMENTS;

-- SELECT C.COUNTRY_ID, C.COUNTRY_NAME,  R.REGION_ID, R.REGION_NAME FROM COUNTRIES C
-- INNER JOIN REGIONS R ON C.REGION_ID = R.REGION_ID
-- INNER JOIN 


SELECT D.DEPARTMENT_ID, D.DEPARTMENT_NAME, L.LOCATION_ID, L.CITY
FROM DEPARTMENTS D 
INNER JOIN LOCATIONS L 
ON D.LOCATION_ID = L.LOCATION_ID
INNER JOIN COUNTRIES C ON L.COUNTRY_ID = C.COUNTRY_ID;


SELECT D.DEPARTMENT_ID, D.DEPARTMENT_NAME, L.LOCATION_ID, L.CITY
FROM DEPARTMENTS D 
LEFT JOIN LOCATIONS L 
ON D.LOCATION_ID = L.LOCATION_ID;


-- LEFT JOIN COUNTRIES C ON L.COUNTRY_ID = C.COUNTRY_ID;


