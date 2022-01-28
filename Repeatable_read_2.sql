set transaction isolation level repeatable read
begin transaction

update Aviary_zone set aviary_name = 'Hots'
where aviary_id = 1
rollback


--Фантом
begin transaction 
insert into Zones values ('Help')
commit