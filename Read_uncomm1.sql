--���������� ���������

set transaction isolation level read uncommitted
begin transaction
select * from Animals
where animal_id = 25

select * from Animals
where animal_id = 25

update Animals set animal_name = '����'
where animal_id = 25

select * from Animals
where animal_id = 25
commit

--������� ������
begin transaction 

select * from Animals
where animal_id = 9

select * from Animals
where animal_id = 9

select * from Animals
where animal_id = 9

commit
