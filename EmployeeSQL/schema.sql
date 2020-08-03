----------------------------------
-- CREATE ALL TABLES
----------------------------------

-- Create titles table
-- No foreign keys, so create first
-- Populated by titles.csv
CREATE TABLE titles (
    title_id VARCHAR(5) NOT NULL,
    title VARCHAR(255) NOT NULL,
    PRIMARY KEY (title_id)
);

-- Create departments table
-- No foreign keys, so create first
-- Populated by departments.csv
CREATE TABLE departments (
    dept_no VARCHAR(4) NOT NULL,
    dept_name VARCHAR(255) NOT NULL,
    PRIMARY KEY (dept_no)
);

-- Create employees table
-- Uses foreign key from titles table
-- Populated by employees.csv
CREATE TABLE employees (
    emp_no INTEGER NOT NULL,
    emp_title_id varchar(5) NOT NULL,
    birth_date DATE NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    sex VARCHAR(1) NOT NULL,
    hire_date DATE NOT NULL,
    PRIMARY KEY (emp_no),
    FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

-- Create salaries table
-- Uses foreign key from employees table
-- Populated by salaries.csv
CREATE TABLE salaries (
 emp_no INTEGER NOT NULL,
 salary INTEGER NOT NULL,
 FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- Create dept_emp table
-- Contains only foreign keys for employees and departments
-- Rows are unique by combination of both columns
-- Populated by dept_emp.csv
CREATE TABLE dept_emp (
    emp_no INTEGER NOT NULL,
    dept_no VARCHAR(4) NOT NULL,
    PRIMARY KEY (emp_no, dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

-- Create dept_manager junction table
-- Contains only foreign keys for employees and departments
-- Rows are unique by combination of both columns
-- Populated by dept_manager.csv
CREATE TABLE dept_manager (
    dept_no VARCHAR(4) NOT NULL,
    emp_no INTEGER NOT NULL,
    PRIMARY KEY (emp_no, dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

----------------------------------
-- UTILITIES
----------------------------------
-- All selections
--select * from titles;
--select * from employees;
--select * from salaries;
--select * from departments;
--select * from dept_emp;
--select * from dept_manager;
----------------------------------
-- Drop all tables
-- DROP TABLE IF EXISTS titles, departments, employees, salaries, dept_emp, dept_manager;
----------------------------------