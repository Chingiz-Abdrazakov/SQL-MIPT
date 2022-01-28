USE zoo5
go

ALTER TABLE Animals
add constraint fkAnimalsAviary
foreign key(aviary_id)
references Aviary_zone(aviary_id)
on update cascade

ALTER TABLE Animals
add constraint fkAnimalSex
foreign key(sex_id)
references Sex(sex_id)
on update cascade

ALTER TABLE Animal_food
add constraint fkAnimalfoodAnimals
foreign key(animal_id)
references Animals(animal_id)
on delete cascade

ALTER TABLE Animal_food
add constraint fkAnimalfoodMerch
foreign key(food_id)
references Merchandise(merchandise_id)


ALTER TABLE Assortment
add constraint fkAssortmentMerch
foreign key(merchandise_id)
references Merchandise(merchandise_id)
on update cascade

ALTER TABLE Assortment
add constraint fkAssortmentlShops
foreign key(shop_id)
references Shops(shop_id)
on update cascade

ALTER TABLE Shops
add constraint fkShopsShoptype
foreign key(type_id)
references Shop_type(type_id)
on delete cascade

ALTER TABLE Shops
add constraint fkShopsZones
foreign key(zone_id)
references Zones(zone_id)

ALTER TABLE Aviary_zone
add constraint fkAviaryZones
foreign key(zone_id)
references Zones(zone_id)

ALTER TABLE Museums
add constraint fkMuseumsZones
foreign key(zone_id)
references Zones(zone_id)

ALTER TABLE Performance_location
add constraint fkPerflocZones
foreign key(zone_id)
references Zones(zone_id)

ALTER TABLE Performance_location
add constraint fkPerlocType
foreign key(performance_type_id)
references Performance_type(performance_type_id)
on update cascade

ALTER TABLE	Performances
add constraint fkPerfToType
foreign key(performance_type_id)
references Performance_type(performance_type_id)
on update cascade