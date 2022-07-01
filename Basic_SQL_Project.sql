# 1. Write a SQL query to find the salaries of all employees
SELECT SALARY FROM temp.employees;

# 2. Write a SQL query to find the unique designations of the employees. Return Job ID.
select distinct(job_id) from temp.employees;

#3. write a SQL query to list the employees’ name, increased their salary by 15%, and expressed as number of Dollars.
select first_name,last_name,((salary /100) * 115)/76.16 from temp.employees;

#4. Write a SQL query to list the employee's name and job name as a format of "Employee & JobID”.
select first_name,last_name,job_id from temp.employees;

# 5. Write a SQL query to find those employees with hire date in the format like February 22, 1991. Return employee ID, employee name, salary, hire date.
select employee_id,first_name,last_name,salary,date_format(hire_date,'%M %D,%Y') from temp.employees;

# 6. Write a SQL query to count the number of characters except the spaces for each employee name. Return employee name length.
select length(first_name) from temp.employees;

#7. Write a SQL query to find the employee ID, salary, and commission of all the employees. 
select employee_id,salary,COMMISSION_PCT from temp.employees;

# 8. Write a SQL query to find the unique department with jobs. Return department ID, Job Count. 
select distinct(DEPARTMENT_ID)from temp.employees;

# 9. Write a SQL query to find those employees who joined before 1991. Return complete information about the employees.
select * from temp.employees where HIRE_DATE < ('1991-1-1');

# 10. Write a SQL query to compute the average salary of those employees who work as ‘Shipping Clerk’. Return average salary.
select avg(salary) from temp.employees where DEPARTMENT_ID = 50;
