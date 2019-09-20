use employees;

select * from salaries where salary > 89000;

create index i_salary on salaries(salary);