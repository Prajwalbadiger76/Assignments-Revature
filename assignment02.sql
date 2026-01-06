-----------------------------------------------
-- employees table - oracle sql practice
-----------------------------------------------

-- table creation
create table employees (
    emp_id number generated always as identity primary key,
    emp_name varchar2(30),
    gender varchar2(10),
    department varchar2(20),
    designation varchar2(30),
    salary number,
    location varchar2(20),
    joining_date date,
    email varchar2(50)
);

-----------------------------------------------
-- insert records
-----------------------------------------------

insert into employees (emp_name, gender, department, designation, salary, location, joining_date, email)
values ('arun', 'male', 'it', 'developer', 45000, 'chennai', date '2022-01-10', 'arun@company.com');

insert into employees values (default, 'divya', 'female', 'hr', 'hr executive', 40000, 'bangalore', date '2021-05-15', 'divya@company.com');
insert into employees values (default, 'mubeen', 'male', 'it', 'senior developer', 55000, 'chennai', date '2023-03-20', 'mubeen@company.com');
insert into employees values (default, 'ravi', 'male', 'finance', 'accountant', null, 'mumbai', date '2020-07-18', 'ravi@company.com');
insert into employees values (default, 'anita', 'female', 'sales', 'sales executive', 38000, 'delhi', date '2022-09-12', 'anita@company.com');
insert into employees values (default, 'kumar', 'male', 'hr', 'recruiter', 32000, 'chennai', date '2021-11-05', 'kumar@company.com');
insert into employees values (default, 'divya', 'female', 'it', 'tester', 40000, 'bangalore', date '2022-06-25', 'divya.it@company.com');
insert into employees values (default, 'rahul', 'male', 'it', 'developer', 45000, 'chennai', date '2020-03-14', null);
insert into employees values (default, 'sneha', 'female', 'finance', 'analyst', null, 'mumbai', date '2023-01-08', 'sneha@company.com');
insert into employees values (default, 'amit', 'male', 'sales', 'sales manager', 60000, 'delhi', date '2019-12-01', 'amit@company.com');
insert into employees values (default, 'pooja', 'female', 'hr', 'hr executive', 40000, 'chennai', date '2021-04-19', null);
insert into employees values (default, 'ramesh', 'male', 'it', 'support engineer', 30000, 'hyderabad', date '2022-08-10', 'ramesh@company.com');
insert into employees values (default, 'suresh', 'male', 'it', 'developer', 45000, 'chennai', date '2020-10-30', 'suresh@company.com');
insert into employees values (default, 'neha', 'female', 'sales', 'sales executive', 38000, 'delhi', date '2023-02-14', 'neha@company.com');
insert into employees values (default, 'arun', 'male', 'it', 'developer', 45000, 'chennai', date '2021-09-09', 'arun.it@company.com');
insert into employees values (default, 'kiran', 'male', 'finance', 'accountant', null, 'mumbai', date '2022-12-21', 'kiran@company.com');
insert into employees values (default, 'meena', 'female', 'hr', 'recruiter', 32000, 'bangalore', date '2020-06-11', 'meena@company.com');
insert into employees values (default, 'vijay', 'male', 'it', 'tester', 35000, 'hyderabad', date '2023-04-01', null);
insert into employees values (default, 'anita', 'female', 'sales', 'sales executive', 38000, 'delhi', date '2021-07-07', 'anita.sales@company.com');
insert into employees values (default, 'rohit', 'male', 'it', 'developer', 45000, 'chennai', date '2022-11-18', 'rohit@company.com');
insert into employees values (default, 'sanjay', 'male', 'it', 'developer', null, 'chennai', date '2020-02-02', null);

-----------------------------------------------
-- select queries
-----------------------------------------------

select * from employees;
select emp_id, emp_name, department from employees;
select emp_name, salary from employees;

select * from employees where salary > 40000;
select * from employees where salary <= 35000;
select * from employees where salary = 45000;

select * from employees where joining_date > date '2022-01-01';
select * from employees where joining_date < date '2021-01-01';

select * from employees where salary between 35000 and 50000;
select * from employees where salary not between 30000 and 45000;

select * from employees
where joining_date between date '2021-01-01' and date '2022-12-31';

select * from employees where department in ('it','hr');
select * from employees where location in ('chennai','bangalore','hyderabad');
select * from employees where salary in (32000,38000,40000);

select * from employees where location <> 'mumbai';
select * from employees where department not in ('it','hr');
select * from employees where designation not in ('developer','tester');

-- ============================================
-- like, null, order by
-- ============================================

select * from employees where emp_name like 'a%';
select * from employees where emp_name like '%i';
select * from employees where emp_name like '%vi%';
select * from employees where email like '%@company.com%';
select * from employees where designation like '%engineer';

select * from employees where salary is null;
select * from employees where email is null;
select * from employees where salary is not null;
select * from employees where email is not null;

select * from employees order by salary asc;
select * from employees order by department asc, salary desc;
select * from employees order by location asc, emp_name asc;
select * from employees order by salary desc, joining_date asc;
select * from employees order by joining_date asc;
select * from employees order by emp_name asc;

-- ============================================
-- update queries
-- ============================================

update employees
set salary = 50000
where salary is null;

update employees
set salary = salary + 5000
where department = 'it';

update employees
set location = 'hyderabad'
where department = 'hr';

-----------------------------------------------
-- group by & having
-----------------------------------------------

select emp_name, count(*)
from employees
group by emp_name
having count(*) > 1;

select salary, count(*)
from employees
group by salary
having count(*) > 1;

select department, location, count(*)
from employees
group by department, location
having count(*) > 1;
