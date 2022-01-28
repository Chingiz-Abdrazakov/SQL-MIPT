--Фантом
set transaction isolation level serializable
begin transaction
insert into Performances values(3, '16:00:00', '17:30:00', 200)

commit