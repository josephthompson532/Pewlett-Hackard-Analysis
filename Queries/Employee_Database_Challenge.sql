-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (______) _____,
______,
______,
______

INTO nameyourtable
FROM _______
ORDER BY _____, _____ DESC;


SELECT e.emp_no, e.first_name, e.last_name, t.title, t.from_date, t.to_date
INTO retirement_titles
FROM titles AS t 
INNER JOIN employees AS e
ON (e.emp_no = t.emp_no)
WHERE e.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY e.emp_no, t.to_date DESC;


SELECT DISTINCT ON(t.emp_no) t.emp_no, t.first_name, t.last_name, t.title
INTO unique_titles
FROM retirement_titles AS t 
ORDER BY t.emp_no, t.to_date DESC;

SELECT COUNT(title) as count, title
INTO retiring_titles
FROM unique_titles
GROUP BY (title)
ORDER BY count DESC;

SELECT DISTINCT ON(e.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date, de.from_date, de.to_date, t.title
-- INTO mentorship_eligibility
FROM employees AS e
INNER JOIN dept_emp AS de
ON (de.emp_no = e.emp_no)
INNER JOIN titles AS t
ON (t.emp_no = e.emp_no)
WHERE e.birth_date BETWEEN '1965-01-01' AND '1965-12-31'
ORDER BY e.emp_no;