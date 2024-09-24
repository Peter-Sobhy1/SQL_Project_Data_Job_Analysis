/*
Question: What skills are required for the top-paying data analyst jobs?
- Use the top 10 highest-paying Data Analyst jobs from first query
- Add the specific skills required for these roles
- Why? It provides a detailed look at which high-paying jobs demand certain skills, 
    helping job seekers understand which skills to develop that align with top salaries
*/
USE sql_course
WITH top_paying_jobs AS (
    SELECT	
        TOP(10)
        job_id,
        job_title,
        salary_year_avg,
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
)

SELECT 
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC;

/*
Here's the breakdown of the most demanded skills for data analysts in 2023, based on job postings:
SQL is leading with a bold count of 8.
Python follows closely with a bold count of 7.
Tableau is also highly sought after, with a bold count of 6.
Other skills like R, Snowflake, Pandas, and Excel show varying degrees of demand.

[
  {
    "job_id": 479485,
    "job_title": "Data Analyst",
    "salary_year_avg": 145000.0,
    "company_name": "Level",
    "skills": "kubernetes"
  },
  {
    "job_id": 479485,
    "job_title": "Data Analyst",
    "salary_year_avg": 145000.0,
    "company_name": "Level",
    "skills": "looker"
  },
  {
    "job_id": 479485,
    "job_title": "Data Analyst",
    "salary_year_avg": 145000.0,
    "company_name": "Level",
    "skills": "scikit-learn"
  },
  {
    "job_id": 479485,
    "job_title": "Data Analyst",
    "salary_year_avg": 145000.0,
    "company_name": "Level",
    "skills": "pandas"
  },
  {
    "job_id": 479485,
    "job_title": "Data Analyst",
    "salary_year_avg": 145000.0,
    "company_name": "Level",
    "skills": "gcp"
  },
  {
    "job_id": 479485,
    "job_title": "Data Analyst",
    "salary_year_avg": 145000.0,
    "company_name": "Level",
    "skills": "bigquery"
  },
  {
    "job_id": 479485,
    "job_title": "Data Analyst",
    "salary_year_avg": 145000.0,
    "company_name": "Level",
    "skills": "sql"
  },
  {
    "job_id": 479485,
    "job_title": "Data Analyst",
    "salary_year_avg": 145000.0,
    "company_name": "Level",
    "skills": "python"
  },
  {
    "job_id": 479485,
    "job_title": "Data Analyst",
    "salary_year_avg": 145000.0,
    "company_name": "Level",
    "skills": "r"
  },
  {
    "job_id": 479485,
    "job_title": "Data Analyst",
    "salary_year_avg": 145000.0,
    "company_name": "Level",
    "skills": "golang"
  },
  {
    "job_id": 479485,
    "job_title": "Data Analyst",
    "salary_year_avg": 145000.0,
    "company_name": "Level",
    "skills": "elasticsearch"
  },
  {
    "job_id": 479485,
    "job_title": "Data Analyst",
    "salary_year_avg": 145000.0,
    "company_name": "Level",
    "skills": "aws"
  },
  {
    "job_id": 592669,
    "job_title": "Behavioral Health Data Analyst- REMOTE",
    "salary_year_avg": 126452.0,
    "company_name": "ICF",
    "skills": "spss"
  },
  {
    "job_id": 592669,
    "job_title": "Behavioral Health Data Analyst- REMOTE",
    "salary_year_avg": 126452.0,
    "company_name": "ICF",
    "skills": "sas"
  },
  {
    "job_id": 592669,
    "job_title": "Behavioral Health Data Analyst- REMOTE",
    "salary_year_avg": 126452.0,
    "company_name": "ICF",
    "skills": "tableau"
  },
  {
    "job_id": 592669,
    "job_title": "Behavioral Health Data Analyst- REMOTE",
    "salary_year_avg": 126452.0,
    "company_name": "ICF",
    "skills": "sas"
  },
  {
    "job_id": 592669,
    "job_title": "Behavioral Health Data Analyst- REMOTE",
    "salary_year_avg": 126452.0,
    "company_name": "ICF",
    "skills": "r"
  },
  {
    "job_id": 592669,
    "job_title": "Behavioral Health Data Analyst- REMOTE",
    "salary_year_avg": 126452.0,
    "company_name": "ICF",
    "skills": "python"
  },
  {
    "job_id": 592669,
    "job_title": "Behavioral Health Data Analyst- REMOTE",
    "salary_year_avg": 126452.0,
    "company_name": "ICF",
    "skills": "sql"
  },
  {
    "job_id": 300502,
    "job_title": "Healthcare Data Analyst",
    "salary_year_avg": 125000.0,
    "company_name": "Get It Recruit - Real Estate",
    "skills": "sql"
  },
  {
    "job_id": 300502,
    "job_title": "Healthcare Data Analyst",
    "salary_year_avg": 125000.0,
    "company_name": "Get It Recruit - Real Estate",
    "skills": "python"
  },
  {
    "job_id": 300502,
    "job_title": "Healthcare Data Analyst",
    "salary_year_avg": 125000.0,
    "company_name": "Get It Recruit - Real Estate",
    "skills": "shell"
  },
  {
    "job_id": 300502,
    "job_title": "Healthcare Data Analyst",
    "salary_year_avg": 125000.0,
    "company_name": "Get It Recruit - Real Estate",
    "skills": "bigquery"
  },
  {
    "job_id": 300502,
    "job_title": "Healthcare Data Analyst",
    "salary_year_avg": 125000.0,
    "company_name": "Get It Recruit - Real Estate",
    "skills": "redshift"
  },
  {
    "job_id": 300502,
    "job_title": "Healthcare Data Analyst",
    "salary_year_avg": 125000.0,
    "company_name": "Get It Recruit - Real Estate",
    "skills": "spark"
  },
  {
    "job_id": 300502,
    "job_title": "Healthcare Data Analyst",
    "salary_year_avg": 125000.0,
    "company_name": "Get It Recruit - Real Estate",
    "skills": "airflow"
  },
  {
    "job_id": 300502,
    "job_title": "Healthcare Data Analyst",
    "salary_year_avg": 125000.0,
    "company_name": "Get It Recruit - Real Estate",
    "skills": "jupyter"
  },
  {
    "job_id": 238020,
    "job_title": "Business Data Analyst with SQL (Strong)",
    "salary_year_avg": 122500.0,
    "company_name": "Innova Solutions",
    "skills": "confluence"
  },
  {
    "job_id": 238020,
    "job_title": "Business Data Analyst with SQL (Strong)",
    "salary_year_avg": 122500.0,
    "company_name": "Innova Solutions",
    "skills": "jira"
  },
  {
    "job_id": 238020,
    "job_title": "Business Data Analyst with SQL (Strong)",
    "salary_year_avg": 122500.0,
    "company_name": "Innova Solutions",
    "skills": "aws"
  },
  {
    "job_id": 238020,
    "job_title": "Business Data Analyst with SQL (Strong)",
    "salary_year_avg": 122500.0,
    "company_name": "Innova Solutions",
    "skills": "sql"
  },
  {
    "job_id": 357990,
    "job_title": "Data Analyst",
    "salary_year_avg": 115000.0,
    "company_name": "Robert Half",
    "skills": "power bi"
  },
  {
    "job_id": 357990,
    "job_title": "Data Analyst",
    "salary_year_avg": 115000.0,
    "company_name": "Robert Half",
    "skills": "tableau"
  },
  {
    "job_id": 357990,
    "job_title": "Data Analyst",
    "salary_year_avg": 115000.0,
    "company_name": "Robert Half",
    "skills": "oracle"
  },
  {
    "job_id": 357990,
    "job_title": "Data Analyst",
    "salary_year_avg": 115000.0,
    "company_name": "Robert Half",
    "skills": "databricks"
  },
  {
    "job_id": 357990,
    "job_title": "Data Analyst",
    "salary_year_avg": 115000.0,
    "company_name": "Robert Half",
    "skills": "azure"
  },
  {
    "job_id": 357990,
    "job_title": "Data Analyst",
    "salary_year_avg": 115000.0,
    "company_name": "Robert Half",
    "skills": "sql server"
  },
  {
    "job_id": 357990,
    "job_title": "Data Analyst",
    "salary_year_avg": 115000.0,
    "company_name": "Robert Half",
    "skills": "sql"
  },
  {
    "job_id": 600392,
    "job_title": "REMOTE PowerBI Data Analyst",
    "salary_year_avg": 107500.0,
    "company_name": "Insight Global",
    "skills": "sql"
  },
  {
    "job_id": 909000,
    "job_title": "Associate Director, Data Analysis",
    "salary_year_avg": 105000.0,
    "company_name": "EL Education (Formerly Expeditionary Learning)",
    "skills": "r"
  },
  {
    "job_id": 909000,
    "job_title": "Associate Director, Data Analysis",
    "salary_year_avg": 105000.0,
    "company_name": "EL Education (Formerly Expeditionary Learning)",
    "skills": "tableau"
  },
  {
    "job_id": 909000,
    "job_title": "Associate Director, Data Analysis",
    "salary_year_avg": 105000.0,
    "company_name": "EL Education (Formerly Expeditionary Learning)",
    "skills": "word"
  },
  {
    "job_id": 1064019,
    "job_title": "Legal Project Management Data Analyst",
    "salary_year_avg": 99500.0,
    "company_name": "Ogletree Deakins",
    "skills": "sql"
  },
  {
    "job_id": 1064019,
    "job_title": "Legal Project Management Data Analyst",
    "salary_year_avg": 99500.0,
    "company_name": "Ogletree Deakins",
    "skills": "python"
  },
  {
    "job_id": 1064019,
    "job_title": "Legal Project Management Data Analyst",
    "salary_year_avg": 99500.0,
    "company_name": "Ogletree Deakins",
    "skills": "r"
  },
  {
    "job_id": 1064019,
    "job_title": "Legal Project Management Data Analyst",
    "salary_year_avg": 99500.0,
    "company_name": "Ogletree Deakins",
    "skills": "excel"
  },
  {
    "job_id": 1064019,
    "job_title": "Legal Project Management Data Analyst",
    "salary_year_avg": 99500.0,
    "company_name": "Ogletree Deakins",
    "skills": "tableau"
  },
  {
    "job_id": 914174,
    "job_title": "Data Analyst, Supply Chain (Remote)",
    "salary_year_avg": 90000.0,
    "company_name": "Home Depot / THD",
    "skills": "oracle"
  },
  {
    "job_id": 914174,
    "job_title": "Data Analyst, Supply Chain (Remote)",
    "salary_year_avg": 90000.0,
    "company_name": "Home Depot / THD",
    "skills": "sql server"
  },
  {
    "job_id": 914174,
    "job_title": "Data Analyst, Supply Chain (Remote)",
    "salary_year_avg": 90000.0,
    "company_name": "Home Depot / THD",
    "skills": "sql"
  },
  {
    "job_id": 116825,
    "job_title": "Data Analyst",
    "salary_year_avg": 90000.0,
    "company_name": "hackajob",
    "skills": "matlab"
  },
  {
    "job_id": 116825,
    "job_title": "Data Analyst",
    "salary_year_avg": 90000.0,
    "company_name": "hackajob",
    "skills": "c#"
  },
  {
    "job_id": 116825,
    "job_title": "Data Analyst",
    "salary_year_avg": 90000.0,
    "company_name": "hackajob",
    "skills": "c++"
  },
  {
    "job_id": 116825,
    "job_title": "Data Analyst",
    "salary_year_avg": 90000.0,
    "company_name": "hackajob",
    "skills": "r"
  },
  {
    "job_id": 116825,
    "job_title": "Data Analyst",
    "salary_year_avg": 90000.0,
    "company_name": "hackajob",
    "skills": "java"
  },
  {
    "job_id": 116825,
    "job_title": "Data Analyst",
    "salary_year_avg": 90000.0,
    "company_name": "hackajob",
    "skills": "python"
  },
  {
    "job_id": 116825,
    "job_title": "Data Analyst",
    "salary_year_avg": 90000.0,
    "company_name": "hackajob",
    "skills": "sql"
  }
]
*/    