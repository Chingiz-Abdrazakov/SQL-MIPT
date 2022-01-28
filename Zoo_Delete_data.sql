USE zoo5
go

ALTER TABLE Animals
drop constraint fkAnimalsAviary

ALTER TABLE Animals
drop constraint fkAnimalSex

ALTER TABLE Animal_food
drop constraint fkAnimalfoodAnimals

ALTER TABLE Animal_food
drop constraint fkAnimalfoodMerch

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


DELETE FROM Animals
DELETE FROM Animal_food
DELETE FROM Assortment
DELETE FROM Aviary_zone
DELETE FROM Sex
DELETE FROM Shop_type
DELETE FROM Shops
DELETE FROM Performance_Location
DELETE FROM Performance_type
DELETE FROM Performances
DELETE FROM Zones
DELETE FROM Merchandise
DELETE FROM Museums 