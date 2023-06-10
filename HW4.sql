# 1. Вывести всех котиков по магазинам по id (условие соединения shops.id = cats.shops_id)
SELECT sh.id AS shop_id, sh.shopname, c.id, c.name
FROM cats c
LEFT JOIN shops sh # на случай, если есть котики, не привязанные к магазину
ON sh.id = c.shop_id
ORDER BY shop_id;

# 2. Вывести магазин, в котором продается кот “Мурзик” (попробуйте выполнить 2 способами)
SELECT sh.id AS shop_id, sh.shopname
FROM shops sh
JOIN cats c
ON c.shop_id = sh.id
WHERE c.name = "Murzik";

SELECT sh.id AS sh_id, sh.shopname
FROM shops sh, cats c
WHERE c.shop_id = sh.id AND c.name = "Murzik";

# 3. Вывести магазины, в которых НЕ продаются коты “Мурзик” и “Zuza”
SELECT sh.id AS sh_id, sh.shopname
FROM shops sh
WHERE sh.id NOT IN (
	SELECT shop_id
    FROM cats c
    WHERE c.shop_id = sh.id
		AND c.name IN ("Murzik", "Zuza")
);

SELECT s.shopname, GROUP_CONCAT(c.name) cats
FROM shops s
LEFT JOIN cats c ON s.id = c.shop_id
GROUP BY s.shopname
HAVING
	cats IS NULL OR
	cats NOT LIKE "%Murzik%"
	AND cats NOT LIKE "%Zuza%";

# 4. Вывести название и цену для всех анализов, которые продавались 5 февраля 2020 и всю следующую неделю
SET @i = 0;
SELECT @i:=@i+1 "#", an_id, an_name, an_price
FROM analysis a
JOIN orders o
ON o.ord_an = a.an_id
WHERE o.ord_datetime BETWEEN "2020-02-05" AND "2020-02-13";

SELECT ROW_NUMBER() OVER () "#",
	an_id, an_name, an_price
FROM analysis a
JOIN orders o
ON o.ord_an = a.an_id
WHERE o.ord_datetime BETWEEN "2020-02-05" AND "2020-02-13";
