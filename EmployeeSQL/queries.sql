----------------------------------
-- QUERY THE DATABASE
----------------------------------
-- 1. List the following details of each employee:
--    employee number, last name, first name, sex, and salary.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
LEFT JOIN salaries s
ON s.emp_no = e.emp_no;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE EXTRACT(year FROM "hire_date") = 1986;

-- 3. List the manager of each department with the following information:
--    department number, department name, the manager's employee number, last name, first name.
SELECT d.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name
FROM departments d
LEFT JOIN dept_manager dm
ON (d.dept_no = dm.dept_no)
LEFT JOIN employees e
ON (e.emp_no = dm.emp_no);

-- 4. List the department of each employee with the following information:
--    employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
LEFT JOIN dept_emp de
ON (e.emp_no = de.emp_no)
LEFT JOIN departments d
ON (d.dept_no = de.dept_no);

-- 5. List first name, last name, and sex for employees whose
--    first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

-- 6. List all employees in the Sales department, including their:
--    employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
RIGHT JOIN dept_emp de
ON (e.emp_no = de.emp_no)
RIGHT JOIN departments d
ON (d.dept_no = de.dept_no)
WHERE dept_name = 'Sales';

-- 7. List all employees in the Sales and Development departments, including their:
--    employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
RIGHT JOIN dept_emp de
ON (e.emp_no = de.emp_no)
RIGHT JOIN departments d
ON (d.dept_no = de.dept_no)
WHERE dept_name = 'Sales' 
OR dept_name = 'Development';

-- 8. In descending order, list the frequency count of employee last names,
--    i.e., how many employees share each last name.
SELECT last_name, COUNT(*)
FROM employees
GROUP BY last_name
ORDER BY COUNT DESC;

-- BONUS
-- As you examine the data, you are overcome with a creeping suspicion that the dataset is fake.
-- You surmise that your boss handed you spurious data in order to test the data engineering skills of a new employee.
-- To confirm your hunch, you decide to take the following steps to generate a visualization of the data, with which you will confront your boss:

-- Import the SQL database into Pandas.
-- (Yes, you could read the CSVs directly in Pandas, but you are, after all, trying to prove your technical mettle.)
-- This step may require some research. Feel free to use the code below to get started.
-- Be sure to make any necessary modifications for your username, password, host, port, and database name:

-- from sqlalchemy import create_engine
-- engine = create_engine('postgresql://localhost:5432/<your_db_name>')
-- connection = engine.connect()

-- Consult SQLAlchemy documentation for more information.

-- If using a password, do not upload your password to your GitHub repository.
-- See https://www.youtube.com/watch?v=2uaTPmNvH0I and https://help.github.com/en/github/using-git/ignoring-files for more information.

-- Create a histogram to visualize the most common salary ranges for employees.

-- Create a bar chart of average salary by title.
