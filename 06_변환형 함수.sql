--��ȯ�� �Լ�

--TO_CHAR
--���ڸ� ���ڷ� ��ȯ
--�޸�(,)
SELECT TO_CHAR(12345678,'999,999,999') �޸�
FROM DUAL;

--�Ҽ���(.)
SELECT TO_CHAR(123.45678,'999,999,999.99') �Ҽ���
FROM DUAL;

--$ǥ��
SELECT TO_CHAR(12345678,'$999,999,999.99') �޷�ǥ��
FROM DUAL;

--Lǥ��
SELECT TO_CHAR(12345678,'L999,999,999.99') ������ȭ
FROM DUAL;

--���ʿ� 0�� ����
SELECT TO_CHAR(123,'09999') ����ǥ�� -- ���°����� 0���� ǥ��
FROM DUAL;

--��¥�� ���ڷ� ��ȯ
--��,��,��,��,��,��
SELECT TO_CHAR(SYSDATE, 'YY-MM-DD HH24:MI:SS') ���糯¥�ð�
FROM DUAL;

--365�� �� ������ ����?
SELECT TO_CHAR(SYSDATE, 'DDD') ��¥
FROM DUAL;

--������ �� ?
SELECT TO_CHAR(SYSDATE, 'MONTH') ���
FROM DUAL;

--����1
SELECT employee_id, TO_CHAR(hire_date, 'MM/YY') �Ի��
FROM employees
where department_id = 100;

--����2
SELECT last_name �̸�, TO_CHAR(salary, '$999,999,999.00') ����
FROM employees
where salary > 10000;

--���ڸ� ��¥�� TO_DATE
SELECT TO_DATE('2011-01-01', 'YYYY-MM-DD')
FROM DUAL;

--���ڸ� ���ڷ� TO_NUMBER
SELECT TO_NUMBER('0123123')+100
FROM DUAL;



