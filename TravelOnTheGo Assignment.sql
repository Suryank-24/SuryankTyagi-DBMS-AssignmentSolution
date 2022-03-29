CREATE DATABASE travelonthego;
USE travelonthego;

CREATE TABLE passenger
(
	p_name VARCHAR(50) NOT NULL,
    category VARCHAR(10) NOT NULL,
    gender CHARACTER NOT NULL,
	boarding_city VARCHAR(30) NOT NULL,
    destination_city VARCHAR(30) NOT NULL,
    distance INT NOT NULL,
    bus_type VARCHAR(10) NOT NULL
);

SELECT * FROM passenger;
SELECT * FROM price;

INSERT INTO passenger VALUES
('Sejal','AC','F','Bengaluru','Chennai',350,'Sleeper'),
('Anmol','NON-AC','M','Mumbai','Hydreabad',700,'Sitting'),
('Pallavi','AC','F','Panaji','Bengaluru',600,'Sleeper'),
('Khusboo','AC','F','Chennai','Mumbai',1500,'Sleeper'),
('Udit','NON-AC','M','Trivandrum','Panaji',1000,'Sleeper'),
('Ankur','AC','M','Nagpur','Hyderabad',500,'Sitting'),
('Hemant','NON-AC','M','Panaji','Mumbai',700,'Sleeper'),
('Manish','NON-AC','M','Hyderabad','Bengaluru',500,'Sitting'),
('Piyush','AC','M','Pune','Nagpur',700,'Sitting');

CREATE TABLE price
(
	bus_type VARCHAR(10) NOT NULL,
    distance INT NOT NULL,
    price INT NOT NULL
);

INSERT INTO price VALUES
('Sleeper',350,770),
('Sleeper',500,1100),
('Sleeper',600,1320),
('Sleeper',700,1540),
('Sleeper',1000,2200),
('Sleeper',1200,2640),
('Sleeper',1500,2700),
('Sitting',500,620),
('Sitting',600,744),
('Sitting',700,868),
('Sitting',1000,1240),
('Sitting',1200,1488),
('Sitting',1500,1860);

#Query: 3

select Gender, count(Gender) FROM Passenger
where Distance>=600 group by Gender;

#Query: 4

SELECT MIN(price) FROM price
WHERE bus_type='Sleeper';

#Query: 5

SELECT p_name FROM passenger 
WHERE p_name LIKE 'S%'order by p_name;

#Query: 6

select a.p_name,a.boarding_city,a.destination_city,a.bus_type,b.price
from passenger a , price b
where (a.bus_type = b.bus_type and a.distance = b.distance);

#Query: 7

select a.p_name,b.price from passenger a ,price b
where (a.bus_type = "Sitting" and b.bus_type = "Sitting" and a.distance = 700 and b.distance=700);

#Query: 8

SELECT price FROM price
where distance=(SELECT distance FROM passenger where p_name = "Pallavi");

#Query: 9

SELECT DISTINCT(distance) FROM passenger
ORDER BY distance DESC;

#Query: 10

with total as ( select sum(distance) as total from passenger)
select p_name,(distance / total.total)*100
as percentage_travel from passenger,total;


#Query: 11

SELECT distance,price,
CASE
WHEN price > 1000 THEN 'Expensive'
WHEN price < 1000 AND price > 500 THEN 'Average Cost'
ELSE 'Cheap'
END AS Cost
FROM price;