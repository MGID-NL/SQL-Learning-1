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
    LIMIT 20
)

SELECT 
    top_betaalde_nl.*,
    skills
FROM 
    top_betaalde_nl 
INNER JOIN skills_job_dim ON top_betaalde_nl.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY  
    salary_year_avg DESC;

/*

De top 20 vacatures in Nederland voor 2023 op het gebied van data-analyse, gebaseerd op salaris, geven interessante inzichten. Hier zijn enkele trends en vaardigheden die veel gevraagd worden:

Top functies:
Staff Research Engineer in Amsterdam bij ServiceNow is de best betaalde positie, met een gemiddeld salaris van €177.283 per jaar.
Andere goedbetaalde functies zijn Data Architect - Sustainability en Analytics Engineer bij Netflix.
Meest gevraagde vaardigheden:
Veelgevraagde technische vaardigheden omvatten SQL, Python, en R, die in bijna elke vacature voorkomen.
Andere specialistische vaardigheden zijn NoSQL, Azure, AWS, Spark, Hadoop, en Tableau.
Voor specifieke functies zoals Data Architect of Master Data Analyst, zijn ERP-systemen zoals SAP veel gevraagd.
Vaardigheden zoals Power BI, Looker, en Excel blijven ook relevant voor data-analyse.
Bedrijven en sectoren:
Grote bedrijven zoals ServiceNow, Netflix, Adyen, en Lucid Motors bieden de hoogste salarissen.
Er is een focus op duurzaamheid (bijv. Data Architect - Sustainability), fintech (bijv. Adyen), en technologie (bijv. ServiceNow, Netflix).

SET:

[
  {
    "job_id": 24675,
    "job_title": "Staff Research Engineer",
    "job_location": "Amsterdam, Netherlands",
    "salary_year_avg": "177283.0",
    "company_name": "ServiceNow",
    "skills": "nosql"
  },
  {
    "job_id": 24675,
    "job_title": "Staff Research Engineer",
    "job_location": "Amsterdam, Netherlands",
    "salary_year_avg": "177283.0",
    "company_name": "ServiceNow",
    "skills": "azure"
  },
  {
    "job_id": 24675,
    "job_title": "Staff Research Engineer",
    "job_location": "Amsterdam, Netherlands",
    "salary_year_avg": "177283.0",
    "company_name": "ServiceNow",
    "skills": "aws"
  },
  {
    "job_id": 24675,
    "job_title": "Staff Research Engineer",
    "job_location": "Amsterdam, Netherlands",
    "salary_year_avg": "177283.0",
    "company_name": "ServiceNow",
    "skills": "spark"
  },
  {
    "job_id": 24675,
    "job_title": "Staff Research Engineer",
    "job_location": "Amsterdam, Netherlands",
    "salary_year_avg": "177283.0",
    "company_name": "ServiceNow",
    "skills": "hadoop"
  },
  {
    "job_id": 1719883,
    "job_title": "Data Architect - Sustainability",
    "job_location": "Netherlands",
    "salary_year_avg": "155000.0",
    "company_name": "LyondellBasell",
    "skills": "sap"
  },
  {
    "job_id": 1051496,
    "job_title": "Analytics Engineer (L5) - Promotional Media - EMEA",
    "job_location": "Amsterdam, Netherlands",
    "salary_year_avg": "147500.0",
    "company_name": "Netflix",
    "skills": "sql"
  },
  {
    "job_id": 1051496,
    "job_title": "Analytics Engineer (L5) - Promotional Media - EMEA",
    "job_location": "Amsterdam, Netherlands",
    "salary_year_avg": "147500.0",
    "company_name": "Netflix",
    "skills": "python"
  },
  {
    "job_id": 1051496,
    "job_title": "Analytics Engineer (L5) - Promotional Media - EMEA",
    "job_location": "Amsterdam, Netherlands",
    "salary_year_avg": "147500.0",
    "company_name": "Netflix",
    "skills": "scala"
  },
  {
    "job_id": 1051496,
    "job_title": "Analytics Engineer (L5) - Promotional Media - EMEA",
    "job_location": "Amsterdam, Netherlands",
    "salary_year_avg": "147500.0",
    "company_name": "Netflix",
    "skills": "r"
  },
  {
    "job_id": 1051496,
    "job_title": "Analytics Engineer (L5) - Promotional Media - EMEA",
    "job_location": "Amsterdam, Netherlands",
    "salary_year_avg": "147500.0",
    "company_name": "Netflix",
    "skills": "go"
  },
  {
    "job_id": 348471,
    "job_title": "Data Analyst, Reporting",
    "job_location": "Amsterdam, Netherlands",
    "salary_year_avg": "111202.0",
    "company_name": "Adyen",
    "skills": "sql"
  },
  {
    "job_id": 348471,
    "job_title": "Data Analyst, Reporting",
    "job_location": "Amsterdam, Netherlands",
    "salary_year_avg": "111202.0",
    "company_name": "Adyen",
    "skills": "python"
  },
  {
    "job_id": 348471,
    "job_title": "Data Analyst, Reporting",
    "job_location": "Amsterdam, Netherlands",
    "salary_year_avg": "111202.0",
    "company_name": "Adyen",
    "skills": "r"
  },
  {
    "job_id": 348471,
    "job_title": "Data Analyst, Reporting",
    "job_location": "Amsterdam, Netherlands",
    "salary_year_avg": "111202.0",
    "company_name": "Adyen",
    "skills": "vba"
  },
  {
    "job_id": 348471,
    "job_title": "Data Analyst, Reporting",
    "job_location": "Amsterdam, Netherlands",
    "salary_year_avg": "111202.0",
    "company_name": "Adyen",
    "skills": "pyspark"
  },
  {
    "job_id": 348471,
    "job_title": "Data Analyst, Reporting",
    "job_location": "Amsterdam, Netherlands",
    "salary_year_avg": "111202.0",
    "company_name": "Adyen",
    "skills": "airflow"
  },
  {
    "job_id": 348471,
    "job_title": "Data Analyst, Reporting",
    "job_location": "Amsterdam, Netherlands",
    "salary_year_avg": "111202.0",
    "company_name": "Adyen",
    "skills": "hadoop"
  },
  {
    "job_id": 348471,
    "job_title": "Data Analyst, Reporting",
    "job_location": "Amsterdam, Netherlands",
    "salary_year_avg": "111202.0",
    "company_name": "Adyen",
    "skills": "excel"
  },
  {
    "job_id": 348471,
    "job_title": "Data Analyst, Reporting",
    "job_location": "Amsterdam, Netherlands",
    "salary_year_avg": "111202.0",
    "company_name": "Adyen",
    "skills": "tableau"
  },
  {
    "job_id": 348471,
    "job_title": "Data Analyst, Reporting",
    "job_location": "Amsterdam, Netherlands",
    "salary_year_avg": "111202.0",
    "company_name": "Adyen",
    "skills": "looker"
  },
  {
    "job_id": 751459,
    "job_title": "Data Analyst",
    "job_location": "Maassluis, Netherlands",
    "salary_year_avg": "111175.0",
    "company_name": "Lely",
    "skills": "sql"
  },
  {
    "job_id": 751459,
    "job_title": "Data Analyst",
    "job_location": "Maassluis, Netherlands",
    "salary_year_avg": "111175.0",
    "company_name": "Lely",
    "skills": "pyspark"
  },
  {
    "job_id": 751459,
    "job_title": "Data Analyst",
    "job_location": "Maassluis, Netherlands",
    "salary_year_avg": "111175.0",
    "company_name": "Lely",
    "skills": "tableau"
  },
  {
    "job_id": 1112483,
    "job_title": "Material Master Data Analyst",
    "job_location": "Amsterdam, Netherlands",
    "salary_year_avg": "111175.0",
    "company_name": "Lucid Motors",
    "skills": "excel"
  },
  {
    "job_id": 1112483,
    "job_title": "Material Master Data Analyst",
    "job_location": "Amsterdam, Netherlands",
    "salary_year_avg": "111175.0",
    "company_name": "Lucid Motors",
    "skills": "word"
  },
  {
    "job_id": 1112483,
    "job_title": "Material Master Data Analyst",
    "job_location": "Amsterdam, Netherlands",
    "salary_year_avg": "111175.0",
    "company_name": "Lucid Motors",
    "skills": "sap"
  },
  {
    "job_id": 1112483,
    "job_title": "Material Master Data Analyst",
    "job_location": "Amsterdam, Netherlands",
    "salary_year_avg": "111175.0",
    "company_name": "Lucid Motors",
    "skills": "outlook"
  },
  {
    "job_id": 138295,
    "job_title": "Data Analyst, Developer Relations",
    "job_location": "Amsterdam, Netherlands",
    "salary_year_avg": "111175.0",
    "company_name": "Adyen",
    "skills": "sql"
  },
  {
    "job_id": 138295,
    "job_title": "Data Analyst, Developer Relations",
    "job_location": "Amsterdam, Netherlands",
    "salary_year_avg": "111175.0",
    "company_name": "Adyen",
    "skills": "python"
  },
  {
    "job_id": 138295,
    "job_title": "Data Analyst, Developer Relations",
    "job_location": "Amsterdam, Netherlands",
    "salary_year_avg": "111175.0",
    "company_name": "Adyen",
    "skills": "r"
  },
  {
    "job_id": 138295,
    "job_title": "Data Analyst, Developer Relations",
    "job_location": "Amsterdam, Netherlands",
    "salary_year_avg": "111175.0",
    "company_name": "Adyen",
    "skills": "go"
  },
  {
    "job_id": 138295,
    "job_title": "Data Analyst, Developer Relations",
    "job_location": "Amsterdam, Netherlands",
    "salary_year_avg": "111175.0",
    "company_name": "Adyen",
    "skills": "matlab"
  },
  {
    "job_id": 138295,
    "job_title": "Data Analyst, Developer Relations",
    "job_location": "Amsterdam, Netherlands",
    "salary_year_avg": "111175.0",
    "company_name": "Adyen",
    "skills": "looker"
  },
  {
    "job_id": 312839,
    "job_title": "Service Parts Data Analyst",
    "job_location": "Amsterdam, Netherlands",
    "salary_year_avg": "105000.0",
    "company_name": "Lucid Motors",
    "skills": "excel"
  },
  {
    "job_id": 312839,
    "job_title": "Service Parts Data Analyst",
    "job_location": "Amsterdam, Netherlands",
    "salary_year_avg": "105000.0",
    "company_name": "Lucid Motors",
    "skills": "sap"
  },
  {
    "job_id": 312839,
    "job_title": "Service Parts Data Analyst",
    "job_location": "Amsterdam, Netherlands",
    "salary_year_avg": "105000.0",
    "company_name": "Lucid Motors",
    "skills": "powerpoint"
  },
  {
    "job_id": 312839,
    "job_title": "Service Parts Data Analyst",
    "job_location": "Amsterdam, Netherlands",
    "salary_year_avg": "105000.0",
    "company_name": "Lucid Motors",
    "skills": "outlook"
  },
  {
    "job_id": 312839,
    "job_title": "Service Parts Data Analyst",
    "job_location": "Amsterdam, Netherlands",
    "salary_year_avg": "105000.0",
    "company_name": "Lucid Motors",
    "skills": "ms access"
  },
  {
    "job_id": 726941,
    "job_title": "Data Analyst - Vegetables",
    "job_location": "Enkhuizen, Netherlands",
    "salary_year_avg": "98500.0",
    "company_name": "Syngenta Group",
    "skills": "sql"
  },
  {
    "job_id": 726941,
    "job_title": "Data Analyst - Vegetables",
    "job_location": "Enkhuizen, Netherlands",
    "salary_year_avg": "98500.0",
    "company_name": "Syngenta Group",
    "skills": "python"
  },
  {
    "job_id": 726941,
    "job_title": "Data Analyst - Vegetables",
    "job_location": "Enkhuizen, Netherlands",
    "salary_year_avg": "98500.0",
    "company_name": "Syngenta Group",
    "skills": "java"
  },
  {
    "job_id": 726941,
    "job_title": "Data Analyst - Vegetables",
    "job_location": "Enkhuizen, Netherlands",
    "salary_year_avg": "98500.0",
    "company_name": "Syngenta Group",
    "skills": "r"
  },
  {
    "job_id": 726941,
    "job_title": "Data Analyst - Vegetables",
    "job_location": "Enkhuizen, Netherlands",
    "salary_year_avg": "98500.0",
    "company_name": "Syngenta Group",
    "skills": "c#"
  },
  {
    "job_id": 726941,
    "job_title": "Data Analyst - Vegetables",
    "job_location": "Enkhuizen, Netherlands",
    "salary_year_avg": "98500.0",
    "company_name": "Syngenta Group",
    "skills": "tableau"
  },
  {
    "job_id": 726941,
    "job_title": "Data Analyst - Vegetables",
    "job_location": "Enkhuizen, Netherlands",
    "salary_year_avg": "98500.0",
    "company_name": "Syngenta Group",
    "skills": "power bi"
  },
  {
    "job_id": 726941,
    "job_title": "Data Analyst - Vegetables",
    "job_location": "Enkhuizen, Netherlands",
    "salary_year_avg": "98500.0",
    "company_name": "Syngenta Group",
    "skills": "qlik"
  },
  {
    "job_id": 726941,
    "job_title": "Data Analyst - Vegetables",
    "job_location": "Enkhuizen, Netherlands",
    "salary_year_avg": "98500.0",
    "company_name": "Syngenta Group",
    "skills": "jira"
  },
  {
    "job_id": 579207,
    "job_title": "Data Analyst – ING Branches and Service",
    "job_location": "Netherlands",
    "salary_year_avg": "89204.0",
    "company_name": "ING",
    "skills": "sql"
  },
  {
    "job_id": 579207,
    "job_title": "Data Analyst – ING Branches and Service",
    "job_location": "Netherlands",
    "salary_year_avg": "89204.0",
    "company_name": "ING",
    "skills": "r"
  },
  {
    "job_id": 579207,
    "job_title": "Data Analyst – ING Branches and Service",
    "job_location": "Netherlands",
    "salary_year_avg": "89204.0",
    "company_name": "ING",
    "skills": "sas"
  },
  {
    "job_id": 579207,
    "job_title": "Data Analyst – ING Branches and Service",
    "job_location": "Netherlands",
    "salary_year_avg": "89204.0",
    "company_name": "ING",
    "skills": "excel"
  },
  {
    "job_id": 579207,
    "job_title": "Data Analyst – ING Branches and Service",
    "job_location": "Netherlands",
    "salary_year_avg": "89204.0",
    "company_name": "ING",
    "skills": "sas"
  },
  {
    "job_id": 579207,
    "job_title": "Data Analyst – ING Branches and Service",
    "job_location": "Netherlands",
    "salary_year_avg": "89204.0",
    "company_name": "ING",
    "skills": "cognos"
  },
  {
    "job_id": 52153,
    "job_title": "Financial Data Analyst",
    "job_location": "Amsterdam, Netherlands",
    "salary_year_avg": "89100.0",
    "company_name": "Adyen",
    "skills": "sql"
  },
  {
    "job_id": 52153,
    "job_title": "Financial Data Analyst",
    "job_location": "Amsterdam, Netherlands",
    "salary_year_avg": "89100.0",
    "company_name": "Adyen",
    "skills": "python"
  },
  {
    "job_id": 52153,
    "job_title": "Financial Data Analyst",
    "job_location": "Amsterdam, Netherlands",
    "salary_year_avg": "89100.0",
    "company_name": "Adyen",
    "skills": "power bi"
  },
  {
    "job_id": 52153,
    "job_title": "Financial Data Analyst",
    "job_location": "Amsterdam, Netherlands",
    "salary_year_avg": "89100.0",
    "company_name": "Adyen",
    "skills": "looker"
  },
  {
    "job_id": 282160,
    "job_title": "Data Management Analyst",
    "job_location": "The Hague, Netherlands",
    "salary_year_avg": "89100.0",
    "company_name": "Experian",
    "skills": "sql"
  },
  {
    "job_id": 282160,
    "job_title": "Data Management Analyst",
    "job_location": "The Hague, Netherlands",
    "salary_year_avg": "89100.0",
    "company_name": "Experian",
    "skills": "python"
  },
  {
    "job_id": 282160,
    "job_title": "Data Management Analyst",
    "job_location": "The Hague, Netherlands",
    "salary_year_avg": "89100.0",
    "company_name": "Experian",
    "skills": "r"
  },
  {
    "job_id": 282160,
    "job_title": "Data Management Analyst",
    "job_location": "The Hague, Netherlands",
    "salary_year_avg": "89100.0",
    "company_name": "Experian",
    "skills": "gdpr"
  },
  {
    "job_id": 1338696,
    "job_title": "Marketing Data Analyst",
    "job_location": "Amsterdam, Netherlands",
    "salary_year_avg": "89100.0",
    "company_name": "Adyen",
    "skills": "sql"
  },
  {
    "job_id": 1338696,
    "job_title": "Marketing Data Analyst",
    "job_location": "Amsterdam, Netherlands",
    "salary_year_avg": "89100.0",
    "company_name": "Adyen",
    "skills": "python"
  },
  {
    "job_id": 724033,
    "job_title": "Web / Data Analyst",
    "job_location": "Netherlands",
    "salary_year_avg": "74368.5",
    "company_name": "DEPT®",
    "skills": "javascript"
  },
  {
    "job_id": 724033,
    "job_title": "Web / Data Analyst",
    "job_location": "Netherlands",
    "salary_year_avg": "74368.5",
    "company_name": "DEPT®",
    "skills": "html"
  },
  {
    "job_id": 724033,
    "job_title": "Web / Data Analyst",
    "job_location": "Netherlands",
    "salary_year_avg": "74368.5",
    "company_name": "DEPT®",
    "skills": "css"
  },
  {
    "job_id": 822487,
    "job_title": "(Junior) Data Analyst",
    "job_location": "Amsterdam, Netherlands",
    "salary_year_avg": "70500.0",
    "company_name": "Vattenfall",
    "skills": "matlab"
  },
  {
    "job_id": 822487,
    "job_title": "(Junior) Data Analyst",
    "job_location": "Amsterdam, Netherlands",
    "salary_year_avg": "70500.0",
    "company_name": "Vattenfall",
    "skills": "excel"
  },
  {
    "job_id": 822487,
    "job_title": "(Junior) Data Analyst",
    "job_location": "Amsterdam, Netherlands",
    "salary_year_avg": "70500.0",
    "company_name": "Vattenfall",
    "skills": "power bi"
  },
  {
    "job_id": 169765,
    "job_title": "Databricks Internship | Interview Questions & Salary Details",
    "job_location": "Amsterdam, Netherlands   (+7 others)",
    "salary_year_avg": "67000.0",
    "company_name": "Databricks",
    "skills": "sql"
  },
  {
    "job_id": 169765,
    "job_title": "Databricks Internship | Interview Questions & Salary Details",
    "job_location": "Amsterdam, Netherlands   (+7 others)",
    "salary_year_avg": "67000.0",
    "company_name": "Databricks",
    "skills": "python"
  },
  {
    "job_id": 169765,
    "job_title": "Databricks Internship | Interview Questions & Salary Details",
    "job_location": "Amsterdam, Netherlands   (+7 others)",
    "salary_year_avg": "67000.0",
    "company_name": "Databricks",
    "skills": "scala"
  },
  {
    "job_id": 169765,
    "job_title": "Databricks Internship | Interview Questions & Salary Details",
    "job_location": "Amsterdam, Netherlands   (+7 others)",
    "salary_year_avg": "67000.0",
    "company_name": "Databricks",
    "skills": "java"
  },
  {
    "job_id": 169765,
    "job_title": "Databricks Internship | Interview Questions & Salary Details",
    "job_location": "Amsterdam, Netherlands   (+7 others)",
    "salary_year_avg": "67000.0",
    "company_name": "Databricks",
    "skills": "databricks"
  },
  {
    "job_id": 169765,
    "job_title": "Databricks Internship | Interview Questions & Salary Details",
    "job_location": "Amsterdam, Netherlands   (+7 others)",
    "salary_year_avg": "67000.0",
    "company_name": "Databricks",
    "skills": "spark"
  },
  {
    "job_id": 861825,
    "job_title": "Production Enginer & Data Analyst Subsea Rock Installation",
    "job_location": "Papendrecht, Netherlands",
    "salary_year_avg": "57500.0",
    "company_name": "Boskalis",
    "skills": "python"
  },
  {
    "job_id": 861825,
    "job_title": "Production Enginer & Data Analyst Subsea Rock Installation",
    "job_location": "Papendrecht, Netherlands",
    "salary_year_avg": "57500.0",
    "company_name": "Boskalis",
    "skills": "excel"
  },
  {
    "job_id": 338855,
    "job_title": "Data Analyst",
    "job_location": "Spijkenisse, Netherlands",
    "salary_year_avg": "53014.0",
    "company_name": "SGS",
    "skills": "python"
  },
  {
    "job_id": 338855,
    "job_title": "Data Analyst",
    "job_location": "Spijkenisse, Netherlands",
    "salary_year_avg": "53014.0",
    "company_name": "SGS",
    "skills": "r"
  },
  {
    "job_id": 338855,
    "job_title": "Data Analyst",
    "job_location": "Spijkenisse, Netherlands",
    "salary_year_avg": "53014.0",
    "company_name": "SGS",
    "skills": "go"
  },
  {
    "job_id": 338855,
    "job_title": "Data Analyst",
    "job_location": "Spijkenisse, Netherlands",
    "salary_year_avg": "53014.0",
    "company_name": "SGS",
    "skills": "excel"
  },
  {
    "job_id": 753590,
    "job_title": "Internal Audit Data Analyst",
    "job_location": "Amsterdam, Netherlands",
    "salary_year_avg": "53014.0",
    "company_name": "Adyen",
    "skills": "sql"
  },
  {
    "job_id": 753590,
    "job_title": "Internal Audit Data Analyst",
    "job_location": "Amsterdam, Netherlands",
    "salary_year_avg": "53014.0",
    "company_name": "Adyen",
    "skills": "python"
  }
]


*/