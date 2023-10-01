-- create database
CREATE DATABASE kalbe;

-- create table inventory
CREATE TABLE inventory (
	item_code varchar(10) NOT NULL,
	item_name varchar(1024) NOT NULL,
	item_price int NOT NULL,
	item_total int NOT NULL,
	CONSTRAINT inventory_pk PRIMARY KEY (item_code)
);

-- insert data to table
INSERT INTO inventory
(item_code, item_name, item_price, item_total)
VALUES
('2341', 'Promag Tablet', 3000, 100),
('2342', 'Hydro Coco 250ML', 7000, 20),
('2343', 'Nutrive Benecol 100ML', 20000, 30),
('2344', 'Blackmores Vit C 500Mg', 95000, 45),
('2345', 'Entrasol Gold 370G', 90000, 120);

-- show item_name that has the highest number in item_total
SELECT Item_name
FROM inventory 
WHERE Item_total = (
      SELECT MAX(Item_total) FROM inventory
)

-- update the item_price of the output of question bullet
UPDATE inventory
INNER JOIN (
      SELECT MAX(Item_total) AS max_total 
      FROM inventory
) AS subquery
SET Item_price = 100000
WHERE inventory.Item_total = subquery.max_total;

-- what will happen if we insert another item_name with item_code of 2343 into the table 
INSERT INTO inventory
VALUES ('2343', 'Nelco Special', 40000, 30);

-- SQL Error [23505]: ERROR: duplicate key value violates unique constraint "inventory_pk"
--  Detail: Key (item_code)=(2343) already exists.

-- delete the item_name that has the lowest number of item_total
DELETE FROM inventory
WHERE Item_total = (
      SELECT min_total
      FROM (
            SELECT MIN(Item_total) AS min_total 
            FROM inventory
       ) AS min_query
);