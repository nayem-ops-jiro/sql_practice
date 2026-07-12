select first_name, length(first_name)
from employee_demographics;

select first_name, upper(first_name)
from employee_demographics;

select first_name, rtrim(first_name) as l
from employee_demographics;

select first_name, left(first_name,3)
from employee_demographics;

select first_name, right(first_name,4)
from employee_demographics;

select first_name, substring(first_name,2,2)
from employee_demographics;

select first_name, substring(birth_date,1,4) as birth_year,age
from employee_demographics
where age>40
order by  birth_year desc;

select dept_id, avg(salary), pd.department_name
from employee_salary es
inner join parks_departments pd
on es.dept_id = pd.department_id
group by dept_id;

select first_name,last_name, occupation, replace(occupation,'Deputy','') as demotion_to, REPLACE(salary,'5','0') as new_salary
from employee_salary
where occupation like '%deputy%';

select first_name,last_name, locate('n',first_name)
from employee_salary
;

select first_name,last_name, concat(first_name,' ',last_name)
from employee_salary
;
