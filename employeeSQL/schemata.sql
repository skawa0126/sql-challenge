CREATE TABLE employees (
  emp_no int PRIMARY KEY,
  emp_title_id VARCHAR(5) NOT NULL,
  birth_date DATE,
  first_name VARCHAR(30),
  last_name VARCHAR(30),
  sex VARCHAR(1),
  hire_date DATE
); 

CREATE TABLE salaries (
  emp_no int PRIMARY KEY,
  salary int,
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
); 

CREATE TABLE manager (
  dept_no VARCHAR(4),
  emp_no int PRIMARY KEY,
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
); 


CREATE TABLE departments (
  dept_no VARCHAR(4) PRIMARY KEY,
  dept_name VARCHAR(30)
); 


CREATE TABLE dept_emp (
  emp_no int,
  dept_no VARCHAR(4),
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
  FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
  PRIMARY KEY (emp_no, dept_no)
); 


CREATE TABLE titles (
  title_id VARCHAR PRIMARY KEY,
  title VARCHAR(30)
); 