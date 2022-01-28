--Неповторяющееся чтение
set transaction isolation level repeatable read
begin transaction
select * from Aviary_zone
where aviary_id = 1

select * from Aviary_zone
where aviary_id = 1
commit

--Фантом
begin transaction
select count(*) from Zones

select count(*) from Zones
commit


