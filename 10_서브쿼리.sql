--��������

-- Abel �������� �޿��� �� ���� �޴� ��������?
--Abel�� �޿� Ȯ��
SELECT salary
FROM employees
WHERE  last_name = 'Abel';

--���������� ���
--������ ������(=, >, <, <=, >=, <>, !=)
SELECT employee_id, last_name, salary
FROM employees
WHERE salary > (SELECT salary
                FROM employees
                WHERE  last_name = 'Abel');
                
--������ ���� ���
SELECT employee_id, last_name, salary
FROM employees
WHERE salary > (SELECT salary
                FROM employees
                WHERE  department_id = 30);
                
--�׷��Լ��� ���������� �̿�
--�׷��Լ� ���� MAX�� ���� ���� �޿��� �޴� ����� ������ �� �� ����.
SELECT *
FROM employees
WHERE salary = (SELECT MAX(salary) FROM employees);
                
--���� 2
SELECT employee_id ������ȣ, last_name �̸�, department_id �μ���ȣ, salary �޿�
FROM employees
WHERE salary > 
(SELECT salary
FROM employees
WHERE last_name = 'Bull') 
AND 
department_id = 
(SELECT department_id
FROM employees
WHERE last_name = 'Bull');

--����3
SELECT last_name �̸�, salary �޿�, manager_id
FROM employees
WHERE manager_id = ( SELECT employee_id FROM employees WHERE last_name = 'Russell');
             
--���� 4
SELECT *
FROM employees
WHERE job_id = (SELECT job_id FROM jobs WHERE job_title = 'Stock Manager');
                
                
                
                