CREATE TABLE job_applied
  (
     job_id                 INT,
     application_sent_date  DATE,
     custom_resume          Bit,
     resume_file_name       VARCHAR(255),
     cover_letter_sent      Bit,
     cover_letter_file_name VARCHAR(255),
     status                 VARCHAR(50)
  ); 

INSERT INTO job_applied
            (job_id,
             application_sent_date,
             custom_resume,
             resume_file_name,
             cover_letter_sent,
             cover_letter_file_name,
             status)
VALUES      (1,
             '2024-02-01',
             1,
             'resume_01.pdf',
             1,
             'cover_letter_01.pdf',
             'submitted'),
            (2,
             '2024-02-02',
             0,
             'resume_02.pdf',
             0,
             NULL,
             'interview scheduled'),
            (3,
             '2024-02-03',
             1,
             'resume_03.pdf',
             1,
             'cover_letter_03.pdf',
             'ghosted'),
            (4,
             '2024-02-04',
             1,
             'resume_04.pdf',
             0,
             NULL,
             'submitted'),
            (5,
             '2024-02-05',
             0,
             'resume_05.pdf',
             1,
             'cover_letter_05.pdf',
             'rejected'); 

ALTER TABLE job_applied
ADD contact VARCHAR(50);

UPDATE job_applied
SET    contact = 'Erlich Bachman'
WHERE  job_id = 1;

UPDATE job_applied
SET    contact = 'Dinesh Chugtai'
WHERE  job_id = 2;

UPDATE job_applied
SET    contact = 'Bertram Gilfoyle'
WHERE  job_id = 3;

UPDATE job_applied
SET    contact = 'Jian Yang'
WHERE  job_id = 4;

UPDATE job_applied
SET    contact = 'Big Head'
WHERE  job_id = 5; 

EXEC sp_RENAME 'job_applied.contact', 'contact_name', 'COLUMN'

ALTER TABLE job_applied
ALTER COLUMN contact_name TEXT

ALTER TABLE job_applied
DROP COLUMN contact_name;

DROP TABLE job_applied;