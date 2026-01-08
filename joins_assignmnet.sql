--------------------------------------------------------
-- JOIN ASSIGNMENT DATA SETUP
--------------------------------------------------------

------------------------
-- department table
------------------------
create table dept (
    dept_id number primary key,
    dept_name varchar2(30),
    location varchar2(30)
);

insert into dept values (10, 'it', 'chennai');
insert into dept values (20, 'hr', 'bengaluru');
insert into dept values (30, 'finance', 'mumbai');
insert into dept values (40, 'sales', 'delhi');
insert into dept values (50, 'support', 'hyderabad');
insert into dept values (60, 'r&d', 'pune');

------------------------
-- employee table
------------------------
create table emp (
    emp_id number primary key,
    emp_name varchar2(50),
    job_title varchar2(50),
    hire_date date,
    salary number,
    manager_id number,
    dept_id number
);

insert into emp values (1001, 'arun kumar', 'it manager', date '2021-06-09', 90000, null, 10);
insert into emp values (1002, 'divya sharma', 'hr executive', date '2022-01-10', 52000, 1006, 20);
insert into emp values (1003, 'mubeen ali', 'senior developer', date '2023-03-20', 85000, 1001, 10);
insert into emp values (1004, 'ravi iyer', 'accountant', date '2020-07-18', 60000, 1007, 30);
insert into emp values (1005, 'anita verma', 'sales executive', date '2022-09-12', 48000, 1008, 40);
insert into emp values (1006, 'kumar singh', 'hr manager', date '2020-11-05', 78000, null, 20);
insert into emp values (1007, 'meera nair', 'finance manager', date '2019-04-22', 82000, null, 30);
insert into emp values (1008, 'sameer khan', 'sales manager', date '2021-02-14', 80000, null, 40);
insert into emp values (1009, 'priya das', 'support engineer', date '2024-01-05', 45000, 1001, 50);
insert into emp values (1010, 'john contractor', 'consultant', date '2024-06-01', 70000, 1001, null);

------------------------
-- project table
------------------------
create table project (
    project_id number primary key,
    project_name varchar2(50),
    start_date date,
    end_date date,
    dept_id number
);

insert into project values (501, 'payroll revamp', date '2025-01-15', date '2025-10-31', 30);
insert into project values (502, 'hr portal', date '2025-02-01', null, 20);
insert into project values (503, 'crm upgrade', date '2025-03-10', null, 40);
insert into project values (504, 'cloud migration', date '2025-01-20', null, 10);
insert into project values (505, 'support ticket automation', date '2025-04-05', null, 50);
insert into project values (506, 'ai research poc', date '2025-05-01', null, 60);
insert into project values (507, 'unassigned initiative', date '2025-06-01', null, null);

------------------------
-- emp_project table
------------------------
create table emp_project (
    emp_id number,
    project_id number,
    role_name varchar2(50),
    allocation_pct number,
    assign_date date
);

insert into emp_project values (1001, 504, 'project lead', 60, date '2025-01-20');
insert into emp_project values (1003, 504, 'developer', 80, date '2025-02-01');
insert into emp_project values (1006, 502, 'project lead', 50, date '2025-02-01');
insert into emp_project values (1002, 502, 'hr analyst', 70, date '2025-02-10');
insert into emp_project values (1008, 503, 'project lead', 40, date '2025-03-10');
insert into emp_project values (1005, 503, 'sales sme', 60, date '2025-03-15');
insert into emp_project values (1007, 501, 'project lead', 50, date '2025-01-15');
insert into emp_project values (1004, 501, 'accountant sme', 50, date '2025-01-20');
insert into emp_project values (1009, 505, 'support sme', 70, date '2025-04-05');

------------------------
-- salary grade table
------------------------
create table sal_grade (
    grade varchar2(5),
    min_sal number,
    max_sal number
);

insert into sal_grade values ('g1', 0, 49999);
insert into sal_grade values ('g2', 50000, 69999);
insert into sal_grade values ('g3', 70000, 89999);
insert into sal_grade values ('g4', 90000, 120000);

--------------------------------------------------------
-- JOIN ASSIGNMENT QUERIES
--------------------------------------------------------

-- 1. list all employees with department name and location
select e.emp_name, d.dept_name, d.location from emp e
join dept d on e.dept_id = d.dept_id;

-- 2. employees assigned to projects (employee + project + role)
select e.emp_name, p.project_name, ep.role_name from emp e
join emp_project ep on e.emp_id = ep.emp_id
join project p on ep.project_id = p.project_id;

-- 3. all departments with employee names (departments with no employees included)
select d.dept_name, e.emp_name from dept d
left join emp e on d.dept_id = e.dept_id;

-- 4. all projects with assigned employee names (projects with no employees included)
select p.project_name, e.emp_name from project p
left join emp_project ep on p.project_id = ep.project_id
left join emp e on ep.emp_id = e.emp_id;

-- 5. right outer join example
select d.dept_name, e.emp_name from emp e
right join dept d on e.dept_id = d.dept_id;

-- 6. all employees including those without department
select e.emp_name, d.dept_name from emp e
left join dept d on e.dept_id = d.dept_id;

-- 7. full outer join (all departments and all employees)
select e.emp_name, d.dept_name from emp e
full outer join dept d on e.dept_id = d.dept_id;

-- 8. planning matrix (department × salary grade)
select d.dept_name, s.grade from dept d
cross join sal_grade s;

-- 9. employee name with manager name (self join)
select e.emp_name as employee, m.emp_name as manager from emp e
left join emp m on e.manager_id = m.emp_id;

-- 10. join using USING (dept_id)
select emp_name, dept_name, location from emp
join dept using (dept_id);

-- 11. non-equi join: assign salary grade
select e.emp_name, e.salary, s.grade
from emp e
join sal_grade s
on e.salary between s.min_sal and s.max_sal;
