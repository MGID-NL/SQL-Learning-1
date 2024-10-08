WITH skill_demand AS (
        SELECT
        skills_dim.skill_id, 
        skills_dim.skills,  
        COUNT(skills_job_dim.job_id) AS Demand_Count
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        salary_year_avg IS NOT NULL AND
        job_location LIKE '%Netherlands%' AND
        job_title_short = 'Data Engineer'
    GROUP BY    
        skills_dim.skill_id
),

skill_avg_salary AS (
    SELECT 
        sj.skill_id,
        ROUND(AVG(j.salary_year_avg)) AS Average_Salary
    FROM skills_dim AS s
    LEFT JOIN skills_job_dim AS sj ON s.skill_id = sj.skill_id
    INNER JOIN job_postings_fact AS j ON sj.job_id = j.job_id
    WHERE salary_year_avg IS NOT NULL AND
    j.job_title_short = 'Data Engineer' 
    AND j.job_location LIKE '%Netherlands%' 
    GROUP BY    
         sj.skill_id
)

SELECT
    skill_demand.skill_id,
    skill_demand.skills,
    skill_demand.Demand_Count,
    skill_avg_salary.Average_Salary
FROM
    skill_demand
INNER JOIN skill_avg_salary ON skill_demand.skill_id = skill_avg_salary.skill_id
WHERE skill_demand.Demand_Count >= 5
ORDER BY  
    skill_demand.Demand_Count DESC,
    skill_avg_salary.Average_Salary DESC

