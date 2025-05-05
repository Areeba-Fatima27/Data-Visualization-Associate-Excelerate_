---------------------------Importing all the datasets-----------------------
--learner_raw data
CREATE TABLE Learner_Raw (
    learner_id TEXT PRIMARY KEY,
    country TEXT,
    degree TEXT,
    institution TEXT,
    major TEXT
);
COPY Learner_Raw FROM 'C:\Program Files\PostgreSQL\17\data\Learner_Raw.csv' WITH (FORMAT 'csv', HEADER, DELIMITER ',');

--marketing comapaigns data
CREATE TABLE Marketing_Campaigns (
    ad_account_name TEXT,
    campaign_name TEXT,
    delivery_status TEXT,
    delivery_level TEXT,
    reach BIGINT,
    outbound_clicks INT,
    landing_page_views INT,
    result_type TEXT,
    results FLOAT,
    cost_per_result FLOAT,
    amount_spent_aed FLOAT,
    cpc_cost_per_link_click FLOAT,
    reporting_starts DATE,
    reporting_ends DATE
);

COPY marketing_campaigns (
    ad_account_name, campaign_name, delivery_status, delivery_level,
    reach, outbound_clicks, landing_page_views, result_type, results,
    cost_per_result, amount_spent_aed, cpc_cost_per_link_click,
    reporting_starts, reporting_ends
)
FROM 'C:\Program Files\PostgreSQL\17\data\Cleaned_Marketing_Campaign_Data.csv'
DELIMITER ','
CSV HEADER
NULL AS 'NULL'
QUOTE '"'
ESCAPE '\';

--cognito data
CREATE TABLE Cognito_Raw (
    user_id TEXT PRIMARY KEY,
    email TEXT,
    gender TEXT,
    UserCreateDate TIMESTAMP,
    UserLastModifiedDate TIMESTAMP,
    birthdate TEXT,
    city TEXT,
    zip TEXT,
    state TEXT
);
COPY Cognito_Raw FROM 'C:\Program Files\PostgreSQL\17\data\Cleaned_Cognito_Raw2.csv' WITH (FORMAT 'csv', HEADER, DELIMITER ',');

--opportunity raw data
CREATE TABLE Opportunity_Raw (
    opportunity_id TEXT PRIMARY KEY,
    opportunity_name TEXT,
    category TEXT,
    opportunity_code TEXT,
    tracking_questions TEXT
);

COPY Opportunity_Raw FROM 'C:\Program Files\PostgreSQL\17\data\Cleaned Opportunity_Raw Dataset.csv' WITH (FORMAT 'csv', HEADER, DELIMITER ',');

--learneropportunity data
DROP TABLE IF EXISTS LearnerOpportunity_Raw;

CREATE TABLE temp_LearnerOpportunity_Raw (
    enrollment_id TEXT,
    learner_id TEXT,
    assigned_cohort TEXT,
    apply_date TEXT,
    status INTEGER
);

COPY temp_LearnerOpportunity_Raw 
FROM 'C:\Program Files\PostgreSQL\17\data\Cleaned_LearnerOpportunity_Raw.csv' 
WITH (FORMAT csv, HEADER, DELIMITER ',', NULL 'NULL');

SELECT enrollment_id, COUNT(*)
FROM learneropportunity_raw
GROUP BY enrollment_id
HAVING COUNT(*) > 1;

--cohort dataset
DROP TABLE IF EXISTS Cohort_Data;
CREATE TABLE Cohort_Data (
    cohort_id TEXT,
    cohort_code TEXT,
    size INTEGER,
    start_date TIMESTAMP,
    end_date TIMESTAMP
);

COPY Cohort_Data FROM 'C:\Program Files\PostgreSQL\17\data\Cleaned_Cohort_data.csv' WITH (FORMAT 'csv', HEADER, DELIMITER ',');

-------------------viewing all the datasets------------------------

SELECT * FROM Learner_Raw LIMIT 10;
SELECT * FROM Marketing_Campaigns LIMIT 140;
SELECT * FROM LearnerOpportunity_Raw LIMIT 10;
SELECT * FROM Cognito_Raw LIMIT 10;
SELECT * FROM Cohort_Data LIMIT 10;
SELECT * FROM Opportunity_Raw LIMIT 10;

