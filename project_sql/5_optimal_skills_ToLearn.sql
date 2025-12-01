/*
Question: What is the most optimal skill to learn?
- Identify skills in high demand and associated with high average salaries for Data Engineer roles
- Concentrate on remote positions with specified salaries
- Why? Target skills that offer job security (high demand) and financial benefits (high salaries),
    offering strategic insights for career development in data Engineering  
*/

WITH top_demand_skills AS
    (SELECT 
        skill_id,
        skills,
        count(skills_job_dim.job_id) AS skill_demand_count
    FROM job_postings_fact
    INNER JOIN skills_job_dim
        USING(job_id)
    INNER JOIN skills_dim
        USING(skill_id)
    WHERE 
        job_title_short = 'Data Engineer'
         AND salary_year_avg IS NOT NULL
         AND job_work_from_home = True
    GROUP BY skill_id, skills
)

, top_skill_salary AS
    (SELECT 
        skill_id,
        skills,
        ROUND(AVG(salary_year_avg), 2) AS avg_year_salary
    FROM job_postings_fact
    INNER JOIN skills_job_dim
        USING(job_id)
    INNER JOIN skills_dim
        USING(skill_id)
    WHERE 
        job_title_short = 'Data Engineer'
        AND salary_year_avg IS NOT NULL
        AND job_work_from_home = True
    GROUP BY skill_id, skills
)

SELECT 
    top_demand_skills.skill_id,
    top_demand_skills.skills,
    skill_demand_count,
    avg_year_salary
FROM top_demand_skills
INNER JOIN top_skill_salary 
    USING(skill_id)
WHERE skill_demand_count > 10
ORDER BY 
    avg_year_salary DESC,
    skill_demand_count DESC
LIMIT 25;