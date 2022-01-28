use zoo5
go

--”меньшаетс€ площадь вольера из-за пожара
update Aviary_zone 
set aviary_area = aviary_area * 2 / 3
where aviary_id = 2
go

--»з-за кризиса подн€лись цены на билеты на представлени€ с дельфинами
update Performances
set entrance_cost += 50
from Performances p inner join Performance_type pt on p.performance_type_id = pt.performance_type_id
where pt.performance_name = 'Dolphin peformances'
go	

--ѕосле указа директора зоопарка, все бакалейные лавки начинают работать по единому графику
update Shops
set opens_at = '08:00:00',
closes_at = '19:00:00'
from Shops s inner join Shop_type st on s.type_id = st.type_id
where st.description = 'Grocery'


