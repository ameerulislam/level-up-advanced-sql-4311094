-- select * from employee;

select e1.firstName, e1.lastName, e2.firstName as m_firstname, e2.lastName as m_lastname
from employee e1
INNER join employee e2
on e1.managerId = e2.employeeId;