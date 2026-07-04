select es.employee_id,es.first_name,es.salary,ed.gender,
(select avg(es1.salary) 
from employee_salary es1
inner join employee_demographics ed1
on es1.employee_id = ed1.employee_id
where ed1.gender = ed. gender
) as avg_sal
from employee_salary es
inner join employee_demographics ed
on es.employee_id = ed.employee_id
order by ed.gender;
