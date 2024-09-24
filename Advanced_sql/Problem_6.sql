USE sql_course
-- For January
CREATE TABLE january_jobs AS;
	SELECT * INTO january_jobs
	FROM job_postings_fact
	WHERE FORMAT(job_posted_date,'MM')  = 1;

-- For February
SELECT * INTO February_jobs
	FROM job_postings_fact
	WHERE FORMAT(job_posted_date,'MM')  = 2;

-- For March
SELECT * INTO March_jobs
	FROM job_postings_fact
	WHERE FORMAT(job_posted_date,'MM')  = 3;