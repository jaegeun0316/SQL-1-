--DELETE �������� ����

--�μ���ȣ 71��~75�� ����
DELETE FROM departments
WHERE department_id BETWEEN 71 AND 75;
COMMIT;

--���� ���̺� id 1,2 ����
DELETE FROM employees
WHERE employee_id IN (1,2);
COMMIT;

--���̺� ���� ������ ��ü�� ����
DELETE FROM copy_departments;
rollback;

--TRUNCATE : ��ü�����ε� ROLLBACK�� �ȵ�
TRUNCATE TABLE copy_departments;
ROLLBACK;

-- DROP ���̺� : ���̺� ����
DROP TABLE copy_departments;
DROP TABLE copy_DEPT;
DROP TABLE XX_EMP;

--���̺� ����Ʈ
SELECT * FROM copy_emp
WHERE employee_id = 108; --salary 12008

UPDATE copy_emp
SET salary = salary + 10
WHERE employee_id = 108; -- salary 12018
--���� ���̺�����Ʈ A�����
SAVEPOINT A;

UPDATE copy_emp
SET salary = salary + 20
WHERE employee_id = 108; -- salary 12038

--���̺�����Ʈ A�� �ѹ�
ROLLBACK TO SAVEPOINT A;

--�ѹ��ϸ� ���̺�����Ʈ ������ ���ʻ��·� ���ư�
ROLLBACK;

COMMIT;










