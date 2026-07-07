SELECT employee_id, concat(first_name,' ',last_name) AS NAME,employee_salary.dept_id,parks_departments.department_name,salary,
CASE 
  WHEN dept_id = 1 then salary*0.95
  WHEN dept_id IN (2,3,4) THEN salary*1.02
WHEN dept_id IS NULL THEN salary*1.05
WHEN dept_id = 6 then salary*1.01
END AS NEW_PAY,
CASE
WHEN dept_id = 6 THEN salary*0.05
WHEN dept_id IN(1,2,3,4,5) THEN salary*0.02
WHEN dept_id IS NULL THEN salary*0.03

END AS BONUS
FROM employee_salary
INNER JOIN parks_departments
 ON employee_salary.dept_id =parks_departments.department_id;
