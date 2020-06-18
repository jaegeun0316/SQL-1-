-- 1.���̺��� ��� ������ ��������
SELECT * FROM employees;

-- 2. where ����(��)�� �´� ���� �����Ѵ�. ��ġ�� FROM �� ������ ��ġ.
SELECT *
FROM employees
WHERE department_id = 90; --90�� �μ���

SELECT *
FROM employees
WHERE salary = 24000; --�޿��� 24000�� ����
/*
where ���� ����� �� ������
���� (string)�� ��¥ (date) ���� �׻� ����ǥ(')�� ǥ��
���ڰ��� ��ҹ��ڸ� �����Ѵ�.(Case-Sensitive)
��¥���� ��¥���˿� ����� �ʵ��� (Format-Sensitive)
����Ŭ�� ��¥ ������ RR/MM/DD(RR�� 2�ڸ��⵵)
*/
-- 3. WHERE + ���ڿ�
SELECT employee_id, first_name, last_name, job_id
FROM employees
WHERE first_name = 'Steven';

-- 4. WHERE + ��¥
SELECT SYSDATE FROM DUAL; --DUAL�� ���� ���̺� SYSDATE�� ���� ��¥ �ð�

SELECT *
fROM employees
WHERE hire_date >= '03/06/17';

-- 5.�� ������
SELECT *
fROM employees
WHERE salary >= 10000;  --���ں�

SELECT *
fROM employees
WHERE hire_date >= '03/06/17'; --��¥��

SELECT *
fROM employees
WHERE first_name > 'King'; --��¥��

--����1
SELECT *
fROM employees
WHERE employee_id = 100;
--����2
SELECT *
fROM employees
WHERE first_name = 'David';
--����3
SELECT *
fROM employees
WHERE employee_id < 150;
--����4
SELECT *
fROM job_history
WHERE start_date > '06/03/03'; 
--����5
SELECT *
fROM departments
WHERE location_id != 1700; -- �����ʴٴ� <>�� !=

-- 6. AND OR NOT
SELECT *
FROM employees
WHERE (department_id = 60 OR
        department_id = 80) AND salary > 10000;

SELECT *
FROM employees
WHERE hire_date > '08/04/04' OR salary > 13000 AND job_id = 'AD_VP'; -- ��ȣ������ AND�� ����.

SELECT *
FROM employees
WHERE NOT(hire_date > '04/01/01' OR salary > 5000) AND job_id = 'AD_VP';
        -- (hire_date <= '04/01/01' AND salary <=5000)
        
-- ����1.
SELECT *
FROM employees
WHERE salary > 4000 AND job_id = 'IT_PROG';

--����2.
SELECT *
FROM employees
WHERE salary > 4000 AND (job_id = 'IT_PROG' OR job_id = 'FI_ACCOUNT');

-- IN : OR�� �ٿ��ش�
SELECT *
FROM employees
WHERE salary IN (4000, 3000, 2700);

--����1.
SELECT *
FROM employees
WHERE salary IN (10000, 17000, 24000);

--����2.
SELECT *
FROM employees
WHERE department_id NOT IN (30, 50, 80, 100, 110);

--BETWEEN
SELECT *
FROM employees
--WHERE salary >=9000 AND salary <=10000;
WHERE salary BETWEEN 9000 AND 10000;

--����1.
SELECT *
FROM employees
WHERE salary BETWEEN 10000 AND 20000;

--����2.
SELECT *
FROM employees
WHERE hire_date BETWEEN 04/01/01 AND 04/12/30;

--����3.
SELECT *
FROM employees
WHERE salary NOT BETWEEN 7000 AND 17000;

/* LIKE _�� %�� ���
%�� ���ڰ� 0�� �Ǵ� 1�� �̻�
-�� ���ڰ� 1��
*/
SELECT *
FROM employees
WHERE last_name LIKE 'B%';

SELECT *
FROM employees
WHERE last_name LIKE '%b%';

SELECT *
FROM employees
WHERE first_name LIKE '_d%';

SELECT *
FROM employees
WHERE first_name LIKE '__s%';

--����1
SELECT *
FROM employees
WHERE job_id LIKE '%AD%';

--����2
SELECT *
FROM employees
WHERE job_id LIKE '%AD___';

--����3
SELECT *
FROM employees
WHERE phone_number LIKE '%1234';

--����4
SELECT *
FROM employees
WHERE phone_number NOT LIKE '%3%' AND 
        phone_number LIKE '%9%';

--����5
SELECT *
FROM employees
WHERE job_id LIKE '%MGR%' OR 
        job_id LIKE '%ASST%';
        
        
--IS NULL / IS NOT NULL
SELECT *
FROM employees
WHERE commission_pct IS NULL;

SELECT *
FROM employees
WHERE commission_pct IS NOT NULL;

--����1
SELECT *
FROM employees
WHERE manager_id IS NULL;

--ORDER BY ���� ���� (ASC = ��������(�⺻), DESC = ��������) *���ڴ� ���ĺ���
SELECT *
FROM employees
ORDER BY salary DESC; 

SELECT *
FROM employees
ORDER BY last_name; 

--��Ƽ ����
SELECT employee_id, last_name, department_id
FROM employees
ORDER BY department_id, employee_id DESC;  -- �μ���ȣ�� ���� �� �����ȣ�� ����

--���� �����Ͽ� ����
SELECT employee_id, last_name, salary*12 ����
FROM employees
ORDER BY ���� DESC; --���� �� ����� ��������

-- ORDER BY�� WHERE�� ������ ��ġ
SELECT employee_id, last_name, salary*12 ����
FROM employees
WHERE department_id = 90
ORDER BY ���� DESC; --���� �� ����� ��������

--����1

SELECT employee_id, first_name, last_name
FROM employees
ORDER BY employee_id DESC;

--����2
SELECT *
FROM employees
WHERE job_id LIKE '%CLERK%'
ORDER BY salary DESC;

--����3
SELECT *
FROM employees
WHERE employee_id BETWEEN 120 AND 150
ORDER BY department_id DESC, salary DESC;


