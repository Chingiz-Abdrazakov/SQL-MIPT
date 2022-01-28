use zoo5
go


If(OBJECT_ID('Perf_Animals') is not null)
drop view Perf_Animals

--Представления, которые находятся в той же зоне, что и определенное животное или вид
CREATE VIEW 
Perf_Animals as
select a.animal_name as 'Animal name', a.animal_type as 'Animal type', pt.performance_name as 'Performance name',
p.start_time as 'Performance start time', p.end_time as 'Performance end time',
p.entrance_cost as 'Entrance cost'
from Animals a inner join Aviary_zone az on a.aviary_id = az.aviary_id 
inner join Zones z on az.zone_id = z.zone_id
inner join Performance_Location pl on z.zone_id = pl.zone_id
inner join Performance_type pt on pl.performance_type_id = pt.performance_type_id
inner join Performances p on pt.performance_type_id = p.performance_type_id
group by p.performance_id, pt.performance_name, a.animal_name, a.animal_type, p.start_time, p.end_time, p.entrance_cost
go 

select * from Perf_Animals
go

--Средняя цена билета в зоне с обезьянами
select avg([Entrance cost] * 1.0) as 'Avg entrance cost'
from Perf_Animals
where [Animal type] = 'Monkey'
