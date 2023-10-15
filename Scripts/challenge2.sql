select firstName, lastName, s.salesAmount
from employee e
left JOIN
sales s
on e.employeeId=s.employeeId
where e.title = 'Sales Person'
AND salesAmount is NULL;

-- select * from sales