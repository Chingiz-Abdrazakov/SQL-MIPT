USE zoo5
go

ALTER TABLE Animals
drop constraint fkAnimalsAviary

ALTER TABLE Animals
drop constraint fkAnimalSex

ALTER TABLE Animal_food
drop constraint fkAnimalfoodAnimals

ALTER TABLE Assortment
drop constraint fkAssortmentMerch

ALTER TABLE Assortment
drop constraint fkAssortmentlShops

ALTER TABLE Shops
drop constraint fkShopsShoptype

ALTER TABLE Shops
drop constraint fkShopsZones

ALTER TABLE Aviary_zone
drop constraint fkAviaryZones

ALTER TABLE Museums
drop constraint fkMuseumsZones

ALTER TABLE Performance_location
drop constraint fkPerflocZones

ALTER TABLE Performance_location
drop constraint fkPerlocType

ALTER TABLE	Performances
drop constraint fkPerfToType

DROP TABLE Animals
DROP TABLE Animal_food
DROP TABLE Assortment
DROP TABLE Aviary_zone
DROP TABLE Sex
DROP TABLE Shop_type
DROP TABLE Shops
DROP TABLE Performance_Location
DROP TABLE Performance_type
DROP TABLE Performances
DROP TABLE Zones
DROP TABLE Merchandise
DROP TABLE Museums 