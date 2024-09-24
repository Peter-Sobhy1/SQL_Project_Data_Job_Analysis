USE sql_course

SELECT 
	COUNT(job_id) AS number_of_jobs,
    CASE
        WHEN job_location LIKE 'Anywhere' THEN 'Remote'
        WHEN job_location LIKE 'New York, NY' THEN 'Local'
        ELSE 'Onsite'
    END AS location_category
FROM 
    job_postings_fact
WHERE
    job_title_short LIKE 'Data Analyst'
GROUP BY
       CASE
        WHEN job_location LIKE 'Anywhere' THEN 'Remote'
        WHEN job_location LIKE 'New York, NY' THEN 'Local'
        ELSE 'Onsite'
    END
ORDER BY    
    number_of_jobs DESC;