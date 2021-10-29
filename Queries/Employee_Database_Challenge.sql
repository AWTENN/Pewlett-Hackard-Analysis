-- Employee_Database_Challenge
SELECT e.emp_no,
e.first_name,
e.last_name,
ti.title,
ti.from_date,
ti.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles AS ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
Order by e.emp_no;

Select distinct on (rt.emp_no)
rt.emp_no,
rt.first_name,
rt.last_name,
rt.title
Into unique_titles
from retirement_titles as rt
order by rt.emp_no,rt.to_date desc;

select count(ut.emp_no),ut.title
into retiring_titles
from unique_titles as ut
group by ut.title
order by count(ut.emp_no) desc;