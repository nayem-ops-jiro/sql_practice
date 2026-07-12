select employee_id, first_name, last_name, 'old' AS 'condition'
from employee_demographics
where age>45
union
select employee_id, first_name, last_name, 'highly paid' AS 'condition'
from employee_salary
where salary>70000;
