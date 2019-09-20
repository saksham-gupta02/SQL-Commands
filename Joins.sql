use employees;
Create table departments_dup
(
	dept_no char(4),
    dept_name varchar(40)
);

select * from departments_dup;

Delete from departments_dup
where dept_no = 'd029';

insert into departments_dup(dept_name)
values ('Public Relations');

Insert into departments_dup
select * from departments;

Insert into departments_dup(dept_no)
value('d010'),('d011');



DROP TABLE IF EXISTS dept_manager_dup;

CREATE TABLE dept_manager_dup (
emp_no int(11) NOT NULL,
dept_no char(4) NULL,
from_date date NOT NULL,
to_date date NULL
  );

INSERT INTO dept_manager_dup
select * from dept_manager;

INSERT INTO dept_manager_dup (emp_no, from_date)
VALUES(999904, '2017-01-01'),
	(999905, '2017-01-01'),
	(999906, '2017-01-01'),
	(999907, '2017-01-01');


DELETE FROM dept_manager_dup
WHERE dept_no = 'd001';

use employees;

# Join more than two tables in SQL - exercise
# Select all managers’ first and last name, hire date, job title, start date, and department name.

SELECT 
    e.first_name,
    e.last_name,
    e.hire_date,
    t.title,
    m.from_date,
    d.dept_name
FROM
    employees e
        INNER JOIN
    titles t ON e.emp_no = t.emp_no
        INNER JOIN
    dept_manager m ON e.emp_no = m.emp_no
        INNER JOIN
    departments d ON m.dept_no = d.dept_no
WHERE
    t.title = 'Manager';
    
    
select e.gender,count(e.emp_no)
from employees e 
inner join titles t on e.emp_no = t.emp_no
where t.title = 'Manager'
group by e.gender;


SELECT
    e.gender, COUNT(dm.emp_no)
FROM
    employees e
        JOIN
    dept_manager dm ON e.emp_no = dm.emp_no
GROUP BY gender;


select * from titles where title = 'Manager';

SELECT 
    *
FROM
    employees e
WHERE
    EXISTS( SELECT 
            t.emp_no
        FROM
            titles t
        WHERE
            t.emp_no = e.emp_no
                AND title = 'Assistant Engineer');




