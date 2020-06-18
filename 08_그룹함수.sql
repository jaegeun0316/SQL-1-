-- �׷��Լ�

--MAX MIN
SELECT MAX(salary), MIN(salary)
FROM employees;
--MAX MIN ���ڿ��� ����
SELECT MAX(first_name), MIN(first_name)
FROM employees;
--MAX MIN ��¥�� ����
SELECT MAX(hire_date), MIN(hire_date)
FROM employees;

-- SUM, AVG : �հ�� ���
SELECT SUM(salary), AVG(salary)
FROM employees;

-- COUNT
SELECT COUNT(*) --�������̺��� ��� ���� ����
FROM employees;

SELECT COUNT(commission_pct) --NULL���� ������ ���� ����
FROM employees;

SELECT COUNT(NVL(commission_pct,0)) --NULL���� 0���� �ٲ㼭 ������ ���� ����
FROM employees;

SELECT COUNT(department_id) 
FROM employees;

SELECT COUNT(DISTINCT department_id) --DISTINCT �ߺ��� ���� : �μ��� ����
FROM employees;

SELECT COUNT(employee_id) --90�� �μ��� ���� ��
FROM employees
WHERE department_id = 90;

SELECT AVG(commission_pct) -- NULL���� ������ ���
FROM employees;

--GPOUP BY�� ������ �����Լ� ���
SELECT department_id, ROUND(AVG(salary)) ��ձ޿�
FROM employees
GROUP BY department_id;

SELECT department_id �μ���ȣ, 
    ROUND(AVG(salary)) ��ձ޿�,
    SUM(salary) �ѱ޿��հ�,
    COUNT(*) �μ��ο���
FROM employees
GROUP BY department_id;


SELECT department_id �μ���ȣ, job_id ����, 
    ROUND(AVG(salary)) ��ձ޿�,
    SUM(salary) �ѱ޿��հ�,
    COUNT(*) --�μ���, ������ �ο���
FROM employees
GROUP BY department_id,job_id;

--����1
SELECT department_id �μ���ȣ, COUNT(department_id) �����, 
    MAX(salary) �ִ�޿�, MIN(salary) �ּұ޿�, SUM(salary) �޿��հ�, ROUND(AVG(salary)) ��ձ޿�
FROM employees
GROUP BY department_id 
ORDER BY �޿��հ� DESC;

--����2
SELECT department_id �μ���ȣ, job_id ����, manager_id ����ȣ, 
        SUM(salary) �޿��հ�, COUNT(*) �����
FROM employees
GROUP BY department_id, job_id, manager_id
ORDER BY �μ���ȣ;

--����3
SELECT ROUND(AVG(MAX(salary))) �μ����ְ�������, ROUND(AVG(MIN(salary))) �μ��������������
FROM employees
GROUP BY department_id;

--HAVING �� : �׷��Լ��� �̿��� ������
SELECT department_id �μ���ȣ, SUM(salary) �޿��հ�
FROM employees
WHERE SUM(salary) > 100000  --WHERE���� �׷��Լ� ����� ����
GROUP BY department_id
ORDER BY department_id;

SELECT department_id �μ���ȣ, SUM(salary) �޿��հ�
FROM employees
GROUP BY department_id
HAVING SUM(salary) > 100000
ORDER BY department_id;

--����1
SELECT job_id ����, SUM(salary) ���޿��հ�
FROM employees
WHERE job_id != 'AC_MGR' --�Ϲ�����
GROUP BY job_id
HAVING AVG(salary) > 10000 --�׷��Լ� ����
ORDER BY ���޿��հ� desc;

--����2
SELECT department_id �μ���ȣ, ROUND(AVG(salary)) ��ձ޿�
FROM employees
WHERE department_id !=40
GROUP BY department_id
HAVING AVG(salary) <= 7000 ;

--����3
SELECT job_id ����, SUM(salary) ���޿��հ�
FROM employees
WHERE job_id NOT LIKE '%REP%' --�Ϲ�����
GROUP BY job_id
HAVING SUM(salary) > 13000 --�׷��Լ� ����
ORDER BY ���޿��հ� desc;







