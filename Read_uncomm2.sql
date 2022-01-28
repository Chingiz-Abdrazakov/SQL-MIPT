--Потерянные изменения

set transaction isolation level read uncommitted
begin transaction
update Animals set animal_name = 'Джещщ'
where animal_id = 25

rollback

--Грязное чтение
begin transaction
update Animals set animal_name = 'Ирва'
where animal_id = 9
rollback