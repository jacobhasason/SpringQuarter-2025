/*CS 420
Assignment 10 Answer Sheet for SQL statements

Insert you SQL statements after the line with the question number. The SQL statement should not be included in any comment statement

Q1*/
SELECT DISTINCT c.first_name,
	c.last_name
FROM customers c
	JOIN orders o 
		ON c.customer_id = o.customer_id
	JOIN order_lines ol 
		ON o.order_id = ol.order_id
	JOIN products p 
		ON ol.product_id = p.product_id
WHERE p.product_name = "Fender Stratocaster"
;


/*
Q2
No SQL for Q2.
*/



/*
Q3
No SQL for Q3.
/*




Q4*/
SELECT w.wh_name				AS warehouse_name,
	SUM(p.list_price) 			AS total_list_price
FROM warehouses w
	JOIN product_locations pl
		ON w.warehouse_id = pl.wh_id
	JOIN products p
		ON p.product_id = pl.prod_id
WHERE pl.qty_on_hand > 0
GROUP BY warehouse_name
;
	
/*
Q5*/
SELECT c.first_name,
	c.last_name,
    COUNT(o.order_id) 	AS items_ordered
FROM customers c 
	JOIN orders o 
		ON c.customer_id = o.customer_id
GROUP BY c.customer_id
ORDER BY items_ordered DESC
LIMIT 3
;
    

/*
Q6*/
SELECT p.product_name
FROM products p
WHERE p.product_id NOT IN (
	SELECT o.product_id
    FROM order_lines o
)
;



/*
Q7*/
SELECT DISTINCT s.supplier_name
FROM suppliers s
WHERE s.supplier_id IN (
    SELECT p1.supplier_id
    FROM products p1
		JOIN categories c1 
			ON p1.category_id = c1.category_id
    WHERE c1.category_name = 'Basses'
)
AND s.supplier_id IN (
    SELECT p2.supplier_id
    FROM products p2
		JOIN categories c2 
			ON p2.category_id = c2.category_id
    WHERE c2.category_name = 'Guitars'
);
