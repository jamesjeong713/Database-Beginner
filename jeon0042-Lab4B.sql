-- 1
SELECT cust_fname, cust_lname, cust_balance FROM customer_t
WHERE cust_balance != 0
ORDER BY cust_balance DESC;
-- 2
SELECT invoice_number, prod_code, line_price, line_units, line_price * line_units AS line_cost
FROM invoice_line_t
WHERE line_price * line_units > 500
ORDER BY line_cost DESC, invoice_number DESC;
-- 3
SELECT prod_code, prod_description, prod_qoh, prod_price, prod_price*prod_qoh AS line_cost
FROM product_t
WHERE prod_price*prod_qoh > 50
ORDER BY prod_description ASC;
-- 4
SELECT cust_lname, cust_fname, cust_balance
FROM customer_t
WHERE cust_balance = 0 AND cust_city='ottawa'
ORDER BY cust_lname ASC;
-- 5
SELECT invoice_number, prod_code, line_units, line_price
FROM invoice_line_t
WHERE line_price > 600 OR line_price < 100
ORDER BY line_price ASC;
-- 6
SELECT CONCAT (cust_fname, ', ', cust_lname) AS cust_name, cust_address
FROM customer_t
WHERE 0 <= cust_balance AND cust_balance <= 100 AND cust_lname LIKE 'J%';
-- 7 
SELECT prod_description, prod_qoh, prod_price
FROM product_t
WHERE prod_qoh = 60 OR prod_qoh = 70 OR prod_qoh = 80 OR prod_qoh = 90
ORDER BY prod_qoh ASC;
-- 8
SELECT prod_description, prod_qoh, prod_price, prod_discount 
FROM product_t
WHERE prod_discount IS null;
-- 9
SELECT DISTINCT cust_city
FROM customer_t
ORDER BY cust_city ASC;
-- 10
SELECT cust_fname, cust_lname, cust_city
FROM customer_t
WHERE cust_city = 'ottawa'
ORDER BY cust_city ASC;