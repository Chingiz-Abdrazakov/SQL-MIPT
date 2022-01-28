use zoo5 
go

If(OBJECT_ID('Animals_in_zones') is not null)
drop view Animals_in_zones

--Помещение, количество животных в этом помещения, наиболее многочисленный вид в этом помещение
CREATE VIEW 
Animals_in_zones as
select z.zone_name as 'Zone name', count(a.animal_id) as 'Amount', a.animal_type as 'Type'
from Animals a inner join Aviary_zone az on a.aviary_id = az.aviary_id
inner join Zones z on az.zone_id = z.zone_id
group by animal_type, zone_name
go


select * from Animals_in_zones

--Самый многочисленный вид в зоне 'Jungle'
select top 1 Amount as 'Top amount', Type
from Animals_in_zones
where Animals_in_zones.[Zone name] = 'Jungle'
order by (-Amount)