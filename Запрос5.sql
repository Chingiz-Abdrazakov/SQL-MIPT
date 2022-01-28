use zoo5
go

--Названия всех магазинов на территории "Jungle", где есть газировка
select	s.name 
from (Shops s inner join Zones z on s.zone_id = z.zone_id) inner join
(Shops s1 inner join Assortment a on s1.shop_id = a.shop_id) on s.shop_id = s1.shop_id
inner join (Merchandise m inner join Assortment a1 on m.merchandise_id = a1.merchandise_id)
on a1.merchandise_id = a.merchandise_id
where z.zone_name = 'Jungle' and m.description = 'Soda'
group by s.name