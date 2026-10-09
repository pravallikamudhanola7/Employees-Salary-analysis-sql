CREATE DATABASE EmployeeProject;
USE Employeeproject;


CREATE TABLE Departments (
    departments_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);


INSERT INTO Departments VALUES 
(1, 'HR'),
(2, 'IT'),
(3, 'Sales'),
(4, 'Finance'),
(5, 'Marketing');

SELECT * FROM Departments;

CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    email VARCHAR(100),
    salary DECIMAL(10,2),
    departments_id INT,
    joining_id DATE,
    managar_id INT,
    FOREIGN KEY (departments_id)
        REFERENCES Departments (departments_id)
);

INSERT INTO Employees VALUES
(101, 'Rahul', 'rahul@gmail.com', 45000, 1, '2024-01-15', NULL),
(102, 'Priya', 'priya@gmail.com', 60000, 2, '2023-06-10', 101),
(103, 'Amit', 'amit@gmail.com', 55000, 2, '2024-03-20', 102),
(104, 'Sneha', 'sneha@gmail.com', 70000, 3, '2022-11-05', 101),
(105, 'Arjun', 'arjun@gmail.com', 50000, 3, '2024-07-12', 104),
(106, 'Neha', 'neha@gmail.com', 65000, 4, '2023-09-18', 101),
(107, 'Kiran', 'kiran@gmail.com', 40000, 1, '2025-02-01', 101),
(108, 'Pooja', 'pooja@gmail.com', 80000, 2, '2022-05-25', 102),
(109, 'Vikram', 'vikram@gmail.com', 35000, 5, '2025-04-15', 104),
(110, 'Divya', 'divya@gmail.com', 75000, 3, '2023-12-01', 104);
 
 SELECT * FROM Employees;
 DESCRIBE Employees;
 
 DESCRIBE Departments;
 
 --#JOIN Using both tables
 
 SELECT
 e.employee_name,
 e.salary, 
 d.department_name
FROM Employees e
INNER JOIN Departments d
    ON e.departments_id = d. departments_id;
    
    --#Rank employees by saraly
    SELECT 
    employee_name,
    salary,
    dense_rank() OVER ( 
    ORDER BY salary DESC
    ) AS salary_rank
FROM Employees;

--#Display all columns from the employees table
SELECT * FROM Employees;

--#Display only employees names and salaries
SELECT employee_name, salary
FROM employees;

--#Find employees whose salary is greater than 50,000
SELECT *
FROM Employees
WHERE salary >50000;

--#Find employees whose salary is between 40,000 and 70,000
SELECT* 
FROM Employees
WHERE salary BETWEEN 40000 AND 70000;

--#Display employees in descending order of salary
SELECT * 
FROM Employees
ORDER BY salary DESC;

--#Find employees whose names start with prepare
SELECT * 
FROM Employees
WHERE employee_name LIKE 'P%';

--#Display the five employees with the highest salaries
SELECT * 
FROM Employees
ORDER BY salary DESC
LIMIT 5;

--#Find employees earning more than 60000 whose department ID is 2
SELECT * 
FROM Employees
WHERE salary > 60000
AND departments_id = 2;


---#AGGREGATE FUNCTIONS
--#Find the total number of employees
SELECT COUNT(*) AS total_employees
FROM Employees;

--#Calculate the total salary paid to all employees
SELECT SUM(salary) AS total_salary
FROM Employees;

--#Find the minimum salary
SELECT MIN(salary) AS minimum_salary
FROM Employees;

--#Calucate the average salary
SELECT AVG(salary) AS average_salary
FROM Employees;

--#COUNT employees in each deparment
SELECT
departments_id,
COUNT(*) AS total_employees
FROM employees
GROUP BY departments_id;

--#Display department where the average salary is greater than 50000
SELECT
departments_id,
AVG(salary) AS average_salary
FROM Employees
GROUP BY departments_id
HAVING AVG(salary) > 50000;

--#find the departments with the highest number of employees
SELECT
departments_id,
COUNT(*) AS total_employees
FROM Employees
GROUP BY departments_id
ORDER BY total_employees DESC
LIMIT 1;

--#Rank employees by salary using rank()
SELECT
    employee_name,
    salary,
    RANK() OVER (
        ORDER BY salary DESC
    ) AS salary_rank
FROM Employees;

--#Rank employees by salary using DENSE_RANK()
SELECT
employee_name,
salary,
DENSE_RANK() OVER (
    ORDER BY salary DESC
    ) AS salary_rank
FROM Employees;


--#Find the second-highest distinct salary
SELECT DISTINCT salary
FROM Employees
ORDER BY salary DESC
LIMIT 1 OFFSET 1;

--#Find employees earning more than the overall average salary
SELECT employee_name, salary
FROM Employees
WHERE salary > (
    SELECT AVG(salary)
    FROM Employees
);
--#Find duplicate email addresses
SELECT
    email,
    COUNT(*) AS total_count
FROM Employees
GROUP BY email
HAVING COUNT(*) > 1;