--------------Checking total row count in each column---------------------
SELECT 'Learner_Raw' AS table_name, COUNT(*) FROM Learner_Raw
SELECT 'Marketing_Campaigns' AS table_name, COUNT(*) FROM Marketing_Campaigns
SELECT 'LearnerOpportunity_Raw' AS table_name, COUNT(*) FROM LearnerOpportunity_Raw
SELECT 'Cognito_Raw' AS table_name, COUNT(*) FROM Cognito_Raw
SELECT 'Cohort_Data' AS table_name, COUNT(*) FROM Cohort_Data
SELECT 'Opportunity_Raw' AS table_name, COUNT(*) FROM Opportunity_Raw;

-----------------------checking column names and their data types------------------------
SELECT column_name, data_type 
FROM information_schema.columns 
WHERE table_name = 'learner_raw';

SELECT column_name, data_type 
FROM information_schema.columns 
WHERE table_name = 'cognito_raw';

SELECT column_name, data_type 
FROM information_schema.columns 
WHERE table_name = 'marketing_campaigns';

SELECT column_name, data_type 
FROM information_schema.columns 
WHERE table_name = 'cohort_data';

SELECT column_name, data_type 
FROM information_schema.columns 
WHERE table_name = 'opportunity_raw';

SELECT column_name, data_type 
FROM information_schema.columns 
WHERE table_name = 'learneropportunity_raw';

-------------------Checking duplicates in all the datasets----------------
--Checking duplicates in learner_raw
SELECT learner_id, COUNT(*) 
FROM learner_raw
GROUP BY learner_id
HAVING COUNT(*) > 1;

--checking duplicates in cognito_raw
SELECT user_id, COUNT(*) 
FROM cognito_raw
GROUP BY user_id
HAVING COUNT(*) > 1;

--checking duplicates in opportunity_raw
SELECT opportunity_id, COUNT(*) 
FROM opportunity_raw
GROUP BY opportunity_id
HAVING COUNT(*) > 1;

SELECT learner_id, COUNT(*) AS occurrence_count
FROM learneropportunity_raw
GROUP BY learner_id
HAVING COUNT(*) > 1
ORDER BY occurrence_count DESC;


--------------identifying common keys and relationship--------------------
-- checking if enrollment_id and learner_id are same
SELECT lo.enrollment_id, lr.learner_id
FROM learneropportunity_raw lo
JOIN learner_raw lr ON lo.enrollment_id = lr.learner_id
LIMIT 1000;

-- checking if assigned_cohort and cohort_code are same
SELECT lo.assigned_cohort, cd.cohort_code
FROM learneropportunity_raw lo
JOIN cohort_data cd ON lo.assigned_cohort = cd.cohort_code
LIMIT 10;

--checking if learner_id and opportunity_id are same
SELECT lo.learner_id, orw.opportunity_id
FROM learneropportunity_raw lo
JOIN opportunity_raw orw ON lo.learner_id = orw.opportunity_id
LIMIT 10;

--checking if user_id, enrollment_id, and learner_id are same
SELECT cr.user_id, lo.enrollment_id, lr.learner_id
FROM cognito_raw cr
JOIN learneropportunity_raw lo ON cr.user_id = REPLACE(lo.enrollment_id, 'Learner#', '')
JOIN learner_raw lr ON lo.enrollment_id = lr.learner_id
LIMIT 10;

-----------------checking duplicates in the above columns-------------------
SELECT enrollment_id, COUNT(*) AS occurrence_count
FROM learneropportunity_raw
GROUP BY enrollment_id
HAVING COUNT(*) > 1
ORDER BY occurrence_count DESC;

SELECT assigned_cohort, COUNT(*) AS occurrence_count
FROM learneropportunity_raw
GROUP BY assigned_cohort
HAVING COUNT(*) > 1
ORDER BY occurrence_count DESC;

SELECT learner_id, COUNT(*) AS occurrence_count
FROM learneropportunity_raw
GROUP BY learner_id
HAVING COUNT(*) > 1
ORDER BY occurrence_count DESC;

