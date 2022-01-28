--Грязное чтение, не работает для read committed и выше
set transaction isolation level read committed
begin transaction
select * from Aviary_zone
where aviary_id = 2

select * from Aviary_zone
where aviary_id = 2
commit

--Неповторяющееся чтение
begin transaction
select * from Aviary_zone
where aviary_id = 2

select * from Aviary_zone
where aviary_id = 2

commit



