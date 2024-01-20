-- Create departments table
CREATE TABLE departments (
    dept_no VARCHAR (50),
	dept_name VARCHAR (50)
	
	
);
select * from departments limit 10



-- Create dept_manager table
CREATE TABLE dept_manager (
    dept_no VARCHAR (50),
	emp_no INT PRIMARY KEY
	
		
);

select * from dept_manager limit 10

-- Create employees table
CREATE TABLE employees (
    emp_no INT,
	emp_title_id VARCHAR (50),
	birth_date DATE,
	first_name VARCHAR (50),
	last_name VARCHAR (50),
	sex VARCHAR (20),
	hire_date DATE

	
);


select * from employees limit 20

-- Create salaries table
CREATE TABLE salaries (
    emp_no INT,
	salary INT
	
	
);
select * from salaries limit 20

-- Create titles table
CREATE TABLE titles (
    emp_title_id VARCHAR (50),
	title VARCHAR (50)
	
	
);
select * from titles limit 7

CREATE TABLE titles (
    emp_title_id VARCHAR (50),
	title VARCHAR (50)
	
	
);


--List the employee number, last name, first name, sex, and salary of each employee.
--
SELECT employees.emp_no,last_name,first_name,sex,salary
FROM employees
JOIN salaries
    ON employees.emp_no = salaries.emp_no

--List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT first_name,last_name,hire_date
FROM employees
WHERE hire_date >= '1/1/1986'
AND hire_date <= '12/12/1986'

--Renaming columns after making a typo error in column name
ALTER TABLE departments
RENAME COLUMN dept_id to dept_no;

select * from departments


--List the manager of each department along with their department number, department name, employee number, last name, and first name.

SELECT * from departments;

SELECT * from dept_manager;

SELECT * from employees;


select departments.dept_no,dept_name,dept_manager.emp_no,last_name,first_name
from departments,dept_manager,employees
where employees.emp_no = dept_manager.emp_no
and dept_manager.dept_no = departments.dept_no
order by dept_manager.emp_no,departments.dept_no

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

select departments.dept_no,employees.emp_no,last_name,first_name,dept_name
from departments,dept_manager,employees
where employees.emp_no = dept_manager.emp_no
and dept_manager.dept_no = departments.dept_no
order by employees.emp_no,departments.dept_no

-- removing a primary key from dept_emp


alter table dept_emp drop constraint dept_emp_pkey

select * from dept_emp


--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

select departments.dept_no,employees.emp_no,last_name,first_name,dept_name
from departments,dept_emp,employees
where employees.emp_no = dept_emp.emp_no
and dept_emp.dept_no = departments.dept_no
order by employees.emp_no,departments.dept_no

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

SELECT first_name,last_name,sex
FROM employees
WHERE first_name like 'Hercules' 
AND last_name like 'B%'


--List each employee in the Sales department, including their employee number, last name, and first name.


select dept_name,employees.emp_no,last_name,first_name
from departments
join dept_emp using (dept_no)
join employees using (emp_no)
where dept_name = 'Sales'
limit 50





--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

select dept_name,employees.emp_no,last_name,first_name
from departments
join dept_emp using (dept_no)
join employees using (emp_no)
where dept_name = 'Sales' or dept_name = 'Development'
limit 50



--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name) (4 points)

select last_name,count(*)
from employees
group by last_name
order by count(*) desc
limit 20












