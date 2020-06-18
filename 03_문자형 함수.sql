--������ �Լ��� ��ҹ��� �Լ��� ���� ���� �Լ��� ������.

--1. ��ҹ��� ���� �Լ� (upper, lower, initcap)
SELECT 1+1
FROM DUAL; --��� ���̺��� ������ ���̺�

SELECT LOWER('SQL COURSE'), UPPER('SQL COURSE'), INITCAP('SQL COURSE')
FROM DUAL;

--�����Լ��� WHERE���� ���
SELECT employee_id, first_name
FROM employees
WHERE UPPER(first_name) = 'PATRICK';

--2. ���� ���� �Լ���

--CONCAP
SELECT first_name, last_name,
        CONCAT(first_name,last_name) Ǯ����
FROM employees;

--SUBSTR (���̸�, m ,n) m�� ���۹���, n�� �߶� ����
SELECT employee_id, first_name, 
 SUBSTR (first_name, 1, 3),
 SUBSTR (first_name, 2, 4),
 SUBSTR (first_name, 2),
 SUBSTR (first_name, -3) --������ ���� ������ ���� ī��Ʈ 
FROM employees;

--length ���ڿ��� ����
SELECT first_name, LENGTH(first_name)
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

--lpad / rpad (���ڿ�, �ڸ���, ä�﹮��)
SELECT employee_id, first_name, salary,
    LPAD(salary,10,'#'), RPAD(salary,10,'*')
FROM employees;

-- ������ �̿��� ���ڿ��� �и�
SELECT
'ȫ �浿' ����,
SUBSTR ('ȫȫ �浿',1,INSTR('ȫȫ �浿',' ')-1) ��,
SUBSTR ('ȫȫ �浿',INSTR('ȫȫ �浿',' ')+1) �̸�
FROM DUAL;

--������ �Լ� ����
SELECT last_name, CONCAT('�������� ',job_id) AS ������
FROM employees
WHERE SUBSTR(job_id, 4, 3) = 'REP'; --job_id�� 4��° ���ں��� REP �� ��� 

SELECT employee_id, 
    CONCAT(first_name, last_name) ��ü�̸�, 
    last_name, 
    LENGTH(last_name) ����, 
    INSTR(last_name, 'a') "a�� ���°?"
FROM employees;

--���� ġȯ : REPLACE
SELECT job_id, REPLACE(job_id,'ACCOUNT','ACCNT') ����
FROM employees
WHERE job_id LIKE '%ACCOUNT%';

--����1
SELECT last_name �̸� ,
        LOWER('last_name') AS LOWER���� , UPPER('last_name') AS UPPER����,
        email, INITCAP(email)
FROM employees;

--����2
SELECT job_id ������,  SUBSTR (job_id, 1, 2)
FROM employees;






