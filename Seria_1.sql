--Фантом 
set transaction isolation level serializable
begin transaction
select sum(entrance_cost) from Performances
where performance_type_id = 3

select sum(entrance_cost) from Performances
where performance_type_id = 3

commit