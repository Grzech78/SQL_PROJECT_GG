/*
What are the most in-demand skills for for all job postings?
Provide 10 top skills 
*/

SELECT
    skills,
    COUNT(jpf.job_id) demand_count
FROM
    job_postings_fact jpf
INNER JOIN 
    skills_job_dim sjd ON sjd.job_id = jpf.job_id
INNER JOIN
    skills_dim sd ON sd.skill_id = sjd.skill_id   
WHERE
    jpf.job_title_short = 'Data Analyst' AND job_work_from_home = TRUE
GROUP BY 
    skills
ORDER BY
    demand_count DESC
LIMIT 10 
;