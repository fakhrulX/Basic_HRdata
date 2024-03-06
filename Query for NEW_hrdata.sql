use hr;


-- 1. What is the gender breakdown of employees in the company? 


select * from hr_data;
select distinct (gender) from hr_data;
select gender , count(*) as total from hr_data where age  >=18 and termdate = '' group by gender;

-- 2. What is the race/ethnicity breakdown of employees in the company?
select * from hr_data;
select distinct(race) from hr_data;
select race , count(*) from hr_data where age  >=18 and termdate = '' group by race order by count(*) desc;


-- 3. What is the age distribution of employees in the company?
select * from hr_data;
select min(age) ,max(age) from hr_data where age  >=18 and termdate = '';


-- 4. How many employees work at headquarters versus remote locations?
select * from hr_data;
select location,count(*)as total from hr_data where age >= 18 and termdate ='' group by location;
select location, count(*) from hr_data group by location;


-- 5. What is the average length of employment for employees who have been terminated?
select * from hr_data;
SELECT ROUND(AVG(DATEDIFF(termdate, hire_date))/365,0) AS avg_length_of_employment FROM hr_data WHERE termdate <> '0000-00-00' AND termdate <= CURDATE() AND age >= 18;



-- 6. How does the gender distribution vary across departments and job titles?
select gender,department,count(*) from hr_data where age >= 18 and termdate ='' group by department,gender order by department,gender ;


-- 7. What is the distribution of job titles across the company?
select jobtitle,gender, count(*) from hr_data where age >= 18 and termdate ='' group by jobtitle,gender order by jobtitle,gender;


-- 8. Which department has the highest turnover rate?
select department,
   total_count,
   terminated_count,
   terminated_count/total_count as termination_rate
from(
   select department,
   count(*) as total_count,
   sum(case when termdate <>'' and termdate <= curdate() then 1 else 0 end) as terminated_count
   from hr_data
   where age >=18
   group by department
   ) as subquery
   order by termination_rate desc;
   
   
   -- 9. What is the distribution of employees across locations by city and state?
select * from hr_data;
select location_state ,count(*) from hr_data where age >= 18 and termdate ='' group by location_state order by count(*) desc ;


-- 10. What is the tenure distribution for each department?
select * from hr_data;
select department,round(avg(datediff(curdate(),termdate)/365),0) as avg_tenure from hr_data where termdate <=curdate() and termdate <> '' and age >=18  group by department;


-- 11. how many employees are there in each department?

select department,count(*) as total_employees from hr_data where age >=18 and termdate = ''   group by department order by department;

select distinct(department) from hr_data;
