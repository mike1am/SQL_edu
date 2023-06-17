# 1. Создайте процедуру, которая принимает кол-во сек и формат их в кол-во дней часов

DROP PROCEDURE IF EXISTS sec_to_form;

DELIMITER //
CREATE PROCEDURE IF NOT EXISTS sec_to_form(sec INT)
BEGIN
	DECLARE min INT;
    DECLARE hours INT;
    DECLARE days INT;
    
	SET days = sec DIV (3600 * 24);
    SET sec = MOD(sec, 3600 * 24);
    SET hours = sec DIV 3600;
    SET sec = MOD(sec, 3600);
    SET min = sec DIV 60;
    SET sec = MOD(sec, 60);
    
    SELECT days, hours, min, sec;
END //
DELIMITER ;

CALL sec_to_form(123456);

# 2. Создайте функцию, которая выводит только четные числа от 1 до 10

DROP FUNCTION IF EXISTS even_nums;

# Функция возвращает положительные чётные числа до num включительно
DELIMITER //
CREATE FUNCTION IF NOT EXISTS even_nums(num INT)
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
	DECLARE res VARCHAR(100) DEFAULT "";
	DECLARE cnt INT DEFAULT 2;
    
    WHILE cnt <= num
    DO
        SET res = CONCAT(res, " ", cnt);
        SET cnt = cnt + 2;
    END WHILE;
    
	RETURN res;
END //
DELIMITER ;

SELECT even_nums(27);