with customer_first_order as
(
    SELECT customer_id
        ,MIN(order_date) as first_order
        ,COUNT(*) OVER() as first_count
    FROM Delivery
    GROUP BY 1
)
SELECT ROUND(((SUM((CASE WHEN d.order_date = d.customer_pref_delivery_date THEN 1 ELSE 0 END))/MIN(f.first_count))*100),2) as immediate_percentage
FROM customer_first_order f
JOIN Delivery d
    ON f.customer_id=d.customer_id
    AND f.first_order=d.order_date;