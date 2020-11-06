SELECT employees.emp_no, last_name, first_name, sex, salary
FROM employees
JOIN salaries
	ON employees.emp_no = salaries.emp_no;
----

----
--department number, department name, the manager's employee number, last name, first name
SELECT dep_managers.dept_no, dept_name, dep_managers.emp_no, last_name, first_name
FROM dep_managers
JOIN department
	ON dep_managers.dept_no = department.dept_no
JOIN employees
	ON dep_managers.emp_no = employees.emp_no;
	
----BONUS
from sqlalchemy import create_engine
engine = create_engine('postgresql://postgres:postgres@localhost:5432/sql_challenge')
connection = engine.connect()
df= pd.read_sql("SELECT*FROM employees",connection)