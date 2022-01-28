use zoo5
go

If(OBJECT_ID('Area_per_type') is not null)
drop view Area_per_type
go

--Вид, средняя площадь, приходящаяся на одну особь, количества
CREATE VIEW 
Area_per_type as
select a.animal_type as 'Animal type', count(a.animal_id) as 'Amount', (az.aviary_area / count(a.animal_id)) as  'Avg area'
from Animals a inner join Aviary_zone az on a.aviary_id = az.aviary_id
group by animal_type, az.aviary_area
go


select * from Area_per_type
go

--Вывести среднюю площадь, приходящуюся на пеликанов и их количество
select Amount, [Avg area]
from Area_per_type
where [Animal type] = 'Pelican'