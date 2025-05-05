--------------------------------Cleaning Master Table---------------------------------
CREATE TABLE final_master_table (
    user_id TEXT,
    learner_id TEXT,
    enrollment_id TEXT,
    learneropp_id TEXT,
    email TEXT,
    gender TEXT,
    birthdate DATE,
    degree TEXT,
    major TEXT,
    institution TEXT,
    city TEXT,
    zip TEXT,
    state TEXT,
    country TEXT,
    opportunity_id TEXT,
    opportunity_name TEXT,
    category TEXT,
    opportunity_code TEXT,
    cohort_id TEXT,
    cohort_code TEXT,
    assigned_cohort TEXT,
    cohort_size INT,
    apply_date TIMESTAMP,
    status TEXT,
    start_date TIMESTAMP,
    end_date TIMESTAMP,
    usercreatedate TIMESTAMP,
    userlastmodifieddate TIMESTAMP
);

CREATE TABLE master_table_temp (
    user_id TEXT, learner_id TEXT, enrollment_id TEXT, learneropp_id TEXT,
    email TEXT, gender TEXT, birthdate TEXT, degree TEXT, major TEXT,
    institution TEXT, city TEXT, zip TEXT, state TEXT, country TEXT,
    opportunity_id TEXT, opportunity_name TEXT, category TEXT,
    opportunity_code TEXT, cohort_id TEXT, cohort_code TEXT,
    assigned_cohort TEXT, cohort_size TEXT, apply_date TEXT,
    status TEXT, start_date TEXT, end_date TEXT, usercreatedate TEXT,
    userlastmodifieddate TEXT
);

COPY master_table_temp 
FROM 'C:\Program Files\PostgreSQL\17\data\MASTER TABLE.csv' 
WITH (FORMAT csv, HEADER, DELIMITER ',', NULL 'NULL') 

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'master_table' AND column_name = 'zip';


INSERT INTO final_master_table
SELECT 
    user_id, learner_id, enrollment_id, learneropp_id, email, gender,
    NULLIF(birthdate, '')::DATE, degree, major, institution, city, 
    NULLIF(zip, ''),  -- No type casting to INTEGER
    state, country, opportunity_id, 
    opportunity_name, category, opportunity_code, cohort_id, 
    cohort_code, assigned_cohort, 
    NULLIF(cohort_size, '')::INTEGER, 
    NULLIF(apply_date, '')::DATE, status, 
    NULLIF(start_date, '')::DATE, NULLIF(end_date, '')::DATE, 
    NULLIF(usercreatedate, '')::TIMESTAMP, 
    NULLIF(userlastmodifieddate, '')::TIMESTAMP
FROM master_table_temp;

SELECT * FROM master_table LIMIT 100;
--------------------------------Cleaning Master Table---------------------------------

----- Updating empty string values to NULL for various columns 
UPDATE final_master_table
SET cohort_id = NULL
WHERE cohort_id = '';

UPDATE final_master_table
SET degree = NULL
WHERE degree = '';

UPDATE final_master_table
SET cohort_code = NULL
WHERE cohort_code = '';

UPDATE final_master_table
SET assigned_cohort = NULL
WHERE assigned_cohort = '';

--Renaming column size as cohort size
ALTER TABLE final_master_table RENAME COLUMN "size" TO cohort_size;

UPDATE final_master_table
SET cohort_size = NULL
WHERE cohort_size = '';

UPDATE final_master_table
SET status = NULL
WHERE status= '';

UPDATE final_master_table
SET apply_date = NULL
WHERE apply_date = '';

UPDATE final_master_table
SET end_date = NULL
WHERE end_date = '';

UPDATE final_master_table
SET start_date = NULL
WHERE start_date = '';

UPDATE final_master_table
SET opportunity_id = NULL
WHERE opportunity_id= '';

UPDATE final_master_table
SET opportunity_name = NULL
WHERE opportunity_name= '';

UPDATE final_master_table
SET opportunity_code = NULL
WHERE opportunity_code= '';

UPDATE final_master_table
SET category = NULL
WHERE category= '';

-- Check distinct values in the gender column
SELECT DISTINCT gender FROM final_master_table;

-- Update NULL values in gender to 'Unknown'
UPDATE final_master_table
SET gender = 'Unknown'
WHERE gender IS NULL;

SELECT distinct degree FROM final_master_table

UPDATE final_master_table
SET degree = 'Not Specified'
WHERE degree IS NULL;

SELECT distinct major FROM FINAL_MASTER_TABLE

UPDATE final_master_table
SET major = 'Not Specified'
WHERE major IS NULL;

SELECT distinct opportunity_name FROM FINAL_MASTER_TABLE

UPDATE final_master_table
SET opportunity_name = 'Not Specified'
WHERE opportunity_name IS NULL;

-- Removing leading and trailing spaces from the 'degree' column  
UPDATE final_master_table
SET degree = TRIM(degree);

-- Replacing NULL or negative values in the 'size' column with 0  
SELECT distinct cohort_size FROM FINAL_MASTER_TABLE

UPDATE final_master_table
SET cohort_size = 0
WHERE cohort_size IS NULL OR cohort_size < 0;

-- Replacing NULL values in the 'state', 'city', and 'country' columns with 'Not Available'  
SELECT distinct count(*) as countw,state FROM final_master_table group by state order by state desc 

UPDATE final_master_table
SET state = 'Not Available'
WHERE state IS NULL;

SELECT distinct count(*) as countw,city FROM final_master_table group by city order by countw desc 

UPDATE final_master_table
SET city = 'Not Available'
WHERE city IS NULL;

SELECT distinct count(*) as countw,country FROM final_master_table group by country order by countw desc 

UPDATE final_master_table
SET country = 'Not Available'
WHERE country IS NULL;

-- Counting the number of users associated with each institution 
SELECT institution, COUNT(user_id) AS total_users
FROM final_master_table
GROUP BY institution
ORDER BY total_users DESC;

-- Converting institution names to proper case (first letter of each word capitalized)  
UPDATE final_master_table
SET institution = INITCAP(institution)
WHERE institution IS NOT NULL;

-- Replacing NULL, 'None', 'N/A', 'Na', and 'Null' values in the 'institution' column with 'Not Specified'  
UPDATE final_master_table
SET institution = 'Not Specified'
WHERE institution IS NULL 
   OR TRIM(INITCAP(institution)) IN ('None', 'N/A', 'Na', 'Null', '');
   
-- Removing leading and trailing spaces from email addresses and converting them to lowercase  
SELECT email FROM final_master_table 

UPDATE final_master_table
SET email = LOWER(TRIM(email));

-- Identifying duplicate user_id values and counting their occurrences  
SELECT user_id, COUNT(*) AS occurrences
FROM final_master_table
GROUP BY user_id
HAVING COUNT(*) > 1;

SELECT * FROM final_master_table LIMIT 1000;