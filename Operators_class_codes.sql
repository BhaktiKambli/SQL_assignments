use hr;

select employee_id, first_name, Salary,
case
when employee_id%2=0 then 'Even EMP_ID'
else 'Odd EMP_ID' 
end as even_emp_id
from employees;

select employee_id, first_name, Salary,hire_date from employees where hire_date = '1987-06-17';
-- 
select employee_id, first_name, Salary,department_id
from employees where department_id != 90;

select employee_id, first_name, Salary,department_id
from employees where department_id <> 90;

select employee_id, first_name, Salary,department_id
from employees where department_id <=> 90;


-- not hired in 1987
select employee_id, first_name, salary, department_id, year(hire_date) from employees where year(hire_date) <> '1987';

select employee_id, first_name, salary, department_id from employees where first_name between 'Adam' and 'Hazel' order by first_name; 
-- for strings the end value is -1

select employee_id, first_name, salary, department_id from employees where employee_id between 100 and 105;
-- for int the between will consider end to end values

select employee_id, hire_date, first_name, salary, department_id from employees where hire_date between '1987-06-17' and '1987-06-21' order by hire_date;

################################ between and AND operator ###############################
select employee_id, hire_date, first_name, salary, department_id from employees where salary between 2100 and 2500 order by salary;
select employee_id, hire_date, first_name, salary, department_id from employees where salary>=2100 and salary<=2500 order by salary;
-- both of the above queries give same output. using AND and >= <= operators gives same output as between.


################################ between and OR operator ###############################
select employee_id, hire_date, first_name, salary, department_id from employees where salary not between 2700 and 3100 order by salary;

select employee_id, hire_date, first_name, salary, department_id from employees where salary<2700 or salary>3100 order by salary;


-- find employees hired between 1987-07-01 1987-08-31
use hr;
select employee_id, hire_date, first_name from employees where hire_date between '1987-07-01' and '1987-08-31';

select EMPLOYEE_ID,
first_name,
LAST_NAME,
EMAIL,
PHONE_NUMBER,
HIRE_DATE from employees where salary> 10000 and department_id not IN (80,90,100) order by salary desc;

desc employees;
######################### NORTHWIND DB ########################################

USE Northwind;
select * from products;

desc products;
select id,product_code,minimum_reorder_quantity from products where minimum_reorder_quantity is null ;

select id,product_code,minimum_reorder_quantity from products where minimum_reorder_quantity between 5 and 30;









