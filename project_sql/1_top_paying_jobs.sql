/*
Question: What are the top-paying data analyst jobs?
- Identify the top 10 highest-paying Data Analyst roles that are available remotely
- Focuses on job postings with specified salaries (remove nulls)
- BONUS: Include company names of top 10 roles
- Why? Highlight the top-paying opportunities for Data Analysts, offering insights into employment options and location flexibility.
*/
USE sql_course
SELECT	
    TOP(10)
	job_id,
	job_title,
	job_location,
	job_schedule_type,
	salary_year_avg,
	job_posted_date,
    name AS company_name
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst' AND 
    job_location = 'Anywhere' AND 
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC


/*
Here's the breakdown of the top data analyst jobs in 2023:
Wide Salary Range: Top 10 paying data analyst roles span from $184,000 to $650,000, indicating significant salary potential in the field.
Diverse Employers: Companies like SmartAsset, Meta, and AT&T are among those offering high salaries, showing a broad interest across different industries.
Job Title Variety: There's a high diversity in job titles, from Data Analyst to Director of Analytics, reflecting varied roles and specializations within data analytics.

RESULTS
=======
[
  {
    "job_id": 479485,
    "job_title": "Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": 145000.0,
    "job_posted_date": "2023-03-15T16:59:55",
    "company_name": "Level"
  },
  {
    "job_id": 592669,
    "job_title": "Behavioral Health Data Analyst- REMOTE",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": 126452.0,
    "job_posted_date": "2023-07-25T17:41:14",
    "company_name": "ICF"
  },
  {
    "job_id": 300502,
    "job_title": "Healthcare Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": 125000.0,
    "job_posted_date": "2023-08-18T17:00:58",
    "company_name": "Get It Recruit - Real Estate"
  },
  {
    "job_id": 238020,
    "job_title": "Business Data Analyst with SQL (Strong)",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": 122500.0,
    "job_posted_date": "2023-06-19T17:01:37",
    "company_name": "Innova Solutions"
  },
  {
    "job_id": 357990,
    "job_title": "Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": 115000.0,
    "job_posted_date": "2023-01-19T17:00:07",
    "company_name": "Robert Half"
  },
  {
    "job_id": 600392,
    "job_title": "REMOTE PowerBI Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": 107500.0,
    "job_posted_date": "2023-04-04T17:05:54",
    "company_name": "Insight Global"
  },
  {
    "job_id": 909000,
    "job_title": "Associate Director, Data Analysis",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": 105000.0,
    "job_posted_date": "2023-01-27T16:59:59",
    "company_name": "EL Education (Formerly Expeditionary Learning)"
  },
  {
    "job_id": 1064019,
    "job_title": "Legal Project Management Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": 99500.0,
    "job_posted_date": "2023-07-24T17:02:21",
    "company_name": "Ogletree Deakins"
  },
  {
    "job_id": 914174,
    "job_title": "Data Analyst, Supply Chain (Remote)",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": 90000.0,
    "job_posted_date": "2023-01-04T03:34:13",
    "company_name": "Home Depot / THD"
  },
  {
    "job_id": 116825,
    "job_title": "Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": 90000.0,
    "job_posted_date": "2023-04-12T17:00:09",
    "company_name": "hackajob"
  }
]
*/