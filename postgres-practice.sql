-- Active: 1739468883101@@127.0.0.1@5432@practicedb@public


CREATE TABLE persons(
    id SERIAL PRIMARY KEY UNIQUE,
    name VARCHAR(50) NOT NULL,
    dob DATE check (dob <= current_date),
    age INT check (age > 0),
    profession VARCHAR(100),
    isActive BOOLEAN,
    rating NUMERIC(3,2)
);

INSERT INTO persons(id, name, dob, age, profession, isActive, rating) VALUES 
(2, 'Rifat', '2002-05-13', 25, 'student', true, 4.25),
(3, 'Rakib', '2002-05-13', 45, 'student', true, 4.35),
(4, 'Mareyam', '2002-05-13', 15, 'student', true, 4.85),
(5, 'Kamal', '2002-05-13', 25, 'student', true, 4.15);

ALTER TABLE persons RENAME to students;

ALTER TABLE students RENAME COLUMN dob to date_of_birth;

ALTER TABLE students
 ADD COLUMN email VARCHAR(35)  NOT NULL DEFAULT 'test@gmail.com';

 ALTER TABLE students 
   alter COLUMN name type VARCHAR(45);



CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    age INT CHECK (age > 0),
    dob DATE CHECK (dob <= CURRENT_DATE),
    profession VARCHAR(100),
    salary NUMERIC(10,2),
    isActive BOOLEAN
);

INSERT INTO employees (name, age, dob, profession, salary, isActive) VALUES
('Alice Johnson', 28, '1996-03-14', 'Software Engineer', 85000.50, TRUE),
('Bob Smith', 35, '1989-07-23', 'Software Engineer', 92000.00, TRUE),
('Charlie Brown', 42, '1982-11-15', 'Project Manager', 115000.75, TRUE),
('David Miller', 30, '1994-05-06', 'Graphic Designer', 70000.00, FALSE),
('Emma Wilson', 25, '1999-09-30', 'Software Developer', 78000.20, TRUE),
('Frank Harris', 50, '1974-12-10', 'System Administrator', 90000.00, TRUE),
('Grace Lee', 29, '1995-06-17', 'UX Designer', 75000.90, FALSE),
('Hannah White', 33, '1991-08-25', 'Data Scientist', 103000.45, TRUE),
('Ian Clark', 40, '1984-04-05', 'Database Administrator', 95000.00, TRUE),
('Jack Turner', 27, '1997-10-12', 'DevOps Engineer', 98000.30, FALSE),
('Karen Baker', 31, '1993-02-18', 'Cybersecurity Analyst', 97000.50, TRUE),
('Liam Scott', 26, '1998-11-03', 'Software Engineer', 89000.00, TRUE),
('Mia Adams', 38, '1986-01-22', 'AI Engineer', 125000.75, TRUE),
('Noah Carter', 45, '1979-07-07', 'Cloud Architect', 135000.90, FALSE),
('Olivia Parker', 28, '1996-05-15', 'NLP Engineer', 94000.40, TRUE),
('Peter Evans', 34, '1990-09-21', 'Machine Learning Engineer', 112000.25, TRUE),
('Quinn Hall', 39, '1985-03-11', 'Data Engineer', 101000.60, FALSE),
('Rachel Martin', 32, '1992-06-19', 'Software Developer', 82000.80, TRUE),
('Samuel Young', 37, '1987-12-04', 'Cloud Engineer', 99000.00, TRUE),
('Taylor Diaz', 29, '1995-08-30', 'Embedded Systems Engineer', 88000.35, FALSE),
('Uma Patel', 41, '1983-05-28', 'Cybersecurity Analyst', 108000.50, TRUE),
('Victor Green', 36, '1988-02-09', 'Web Developer', 81000.60, TRUE),
('Wendy Cooper', 30, '1994-11-17', 'Game Developer', 89000.00, FALSE),
('Xander King', 33, '1991-04-23', 'IT Support Engineer', 78000.20, TRUE),
('Yasmine Bell', 27, '1997-07-14', 'Software Tester', 80000.00, TRUE),
('Zane Rogers', 50, '1974-01-05', 'Network Engineer', 101000.70, FALSE),
('Abigail Hughes', 26, '1998-03-30', 'Cloud Engineer', 95000.40, TRUE),
('Benjamin Perez', 44, '1980-09-25', 'Full-Stack Developer', 110000.50, TRUE),
('Catherine Reed', 31, '1993-06-13', 'Frontend Developer', 89000.90, TRUE),
('Daniel Foster', 29, '1995-12-29', 'Backend Developer', 95000.25, FALSE),
('Ethan Simmons', 42, '1982-10-08', 'AI Engineer', 150000.80, TRUE),
('Fiona Bennett', 35, '1989-02-15', 'Software Developer', 92000.30, TRUE),
('George Murphy', 28, '1996-09-12', 'Game Developer', 75000.00, FALSE),
('Hazel Richardson', 37, '1987-05-20', 'Blockchain Developer', 99000.90, TRUE),
('Isaac Hernandez', 40, '1984-03-01', 'Cloud Architect', 118000.40, TRUE),
('Jessica Collins', 33, '1991-11-11', 'DevOps Engineer', 102000.00, FALSE),
('Kyle Ward', 30, '1994-07-19', 'Data Engineer', 107000.75, TRUE),
('Laura Cooper', 25, '1999-08-07', 'Full-Stack Developer', 97000.50, TRUE),
('Max Robinson', 29, '1995-04-26', 'Robotics Engineer', 110000.00, FALSE),
('Natalie Scott', 45, '1979-02-13', 'Cybersecurity Specialist', 130000.90, TRUE),
('Oscar Perry', 50, '1974-06-09', 'Embedded Systems Engineer', 105000.40, TRUE),
('Penelope Flores', 31, '1993-10-31', 'Software Engineer', 93000.75, FALSE),
('Quentin Brooks', 28, '1996-12-05', 'Mobile App Developer', 87000.00, TRUE),
('Ruby Bennett', 39, '1985-01-14', 'Blockchain Developer', 102000.25, TRUE),
('Steve Walsh', 34, '1990-11-22', 'Data Scientist', 120000.60, FALSE),
('Tracy Powell', 36, '1988-07-30', 'Machine Learning Engineer', 115000.50, TRUE),
('Umar Khan', 27, '1997-06-17', 'Software Developer', 89000.00, TRUE);

-- SELECT->FROM->WHERE->
-- FROM indicates which table you want to retrieve data
-- WHERE gives filtered data(rows) according to the specific condition
SELECT name,age,profession FROM employees 
  WHERE age>=30 LIMIT 10;
SELECT name,age,profession FROM employees
  WHERE profession='Software Developer' and age BETWEEN 27 AND 35;


SELECT id,name,age FROM employees
WHERE name ILIKE '%E';
SELECT id,name,age FROM employees
WHERE name ILIKE 'A%';
SELECT id,name,age FROM employees
WHERE name ILIKE '___E';

SELECT profession,SUM(salary) FROM employees GROUP BY(profession);
SELECT profession,MAX(salary) FROM employees GROUP BY(profession);
SELECT profession,AVG(salary) FROM employees GROUP BY(profession);


SELECT profession, COUNT(*) AS total_employees_by_profession
FROM employees
GROUP BY(profession);

SELECT profession, COUNT(*) AS total_employees_by_profession
FROM employees
WHERE profession='Software Engineer'
GROUP BY(profession);

SELECT profession, COUNT(*) AS total_employees_by_profession
FROM employees
GROUP BY(profession)
HAVING COUNT(*)>1;