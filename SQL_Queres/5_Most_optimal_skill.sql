
/*
WITH Demanded_Skills AS (
    SELECT 
    skills_dim.skill_id,
    skills_dim.skills AS skills,
    COUNT(skills_job_dim.skill_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title = 'Data Analyst' 
AND job_location = 'Anywhere'
AND salary_year_avg IS NOT NULL
GROUP BY skills_dim.skill_id
),
 Paying_Skills AS (
    SELECT
    skills_dim.skill_id,
    skills_dim.skills AS skills,
    Round(AVG(job_postings_fact.salary_year_avg), 0) AS avg_paying
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title = 'Data Analyst' 
AND salary_year_avg IS NOT NULL
AND job_location = 'Anywhere'
GROUP BY skills_dim.skill_id
)

SELECT 
    Demanded_Skills.skill_id,
    Demanded_Skills.skills,
    demand_count,
    avg_paying
FROM Demanded_Skills
INNER JOIN Paying_Skills ON Demanded_Skills.skill_id = Paying_Skills.skill_id
ORDER BY demand_count DESC, avg_paying DESC   

*/
-- re-writing the above query in a single query without CTEs for better performance
SELECT 
    skills_dim.skills AS skills,
    COUNT(skills_job_dim.skill_id) AS demand_count,
    Round(AVG(job_postings_fact.salary_year_avg), 0) AS avg_paying
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title = 'Data Analyst'
AND job_location = 'Anywhere'
AND salary_year_avg IS NOT NULL
GROUP BY skills_dim.skill_id
ORDER BY demand_count DESC, avg_paying DESC


