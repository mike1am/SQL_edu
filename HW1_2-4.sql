# task 2
SELECT product_name, brand, price
FROM mobile_phones
WHERE product_count > 2;

# task 3
SELECT *
FROM mobile_phones
WHERE brand LIKE "Samsung";

# task 4.1
SELECT *
FROM mobile_phones
WHERE product_name REGEXP "(?i)iphone";

# task 4.2
SELECT *
FROM mobile_phones
WHERE brand REGEXP "(?i)samsung";

# task 4.3
SELECT *
FROM mobile_phones
WHERE product_name REGEXP "8";