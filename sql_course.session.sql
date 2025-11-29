/*
- size categories:
        'small' - < 10
        'Medium' - between 10 and 50
        'Large' - > 50
*/

SELECT
    company_id,
    CASE
        WHEN job_postings < 10 THEN 'Small'
        WHEN job_postings  BETWEEN 10 AND 50 THEN 'Medium'
        ELSE 'Large'
    END AS size_category
FROM (SELECT 
        company_id,
        COUNT(job_id) AS job_postings
    FROM job_postings_fact
    GROUP BY company_id) AS f
GROUP BY job_postings, company_id
ORDER BY job_postings;
