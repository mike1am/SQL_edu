-- Используя операторы языка SQL, создайте таблицу “sales”. Заполните ее данными.
CREATE TABLE sales (
	id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE,
    count_product INT UNSIGNED NULL DEFAULT 0
);

INSERT INTO sales (order_date, count_product)
VALUES
	("2022-01-01", 156),
    ("2022-01-02", 180),
    ("2022-01-03", 21),
    ("2022-01-04", 124),
    ("2022-01-05", 341);
    
SELECT * FROM sales;

/*
Для данных таблицы “sales” укажите тип заказа в зависимости от кол-ва : 
меньше 100  -    Маленький заказ
от 100 до 300 - Средний заказ
больше 300  -     Большой заказ
*/
SELECT
	order_date,
	IF(count_product < 100, "Маленький заказ",
		IF(count_product <= 300, "Средний заказ", "Большой заказ")) AS order_type
FROM sales;

-- Создайте таблицу “orders”, заполните ее значениями
CREATE TABLE orders (
	id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id VARCHAR(5),
    amount DECIMAL(8, 2),
    order_status VARCHAR(12)
);

INSERT INTO orders (employee_id, amount, order_status)
VALUES
	("e03", 15, "OPEN"),
    ("e01", 25.5, "OPEN"),
    ("e05", 100.7, "CLOSED"),
    ("e02", 22.18, "OPEN"),
    ("e04", 9.5, "CANCELLED");
    
SELECT * FROM orders;

/*
Выберите все заказы. В зависимости от поля order_status выведите столбец full_order_status:
OPEN – «Order is in open state» ; CLOSED - «Order is closed»; CANCELLED -  «Order is cancelled»
*/
SELECT id, employee_id, amount,
	CASE order_status
    WHEN "OPEN" THEN "Order is in open state"
    WHEN "CLOSED" THEN "Order is closed"
    WHEN "CANCELLED" THEN "Order is cancelled"
    END AS full_order_status
FROM orders;