USE sql_course

SELECT
    job_title_short,
    job_location,
	job_posted_date AS date_time
FROM
    job_postings_fact;

SELECT
	job_title_short,
	job_location,
	FORMAT(job_posted_date,'MMMM') AS job_posted_month,
	FORMAT(job_posted_date,'yyyy') AS job_posted_year
FROM
	job_postings_fact;

SELECT
    COUNT(job_id) AS job_posted_count,
    FORMAT(job_posted_date,'MMMM') AS job_posted_month
FROM
	job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
GROUP BY
    FORMAT(job_posted_date,'MMMM')
ORDER BY
    job_posted_count DESC