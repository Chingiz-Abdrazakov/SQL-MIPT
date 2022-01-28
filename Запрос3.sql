use zoo5
go 

--Умер Пашка, удаляем данные о его питании
delete from Animals
from Animals a inner join Animal_food af on a.animal_id = af.animal_id
where a.animal_name = 'Пашка'

--Два самых дорогих товара в магазине "Фарфор" были убраны с прилавка

declare @i int
set @i = 0;
while @i < 2
begin
set @i+=1
declare @r int
select @r = (select top 1 cost 
from Merchandise m inner join Assortment a on m.merchandise_id = a.merchandise_id
inner join Shops s on s.shop_id = a.shop_id 
where s.name = 'Фарфор'
order by -cost)

delete from Assortment
from Assortment a1 inner join Shops ss on a1.shop_id = ss.shop_id
inner join Merchandise m1 on a1.merchandise_id = m1.merchandise_id
where ss.name = 'Фарфор' and m1.cost = @r;

end


go


--Второй delete
delete from Animals 
from Animals a inner join Aviary_zone az on a.aviary_id = az.aviary_id
inner join Zones z on az.zone_id = z.zone_id
where z.zone_name = 'Sea animals'

delete from Aviary_zone 
from Aviary_zone az inner join Zones z on az.zone_id = z.zone_id
where z.zone_name = 'Sea animals'

delete from Assortment
from Assortment a inner join Shops s on a.shop_id = s.shop_id
inner join Zones z on s.zone_id = z.zone_id
where z.zone_name = 'Sea animals'

delete from Shops  
from Shops s inner join Zones z on s.zone_id = z.zone_id
where z.zone_name = 'Sea animals'

delete from Museums
from Museums m inner join Zones z on m.zone_id = z.zone_id
where z.zone_name = 'Sea animals'

delete from Performance_location
from Performance_location pl inner join Zones z on pl.zone_id = z.zone_id
where z.zone_name = 'Sea animals'