---employee number, last name, first name, sex, and salary.
SELECT employees.emp_no, last_name, first_name, sex, salary
FROM employees
JOIN salaries
	ON employees.emp_no = salaries.emp_no;

---first name, last name, and hire date for employees who were hired in 1986
SELECT first_name, last_name, hire_date
FROM employees
WHERE DATE_PART('year', hire_date) = 1986;

----department number, department name, the manager's employee number, last name, first name
SELECT dep_managers.dept_no, dept_name, dep_managers.emp_no, last_name, first_name
FROM dep_managers
JOIN department
	ON dep_managers.dept_no = department.dept_no
JOIN employees
	ON dep_managers.emp_no = employees.emp_no;
---employee number, last name, first name, and department name
SELECT employees.emp_no, last_name, first_name, department.dept_name
FROM employees
JOIN dep_employee
	ON dep_employee.emp_no = employees.emp_no
JOIN department
	ON department.dept_no = dep_employee.dept_no;

---first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM employees 
WHERE first_name = 'Hercules' 
AND last_name LIKE 'B%';

---all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT employees.emp_no, last_name, first_name, dept_name
FROM employees
JOIN dep_employee
	ON dep_employee.emp_no = employees.emp_no
JOIN department
	ON department.dept_no = dep_employee.dept_no
WHERE dept_name = 'Sales';

---all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.


---descending order, list the frequency count of employee last names, i.e., how many employees share each last name.


----BONUS
from sqlalchemy import create_engine
engine = create_engine('postgresql://postgres:postgres@localhost:5432/sql_challenge')
connection = engine.connect()
df= pd.read_sql("SELECT*FROM employees",connection)