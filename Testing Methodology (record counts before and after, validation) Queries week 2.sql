----------------------------------------------------Testing Methodology________________________________________________

------------------------Record counts before cleaning the master table--------------------------------
--Count of rows in master table before cleaning
SELECT COUNT(*) AS total_rows FROM master_table;

--Count of each column of master table before cleaning
SELECT 
    COUNT(user_id) AS user_id_count,
    COUNT(learner_id) AS learner_id_count,
    COUNT(enrollment_id) AS enrollment_id_count,
    COUNT(learneropp_id) AS learneropp_id_count,
    COUNT(email) AS email_count,
    COUNT(gender) AS gender_count,
    COUNT(birthdate) AS birthdate_count,
    COUNT(degree) AS degree_count,
    COUNT(major) AS major_count,
    COUNT(institution) AS institution_count,
    COUNT(city) AS city_count,
    COUNT(zip) AS zip_count,
    COUNT(state) AS state_count,
    COUNT(country) AS country_count,
    COUNT(opportunity_id) AS opportunity_id_count,
    COUNT(opportunity_name) AS opportunity_name_count,
    COUNT(category) AS category_count,
    COUNT(opportunity_code) AS opportunity_code_count,
    COUNT(cohort_id) AS cohort_id_count,
    COUNT(cohort_code) AS cohort_code_count,
    COUNT(assigned_cohort) AS assigned_cohort_count,
    COUNT(cohort_size) AS cohort_size_count,
    COUNT(apply_date) AS apply_date_count,
    COUNT(status) AS status_count,
    COUNT(start_date) AS start_date_count,
    COUNT(end_date) AS end_date_count,
    COUNT(usercreatedate) AS usercreatedate_count,
    COUNT(userlastmodifieddate) AS userlastmodifieddate_count
FROM master_table;

--Count of null values in each column of master table before cleaning
SELECT 
    COUNT(user_id) AS user_id_count,
    COUNT(learner_id) AS learner_id_count,
    COUNT(enrollment_id) AS enrollment_id_count,
    COUNT(learneropp_id) AS learneropp_id_count,
    COUNT(email) AS email_count,
    COUNT(gender) AS gender_count,
    COUNT(birthdate) AS birthdate_count,
    COUNT(degree) AS degree_count,
    COUNT(major) AS major_count,
    COUNT(institution) AS institution_count,
    COUNT(city) AS city_count,
    COUNT(zip) AS zip_count,
    COUNT(state) AS state_count,
    COUNT(country) AS country_count,
    COUNT(opportunity_id) AS opportunity_id_count,
    COUNT(opportunity_name) AS opportunity_name_count,
    COUNT(category) AS category_count,
    COUNT(opportunity_code) AS opportunity_code_count,
    COUNT(cohort_id) AS cohort_id_count,
    COUNT(cohort_code) AS cohort_code_count,
    COUNT(assigned_cohort) AS assigned_cohort_count,
    COUNT(cohort_size) AS cohort_size_count,
    COUNT(apply_date) AS apply_date_count,
    COUNT(status) AS status_count,
    COUNT(start_date) AS start_date_count,
    COUNT(end_date) AS end_date_count,
    COUNT(usercreatedate) AS usercreatedate_count,
    COUNT(userlastmodifieddate) AS userlastmodifieddate_count
FROM master_table;

--check the count of duplicates in each column of master_table before cleaning
SELECT 
    'user_id' AS column_name, COUNT(user_id) - COUNT(DISTINCT user_id) AS duplicate_count FROM master_table
UNION ALL
SELECT 
    'learner_id', COUNT(learner_id) - COUNT(DISTINCT learner_id) FROM master_table
UNION ALL
SELECT 
    'enrollment_id', COUNT(enrollment_id) - COUNT(DISTINCT enrollment_id) FROM master_table
UNION ALL
SELECT 
    'learneropp_id', COUNT(learneropp_id) - COUNT(DISTINCT learneropp_id) FROM master_table
UNION ALL
SELECT 
    'email', COUNT(email) - COUNT(DISTINCT email) FROM master_table
UNION ALL
SELECT 
    'gender', COUNT(gender) - COUNT(DISTINCT gender) FROM master_table
UNION ALL
SELECT 
    'birthdate', COUNT(birthdate) - COUNT(DISTINCT birthdate) FROM master_table
UNION ALL
SELECT 
    'degree', COUNT(degree) - COUNT(DISTINCT degree) FROM master_table
UNION ALL
SELECT 
    'major', COUNT(major) - COUNT(DISTINCT major) FROM master_table
