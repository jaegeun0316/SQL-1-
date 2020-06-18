--����
SELECT e.employee_id, e.department_id, d.department_name
FROM employees e
JOIN departments d
ON e.department_id = d.department_id;

-- ���߷� ���� : ON �� ����
SELECT employee_id, first_name, job_id, job_title
FROM employees 
NATURAL JOIN jobs;

--�⺻ ��������
SELECT e.employee_id, j.job_id, j.job_title
FROM employees e
JOIN jobs j
ON e.job_id = j.job_id;

--WHERE �� �߰�
SELECT e.employee_id, e.department_id, d.department_name
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
WHERE d.department_id = 50;

--3�� ���̺� ����
SELECT e.employee_id, d.department_name, lo.city
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations lo ON d.location_id = lo.location_id;

--����
SELECT d.department_name �μ���, l.city ���ø�, c.country_name ������
FROM departments d
JOIN locations l ON d.location_id = l.location_id
JOIN countries c ON l.country_id = c.country_id
WHERE (l.city = 'Seattle' OR l.city = 'London')
            AND c.country_name LIKE 'United%';
            
            
--��ü����
SELECT e.last_name ����, e.employee_id ������ȣ, m.last_name �Ŵ���, m.employee_id ������ȣ2
FROM employees e
JOIN employees m
 ON e.manager_id = m.employee_id;

--�ܺ�����(OUTER JOIN)
--LEFT OUTER JOIN
SELECT e.last_name ����, e.department_id �μ���ȣ, d.department_name �μ���
FROM employees e
LEFT OUTER JOIN departments d
    ON e.department_id = d.department_id;
    
--RIGHT OUTER JOIN
SELECT e.last_name ����, e.department_id �μ���ȣ, d.department_name �μ���
FROM employees e
RIGHT OUTER JOIN departments d
    ON e.department_id = d.department_id;

--FULL OUTER JOIN
SELECT e.last_name ����, e.department_id �μ���ȣ, d.department_name �μ���
FROM employees e
FULL OUTER JOIN departments d
    ON e.department_id = d.department_id;
    
--����
SELECT c.country_name ����, c.country_id ������ȣ, l.location_id ������ȣ, l.city ����
FROM countries c
LEFT OUTER JOIN locations l
ON c.country_id = l.country_id
ORDER BY location_id DESC;

--ũ�ν� ���� ����
SELECT c.country_name ����, r.region_name �����̸�
FROM countries c
CROSS JOIN regions r;

--���� ���� 1
SELECT d.department_name �μ���,
       d.manager_id �Ŵ�����ȣ,
       e.last_name||' '||e.first_name Ǯ����,
       e.phone_number
FROM departments d
JOIN employees e
    ON d.manager_id = e.employee_id;

--���� ����2
SELECT e.employee_id ������ȣ, e.hire_date �������, j.job_id ����, j.job_title ��å
FROM employees e
JOIN jobs j
    ON e.job_id = j.job_id;
    
--���� ����3
SELECT to_char(e.hire_date,'yyyy') �Ի�⵵, ROUND(AVG(e.salary)) ��ձ޿�
FROM employees e
JOIN jobs j ON e.job_id = j.job_id
WHERE j.job_title = 'Sales Manager'
GROUP BY to_char(e.hire_date,'yyyy')
ORDER BY 1;

--���� ����4
SELECT l.city, ROUND(AVG(e.salary)),COUNT(*)
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
GROUP BY l.city
HAVING COUNT(*) < 10 
ORDER BY 2;

--���� ����5
SELECT e.employee_id, e.last_name, e.salary, m.last_name, m.salary
FROM employees e
JOIN employees m ON e.manager_id = m.employee_id
WHERE e.salary > m.salary;

