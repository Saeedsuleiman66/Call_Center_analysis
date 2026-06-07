use call_center_db;
select * from master_calls;
DESCRIBE master_calls;
-- Agent Performance Sentiment Analysis View
-- Purpose: Analyzes how different agent tones impact angry customers.
CREATE OR REPLACE VIEW view_sentiment_insights AS
SELECT 
    agent_tone,
    COUNT(call_id) AS handled_angry_calls,
    ROUND(AVG(talk_duration_seconds) / 60, 2) AS avg_talk_duration_minutes,
    ROUND(AVG(average_sentiment), 3) AS final_avg_sentiment,
    ROUND(AVG(silence_percent_average) * 100, 1) AS avg_silence_percentage
FROM master_calls
WHERE customer_tone = 'angry'
GROUP BY agent_tone
ORDER BY final_avg_sentiment DESC;

--  Customer Tier SLA and Wait Time Analysis View
-- Purpose: Evaluates queue prioritization and SLA adherence across customer tiers.
CREATE OR REPLACE VIEW sla_insights AS
SELECT 
    elite_level_code,
    COUNT(call_id) AS total_calls,
    ROUND(AVG(wait_time_seconds), 2) AS avg_wait_time_sec
FROM master_calls
GROUP BY elite_level_code
ORDER BY avg_wait_time_sec ASC;

-- Agent Performance Evaluation View
-- Purpose: Monitors agent efficiency, talk times, and average customer satisfaction.
CREATE OR REPLACE VIEW agent_performance AS
    SELECT 
        agent_id,
        COUNT(call_id) AS total_calls,
        ROUND(AVG(talk_duration_seconds) / 60, 2) AS avg_talk_duration_minutes,
        ROUND(AVG(average_sentiment), 2) AS avg_sentiment,
        ROUND(AVG(silence_percent_average) * 100, 1) AS avg_agent_silence_pct
    FROM
        master_calls
    GROUP BY agent_id
    HAVING total_calls > 150
    ORDER BY avg_sentiment DESC;

-- Call Reason & Customer Pain Points Analysis View
-- Purpose: Identifies the root causes of customer inquiries and their emotional impact
CREATE OR REPLACE VIEW call_reason_insights AS
    SELECT 
        primary_call_reason,
        COUNT(call_id) AS call_volume,
        ROUND(AVG(average_sentiment), 2) AS avg_reason_sentiment,
        ROUND(AVG(wait_time_seconds), 2) AS avg_wait_time_sec
    FROM
        master_calls
    GROUP BY primary_call_reason
    ORDER BY call_volume desc;
    
    
-- Call Center Hourly Traffic & Peak Load View
-- Purpose: Analyzes call distribution throughout the day to optimize staffing.
CREATE OR REPLACE VIEW hourly_traffic AS
SELECT 
    HOUR(call_start_datetime) AS call_hour,
    COUNT(call_id) AS calls_count,
    ROUND(AVG(wait_time_seconds), 2) AS avg_wait_time_sec
FROM
    master_calls
GROUP BY HOUR(call_start_datetime)
ORDER BY calls_count DESC;