SELECT c.customer_id
FROM Customer c
GROUP BY 1
HAVING COUNT(DISTINCT c.product_key) = (SELECT COUNT(DISTINCT p.product_key) FROM Product p);