SELECT
  region, COUNT(*) AS node_count
FROM infra_nodes
GROUP BY region
ORDER BY node_count DESC
LIMIT 1;
