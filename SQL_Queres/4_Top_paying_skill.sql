SELECT
    skills_dim.skills AS skills,
    Round(AVG(job_postings_fact.salary_year_avg), 0) AS avg_paying
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title = 'Data Analyst' 
AND salary_year_avg IS NOT NULL
AND job_location = 'Anywhere'
GROUP BY skills_dim.skills
ORDER BY avg_paying DESC
LIMIT 10;

/*[
  {
    "skills": "golang",
    "avg_paying": "145000"
  },
  {
    "skills": "kubernetes",
    "avg_paying": "145000"
  },
  {
    "skills": "elasticsearch",
    "avg_paying": "145000"
  },
  {
    "skills": "swift",
    "avg_paying": "140500"
  },
  {
    "skills": "pandas",
    "avg_paying": "125913"
  },
  {
    "skills": "scikit-learn",
    "avg_paying": "125781"
  },
  {
    "skills": "gcp",
    "avg_paying": "123750"
  },
  {
    "skills": "databricks",
    "avg_paying": "120000"
  },
  {
    "skills": "numpy",
    "avg_paying": "118281"
  },
  {
    "skills": "vba",
    "avg_paying": "115000"
  }
]
*/