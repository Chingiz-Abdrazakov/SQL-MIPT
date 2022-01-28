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


--Создание логина test
CREATE LOGIN [test] WITH PASSWORD = '12345';

--Смена пароля для логина test(если зайти под логином test)
ALTER LOGIN [test] WITH PASSWORD = '112233' OLD_PASSWORD = '12345'

--Смена пароля для логина test от имени пользоватея
ALTER LOGIN [test] WITH PASSWORD = '112233'
--Создание пользователя test для БД zoo5
CREATE USER [test] FOR LOGIN [test]


--Грант на подключение к БД
GRANT CONNECT TO [test]
GO


--Проверка
EXECUTE AS USER = 'test'
	--Select 
	SELECT * FROM Animals

	--Update 
	UPDATE Animals SET animal_name = 'Грызли'
		WHERE animal_id = 3

	--Delete
	DELETE FROM Animals WHERE animal_id = 5

	--Insert
	INSERT INTO Animals VALUES('Hector', 'Tiger', 2, 1, '2002-10-09')

REVERT;

--Выдача разрешений на выборку, изменение и ввод данных
GRANT SELECT, UPDATE, INSERT ON OBJECT::dbo.Animals TO [test]
GO

EXECUTE AS USER = 'test'
	BEGIN TRANSACTION
		--Select
		SELECT * FROM Animals

		--Update 
		UPDATE Animals SET animal_name = 'Грызли'
			WHERE animal_id = 3

		--Insert
		INSERT INTO Animals VALUES('Hector', 'Tiger', 2, 1, '2002-10-09')

		--Проверка на изменения update & insert
		SELECT * FROM Animals

	ROLLBACK
REVERT;
GO

--Выдача разрешений на Aviary_zone
GRANT SELECT, UPDATE ON OBJECT::dbo.Aviary_zone([aviary_area], [aviary_name]) TO [test]
GO


EXECUTE AS USER = 'test'
	BEGIN TRANSACTION
		--Select на все данные таблицы(ошибка)
		SELECT * FROM Aviary_zone

		--Select разрешенных данных из таблицы
		SELECT aviary_name, aviary_area
		FROM Aviary_zone

		--Update неразрешенных данных(ошибка)
		UPDATE Aviary_zone SET aviary_id = 777
		WHERE aviary_id = 8
	
		--Поменять значение площади у всех вольеров с названием 'Forest'
		UPDATE Aviary_zone SET aviary_area = 77777
		WHERE aviary_name = 'Forest'

		--Проверка изменений
		SELECT aviary_name, aviary_area
		FROM Aviary_zone

	ROLLBACK
REVERT;
GO

--Грант на селект из таблицы "Музеи"
GRANT SELECT ON OBJECT::dbo.Museums TO [test]
GO

EXECUTE AS USER = 'test'
	--Select данных из таблицы
	SELECT * FROM Museums

	--Update, на который у пользователя нет прав(выдаст ошибку)
	UPDATE Museums SET theme = 'Unforgettable'
	WHERE museum_id = 2

	--Удостоверимся, что изменений не произошло
	SELECT * FROM Museums
REVERT
GO

--Грант на выборку из представления Perf_Animals
GRANT SELECT ON OBJECT::dbo.Perf_Animals TO [test]
GO

EXECUTE AS USER = 'test'
	--Select из представления
	SELECT * FROM Perf_Animals
	
	--Пробуем внести изменения
	UPDATE Perf_Animals SET [Entrance cost] = 777
	WHERE [Animal type] = 'Monkey'
REVERT
GO

------------------------------------------------------
------------------------------------------------------
--Создаем роль test_role
CREATE ROLE test_role
GO

--Присваеваем пользователю test роль test_role
ALTER ROLE test_role ADD MEMBER [test]
GO

--Выдача прав роли(значит, и всем ее членам)
GRANT SELECT, UPDATE ON OBJECT::dbo.Zones([zone_name]) TO [test_role]
GO

--
EXECUTE AS USER = 'test'
	BEGIN TRANSACTION
		--Попытка чтения неразрешенных роли данных
		SELECT * FROM Zones

		--Чтение разрешенных данных
		SELECT zone_name
		FROM Zones

		--Переименовать все зоны с именем "Hell"
		UPDATE Zones SET zone_name = 'Penguin'
		WHERE zone_name = 'Hell'

	ROLLBACK
REVERT;
GO







--Login - user 1 к n
--Изначально public, 0 прав


--Revert - предыдущий пользователь

--Update и Delete нельзя без select'a, Insert можно
--Если нет разрешения хотя бы на один столбец, то не работает

--Grant control нельзя забрать select

--Alter role asvasv add member [adsca]

--Deny выше чем Grant