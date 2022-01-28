use zoo5
go

--���, ������� �������
select a.animal_type as 'Animal_type',
(az.aviary_area / count(a.animal_id)) as  'Avg area'
from Animals a inner join Aviary_zone az on a.aviary_id = az.aviary_id
group by animal_type, aviary_area
go

--���������, ���������� �������� ����� ��������� � ��������, �������� ������������� ����� ��������
select a.animal_type, count(a.animal_id) as 'Number', az.aviary_name
from Animals a inner join Aviary_zone az on a.aviary_id = az.aviary_id
group by animal_type, aviary_name

--���������, ���������� �������� � ���� ���������, �������� �������������� ��� � ���� ���������
select top 1 a.animal_type, z.zone_name 
from Animals a inner join Aviary_zone az on a.aviary_id = az.aviary_id
inner join Zones z on az.zone_id = z.zone_id

--����, ���������� �������� � ������ �� ���
select z.zone_name, count(az.aviary_id), az.aviary_name
from Aviary_zone az inner join Zones z on az.zone_id = z.zone_id

group by zone_name, aviary_name