UNION ALL
SELECT 
    'institution', COUNT(institution) - COUNT(DISTINCT institution) FROM master_table
UNION ALL
SELECT 
    'city', COUNT(city) - COUNT(DISTINCT city) FROM master_table
UNION ALL
SELECT 
    'zip', COUNT(zip) - COUNT(DISTINCT zip) FROM master_table
UNION ALL
SELECT 
    'state', COUNT(state) - COUNT(DISTINCT state) FROM master_table
UNION ALL
SELECT 
    'country', COUNT(country) - COUNT(DISTINCT country) FROM master_table
UNION ALL
SELECT 
    'opportunity_id', COUNT(opportunity_id) - COUNT(DISTINCT opportunity_id) FROM master_table
UNION ALL
SELECT 
    'opportunity_name', COUNT(opportunity_name) - COUNT(DISTINCT opportunity_name) FROM master_table
UNION ALL
SELECT 
    'category', COUNT(category) - COUNT(DISTINCT category) FROM master_table
UNION ALL
SELECT 
    'opportunity_code', COUNT(opportunity_code) - COUNT(DISTINCT opportunity_code) FROM master_table
UNION ALL
SELECT 
    'cohort_id', COUNT(cohort_id) - COUNT(DISTINCT cohort_id) FROM master_table
UNION ALL
SELECT 
    'cohort_code', COUNT(cohort_code) - COUNT(DISTINCT cohort_code) FROM master_table
UNION ALL
SELECT 
    'assigned_cohort', COUNT(assigned_cohort) - COUNT(DISTINCT assigned_cohort) FROM master_table
UNION ALL
SELECT 
    'cohort_size', COUNT(cohort_size) - COUNT(DISTINCT cohort_size) FROM master_table
UNION ALL
SELECT 
    'apply_date', COUNT(apply_date) - COUNT(DISTINCT apply_date) FROM master_table
UNION ALL
SELECT 
    'status', COUNT(status) - COUNT(DISTINCT status) FROM master_table
UNION ALL
SELECT 
    'start_date', COUNT(start_date) - COUNT(DISTINCT start_date) FROM master_table
UNION ALL
SELECT 
    'end_date', COUNT(end_date) - COUNT(DISTINCT end_date) FROM master_table
UNION ALL
SELECT 
    'usercreatedate', COUNT(usercreatedate) - COUNT(DISTINCT usercreatedate) FROM master_table
UNION ALL
SELECT 
    'userlastmodifieddate', COUNT(userlastmodifieddate) - COUNT(DISTINCT userlastmodifieddate) FROM master_table;

SELECT DISTINCT gender FROM master_table;


----------------------------------Record Counts After Cleaning the master table--------------------------

--Count of rows in master table after cleaning
SELECT COUNT(*) AS total_rows FROM master_table;

--Count of each column of master table after cleaning
SELECT 
    COUNT(user_id) AS user_id_count,
    COUNT(learner_id) AS learner_id_count,
    COUNT(enrollment_id) AS enrollment_id_count,
    COUNT(learneropp_id) AS learneropp_id_count,
    COUNT(email) AS email_count,
    COUNT(gender) AS gender_count,
    COUNT(birthdate) AS birthdate_count,
    COUNT(degree) AS degree_count,
    COUNT(major) AS major_count,
    COUNT(institution) AS institution_count,
    COUNT(city) AS city_count,
    COUNT(zip) AS zip_count,
    COUNT(state) AS state_count,
    COUNT(country) AS country_count,
    COUNT(opportunity_id) AS opportunity_id_count,
    COUNT(opportunity_name) AS opportunity_name_count,
    COUNT(category) AS category_count,
    COUNT(opportunity_code) AS opportunity_code_count,
    COUNT(cohort_id) AS cohort_id_count,
    COUNT(cohort_code) AS cohort_code_count,
    COUNT(assigned_cohort) AS assigned_cohort_count,
    COUNT(cohort_size) AS cohort_size_count,
    COUNT(apply_date) AS apply_date_count,
    COUNT(status) AS status_count,
    COUNT(start_date) AS start_date_count,
    COUNT(end_date) AS end_date_count,
    COUNT(usercreatedate) AS usercreatedate_count,
    COUNT(userlastmodifieddate) AS userlastmodifieddate_count
FROM master_table;

