DROP TABLE IF EXISTS cars;
CREATE TABLE cars (
	`id` INT PRIMARY KEY,
	`name` VARCHAR(25) NOT NULL,
    `cost` DECIMAL
);

ALTER TABLE cars
	MODIFY COLUMN `id` INT AUTO_INCREMENT;
    
DESC cars;

INSERT INTO cars (`name`, `cost`)
VALUES
	("Audi", 52642),
    ("Mercedes", 57127),
    ("Skoda", 9000),
    ("Volvo", 29000),
    ("Bentley", 350000),
    ("Citroen", 21000),
    ("Hummer", 41400),
    ("Volkswagen", 21600);
    
# 1. Создайте представление, в которое попадут автомобили стоимостью  до 25 000 долларов
CREATE VIEW low_price_cars AS (
	SELECT *
    FROM cars
    WHERE cost < 25000
);

# 2. Изменить в существующем представлении порог для стоимости: пусть цена будет до 30 000 долларов (используя оператор ALTER VIEW)
ALTER VIEW low_price_cars AS (
	SELECT *
    FROM cars
    WHERE cost < 30000
);

SELECT * FROM low_price_cars;

# 3. Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди”
CREATE VIEW Skoda_Audi_list AS (
	SELECT *
    FROM cars
    WHERE `name` IN ("Skoda", "Audi")
);

SELECT * FROM Skoda_Audi_list;