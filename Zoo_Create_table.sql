Use zoo5
go

CREATE TABLE Animals(
	animal_id int identity NOT NULL,
	animal_name varchar(30) NOT NULL,
	animal_type	varchar(60)	 NOT NULL,
	aviary_id	int	 NOT NULL	,
	sex_id	int	 NOT NULL,
	day_of_birth	date NOT NULL,
	primary key(animal_id)
);

CREATE TABLE Sex(
	sex_id int NOT NULL,
	description varchar(255) NOT NULL,
	primary key(sex_id)
);

CREATE TABLE Animal_food(
	animal_id int NOT NULL,
	food_id int NOT NULL,
	primary key(food_id, animal_id)	
);

CREATE TABLE Merchandise(
	merchandise_id	int	 NOT NULL,
	merch_type	varchar(255)	 NOT NULL,
	description	varchar(255) NOT NULL,
	cost int NOT NULL,
	primary key(merchandise_id)
);

CREATE TABLE Assortment(
	shop_id	int NOT NULL,
	merchandise_id	int NOT NULL,
	primary key(shop_id, merchandise_id)
);

CREATE TABLE Shop_type(
	type_id	int NOT NULL,
	description	varchar(255) NOT NULL,
	primary key(type_id)
);

CREATE TABLE Shops(
	shop_id	int identity NOT NULL,
	type_id	int	 NOT NULL,
	name	varchar(255)	NOT NULL, 
	opens_at	time	 NOT NULL,
	closes_at	time	 NOT NULL,
	zone_id	int NOT NULL,
	primary key(shop_id)
);

CREATE TABLE Zones(
	zone_name	varchar(255)NOT NULL,
	zone_id	int IDENTITY,
	primary key(zone_id)
);

CREATE TABLE Aviary_zone(
	aviary_id	int NOT NULL,
	zone_id	int	 NOT NULL,
	aviary_area	int	 NOT NULL,
	aviary_name	varchar(255)	NOT NULL,
	primary key(aviary_id)
);

CREATE TABLE Museums(
	museum_id	int identity NOT NULL,
	zone_id	int	 NOT NULL,
	theme	varchar(255) NOT NULL,	 
	primary key(museum_id)
);

CREATE TABLE Performance_Location(
	performance_type_id	int NOT NULL,
	zone_id	int NOT NULL,
	

	primary key(zone_id, performance_type_id)
);


CREATE TABLE Performance_type(
	
	performance_type_id	int NOT NULL,
	performance_name	varchar(255) NOT NULL,
	program	varchar(255) NOT NULL,
	begin_date	date	 NOT NULL,
	end_date	date NOT NULL,
	
	primary key(performance_type_id)
);


CREATE TABLE Performances(
	performance_id	int identity NOT NULL,
	performance_type_id	int NOT NULL,
	start_time	time	 NOT NULL,
	end_time	time	 NOT NULL,
	entrance_cost	int NOT NULL,
	primary key(performance_id)
);