--Count of null values in each column of master table after cleaning
SELECT 
    COUNT(user_id) AS user_id_count,
    COUNT(learner_id) AS learner_id_count,
    COUNT(enrollment_id) AS enrollment_id_count,
    COUNT(learneropp_id) AS learneropp_id_count,
    COUNT(email) AS email_count,
    COUNT(gender) AS gender_count,
    COUNT(birthdate) AS birthdate_count,
    COUNT(degree) AS degree_count,
    COUNT(major) AS major_count,
    COUNT(institution) AS institution_count,
    COUNT(city) AS city_count,
    COUNT(zip) AS zip_count,
    COUNT(state) AS state_count,
    COUNT(country) AS country_count,
    COUNT(opportunity_id) AS opportunity_id_count,
    COUNT(opportunity_name) AS opportunity_name_count,
    COUNT(category) AS category_count,
    COUNT(opportunity_code) AS opportunity_code_count,
    COUNT(cohort_id) AS cohort_id_count,
    COUNT(cohort_code) AS cohort_code_count,
    COUNT(assigned_cohort) AS assigned_cohort_count,
    COUNT(cohort_size) AS cohort_size_count,
    COUNT(apply_date) AS apply_date_count,
    COUNT(status) AS status_count,
    COUNT(start_date) AS start_date_count,
    COUNT(end_date) AS end_date_count,
    COUNT(usercreatedate) AS usercreatedate_count,
    COUNT(userlastmodifieddate) AS userlastmodifieddate_count
FROM master_table;

--check the count of duplicates in each column of master_table after cleaning
SELECT 
    'user_id' AS column_name, COUNT(user_id) - COUNT(DISTINCT user_id) AS duplicate_count FROM master_table
UNION ALL
SELECT 
    'learner_id', COUNT(learner_id) - COUNT(DISTINCT learner_id) FROM master_table
UNION ALL
SELECT 
    'enrollment_id', COUNT(enrollment_id) - COUNT(DISTINCT enrollment_id) FROM master_table
UNION ALL
SELECT 
    'learneropp_id', COUNT(learneropp_id) - COUNT(DISTINCT learneropp_id) FROM master_table
UNION ALL
SELECT 
    'email', COUNT(email) - COUNT(DISTINCT email) FROM master_table
UNION ALL
SELECT 
    'gender', COUNT(gender) - COUNT(DISTINCT gender) FROM master_table
UNION ALL
SELECT 
    'birthdate', COUNT(birthdate) - COUNT(DISTINCT birthdate) FROM master_table
UNION ALL
SELECT 
    'degree', COUNT(degree) - COUNT(DISTINCT degree) FROM master_table
UNION ALL
SELECT 
    'major', COUNT(major) - COUNT(DISTINCT major) FROM master_table
UNION ALL
SELECT 
    'institution', COUNT(institution) - COUNT(DISTINCT institution) FROM master_table
UNION ALL
SELECT 
    'city', COUNT(city) - COUNT(DISTINCT city) FROM master_table
UNION ALL
SELECT 
    'zip', COUNT(zip) - COUNT(DISTINCT zip) FROM master_table
UNION ALL
SELECT 
    'state', COUNT(state) - COUNT(DISTINCT state) FROM master_table
UNION ALL
SELECT 
    'country', COUNT(country) - COUNT(DISTINCT country) FROM master_table
UNION ALL
SELECT 
    'opportunity_id', COUNT(opportunity_id) - COUNT(DISTINCT opportunity_id) FROM master_table
UNION ALL
SELECT 
    'opportunity_name', COUNT(opportunity_name) - COUNT(DISTINCT opportunity_name) FROM master_table
UNION ALL
SELECT 
    'category', COUNT(category) - COUNT(DISTINCT category) FROM master_table
UNION ALL
SELECT 
    'opportunity_code', COUNT(opportunity_code) - COUNT(DISTINCT opportunity_code) FROM master_table
UNION ALL
SELECT 
    'cohort_id', COUNT(cohort_id) - COUNT(DISTINCT cohort_id) FROM master_table
UNION ALL
SELECT 
    'cohort_code', COUNT(cohort_code) - COUNT(DISTINCT cohort_code) FROM master_table
UNION ALL
SELECT 
    'assigned_cohort', COUNT(assigned_cohort) - COUNT(DISTINCT assigned_cohort) FROM master_table
UNION ALL
SELECT 
    'cohort_size', COUNT(cohort_size) - COUNT(DISTINCT cohort_size) FROM master_table
UNION ALL
SELECT 
    'apply_date', COUNT(apply_date) - COUNT(DISTINCT apply_date) FROM master_table
UNION ALL
SELECT 
    'status', COUNT(status) - COUNT(DISTINCT status) FROM master_table
UNION ALL
SELECT 
    'start_date', COUNT(start_date) - COUNT(DISTINCT start_date) FROM master_table
UNION ALL
SELECT 
    'end_date', COUNT(end_date) - COUNT(DISTINCT end_date) FROM master_table
