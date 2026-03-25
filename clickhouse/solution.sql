SELECT
    endpoint,
    avg(response_time_ms) AS avg_response_time_ms
FROM server_logs
GROUP BY endpoint
ORDER BY avg_response_time_ms DESC
LIMIT 5;


SELECT
    toHour(timestamp) AS hour,
    count() AS request_count
FROM server_logs
GROUP BY hour
ORDER BY hour;


SELECT
    endpoint,
    countIf(status_code >= 400) * 100.0 / count() AS error_percent
FROM server_logs
GROUP BY endpoint
ORDER BY error_percent DESC;