WITH top_betaalde_nl AS (
SELECT
    jobs.job_id,
    jobs.job_title,
    jobs.job_location,
    jobs.salary_year_avg,
    com.name AS company_name 
FROM
    job_postings_fact AS jobs
LEFT JOIN company_dim AS com
    ON jobs.company_id = com.company_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_location LIKE '%Netherlands%' AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10; )

