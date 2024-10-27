SELECT c.customer_id AS Customer, 
       c.age AS Age, 
       i.item_name AS Item, 
       SUM(o.quantity) AS Quantity
FROM sales s
INNER JOIN customers c 
    ON s.customer_id = c.customer_id  
INNER JOIN orders o 
    ON s.sales_id = o.sales_id      
INNER JOIN items i 
    ON o.item_id = i.item_id        
WHERE c.age BETWEEN 18 AND 35        
  AND o.quantity IS NOT NULL          
GROUP BY c.customer_id, i.item_name
HAVING SUM(o.quantity) > 0;         