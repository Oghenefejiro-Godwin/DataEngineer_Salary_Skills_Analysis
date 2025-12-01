/*
Quesion: what skills are required for the top paying Data Engineer jobs?
- use the top 10 highest-paying Data Engineer jobs from the first query
- Add the specific skills required for these roles
- Why? It provides a detailed look at which high paying jobs demand certain skills,
    helping job seekers understand which skills to develop that align with top salaries
*/

WITH top_paying_jobs AS (
    SELECT
        job_id,
        job_title,
        company_dim.name AS company_name,
        job_schedule_type,   
        salary_year_avg
    FROM
        job_postings_fact
    LEFT JOIN company_dim
        USING(company_id)
    WHERE 
        job_title_short = 'Data Engineer'
        AND job_location = 'Anywhere'
        AND salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)

SELECT 
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim
    USING (job_id)
INNER JOIN skills_dim
    USING (skill_id)
ORDER BY salary_year_avg DESC
LIMIT 10;

/*
Here's the breakdown of the most demanded skills for data engineering in 2023, based on job postings:

- Python clearly takes the lead, appearing across almost all high-paying roles.
-Apache Spark follows closely, showing strong demand in modern data pipeline environments.
- Big Data technologies like Hadoop, Kafka, and PySpark appear frequently across senior positions.
- Cloud platforms (AWS, Azure, GCP) also rank highly, especially in top-tier and advanced engineering roles.

[
  {
    "job_id": 157003,
    "job_title": "Data Engineer",
    "company_name": "Engtal",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "325000.0",
    "skills": "python"
  },
  {
    "job_id": 157003,
    "job_title": "Data Engineer",
    "company_name": "Engtal",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "325000.0",
    "skills": "spark"
  },
  {
    "job_id": 157003,
    "job_title": "Data Engineer",
    "company_name": "Engtal",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "325000.0",
    "skills": "pandas"
  },
  {
    "job_id": 157003,
    "job_title": "Data Engineer",
    "company_name": "Engtal",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "325000.0",
    "skills": "numpy"
  },
  {
    "job_id": 157003,
    "job_title": "Data Engineer",
    "company_name": "Engtal",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "325000.0",
    "skills": "pyspark"
  },
  {
    "job_id": 157003,
    "job_title": "Data Engineer",
    "company_name": "Engtal",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "325000.0",
    "skills": "hadoop"
  },
  {
    "job_id": 157003,
    "job_title": "Data Engineer",
    "company_name": "Engtal",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "325000.0",
    "skills": "kafka"
  },
  {
    "job_id": 157003,
    "job_title": "Data Engineer",
    "company_name": "Engtal",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "325000.0",
    "skills": "kubernetes"
  },
  {
    "job_id": 21321,
    "job_title": "Data Engineer",
    "company_name": "Engtal",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "325000.0",
    "skills": "python"
  },
  {
    "job_id": 21321,
    "job_title": "Data Engineer",
    "company_name": "Engtal",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "325000.0",
    "skills": "spark"
  },
  {
    "job_id": 21321,
    "job_title": "Data Engineer",
    "company_name": "Engtal",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "325000.0",
    "skills": "pandas"
  },
  {
    "job_id": 21321,
    "job_title": "Data Engineer",
    "company_name": "Engtal",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "325000.0",
    "skills": "numpy"
  },
  {
    "job_id": 21321,
    "job_title": "Data Engineer",
    "company_name": "Engtal",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "325000.0",
    "skills": "pyspark"
  },
  {
    "job_id": 21321,
    "job_title": "Data Engineer",
    "company_name": "Engtal",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "325000.0",
    "skills": "hadoop"
  },
  {
    "job_id": 21321,
    "job_title": "Data Engineer",
    "company_name": "Engtal",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "325000.0",
    "skills": "kafka"
  },
  {
    "job_id": 21321,
    "job_title": "Data Engineer",
    "company_name": "Engtal",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "325000.0",
    "skills": "kubernetes"
  },
  {
    "job_id": 270455,
    "job_title": "Data Engineer",
    "company_name": "Durlston Partners",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "300000.0",
    "skills": "sql"
  },
  {
    "job_id": 270455,
    "job_title": "Data Engineer",
    "company_name": "Durlston Partners",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "300000.0",
    "skills": "python"
  },
  {
    "job_id": 230458,
    "job_title": "Director of Engineering - Data Platform",
    "company_name": "Twitch",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "251000.0",
    "skills": "spark"
  },
  {
    "job_id": 230458,
    "job_title": "Director of Engineering - Data Platform",
    "company_name": "Twitch",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "251000.0",
    "skills": "hadoop"
  },
  {
    "job_id": 230458,
    "job_title": "Director of Engineering - Data Platform",
    "company_name": "Twitch",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "251000.0",
    "skills": "kafka"
  },
  {
    "job_id": 230458,
    "job_title": "Director of Engineering - Data Platform",
    "company_name": "Twitch",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "251000.0",
    "skills": "tensorflow"
  },
  {
    "job_id": 230458,
    "job_title": "Director of Engineering - Data Platform",
    "company_name": "Twitch",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "251000.0",
    "skills": "keras"
  },
  {
    "job_id": 230458,
    "job_title": "Director of Engineering - Data Platform",
    "company_name": "Twitch",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "251000.0",
    "skills": "pytorch"
  },
  {
    "job_id": 595768,
    "job_title": "Principal Data Engineer",
    "company_name": "Signify Technology",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "250000.0",
    "skills": "python"
  },
  {
    "job_id": 595768,
    "job_title": "Principal Data Engineer",
    "company_name": "Signify Technology",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "250000.0",
    "skills": "scala"
  },
  {
    "job_id": 595768,
    "job_title": "Principal Data Engineer",
    "company_name": "Signify Technology",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "250000.0",
    "skills": "databricks"
  },
  {
    "job_id": 595768,
    "job_title": "Principal Data Engineer",
    "company_name": "Signify Technology",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "250000.0",
    "skills": "spark"
  },
  {
    "job_id": 543728,
    "job_title": "Staff Data Engineer",
    "company_name": "Signify Technology",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "250000.0",
    "skills": "python"
  },
  {
    "job_id": 543728,
    "job_title": "Staff Data Engineer",
    "company_name": "Signify Technology",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "250000.0",
    "skills": "scala"
  },
  {
    "job_id": 543728,
    "job_title": "Staff Data Engineer",
    "company_name": "Signify Technology",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "250000.0",
    "skills": "databricks"
  },
  {
    "job_id": 543728,
    "job_title": "Staff Data Engineer",
    "company_name": "Signify Technology",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "250000.0",
    "skills": "spark"
  },
  {
    "job_id": 561728,
    "job_title": "Data Engineer",
    "company_name": "AI Startup",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "250000.0",
    "skills": "python"
  },
  {
    "job_id": 561728,
    "job_title": "Data Engineer",
    "company_name": "AI Startup",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "250000.0",
    "skills": "scala"
  },
  {
    "job_id": 561728,
    "job_title": "Data Engineer",
    "company_name": "AI Startup",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "250000.0",
    "skills": "r"
  },
  {
    "job_id": 561728,
    "job_title": "Data Engineer",
    "company_name": "AI Startup",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "250000.0",
    "skills": "azure"
  },
  {
    "job_id": 151972,
    "job_title": "Principal Data Engineer (Remote)",
    "company_name": "Movable Ink",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "245000.0",
    "skills": "nosql"
  },
  {
    "job_id": 151972,
    "job_title": "Principal Data Engineer (Remote)",
    "company_name": "Movable Ink",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "245000.0",
    "skills": "aws"
  },
  {
    "job_id": 151972,
    "job_title": "Principal Data Engineer (Remote)",
    "company_name": "Movable Ink",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "245000.0",
    "skills": "gcp"
  },
  {
    "job_id": 204320,
    "job_title": "Staff Data Engineer",
    "company_name": "Handshake",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "245000.0",
    "skills": "go"
  },
  {
    "job_id": 2446,
    "job_title": "Data Engineering Manager",
    "company_name": "Meta",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "242000.0",
    "skills": "sql"
  },
  {
    "job_id": 2446,
    "job_title": "Data Engineering Manager",
    "company_name": "Meta",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "242000.0",
    "skills": "python"
  },
  {
    "job_id": 2446,
    "job_title": "Data Engineering Manager",
    "company_name": "Meta",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "242000.0",
    "skills": "java"
  },
  {
    "job_id": 2446,
    "job_title": "Data Engineering Manager",
    "company_name": "Meta",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "242000.0",
    "skills": "perl"
  }
]
*/