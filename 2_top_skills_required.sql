/* 
- what are skills required to the top 10 paying jobs as Data Analyst
- use data from 1_top_paid_jobs
- add specific siklls to these jobs
- it helps to find skills which should be developed if you try to find 
this kind of job
*/
WITH top_paid_jobs AS
(
SELECT 
    job_id,
    job_title_short,
    job_title,
    cd.name,
    salary_year_avg
FROM 
    job_postings_fact
LEFT JOIN 
    company_dim cd ON cd.company_id = job_postings_fact.company_id
WHERE salary_year_avg IS NOT NULL AND job_title_short = 'Data Analyst'
AND job_location LIKE'Anywhere'
ORDER BY
    salary_year_avg DESC
LIMIT 10
)
SELECT
    top_paid_jobs.*,
    sd.skills
FROM 
    top_paid_jobs
INNER JOIN 
    skills_job_dim sjd ON sjd.job_id = top_paid_jobs.job_id
INNER JOIN
    skills_dim sd ON sd.skill_id = sjd.skill_id    
ORDER BY
    salary_year_avg DESC
;
/*
SQL, Python, and Tableau are by far the most in-demand skills for data analyst roles across multiple companies.

Other valuable tools include R, Excel, and data cloud platforms like Snowflake and AWS/Azure.

Collaboration tools like Jira, Confluence, and Bitbucket are also appearing, indicating cross-functional teamwork environments.

Libraries like Pandas and NumPy are being sought as part of the Python ecosystem.
Rank	Skill	Frequency
1	sql	9
2	python	8
3	tableau	7
4	r	4
5	excel	2
5	pandas	2
5	power bi	2
5	snowflake	2
5	numpy	2
5	go	2
5	oracle	2
5	azure	2
5	aws	2
5	bitbucket	2
5	atlassian	2
5	jira	2
5	confluence	2
—	(Others)	1 each

CSV:

"job_id","job_title_short","job_title","name","salary_year_avg","skills"
552322,"Data Analyst","Associate Director- Data Insights","AT&T","255829.5","sql"
552322,"Data Analyst","Associate Director- Data Insights","AT&T","255829.5","python"
552322,"Data Analyst","Associate Director- Data Insights","AT&T","255829.5","r"
552322,"Data Analyst","Associate Director- Data Insights","AT&T","255829.5","azure"
552322,"Data Analyst","Associate Director- Data Insights","AT&T","255829.5","databricks"
552322,"Data Analyst","Associate Director- Data Insights","AT&T","255829.5","aws"
552322,"Data Analyst","Associate Director- Data Insights","AT&T","255829.5","pandas"
552322,"Data Analyst","Associate Director- Data Insights","AT&T","255829.5","pyspark"
552322,"Data Analyst","Associate Director- Data Insights","AT&T","255829.5","jupyter"
552322,"Data Analyst","Associate Director- Data Insights","AT&T","255829.5","excel"
552322,"Data Analyst","Associate Director- Data Insights","AT&T","255829.5","tableau"
552322,"Data Analyst","Associate Director- Data Insights","AT&T","255829.5","power bi"
552322,"Data Analyst","Associate Director- Data Insights","AT&T","255829.5","powerpoint"
99305,"Data Analyst","Data Analyst, Marketing","Pinterest Job Advertisements","232423.0","sql"
99305,"Data Analyst","Data Analyst, Marketing","Pinterest Job Advertisements","232423.0","python"
99305,"Data Analyst","Data Analyst, Marketing","Pinterest Job Advertisements","232423.0","r"
99305,"Data Analyst","Data Analyst, Marketing","Pinterest Job Advertisements","232423.0","hadoop"
99305,"Data Analyst","Data Analyst, Marketing","Pinterest Job Advertisements","232423.0","tableau"
1021647,"Data Analyst","Data Analyst (Hybrid/Remote)","Uclahealthcareers","217000.0","sql"
1021647,"Data Analyst","Data Analyst (Hybrid/Remote)","Uclahealthcareers","217000.0","crystal"
1021647,"Data Analyst","Data Analyst (Hybrid/Remote)","Uclahealthcareers","217000.0","oracle"
1021647,"Data Analyst","Data Analyst (Hybrid/Remote)","Uclahealthcareers","217000.0","tableau"
1021647,"Data Analyst","Data Analyst (Hybrid/Remote)","Uclahealthcareers","217000.0","flow"
168310,"Data Analyst","Principal Data Analyst (Remote)","SmartAsset","205000.0","sql"
168310,"Data Analyst","Principal Data Analyst (Remote)","SmartAsset","205000.0","python"
168310,"Data Analyst","Principal Data Analyst (Remote)","SmartAsset","205000.0","go"
168310,"Data Analyst","Principal Data Analyst (Remote)","SmartAsset","205000.0","snowflake"
168310,"Data Analyst","Principal Data Analyst (Remote)","SmartAsset","205000.0","pandas"
168310,"Data Analyst","Principal Data Analyst (Remote)","SmartAsset","205000.0","numpy"
168310,"Data Analyst","Principal Data Analyst (Remote)","SmartAsset","205000.0","excel"
168310,"Data Analyst","Principal Data Analyst (Remote)","SmartAsset","205000.0","tableau"
168310,"Data Analyst","Principal Data Analyst (Remote)","SmartAsset","205000.0","gitlab"
731368,"Data Analyst","Director, Data Analyst - HYBRID","Inclusively","189309.0","sql"
731368,"Data Analyst","Director, Data Analyst - HYBRID","Inclusively","189309.0","python"
731368,"Data Analyst","Director, Data Analyst - HYBRID","Inclusively","189309.0","azure"
731368,"Data Analyst","Director, Data Analyst - HYBRID","Inclusively","189309.0","aws"
731368,"Data Analyst","Director, Data Analyst - HYBRID","Inclusively","189309.0","oracle"
731368,"Data Analyst","Director, Data Analyst - HYBRID","Inclusively","189309.0","snowflake"
731368,"Data Analyst","Director, Data Analyst - HYBRID","Inclusively","189309.0","tableau"
731368,"Data Analyst","Director, Data Analyst - HYBRID","Inclusively","189309.0","power bi"
731368,"Data Analyst","Director, Data Analyst - HYBRID","Inclusively","189309.0","sap"
731368,"Data Analyst","Director, Data Analyst - HYBRID","Inclusively","189309.0","jenkins"
731368,"Data Analyst","Director, Data Analyst - HYBRID","Inclusively","189309.0","bitbucket"
731368,"Data Analyst","Director, Data Analyst - HYBRID","Inclusively","189309.0","atlassian"
731368,"Data Analyst","Director, Data Analyst - HYBRID","Inclusively","189309.0","jira"
731368,"Data Analyst","Director, Data Analyst - HYBRID","Inclusively","189309.0","confluence"
310660,"Data Analyst","Principal Data Analyst, AV Performance Analysis","Motional","189000.0","sql"
310660,"Data Analyst","Principal Data Analyst, AV Performance Analysis","Motional","189000.0","python"
310660,"Data Analyst","Principal Data Analyst, AV Performance Analysis","Motional","189000.0","r"
310660,"Data Analyst","Principal Data Analyst, AV Performance Analysis","Motional","189000.0","git"
310660,"Data Analyst","Principal Data Analyst, AV Performance Analysis","Motional","189000.0","bitbucket"
310660,"Data Analyst","Principal Data Analyst, AV Performance Analysis","Motional","189000.0","atlassian"
310660,"Data Analyst","Principal Data Analyst, AV Performance Analysis","Motional","189000.0","jira"
310660,"Data Analyst","Principal Data Analyst, AV Performance Analysis","Motional","189000.0","confluence"
1749593,"Data Analyst","Principal Data Analyst","SmartAsset","186000.0","sql"
1749593,"Data Analyst","Principal Data Analyst","SmartAsset","186000.0","python"
1749593,"Data Analyst","Principal Data Analyst","SmartAsset","186000.0","go"
1749593,"Data Analyst","Principal Data Analyst","SmartAsset","186000.0","snowflake"
1749593,"Data Analyst","Principal Data Analyst","SmartAsset","186000.0","pandas"
1749593,"Data Analyst","Principal Data Analyst","SmartAsset","186000.0","numpy"
1749593,"Data Analyst","Principal Data Analyst","SmartAsset","186000.0","excel"
1749593,"Data Analyst","Principal Data Analyst","SmartAsset","186000.0","tableau"
1749593,"Data Analyst","Principal Data Analyst","SmartAsset","186000.0","gitlab"
387860,"Data Analyst","ERM Data Analyst","Get It Recruit - Information Technology","184000.0","sql"
387860,"Data Analyst","ERM Data Analyst","Get It Recruit - Information Technology","184000.0","python"
387860,"Data Analyst","ERM Data Analyst","Get It Recruit - Information Technology","184000.0","r"

*/