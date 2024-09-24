
/*
Answer: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Analyst positions
- Focuses on roles with specified salaries, regardless of location
- Why? It reveals how different skills impact salary levels for Data Analysts and 
    helps identify the most financially rewarding skills to acquire or improve
*/

USE sql_course

SELECT 
    TOP(25)
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary 
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = 1 
GROUP BY
    skills
ORDER BY
    avg_salary DESC;

/*
Here's a breakdown of the results for top paying skills for Data Analysts:
- High Demand for Big Data & ML Skills: Top salaries are commanded by analysts skilled in big data technologies (PySpark, Couchbase), machine learning tools (DataRobot, Jupyter), and Python libraries (Pandas, NumPy), reflecting the industry's high valuation of data processing and predictive modeling capabilities.
- Software Development & Deployment Proficiency: Knowledge in development and deployment tools (GitLab, Kubernetes, Airflow) indicates a lucrative crossover between data analysis and engineering, with a premium on skills that facilitate automation and efficient data pipeline management.
- Cloud Computing Expertise: Familiarity with cloud and data engineering tools (Elasticsearch, Databricks, GCP) underscores the growing importance of cloud-based analytics environments, suggesting that cloud proficiency significantly boosts earning potential in data analytics.
[
  {
    "skills": "golang",
    "avg_salary": 145000.000000
  },
  {
    "skills": "microsoft teams",
    "avg_salary": 79416.000000
  },
  {
    "skills": "elasticsearch",
    "avg_salary": 72500.000000
  },
  {
    "skills": "kubernetes",
    "avg_salary": 72500.000000
  },
  {
    "skills": "smartsheet",
    "avg_salary": 60000.000000
  },
  {
    "skills": "jupyter",
    "avg_salary": 31250.000000
  },
  {
    "skills": "shell",
    "avg_salary": 31250.000000
  },
  {
    "skills": "confluence",
    "avg_salary": 30214.000000
  },
  {
    "skills": "scikit-learn",
    "avg_salary": 24167.000000
  },
  {
    "skills": "spss",
    "avg_salary": 22874.000000
  },
  {
    "skills": "c++",
    "avg_salary": 22500.000000
  },
  {
    "skills": "bigquery",
    "avg_salary": 20769.000000
  },
  {
    "skills": "matplotlib",
    "avg_salary": 20000.000000
  },
  {
    "skills": "airflow",
    "avg_salary": 15625.000000
  },
  {
    "skills": "redshift",
    "avg_salary": 15583.000000
  },
  {
    "skills": "matlab",
    "avg_salary": 15000.000000
  },
  {
    "skills": "java",
    "avg_salary": 14917.000000
  },
  {
    "skills": "scala",
    "avg_salary": 14833.000000
  },
  {
    "skills": "jira",
    "avg_salary": 14100.000000
  },
  {
    "skills": "sql server",
    "avg_salary": 13667.000000
  },
  {
    "skills": "aws",
    "avg_salary": 13180.000000
  },
  {
    "skills": "oracle",
    "avg_salary": 12813.000000
  },
  {
    "skills": "pandas",
    "avg_salary": 12083.000000
  },
  {
    "skills": "javascript",
    "avg_salary": 11125.000000
  },
  {
    "skills": "databricks",
    "avg_salary": 10455.000000
  }
]
*/
