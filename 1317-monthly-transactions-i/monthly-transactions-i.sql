SELECT DATE_FORMAT(trans_date, '%Y-%m') as month
    ,country
    ,COUNT(*) as trans_count
    ,COUNT(CASE WHEN state = 'approved' THEN state ELSE NULL END) as approved_count
    ,COALESCE(SUM(amount),0) as trans_total_amount
    ,COALESCE(SUM(CASE WHEN state = 'approved' THEN amount ELSE NULL END),0) as approved_total_amount
FROM Transactions
GROUP BY 1, 2;