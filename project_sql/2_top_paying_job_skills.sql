-- What are the skills required for the these top-paying roles?
WITH top_paying_jobs AS (
    SELECT
        job_id,
        job_title,
        job_title_short,
        salary_year_avg,
        job_work_from_home,
        name AS company_name
    FROM
        job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_title_short = 'Data Analyst' AND
        job_work_from_home = TRUE AND
        salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)
SELECT 
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY 
    salary_year_avg DESC


/*

The data contains 8 unique job positions across 66 skill entries (each skill listed separately for some roles). Here are the top insights on the most in-demand skills for these data analyst roles:

1-SQL - Required in all 8 roles.
2-Python - Mentioned in 7 roles.
3-Tableau - Required in 6 roles.
4-R - Mentioned in 4 roles.
5-Snowflake, Pandas, Excel - Each is required in 3 roles.
6-Azure, Bitbucket, Go - Each appears in 2 roles.


[
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "255829.5",
    "job_work_from_home": true,
    "company_name": "AT&T",
    "skills": "sql"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "255829.5",
    "job_work_from_home": true,
    "company_name": "AT&T",
    "skills": "python"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "255829.5",
    "job_work_from_home": true,
    "company_name": "AT&T",
    "skills": "r"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "255829.5",
    "job_work_from_home": true,
    "company_name": "AT&T",
    "skills": "azure"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "255829.5",
    "job_work_from_home": true,
    "company_name": "AT&T",
    "skills": "databricks"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "255829.5",
    "job_work_from_home": true,
    "company_name": "AT&T",
    "skills": "aws"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "255829.5",
    "job_work_from_home": true,
    "company_name": "AT&T",
    "skills": "pandas"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "255829.5",
    "job_work_from_home": true,
    "company_name": "AT&T",
    "skills": "pyspark"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "255829.5",
    "job_work_from_home": true,
    "company_name": "AT&T",
    "skills": "jupyter"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "255829.5",
    "job_work_from_home": true,
    "company_name": "AT&T",
    "skills": "excel"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "255829.5",
    "job_work_from_home": true,
    "company_name": "AT&T",
    "skills": "tableau"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "255829.5",
    "job_work_from_home": true,
    "company_name": "AT&T",
    "skills": "power bi"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "255829.5",
    "job_work_from_home": true,
    "company_name": "AT&T",
    "skills": "powerpoint"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "232423.0",
    "job_work_from_home": true,
    "company_name": "Pinterest Job Advertisements",
    "skills": "sql"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "232423.0",
    "job_work_from_home": true,
    "company_name": "Pinterest Job Advertisements",
    "skills": "python"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "232423.0",
    "job_work_from_home": true,
    "company_name": "Pinterest Job Advertisements",
    "skills": "r"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "232423.0",
    "job_work_from_home": true,
    "company_name": "Pinterest Job Advertisements",
    "skills": "hadoop"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "232423.0",
    "job_work_from_home": true,
    "company_name": "Pinterest Job Advertisements",
    "skills": "tableau"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "217000.0",
    "job_work_from_home": true,
    "company_name": "Uclahealthcareers",
    "skills": "sql"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "217000.0",
    "job_work_from_home": true,
    "company_name": "Uclahealthcareers",
    "skills": "crystal"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "217000.0",
    "job_work_from_home": true,
    "company_name": "Uclahealthcareers",
    "skills": "oracle"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "217000.0",
    "job_work_from_home": true,
    "company_name": "Uclahealthcareers",
    "skills": "tableau"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "217000.0",
    "job_work_from_home": true,
    "company_name": "Uclahealthcareers",
    "skills": "flow"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "205000.0",
    "job_work_from_home": true,
    "company_name": "SmartAsset",
    "skills": "sql"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "205000.0",
    "job_work_from_home": true,
    "company_name": "SmartAsset",
    "skills": "python"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "205000.0",
    "job_work_from_home": true,
    "company_name": "SmartAsset",
    "skills": "go"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "205000.0",
    "job_work_from_home": true,
    "company_name": "SmartAsset",
    "skills": "snowflake"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "205000.0",
    "job_work_from_home": true,
    "company_name": "SmartAsset",
    "skills": "pandas"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "205000.0",
    "job_work_from_home": true,
    "company_name": "SmartAsset",
    "skills": "numpy"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "205000.0",
    "job_work_from_home": true,
    "company_name": "SmartAsset",
    "skills": "excel"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "205000.0",
    "job_work_from_home": true,
    "company_name": "SmartAsset",
    "skills": "tableau"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "205000.0",
    "job_work_from_home": true,
    "company_name": "SmartAsset",
    "skills": "gitlab"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "189309.0",
    "job_work_from_home": true,
    "company_name": "Inclusively",
    "skills": "sql"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "189309.0",
    "job_work_from_home": true,
    "company_name": "Inclusively",
    "skills": "python"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "189309.0",
    "job_work_from_home": true,
    "company_name": "Inclusively",
    "skills": "azure"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "189309.0",
    "job_work_from_home": true,
    "company_name": "Inclusively",
    "skills": "aws"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "189309.0",
    "job_work_from_home": true,
    "company_name": "Inclusively",
    "skills": "oracle"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "189309.0",
    "job_work_from_home": true,
    "company_name": "Inclusively",
    "skills": "snowflake"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "189309.0",
    "job_work_from_home": true,
    "company_name": "Inclusively",
    "skills": "tableau"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "189309.0",
    "job_work_from_home": true,
    "company_name": "Inclusively",
    "skills": "power bi"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "189309.0",
    "job_work_from_home": true,
    "company_name": "Inclusively",
    "skills": "sap"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "189309.0",
    "job_work_from_home": true,
    "company_name": "Inclusively",
    "skills": "jenkins"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "189309.0",
    "job_work_from_home": true,
    "company_name": "Inclusively",
    "skills": "bitbucket"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "189309.0",
    "job_work_from_home": true,
    "company_name": "Inclusively",
    "skills": "atlassian"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "189309.0",
    "job_work_from_home": true,
    "company_name": "Inclusively",
    "skills": "jira"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "189309.0",
    "job_work_from_home": true,
    "company_name": "Inclusively",
    "skills": "confluence"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "189000.0",
    "job_work_from_home": true,
    "company_name": "Motional",
    "skills": "sql"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "189000.0",
    "job_work_from_home": true,
    "company_name": "Motional",
    "skills": "python"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "189000.0",
    "job_work_from_home": true,
    "company_name": "Motional",
    "skills": "r"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "189000.0",
    "job_work_from_home": true,
    "company_name": "Motional",
    "skills": "git"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "189000.0",
    "job_work_from_home": true,
    "company_name": "Motional",
    "skills": "bitbucket"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "189000.0",
    "job_work_from_home": true,
    "company_name": "Motional",
    "skills": "atlassian"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "189000.0",
    "job_work_from_home": true,
    "company_name": "Motional",
    "skills": "jira"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "189000.0",
    "job_work_from_home": true,
    "company_name": "Motional",
    "skills": "confluence"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "186000.0",
    "job_work_from_home": true,
    "company_name": "SmartAsset",
    "skills": "sql"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "186000.0",
    "job_work_from_home": true,
    "company_name": "SmartAsset",
    "skills": "python"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "186000.0",
    "job_work_from_home": true,
    "company_name": "SmartAsset",
    "skills": "go"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "186000.0",
    "job_work_from_home": true,
    "company_name": "SmartAsset",
    "skills": "snowflake"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "186000.0",
    "job_work_from_home": true,
    "company_name": "SmartAsset",
    "skills": "pandas"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "186000.0",
    "job_work_from_home": true,
    "company_name": "SmartAsset",
    "skills": "numpy"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "186000.0",
    "job_work_from_home": true,
    "company_name": "SmartAsset",
    "skills": "excel"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "186000.0",
    "job_work_from_home": true,
    "company_name": "SmartAsset",
    "skills": "tableau"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "186000.0",
    "job_work_from_home": true,
    "company_name": "SmartAsset",
    "skills": "gitlab"
  },
  {
    "job_id": 387860,
    "job_title": "ERM Data Analyst",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "184000.0",
    "job_work_from_home": true,
    "company_name": "Get It Recruit - Information Technology",
    "skills": "sql"
  },
  {
    "job_id": 387860,
    "job_title": "ERM Data Analyst",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "184000.0",
    "job_work_from_home": true,
    "company_name": "Get It Recruit - Information Technology",
    "skills": "python"
  },
  {
    "job_id": 387860,
    "job_title": "ERM Data Analyst",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "184000.0",
    "job_work_from_home": true,
    "company_name": "Get It Recruit - Information Technology",
    "skills": "r"
  }
]
*/