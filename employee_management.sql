create database employee_management;

create table departments
(
	department_id serial not null,
	department_name varchar(50) not null,
	primary key(department_id)
);

create table employees
(
	employee_id serial not null,
	department_name varchar(50) not null,
	first_name varchar(50) not null, 
	last_name varchar(50) not null,
	email varchar(100) unique not null,
	hire_date date not null default current_date,
	department_id int,
	primary key (employee_id),
	constraint fk_employee_department foreign key(department_id) references departments(department_id)
);

select* from employees;

drop table employees;

alter table employees
drop department_name;

create table salaries
(
	salary_id serial not null,
	employee_id int not null,
	salary decimal(10,2) not null,
	constraint fk_salary_employee foreign key(employee_id) references employees(employee_id)
);

insert into departments(department_name) 
values('HR'),('Engineering'),('Sales'),('Marketing');

insert into employees(first_name, last_name, email, department_id) 
values('Diana', 'Wulandari', 'dianaw@gmail.com', 2),
	  ('Mark', 'Lee', 'marklee@gmail.com', 1),
	  ('Katarina', 'Blu', 'katarinalu@gmail.com', 3);

insert into employees(first_name, last_name, email, department_id) 
values('Nana', 'Yu', 'nanayu@gmail.com', 2),
	  ('Jisung', 'Park', 'jisungP@gmail.com', 2);

insert into salaries(employee_id, salary) 
values(3, 7000000),
	  (4, 6500000),
      (5, 5000000);

insert into salaries(employee_id, salary) 
values(6, 7000000);

#analisis 
select* from employees;
select* from salaries;

select e.first_name, e.last_name, e.email, d.department_name
from employees e
join departments d on e.department_id = d.department_id;

select e.first_name, e.last_name, s.salary
from employees e
join salaries s on e.employee_id = s.employee_id;

update salaries
set salary = 6300000
where employee_id = 5;

select concat(e.first_name, ' ', e.last_name), s.salary
from employees e
left join salaries s on s.employee_id = e.employee_id
where s.salary is null

delete from employees
where first_name = 'Jisung';

delete from employees
where(
select e.first_name, s.salary
from employees e
left join salaries s on s.employee_id = e.employee_id
where s.salary is null);

select* from employees;



