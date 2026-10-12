WITH ServiceLowestUptime AS (
  SELECT
    svc_name,
    MIN(uptime) AS min_uptime
  FROM svc_health
  GROUP BY svc_name
),
RankedServices AS (
  SELECT
    svc_name,
    min_uptime,
    DENSE_RANK() OVER (ORDER BY min_uptime ASC) AS service_rank
  FROM ServiceLowestUptime
)
SELECT 
  svc_name, 
  min_uptime
FROM 
  RankedServices 
WHERE 
  service_rank <= 10
ORDER BY 
  min_uptime ASC;
