use zoo5
go


--Магазины, в которых продается еда для животного

if(OBJECT_ID('Food_for_animals') is not null )
drop view Food_for_animals

CREATE VIEW
Food_for_animals as
select an.animal_name as 'Animal name', s.name as 'Shop name', az.aviary_area as 'Area'
from Shops s inner join Assortment a on s.shop_id = a.shop_id
inner join Merchandise m on a.merchandise_id = m.merchandise_id
inner join Animal_food af on m.merchandise_id = af.food_id
inner join Animals an on af.animal_id = an.animal_id
inner join Aviary_zone az on an.aviary_id = az.aviary_id

group by an.animal_name, s.name, aviary_area
having az.aviary_area >= (select avg(aviary_area)
from Aviary_zone inner join Zones on Aviary_zone.zone_id = Zones.zone_id
where Zones.zone_name = 'Jungle')
go



select * from Food_for_animals
go

--Количество магазинов в зоопарке, где есть еда для Алекса
select count(Food_for_animals.[Shop name]) as 'Amount' 
from Food_for_animals 
where Food_for_animals.[Animal name] = 'Алекс'
