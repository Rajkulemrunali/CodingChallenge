-----Coding Challenge Assesment Task
create database test;
create table employee
(
emp_id int primary key,
emp_name varchar(100)
);
create table salary
(
salary_id int primary key,
salary decimal(10,2),
emp_id int,
foreign key (emp_id) references employee(emp_id)
);

insert into employee values(10,'MRUNALI'),(11,'Minal'),(13,'Ruhi');
insert into salary values (20,2000,10),(21,3000,11);

select * from employee;
select * from salary;

--delete emp_id=13
if exists (select 1 from salary where emp_id=13)
begin 
	delete from salary
	where emp_id=13;
end
delete from employee
where emp_id=13;

insert into employee values(13,'Ruhi');





