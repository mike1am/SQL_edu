CREATE TABLE staff_hw LIKE staff;

INSERT INTO staff_hw (firstname, lastname, position, exp, salary, age)
VALUES
	("Вася", "Петров", "Начальник", 40, 100000, 60),
    ("Пётр", "Власов", "Начальник", 8, 70000, 30),
    ("Катя", "Катина", "Инженер", 2, 70000, 25),
    ("Саша", "Сасин", "Инженер", 12, 50000, 35),
    ("Иван", "Иванов", "Рабочий", 40, 30000, 59),
    ("Пётр", "Петров", "Рабочий", 20, 25000, 40),
    ("Сидр", "Сидоров", "Рабочий", 10, 20000, 35),
    ("Антон", "Антонов", "Рабочий", 8, 19000, 28),
    ("Юрий", "Юрков", "Рабочий", 5, 15000, 25),
    ("Максим", "Максимов", "Рабочий", 2, 11000, 22),
    ("Юрий", "Галкин", "Рабочий", 3, 12000, 24),
    ("Людмила", "Маркина", "Уборщик", 10, 10000, 49);

# 1. Отсортируйте данные по полю заработная плата (salary) в порядке: убывания; возрастания 
SELECT *
FROM staff_hw
ORDER BY salary DESC;

SELECT *
FROM staff_hw
ORDER BY salary;

# 2. Выведите 5 максимальных заработных плат (salary)
SELECT firstname, lastname, salary
FROM staff_hw
ORDER BY salary DESC
LIMIT 5;

# 3. Посчитайте суммарную зарплату (salary) по каждой специальности (роst)
SELECT position, SUM(salary) AS "Суммарная зарплата"
FROM staff_hw
GROUP BY position;

# 4. Найдите кол-во сотрудников с специальностью (post) «Рабочий» в возрасте от 24 до 49 лет включительно
SELECT COUNT(*)
FROM staff_hw
WHERE
	position LIKE "Рабочий"
    AND age BETWEEN 24 AND 49;

# 5. Найдите количество специальностей
SELECT COUNT(DISTINCT position) AS "Кол. специальностей"
FROM staff_hw;

# 2-ой вариант
SELECT COUNT(*) AS "Кол. специальностей"
FROM (
	SELECT COUNT(*)
	FROM staff_hw
	GROUP BY position
) positions;

# 6. Выведите специальности, у которых средний возраст сотрудников меньше 30 лет
SELECT position, AVG(age) AS mean_age
FROM staff_hw
GROUP BY position
HAVING mean_age < 30;