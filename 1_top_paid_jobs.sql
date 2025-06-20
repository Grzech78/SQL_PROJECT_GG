/* 
- what are the top 10 paying jobs as Data Analyst
- they are availabe remotely
- salary is specified (amount should be completed)
*/

SELECT 
    job_id,
    job_title_short,
    job_title,
    cd.name,
    job_schedule_type,
    job_location,
    salary_year_avg,
    job_posted_date
FROM 
    job_postings_fact
LEFT JOIN 
    company_dim cd ON cd.company_id = job_postings_fact.company_id
WHERE salary_year_avg IS NOT NULL AND job_title_short = 'Data Analyst'
AND job_location LIKE'Anywhere'
ORDER BY
    salary_year_avg DESC
LIMIT 10;