--���������� ���������

set transaction isolation level read uncommitted
begin transaction
update Animals set animal_name = '�����'
where animal_id = 25

rollback

--������� ������
begin transaction
update Animals set animal_name = '����'
where animal_id = 9
rollback