UNION ALL
SELECT 
    'usercreatedate', COUNT(usercreatedate) - COUNT(DISTINCT usercreatedate) FROM master_table
UNION ALL
SELECT 
    'userlastmodifieddate', COUNT(userlastmodifieddate) - COUNT(DISTINCT userlastmodifieddate) FROM master_table;







--Validation queries

--Check for NULL values in each column
SELECT 'user_id' AS column_name, COUNT(*) AS null_count FROM final_master_table WHERE user_id IS NULL
UNION ALL
SELECT 'learner_id', COUNT(*) FROM final_master_table WHERE learner_id IS NULL
UNION ALL
SELECT 'enrollment_id', COUNT(*) FROM final_master_table WHERE enrollment_id IS NULL
UNION ALL
SELECT 'learneropp_id', COUNT(*) FROM final_master_table WHERE learneropp_id IS NULL
UNION ALL
SELECT 'email', COUNT(*) FROM final_master_table WHERE email IS NULL
UNION ALL
SELECT 'gender', COUNT(*) FROM final_master_table WHERE gender IS NULL
UNION ALL
SELECT 'birthdate', COUNT(*) FROM final_master_table WHERE birthdate IS NULL
UNION ALL
SELECT 'degree', COUNT(*) FROM final_master_table WHERE degree IS NULL
UNION ALL
SELECT 'major', COUNT(*) FROM final_master_table WHERE major IS NULL
UNION ALL
SELECT 'institution', COUNT(*) FROM final_master_table WHERE institution IS NULL
UNION ALL
SELECT 'city', COUNT(*) FROM final_master_table WHERE city IS NULL
UNION ALL
SELECT 'zip', COUNT(*) FROM final_master_table WHERE zip IS NULL
UNION ALL
SELECT 'state', COUNT(*) FROM final_master_table WHERE state IS NULL
UNION ALL
SELECT 'country', COUNT(*) FROM final_master_table WHERE country IS NULL
UNION ALL
SELECT 'opportunity_id', COUNT(*) FROM final_master_table WHERE opportunity_id IS NULL
UNION ALL
SELECT 'opportunity_name', COUNT(*) FROM final_master_table WHERE opportunity_name IS NULL
UNION ALL
SELECT 'category', COUNT(*) FROM final_master_table WHERE category IS NULL
UNION ALL
SELECT 'opportunity_code', COUNT(*) FROM final_master_table WHERE opportunity_code IS NULL
UNION ALL
SELECT 'cohort_id', COUNT(*) FROM final_master_table WHERE cohort_id IS NULL
UNION ALL
SELECT 'cohort_code', COUNT(*) FROM final_master_table WHERE cohort_code IS NULL
UNION ALL
SELECT 'assigned_cohort', COUNT(*) FROM final_master_table WHERE assigned_cohort IS NULL
UNION ALL
SELECT 'cohort_size', COUNT(*) FROM final_master_table WHERE cohort_size IS NULL
UNION ALL
SELECT 'apply_date', COUNT(*) FROM final_master_table WHERE apply_date IS NULL
UNION ALL
SELECT 'status', COUNT(*) FROM final_master_table WHERE status IS NULL
UNION ALL
SELECT 'start_date', COUNT(*) FROM final_master_table WHERE start_date IS NULL
UNION ALL
SELECT 'end_date', COUNT(*) FROM final_master_table WHERE end_date IS NULL
UNION ALL
SELECT 'usercreatedate', COUNT(*) FROM final_master_table WHERE usercreatedate IS NULL
UNION ALL
SELECT 'userlastmodifieddate', COUNT(*) FROM final_master_table WHERE userlastmodifieddate IS NULL;

--Check for duplicate values in each column
SELECT 'user_id' AS column_name, COUNT(user_id) AS duplicates 
FROM final_master_table GROUP BY user_id HAVING COUNT(user_id) > 1
UNION ALL
SELECT 'learner_id', COUNT(learner_id) FROM final_master_table GROUP BY learner_id HAVING COUNT(learner_id) > 1
UNION ALL
SELECT 'email', COUNT(email) FROM final_master_table GROUP BY email HAVING COUNT(email) > 1;


--Check for duplicate rows (full row duplicates)
SELECT COUNT(*) - COUNT(DISTINCT *) AS duplicate_rows FROM final_master_table;


--validate email format
SELECT email 
FROM final_master_table 
WHERE email NOT LIKE '%@%.%' OR email LIKE '% %';


--Check for inconsistent capitalization in institution column
SELECT DISTINCT institution FROM final_master_table ORDER BY institution;