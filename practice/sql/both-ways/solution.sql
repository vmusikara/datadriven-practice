SELECT
  transaction_date,
  SUM(total_amount) AS net_revenue
FROM transactions
WHERE total_amount < 0
OR (
  total_amount > 0
  AND transaction_date BETWEEN '2026-01-01'
AND '2026-04-30'
)
GROUP BY transaction_date
ORDER BY transaction_date ASC
