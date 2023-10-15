with max_model_sales as(
select 
s.employeeId,
i.modelId,
count() model_sold
from sales s
left join inventory i
on s.inventoryId = i.inventoryId
group by employeeId, modelId
),
ranking as (
  select
  employeeId,
  modelId,
  model_sold,
  ROW_NUMBER() over(partition by employeeId order by model_sold desc) rank
  from max_model_sales
)
select
e.firstName,
e.lastName,
m.model,
r.rank
from employee e
join ranking r
on e.employeeId = r.employeeId
join model m
on m.modelId = r.modelId
where rank = 1;




select * from inventory;
select * from model;

select modelId, count(*) from inventory 
group by modelId

select firstName, lastName, count(*) from employee e
join sales s
on e.employeeId = s.employeeId
group by