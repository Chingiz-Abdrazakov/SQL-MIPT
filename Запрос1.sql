use zoo5
go
--Названия продуктов, которые едят пеликаны
select description 
from (Merchandise m inner join Animal_food af on m.merchandise_id = af.food_id)
inner join (Animals a inner join Animal_food af1 on a.animal_id = af1.animal_id) on af.food_id = af1.food_id
where a.animal_type = 'Pelican'
group by description

--Вывести самый дорогой товар в магазине "Восток"
select top 1 with ties 
cost, description
from (Merchandise m inner join Assortment a on m.merchandise_id = a.merchandise_id)
inner join (Assortment aa inner join Shops s on aa.shop_id = s.shop_id) on aa.shop_id = a.shop_id 
and aa.merchandise_id = a.merchandise_id
where s.name = 'Восток'
order by -cost

--Средняя стоимость сувениров, которые находятся в зоне с рыбами

select avg(cost) as 'Avg souvenirs cost'
from (Merchandise m inner join Assortment a on m.merchandise_id = a.merchandise_id)
inner join (Assortment a1 inner join Shops s on a1.shop_id = s.shop_id)
on a1.shop_id = a.shop_id
inner join Zones z on s.zone_id = z.zone_id
where z.zone_name = 'Sea animals' 
and m.merch_type = 'Souvenir'

--Количество самок, в зоне "Jungle",возраст которых больше не 10 лет

select count(animal_id) as 'Number'
from (Animals a inner join Sex s on a.sex_id = s.sex_id)
inner join Aviary_zone az on a.aviary_id = az.aviary_id 
inner join Zones z on az.zone_id = z.zone_id
where z.zone_name = 'Jungle' 
and s.description = 'Female' 
and a.day_of_birth >
'01/01/2010'