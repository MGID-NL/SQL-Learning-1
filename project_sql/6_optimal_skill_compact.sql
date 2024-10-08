SELECT
    s.skills,    
    COUNT(j.job_id) AS Vacatures,
    ROUND(AVG(j.salary_year_avg)) AS Salaris
FROM job_postings_fact AS j
INNER JOIN skills_job_dim AS sj ON j.job_id = sj.job_id
INNER JOIN skills_dim AS s ON sj.skill_id = s.skill_id
WHERE 
    salary_year_avg is not NULL AND
    j.job_title_short = 'Data Engineer' AND 
    j.job_location LIKE '%Netherlands%'
GROUP BY
    s.skills
ORDER BY
    Vacatures DESC
LIMIT 25