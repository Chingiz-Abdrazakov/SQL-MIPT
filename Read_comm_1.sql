
--Грязное чтение
set transaction isolation level read committed

begin transaction 
update Aviary_zone set aviary_name = 'Forestrrr'
where aviary_id = 2
rollback

--Неповторяющееся чтение
begin transaction 
update Aviary_zone set aviary_name = 'Forestfff'
where aviary_id = 2
commit


update Aviary_zone set aviary_name = 'Forest'
where aviary_id = 2


