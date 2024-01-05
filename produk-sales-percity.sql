SELECT t1.city_name, 
	   t5.product_name,
       ROUND(SUM(t4.line_total_price), 2)
FROM city t1
	   JOIN customer t2 
			ON t1.id = t2.city_id
	   JOIN invoice t3 
			ON t2.id = t3.customer_id
	   JOIN invoice_item t4 
			ON t3.id = t4.invoice_id
	   JOIN product t5 
			ON t4.product_id = t5.id
GROUP BY t1.city_name, t5.product_name
ORDER BY SUM(t4.line_total_price), 
		 t1.city_name, 
         t5.product_name ASC;