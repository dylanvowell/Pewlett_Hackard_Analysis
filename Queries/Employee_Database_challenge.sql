SELECT 
	e.emp_no,
	e.first_name,
	e.last_name,
	ts.title,
	ts.from_date,
	ts.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as ts
ON (e.emp_no = ts.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no ASC;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
WHERE (to_date = '9999-01-01')
ORDER BY emp_no, title DESC;

SELECT * FROM unique_titles;

SELECT COUNT(ut.title), ut.title 
--INTO retiring_titles
FROM unique_titles as ut
GROUP BY ut.title
ORDER BY COUNT(ut.title) DESC;