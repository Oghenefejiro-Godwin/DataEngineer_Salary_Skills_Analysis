/*
Question: What is the most in demand skills for data engineers?
- Join job postings to inner join table similar to query 2
- Identify the top 5 in-demand skills for a data engineer.
- Focus on all job postings.
- Why? Retrives the top 5 skills with the highest demand in the job market,
    providing insights into the most valuable skills for a job seekers.
*/


SELECT 
    skills AS skill_name,
    count(skills_job_dim.job_id) AS skill_demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim
    USING(job_id)
INNER JOIN skills_dim
    USING(skill_id)
WHERE 
    job_title_short = 'Data Engineer'
GROUP BY skill_name
ORDER BY skill_demand_count DESC
LIMIT 10;