USE zoo5
GO


EXECUTE sys.sp_dropuser [test]
EXECUTE sys.sp_droplogin [test]

/*
SELECT session_id FROM sys.dm_exec_sessions WHERE login_name = 'test'
KILL 55
GO
*/

EXECUTE sys.sp_droprole [test_role]


--�������� ������ test
CREATE LOGIN [test] WITH PASSWORD = '12345';

--����� ������ ��� ������ test(���� ����� ��� ������� test)
ALTER LOGIN [test] WITH PASSWORD = '112233' OLD_PASSWORD = '12345'

--����� ������ ��� ������ test �� ����� �����������
ALTER LOGIN [test] WITH PASSWORD = '112233'
--�������� ������������ test ��� �� zoo5
CREATE USER [test] FOR LOGIN [test]


--����� �� ����������� � ��
GRANT CONNECT TO [test]
GO


--��������
EXECUTE AS USER = 'test'
	--Select 
	SELECT * FROM Animals

	--Update 
	UPDATE Animals SET animal_name = '������'
		WHERE animal_id = 3

	--Delete
	DELETE FROM Animals WHERE animal_id = 5

	--Insert
	INSERT INTO Animals VALUES('Hector', 'Tiger', 2, 1, '2002-10-09')

REVERT;

--������ ���������� �� �������, ��������� � ���� ������
GRANT SELECT, UPDATE, INSERT ON OBJECT::dbo.Animals TO [test]
GO

EXECUTE AS USER = 'test'
	BEGIN TRANSACTION
		--Select
		SELECT * FROM Animals

		--Update 
		UPDATE Animals SET animal_name = '������'
			WHERE animal_id = 3

		--Insert
		INSERT INTO Animals VALUES('Hector', 'Tiger', 2, 1, '2002-10-09')

		--�������� �� ��������� update & insert
		SELECT * FROM Animals

	ROLLBACK
REVERT;
GO

--������ ���������� �� Aviary_zone
GRANT SELECT, UPDATE ON OBJECT::dbo.Aviary_zone([aviary_area], [aviary_name]) TO [test]
GO


EXECUTE AS USER = 'test'
	BEGIN TRANSACTION
		--Select �� ��� ������ �������(������)
		SELECT * FROM Aviary_zone

		--Select ����������� ������ �� �������
		SELECT aviary_name, aviary_area
		FROM Aviary_zone

		--Update ������������� ������(������)
		UPDATE Aviary_zone SET aviary_id = 777
		WHERE aviary_id = 8
	
		--�������� �������� ������� � ���� �������� � ��������� 'Forest'
		UPDATE Aviary_zone SET aviary_area = 77777
		WHERE aviary_name = 'Forest'

		--�������� ���������
		SELECT aviary_name, aviary_area
		FROM Aviary_zone

	ROLLBACK
REVERT;
GO

--����� �� ������ �� ������� "�����"
GRANT SELECT ON OBJECT::dbo.Museums TO [test]
GO

EXECUTE AS USER = 'test'
	--Select ������ �� �������
	SELECT * FROM Museums

	--Update, �� ������� � ������������ ��� ����(������ ������)
	UPDATE Museums SET theme = 'Unforgettable'
	WHERE museum_id = 2

	--�������������, ��� ��������� �� ���������
	SELECT * FROM Museums
REVERT
GO

--����� �� ������� �� ������������� Perf_Animals
GRANT SELECT ON OBJECT::dbo.Perf_Animals TO [test]
GO

EXECUTE AS USER = 'test'
	--Select �� �������������
	SELECT * FROM Perf_Animals
	
	--������� ������ ���������
	UPDATE Perf_Animals SET [Entrance cost] = 777
	WHERE [Animal type] = 'Monkey'
REVERT
GO

------------------------------------------------------
------------------------------------------------------
--������� ���� test_role
CREATE ROLE test_role
GO

--����������� ������������ test ���� test_role
ALTER ROLE test_role ADD MEMBER [test]
GO

--������ ���� ����(������, � ���� �� ������)
GRANT SELECT, UPDATE ON OBJECT::dbo.Zones([zone_name]) TO [test_role]
GO

--
EXECUTE AS USER = 'test'
	BEGIN TRANSACTION
		--������� ������ ������������� ���� ������
		SELECT * FROM Zones

		--������ ����������� ������
		SELECT zone_name
		FROM Zones

		--������������� ��� ���� � ������ "Hell"
		UPDATE Zones SET zone_name = 'Penguin'
		WHERE zone_name = 'Hell'

	ROLLBACK
REVERT;
GO







--Login - user 1 � n
--���������� public, 0 ����


--Revert - ���������� ������������

--Update � Delete ������ ��� select'a, Insert �����
--���� ��� ���������� ���� �� �� ���� �������, �� �� ��������

--Grant control ������ ������� select

--Alter role asvasv add member [adsca]

--Deny ���� ��� Grant