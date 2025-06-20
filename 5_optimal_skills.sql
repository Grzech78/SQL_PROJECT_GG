    WITH skills_demand AS (
        SELECT
            sd.skill_id,
            COUNT(jpf.job_id) demand_count,
            sd.skills
        FROM
            job_postings_fact jpf
        INNER JOIN 
            skills_job_dim sjd ON sjd.job_id = jpf.job_id
        INNER JOIN
            skills_dim sd ON sd.skill_id = sjd.skill_id   
        WHERE
            jpf.job_title_short = 'Data Analyst' AND job_work_from_home = TRUE
            AND salary_year_avg IS NOT NULL
        GROUP BY 
            sd.skill_id
    ), average_salary AS (
        SELECT
            sjd.skill_id,
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
            sjd.skill_id
    )
SELECT
    skills_demand.skill_id,
    skills_demand.skills,
    skills_demand.demand_count,
    average_salary.avg_salary
FROM
    skills_demand
INNER JOIN  average_salary ON skills_demand.skill_id = average_salary.skill_id
WHERE demand_count > 10
ORDER BY
    avg_salary DESC,
    demand_count DESC
LIMIT 25
;

SELECT 
skills_dim.skill_id,
skills_dim.skills,
COUNT(skills_job_dim.job_id) AS job_count,
ROUND(AVG(job_postings_fact.salary_year_avg),2) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL
GROUP BY skills_dim.skill_id
HAVING COUNT(skills_job_dim.job_id) > 10
ORDER BY
    avg_salary DESC,
    job_count DESC
LIMIT 25
;
