SELECT 
    s.skills,
    ROUND(AVG(j.salary_year_avg)) AS Average_Salary
FROM skills_dim AS s
LEFT JOIN skills_job_dim AS sj ON s.skill_id = sj.skill_id
INNER JOIN job_postings_fact AS j ON sj.job_id = j.job_id
WHERE salary_year_avg IS NOT NULL AND
j.job_title_short = 'Data Analyst' 
 AND j.job_location LIKE '%Netherlands%' 
GROUP BY
    s.skills 
ORDER BY
    Average_Salary DESC
LIMIT 25
