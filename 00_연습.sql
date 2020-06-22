--DISTINCT : �ߺ� �� ����
SELECT DISTINCT job_id FROM employees;

-- ���� ������ (||)
SELECT last_name||' is a '||job_id AS "���� ����"
FROM employees;

--WHERE : ����(��)�� �´� ���� �����Ѵ�. ��ġ�� FROM �� ������ ��ġ.
SELECT *
FROM employees
WHERE department_id = 90; --90�� �μ���
/*
where ���� ����� �� ������
���� (string)�� ��¥ (date) ���� �׻� ����ǥ(')�� ǥ��
���ڰ��� ��ҹ��ڸ� �����Ѵ�.(Case-Sensitive)
��¥���� ��¥���˿� ����� �ʵ��� (Format-Sensitive)
����Ŭ�� ��¥ ������ RR/MM/DD(RR�� 2�ڸ��⵵)
*/

--AND OR NOT
SELECT *
FROM employees
WHERE hire_date > '08/04/04' OR salary > 13000 AND job_id = 'AD_VP'; -- (��ȣ������ AND�� ����)

--IN : OR�� �����ϰ�
SELECT *
FROM employees
WHERE salary IN (4000, 3000, 2700);

--BETWEEN : A������ B�� ����
SELECT *
FROM employees
--WHERE salary >=9000 AND salary <=10000;
WHERE salary BETWEEN 9000 AND 10000;

/* LIKE, _�� % : ��ġ�ϴ� ���� ã�� ���ǿ� ���
%�� ���ڰ� 0�� �Ǵ� 1�� �̻�
-�� ���ڰ� 1��
*/
SELECT *
FROM employees
WHERE first_name LIKE '_d%';

--IS NULL : ���� - NULL�� �˻��� �� / IS NOT NULL : ���� - NOT NULL�� �˻��� ��
SELECT *
FROM employees
WHERE commission_pct IS NULL;

SELECT *
FROM employees
WHERE commission_pct IS NOT NULL;

--ORDER BY ���� ���� (ASC = ��������(�⺻), DESC = ��������) *���ڴ� ���ĺ���

--1. ��ҹ��� ���� �Լ� (upper, lower, initcap)

SELECT LOWER('SQL COURSE'), UPPER('SQL COURSE'), INITCAP('SQL COURSE')
FROM DUAL;

--�����Լ��� ��ҹ��� �����ؾ��ϴ� WHERE���� ���
SELECT employee_id, first_name
FROM employees
WHERE UPPER(first_name) = 'PATRICK';

--2. ���� ���� �Լ���

--CONCAP : ���� �ϳ��� �����ϱ�
SELECT first_name, last_name,
        CONCAT(first_name,last_name) Ǯ����
FROM employees;

--length ���ڿ��� ����
SELECT first_name, LENGTH(first_name)
FROM employees;

--SUBSTR (���̸�, m ,n) m�� ���۹���, n�� �߶� ����
SELECT employee_id, first_name, 
 SUBSTR (first_name, 1, 3),
 SUBSTR (first_name, 2, 4),
 SUBSTR (first_name, 2),
 SUBSTR (first_name, -3) --������ ���� ������ ���� ī��Ʈ 
FROM employees;

--INSTR (������, ã�� ����, m, n)
--m�� �˻� ������ġ
--n�� ã�� Ƚ��
-- ����Ʈ���� m, n ���� 1
SELECT first_name,
INSTR(first_name, 'e', 2),
INSTR(first_name, 'e', 5),
INSTR(first_name, 'e', 1, 2)
FROM employees
WHERE first_name = 'Nanette';

3. �Ϲ��� �Լ���
--NULL ���� �Լ�
--NVL : �ΰ��� �ٸ� ������ �ٲܶ� ���

SELECT last_name, manager_id, NVL(manager_id, 0) �Ŵ���
FROM employees
WHERE last_name = 'King';

--NVL2 (ex, ex1, ex2) : ex���� NULL���� �ƴϸ� ex1����, NULL���̸� ex2�� �ٲ�
SELECT last_name, manager_id, NVL2(manager_id, 1, 0) �Ŵ���
FROM employees
WHERE last_name = 'King';

--NULLIF : (ex1, ex2) : ex1�� ex2���� �����ϸ� NULL, �������� ������ ex1���� ���
SELECT NULLIF(1,1), NULLIF(1,2)
FROM DUAL;

--COALESCE(ex1, ex2, ex3,...) : ex1�� NULL���̸� ex2��ȯ, ex2�� NULL���̸� ex3��ȯ....
SELECT last_name �̸�, salary ����, commission_pct Ŀ�̼�pct, COALESCE((salary+(commission_pct*salary)),salary+2000) �����λ�
FROM employees
ORDER BY 3;

--DECODE �Լ�
SELECT last_name �̸�, job_id, salary,
        DECODE(job_id, 'IT_PROG',  salary*1.10,
                       'ST_CLERK', salary*1.15,
                       'SA_REP',   salary*1.20,
                                   salary) ��������
FROM employees;

--CASE �Լ�
SELECT last_name �̸�, job_id, salary,
    CASE WHEN salary<5000 THEN 'LOW'
        WHEN salary<10000 THEN 'MEDIUM'
        WHEN salary<20000 THEN 'GOOD'
        ELSE                   'EXCELLENT'
        END "�޿� ����"
FROM employees;

--4.�׷� �Լ�
--GPOUP BY�� ������ �����Լ� ���
SELECT department_id, ROUND(AVG(salary)) ��ձ޿�
FROM employees
GROUP BY department_id;

--����1
SELECT department_id �μ���ȣ, COUNT(department_id) �����, 
    MAX(salary) �ִ�޿�, MIN(salary) �ּұ޿�, SUM(salary) �޿��հ�, ROUND(AVG(salary)) ��ձ޿�
FROM employees
GROUP BY department_id 
ORDER BY �޿��հ� DESC;

--����2
SELECT ROUND(AVG(MAX(salary))) �μ����ְ�������, ROUND(AVG(MIN(salary))) �μ��������������
FROM employees
GROUP BY department_id;

--HAVING �� : �׷��Լ��� �̿��� ������
SELECT department_id �μ���ȣ, SUM(salary) �޿��հ�
FROM employees
WHERE SUM(salary) > 100000  --WHERE���� �׷��Լ� ����� ����
GROUP BY department_id
ORDER BY department_id;
--�׷��� �Ʒ��� ����.
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