SELECT user_id, COUNT(*) AS occurrence_count
FROM cognito_raw
GROUP BY user_id
HAVING COUNT(*) > 1
ORDER BY occurrence_count DESC;

SELECT learner_id, COUNT(*) AS occurrence_count
FROM learner_raw
GROUP BY learner_id
HAVING COUNT(*) > 1
ORDER BY occurrence_count DESC;

-----Count of each unique value in the assigned_cohort column from the learneropportunity_raw dataset:
SELECT assigned_cohort, COUNT(*) AS count
FROM learneropportunity_raw
GROUP BY assigned_cohort
ORDER BY count DESC;

--check for duplicates in the cohort_code column in the cohort_raw dataset, 
SELECT cohort_code, COUNT(*) AS count
FROM cohort_data
GROUP BY cohort_code
HAVING COUNT(*) > 1
ORDER BY count DESC;

--Joining a copy of cognito_raw data and learner_raw

DROP TABLE IF EXISTS Learner_Cognito;
CREATE TABLE Learner_Cognito AS
SELECT 
    mp.user_id, 
    lr.learner_id, 
    mp.email, 
    mp.gender, 
    mp.birthdate, 
    lr.degree, 
    lr.major, 
    lr.institution, 
    mp.city, 
    mp.zip, 
    mp.state, 
    lr.country, 
    mp.usercreatedate, 
    mp.userlastmodifieddate
FROM cognito_raw_copy mp
LEFT JOIN learner_raw lr 
ON mp.user_id = REGEXP_REPLACE(lr.learner_id, '^Learner#', '');

SELECT * FROM Learner_Cognito LIMIT 10;


--Joining Cohort_data and LearnerOpportunity_raw:
CREATE TABLE Cohort_LearnerOpportunity AS
SELECT 
    lo.*,
    c.*
FROM learneropportunity_raw lo
LEFT JOIN cohort_data c 
ON lo.assigned_cohort = c.cohort_code;

SELECT * FROM Cohort_LearnerOpportunity LIMIT 10;

----Joining Cohort_LearnerOpportunity and Opportunity_raw:
CREATE TABLE Opportunity_CohortLearnerOpp AS
SELECT 
    cl.*,
    o.*
FROM Cohort_LearnerOpportunity cl
LEFT JOIN opportunity_raw o 
ON cl.learner_id = o.opportunity_id;

SELECT * FROM Opportunity_CohortLearnerOpp LIMIT 10;

-------------------Creating MASTER TABLE by joining Learner_Cognito and Opportunity_CohortLearnerOpp---------------------------------

UPDATE Opportunity_CohortLearnerOpp 
SET cleaned_enrollment_id = REGEXP_REPLACE(enrollment_id, '^Learner#', '');

CREATE INDEX IF NOT EXISTS idx_cleaned_enrollment_id 
ON Opportunity_CohortLearnerOpp(cleaned_enrollment_id);
DROP TABLE IF EXISTS Master_Table;
CREATE TABLE Master_Table AS
SELECT 
    lc.user_id, lc.learner_id, ocl.enrollment_id, 
    ocl.learner_id AS learneropp_id, lc.email, lc.gender, 
    lc.birthdate, lc.degree, lc.major, lc.institution, 
    lc.city, lc.zip, lc.state, lc.country, ocl.opportunity_id, 
    ocl.opportunity_name, ocl.category, ocl.opportunity_code, 
    ocl.cohort_id, ocl.cohort_code, ocl.assigned_cohort, 
    ocl.size, ocl.apply_date, ocl.status, 
    ocl.start_date, ocl.end_date, lc.usercreatedate, 
    lc.userlastmodifieddate AS userlastmodifieddate
FROM Learner_Cognito lc
LEFT JOIN Opportunity_CohortLearnerOpp ocl 
ON lc.user_id = ocl.cleaned_enrollment_id;

---viewing master table
SELECT * FROM master_table LIMIT 10;

--checking columns and their data types in master table
SELECT column_name, data_type 
FROM information_schema.columns 
WHERE table_name = 'master_table';


