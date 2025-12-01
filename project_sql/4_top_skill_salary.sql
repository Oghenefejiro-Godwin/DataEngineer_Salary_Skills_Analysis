/*
Question: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Engineer positions
- Focuses on roles with specified salaries, regardless of location
- Why? It reveals how different skills impact salary levels for Data Engineers and helps 
    identify the most financial rewarding skills to acquire or improve
*/


SELECT 
    skills AS skill_name,
    ROUND(AVG(salary_year_avg), 2) AS avg_year_salary
FROM job_postings_fact
INNER JOIN skills_job_dim
    USING(job_id)
INNER JOIN skills_dim
    USING(skill_id)
WHERE 
    job_title_short = 'Data Engineer'
    AND salary_year_avg IS NOT NULL
GROUP BY skill_name
ORDER BY avg_year_salary DESC
LIMIT 25;

/*
Here’s the breakdown of the top-paying skills related to data engineering:

- Specialized backend technologies like Node and MongoDB top the salary list, showing that data engineers who can bridge backend + data systems earn more.
- High-paying niche skills (Solidity, Rust, Clojure) indicate strong salaries for engineers working in blockchain, low-latency systems, and emerging tech.
- Big Data and distributed technologies (Cassandra, Kafka, Kubernetes) remain highly valued due to their use in large-scale data platforms.
- Systems and DevOps skills (Ubuntu, Shell, IBM Cloud, CodeCommit) command strong pay, highlighting the importance of infrastructure automation in data engineering.

[
  {
    "skill_name": "node",
    "avg_year_salary": "181861.78"
  },
  {
    "skill_name": "mongo",
    "avg_year_salary": "179402.54"
  },
  {
    "skill_name": "ggplot2",
    "avg_year_salary": "176250.00"
  },
  {
    "skill_name": "solidity",
    "avg_year_salary": "166250.00"
  },
  {
    "skill_name": "vue",
    "avg_year_salary": "159375.00"
  },
  {
    "skill_name": "codecommit",
    "avg_year_salary": "155000.00"
  },
  {
    "skill_name": "ubuntu",
    "avg_year_salary": "154455.00"
  },
  {
    "skill_name": "clojure",
    "avg_year_salary": "153662.60"
  },
  {
    "skill_name": "cassandra",
    "avg_year_salary": "150255.30"
  },
  {
    "skill_name": "rust",
    "avg_year_salary": "147770.73"
  },
  {
    "skill_name": "drupal",
    "avg_year_salary": "147500.00"
  },
  {
    "skill_name": "perl",
    "avg_year_salary": "145539.92"
  },
  {
    "skill_name": "next.js",
    "avg_year_salary": "145000.00"
  },
  {
    "skill_name": "angular",
    "avg_year_salary": "143318.96"
  },
  {
    "skill_name": "scala",
    "avg_year_salary": "143161.07"
  },
  {
    "skill_name": "kafka",
    "avg_year_salary": "143085.77"
  },
  {
    "skill_name": "gdpr",
    "avg_year_salary": "142368.74"
  },
  {
    "skill_name": "shell",
    "avg_year_salary": "141724.61"
  },
  {
    "skill_name": "macos",
    "avg_year_salary": "141616.67"
  },
  {
    "skill_name": "numpy",
    "avg_year_salary": "141605.32"
  },
  {
    "skill_name": "opencv",
    "avg_year_salary": "141250.00"
  },
  {
    "skill_name": "atlassian",
    "avg_year_salary": "140643.52"
  },
  {
    "skill_name": "ibm cloud",
    "avg_year_salary": "140546.60"
  },
  {
    "skill_name": "splunk",
    "avg_year_salary": "140156.30"
  },
  {
    "skill_name": "kubernetes",
    "avg_year_salary": "140091.81"
  }
]
*/