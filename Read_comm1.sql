--������� ������, �� �������� ��� read committed � ����
set transaction isolation level read committed
begin transaction
select * from Aviary_zone
where aviary_id = 2

select * from Aviary_zone
where aviary_id = 2
commit

--��������������� ������
begin transaction
select * from Aviary_zone
where aviary_id = 2

select * from Aviary_zone
where aviary_id = 2

commit



