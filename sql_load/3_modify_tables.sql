BULK INSERT company_dim
FROM 'D:\sql_projrct_data_job_analysis\csv_files\company_dim.csv'
WITH (FORMAT= 'csv',FIRSTROW = 2 ,DELIMITER =',',ROWTERMINATOR = '0x0a');

BULK INSERT skills_dim
FROM 'D:\sql_projrct_data_job_analysis\csv_files\skills_dim.csv'
WITH (FORMAT= 'csv',FIRSTROW = 2 ,DELIMITER =',',ROWTERMINATOR = '0x0a');

BULK INSERT skills_job_dim
FROM 'D:\sql_projrct_data_job_analysis\csv_files\skills_job_dim.csv'
WITH (FORMAT= 'csv',FIRSTROW = 2 ,DELIMITER =',',ROWTERMINATOR = '0x0a');

--i uploaded the job_postings_fact data with the import and export wizard in SQL Server.
