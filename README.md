# Background
# Introduction
The tech job market is rapidly evolving, with increasing demand for various roles such as software developers, data analysts, and cybersecurity experts. This project aims to analyze job postings to identify trends in hiring, required skills, and salary ranges. By examining this data, we hope to provide valuable insights for job seekers and employers alike, helping them understand the current landscape of tech jobs and the skills that are in high demand. [project_sql](/project_sql/)

# Tools I Used
1- **SQL (Structured Query Language):** Proficient in writing and optimizing queries to manipulate and retrieve data from relational databases. Familiar with database design concepts, including normalization and indexing.

2- **PostgreSQL:** Experienced in using PostgreSQL for managing databases, leveraging advanced features such as stored procedures, triggers, and data types. Skilled in performance tuning and implementing security measures.

3- **Visual Studio Code:** Comfortable using Visual Studio Code as a primary code editor, utilizing extensions and features for efficient coding, debugging, and version control integration.

4- **Git:** Proficient in using Git for version control, including branching, merging, and resolving conflicts. Able to maintain a clean project history and collaborate effectively with teams.

5- **GitHub:** Experienced in using GitHub for hosting projects, managing repositories, and collaborating with others through pull requests and code reviews. Familiar with GitHub Actions for automating workflows and CI/CD processes.
# The Analysis

To identify the highest-paying roles I filtered data analyst positions by average yearly salary and location, focusing on remote jobs. This query highlights the high paying opportunities in the field.

```sql
SELECT
    job_id,
    job_title,
    job_title_short,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
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
LIMIT 10;
```
Here's the breakdown of the top data analyst jobs in 2023:
- **Wide Salary Range:** Top 10 paying data analyst roles span from 184,000 to 650,000, indicating significant salary potential in the field.
- **Diverse Employers:** Companies like SmartAsset, Meta, and AT&T are among those offering high salaries, showing broad interest across different industries.
- **Job Title Variety:** There's a high diversity in job titles, from Data Analyst to Directo of Analytics, reflecting varied roles and specializations within data analytics.
# What I learned
This was my first project in SQL and it was a guided project by Luke Barousse in this SQL for Data Analytics Course.
I learned all the fundaments in SQL: Data Types, Sub-queries, CTEs, etc.

link: https://www.youtube.com/watch?v=7mz73uXD9DA&t=11467s

# Conclusions 
I really liked working on this project to explore job opportunities as a future Data Analyst.