/*[
  {
    "skills": "sql",
    "demand_count": "121",
    "avg_paying": "90624"
  },
  {
    "skills": "python",
    "demand_count": "76",
    "avg_paying": "95080"
  },
  {
    "skills": "tableau",
    "demand_count": "71",
    "avg_paying": "93863"
  },
  {
    "skills": "excel",
    "demand_count": "65",
    "avg_paying": "85326"
  },
  {
    "skills": "r",
    "demand_count": "49",
    "avg_paying": "93704"
  },
  {
    "skills": "power bi",
    "demand_count": "36",
    "avg_paying": "91098"
  },
  {
    "skills": "sas",
    "demand_count": "22",
    "avg_paying": "89859"
  },
  {
    "skills": "sas",
    "demand_count": "22",
    "avg_paying": "89859"
  },
  {
    "skills": "looker",
    "demand_count": "20",
    "avg_paying": "98128"
  },
  {
    "skills": "powerpoint",
    "demand_count": "14",
    "avg_paying": "89351"
  },
  {
    "skills": "azure",
    "demand_count": "12",
    "avg_paying": "88292"
  },
  {
    "skills": "javascript",
    "demand_count": "11",
    "avg_paying": "96182"
  },
  {
    "skills": "aws",
    "demand_count": "9",
    "avg_paying": "105278"
  },
  {
    "skills": "snowflake",
    "demand_count": "9",
    "avg_paying": "93667"
  },
  {
    "skills": "oracle",
    "demand_count": "9",
    "avg_paying": "88537"
  },
  {
    "skills": "spss",
    "demand_count": "9",
    "avg_paying": "82556"
  },
  {
    "skills": "sheets",
    "demand_count": "9",
    "avg_paying": "75167"
  },
  {
    "skills": "qlik",
    "demand_count": "8",
    "avg_paying": "101588"
  },
  {
    "skills": "flow",
    "demand_count": "8",
    "avg_paying": "87531"
  },
  {
    "skills": "sql server",
    "demand_count": "7",
    "avg_paying": "92143"
  },
  {
    "skills": "jira",
    "demand_count": "7",
    "avg_paying": "90786"
  },
  {
    "skills": "word",
    "demand_count": "7",
    "avg_paying": "87030"
  },
  {
    "skills": "pandas",
    "demand_count": "5",
    "avg_paying": "125913"
  },
  {
    "skills": "hadoop",
    "demand_count": "5",
    "avg_paying": "93140"
  },
  {
    "skills": "mysql",
    "demand_count": "5",
    "avg_paying": "90500"
  },
  {
    "skills": "t-sql",
    "demand_count": "5",
    "avg_paying": "88000"
  },
  {
    "skills": "alteryx",
    "demand_count": "5",
    "avg_paying": "87051"
  },
  {
    "skills": "redshift",
    "demand_count": "5",
    "avg_paying": "82100"
  },
  {
    "skills": "spark",
    "demand_count": "5",
    "avg_paying": "79000"
  },
  {
    "skills": "c++",
    "demand_count": "4",
    "avg_paying": "103500"
  },
  {
    "skills": "matlab",
    "demand_count": "4",
    "avg_paying": "102750"
  },
  {
    "skills": "dax",
    "demand_count": "4",
    "avg_paying": "101000"
  },
  {
    "skills": "java",
    "demand_count": "4",
    "avg_paying": "100000"
  },
  {
    "skills": "bigquery",
    "demand_count": "4",
    "avg_paying": "97500"
  },
  {
    "skills": "confluence",
    "demand_count": "4",
    "avg_paying": "93500"
  },
  {
    "skills": "git",
    "demand_count": "4",
    "avg_paying": "92750"
  },
  {
    "skills": "ssrs",
    "demand_count": "4",
    "avg_paying": "89375"
  },
  {
    "skills": "c#",
    "demand_count": "4",
    "avg_paying": "80000"
  },
  {
    "skills": "sharepoint",
    "demand_count": "4",
    "avg_paying": "75250"
  },
  {
    "skills": "outlook",
    "demand_count": "3",
    "avg_paying": "104833"
  },
  {
    "skills": "github",
    "demand_count": "3",
    "avg_paying": "98333"
  },
  {
    "skills": "ssis",
    "demand_count": "3",
    "avg_paying": "95833"
  },
  {
    "skills": "matplotlib",
    "demand_count": "3",
    "avg_paying": "76336"
  },
  {
    "skills": "scikit-learn",
    "demand_count": "2",
    "avg_paying": "125781"
  },
  {
    "skills": "gcp",
    "demand_count": "2",
    "avg_paying": "123750"
  },
  {
    "skills": "databricks",
    "demand_count": "2",
    "avg_paying": "120000"
  },
  {
    "skills": "numpy",
    "demand_count": "2",
    "avg_paying": "118281"
  },
  {
    "skills": "unix",
    "demand_count": "2",
    "avg_paying": "110000"
  },
  {
    "skills": "ms access",
    "demand_count": "2",
    "avg_paying": "98857"
  },
  {
    "skills": "jenkins",
    "demand_count": "2",
    "avg_paying": "93500"
  },
  {
    "skills": "bash",
    "demand_count": "2",
    "avg_paying": "82500"
  },
  {
    "skills": "crystal",
    "demand_count": "2",
    "avg_paying": "82500"
  },
  {
    "skills": "webex",
    "demand_count": "2",
    "avg_paying": "81250"
  },
  {
    "skills": "sqlite",
    "demand_count": "2",
    "avg_paying": "77500"
  },
  {
    "skills": "smartsheet",
    "demand_count": "2",
    "avg_paying": "57500"
  },
  {
    "skills": "elasticsearch",
    "demand_count": "1",
    "avg_paying": "145000"
  },
  {
    "skills": "golang",
    "demand_count": "1",
    "avg_paying": "145000"
  },
  {
    "skills": "kubernetes",
    "demand_count": "1",
    "avg_paying": "145000"
  },
  {
    "skills": "swift",
    "demand_count": "1",
    "avg_paying": "140500"
  },
  {
    "skills": "vba",
    "demand_count": "1",
    "avg_paying": "115000"
  },
  {
    "skills": "ibm cloud",
    "demand_count": "1",
    "avg_paying": "111500"
  },
  {
    "skills": "sap",
    "demand_count": "1",
    "avg_paying": "100000"
  },
  {
    "skills": "atlassian",
    "demand_count": "1",
    "avg_paying": "100000"
  },
  {
    "skills": "microstrategy",
    "demand_count": "1",
    "avg_paying": "95000"
  },
  {
    "skills": "shell",
    "demand_count": "1",
    "avg_paying": "90000"
  },
  {
    "skills": "html",
    "demand_count": "1",
    "avg_paying": "90000"
  },
  {
    "skills": "microsoft teams",
    "demand_count": "1",
    "avg_paying": "90000"
  },
  {
    "skills": "clickup",
    "demand_count": "1",
    "avg_paying": "90000"
  },
  {
    "skills": "visio",
    "demand_count": "1",
    "avg_paying": "90000"
  },
  {
    "skills": "vb.net",
    "demand_count": "1",
    "avg_paying": "90000"
  },
  {
    "skills": "windows",
    "demand_count": "1",
    "avg_paying": "84500"
  },
  {
    "skills": "arch",
    "demand_count": "1",
    "avg_paying": "84000"
  },
  {
    "skills": "node.js",
    "demand_count": "1",
    "avg_paying": "83500"
  },
  {
    "skills": "scala",
    "demand_count": "1",
    "avg_paying": "81000"
  },
  {
    "skills": "cognos",
    "demand_count": "1",
    "avg_paying": "78000"
  },
  {
    "skills": "spring",
    "demand_count": "1",
    "avg_paying": "76500"
  },
  {
    "skills": "ruby",
    "demand_count": "1",
    "avg_paying": "72500"
  },
  {
    "skills": "ruby",
    "demand_count": "1",
    "avg_paying": "72500"
  },
  {
    "skills": "phoenix",
    "demand_count": "1",
    "avg_paying": "71850"
  },
  {
    "skills": "seaborn",
    "demand_count": "1",
    "avg_paying": "70000"
  },
  {
    "skills": "plotly",
    "demand_count": "1",
    "avg_paying": "70000"
  },
  {
    "skills": "colocation",
    "demand_count": "1",
    "avg_paying": "67500"
  },
  {
    "skills": "terminal",
    "demand_count": "1",
    "avg_paying": "67500"
  },
  {
    "skills": "sass",
    "demand_count": "1",
    "avg_paying": "67500"
  },
  {
    "skills": "airflow",
    "demand_count": "1",
    "avg_paying": "65000"
  },
  {
    "skills": "mongodb",
    "demand_count": "1",
    "avg_paying": "52000"
  },
  {
    "skills": "mongodb",
    "demand_count": "1",
    "avg_paying": "52000"
  }
]*/