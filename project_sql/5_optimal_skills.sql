
/*
Answer: What are the most optimal skills to learn (aka it’s in high demand and a high-paying skill)?
- Identify skills in high demand and associated with high average salaries for Data Analyst roles
- Concentrates on remote positions with specified salaries
- Why? Targets skills that offer job security (high demand) and financial benefits (high salaries), 
    offering strategic insights for career development in data analysis
*/

-- Identifies skills in high demand for Data Analyst roles
-- Use Query #3
USE sql_course
WITH skills_demand AS (
    SELECT
        skills_dim.skill_id,
        skills_dim.skills,
        COUNT(skills_job_dim.job_id) AS demand_count
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst' 
        AND salary_year_avg IS NOT NULL
        AND job_work_from_home = 1 
    GROUP BY
        skills_dim.skill_id,
        skills_dim.skills
), 
-- Skills with high average salaries for Data Analyst roles
-- Use Query #4
average_salary AS (
    SELECT 
        skills_job_dim.skill_id,
        ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst'
        AND salary_year_avg IS NOT NULL
        AND job_work_from_home = 1 
    GROUP BY
        skills_job_dim.skill_id
)
-- Return high demand and high salaries for 10 skills 
SELECT
    TOP(25)
    skills_demand.skill_id,
    skills_demand.skills,
    demand_count,
    avg_salary
FROM
    skills_demand
INNER JOIN  average_salary ON skills_demand.skill_id = average_salary.skill_id
WHERE  
    demand_count > 10
ORDER BY
    avg_salary DESC,
    demand_count DESC;


-- rewriting this same query more concisely
SELECT 
    TOP(25)
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count,
    ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = 1 
GROUP BY
    skills_dim.skill_id,
    skills_dim.skills
HAVING
    COUNT(skills_job_dim.job_id) > 10
ORDER BY
    avg_salary DESC,
    demand_count DESC;

/*
Here's a breakdown of the most optimal skills for Data Analysts in 2023: 
High-Demand Programming Languages: Python and R stand out for their high demand, with demand counts of 236 and 148 respectively. Despite their high demand, their average salaries are around $101,397 for Python and $100,499 for R, indicating that proficiency in these languages is highly valued but also widely available.
Cloud Tools and Technologies: Skills in specialized technologies such as Snowflake, Azure, AWS, and BigQuery show significant demand with relatively high average salaries, pointing towards the growing importance of cloud platforms and big data technologies in data analysis.
Business Intelligence and Visualization Tools: Tableau and Looker, with demand counts of 230 and 49 respectively, and average salaries around $99,288 and $103,795, highlight the critical role of data visualization and business intelligence in deriving actionable insights from data.
Database Technologies: The demand for skills in traditional and NoSQL databases (Oracle, SQL Server, NoSQL) with average salaries ranging from $97,786 to $104,534, reflects the enduring need for data storage, retrieval, and management expertise.

[
  {
    "skill_id": 77,
    "skills": "bigquery",
    "demand_count": 13,
    "avg_salary": 20769.000000
  },
  {
    "skill_id": 78,
    "skills": "redshift",
    "demand_count": 12,
    "avg_salary": 15583.000000
  },
  {
    "skill_id": 4,
    "skills": "java",
    "demand_count": 12,
    "avg_salary": 14917.000000
  },
  {
    "skill_id": 233,
    "skills": "jira",
    "demand_count": 15,
    "avg_salary": 14100.000000
  },
  {
    "skill_id": 61,
    "skills": "sql server",
    "demand_count": 15,
    "avg_salary": 13667.000000
  },
  {
    "skill_id": 76,
    "skills": "aws",
    "demand_count": 25,
    "avg_salary": 13180.000000
  },
  {
    "skill_id": 79,
    "skills": "oracle",
    "demand_count": 16,
    "avg_salary": 12813.000000
  },
  {
    "skill_id": 93,
    "skills": "pandas",
    "demand_count": 12,
    "avg_salary": 12083.000000
  },
  {
    "skill_id": 75,
    "skills": "databricks",
    "demand_count": 11,
    "avg_salary": 10455.000000
  },
  {
    "skill_id": 5,
    "skills": "r",
    "demand_count": 78,
    "avg_salary": 10441.000000
  },
  {
    "skill_id": 81,
    "skills": "gcp",
    "demand_count": 15,
    "avg_salary": 9667.000000
  },
  {
    "skill_id": 188,
    "skills": "word",
    "demand_count": 20,
    "avg_salary": 9375.000000
  },
  {
    "skill_id": 185,
    "skills": "looker",
    "demand_count": 20,
    "avg_salary": 7250.000000
  },
  {
    "skill_id": 80,
    "skills": "snowflake",
    "demand_count": 25,
    "avg_salary": 6960.000000
  },
  {
    "skill_id": 186,
    "skills": "sas",
    "demand_count": 31,
    "avg_salary": 6641.000000
  },
  {
    "skill_id": 7,
    "skills": "sas",
    "demand_count": 31,
    "avg_salary": 6641.000000
  },
  {
    "skill_id": 0,
    "skills": "sql",
    "demand_count": 248,
    "avg_salary": 6558.000000
  },
  {
    "skill_id": 182,
    "skills": "tableau",
    "demand_count": 139,
    "avg_salary": 6539.000000
  },
  {
    "skill_id": 92,
    "skills": "spark",
    "demand_count": 20,
    "avg_salary": 6250.000000
  },
  {
    "skill_id": 1,
    "skills": "python",
    "demand_count": 167,
    "avg_salary": 5909.000000
  },
  {
    "skill_id": 8,
    "skills": "go",
    "demand_count": 19,
    "avg_salary": 4180.000000
  },
  {
    "skill_id": 192,
    "skills": "sheets",
    "demand_count": 15,
    "avg_salary": 4000.000000
  },
  {
    "skill_id": 74,
    "skills": "azure",
    "demand_count": 32,
    "avg_salary": 3594.000000
  },
  {
    "skill_id": 181,
    "skills": "excel",
    "demand_count": 147,
    "avg_salary": 2650.000000
  },
  {
    "skill_id": 183,
    "skills": "power bi",
    "demand_count": 99,
    "avg_salary": 2590.000000
  }
]
*/
