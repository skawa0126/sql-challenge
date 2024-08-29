-- List the employee number, last name, first name, sex, and salary of each employee.
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
INNER JOIN salaries ON salaries.emp_no = employees.emp_no

-- List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT employees.first_name, employees.last_name, employees.hire_date
FROM employees 
-- WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31'
WHERE EXTRACT (YEAR FROM hire_date)=1986


-- List the manager of each department
-- along with their department number, department name, employee number, last name, and first name.
SELECT manager.dept_no, departments.dept_name, employees.emp_no, employees.last_name, employees.first_name
FROM manager
INNER JOIN departments ON manager.dept_no = departments.dept_no
INNER JOIN employees ON manager.emp_no = employees.emp_no
WHERE employees.emp_title_id = 'm0001'

-- List the department number for each employee
-- along with that employee’s employee number, last name, first name, and department name.
SELECT dept_emp.dept_no, dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
INNER JOIN employees ON dept_emp.emp_no = employees.emp_no
INNER JOIN departments ON dept_emp.dept_no = departments.dept_no


-- List first name, last name, and sex of each employee
-- whose first name is Hercules and whose last name begins with the letter B.
SELECT employees.first_name, employees.last_name, employees.sex
FROM employees
WHERE employees.first_name = 'Hercules' AND employees.last_name LIKE 'B%'

-- List each employee in the Sales department, 
-- including their employee number, last name, and first name.
SELECT employees.emp_no, employees.last_name, employees.first_name
FROM employees
INNER JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales'

-- List each employee in the Sales and Development departments,
-- including their employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
INNER JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development'

-- List the frequency counts, in descending order,
-- of all the employee last names (that is, how many employees share each last name).
SELECT last_name, COUNT(last_name) AS last_name_count
FROM employees    
GROUP BY last_name
ORDER BY last_name_count DESC