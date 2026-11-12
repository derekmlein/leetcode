with earliest_year as
(
    SELECT product_id
        ,MIN(year) as first_year
    FROM Sales
    GROUP BY 1
)

SELECT s.product_id
    ,e.first_year
    ,s.quantity
    ,s.price
FROM Sales s
JOIN earliest_year e
    ON s.product_id = e.product_id
    AND s.year = e.first_year