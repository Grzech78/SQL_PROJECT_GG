/*
What are the top 10 paid skills
*/
WITH top_10_paid_jobs AS( 
SELECT 
    job_id,
    job_title,
    salary_year_avg,
    cd.name
FROM 
    job_postings_fact
LEFT JOIN 
    company_dim cd ON cd.company_id = job_postings_fact.company_id
WHERE salary_year_avg IS NOT NULL AND job_title_short = 'Data Analyst'
AND job_location LIKE'Anywhere'
ORDER BY
    salary_year_avg DESC

)
SELECT
    top_10_paid_jobs.*,
    skills
    
FROM
    top_10_paid_jobs
INNER JOIN
    skills_job_dim sjd ON  sjd.job_id = top_10_paid_jobs.job_id
INNER JOIN
    skills_dim sd ON sd.skill_id = sjd.skill_id

LIMIT 1000;



SELECT 
    skills,
    ROUND(AVG(salary_year_avg),2) avg_salary
FROM 
    job_postings_fact
INNER JOIN
    skills_job_dim sjd ON  sjd.job_id = job_postings_fact.job_id
INNER JOIN
    skills_dim sd ON sd.skill_id = sjd.skill_id
WHERE salary_year_avg IS NOT NULL AND job_title_short = 'Data Analyst'
AND job_location LIKE'Anywhere'
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 25;