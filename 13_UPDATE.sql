--UPDATE : ������ �����ϱ�

--������Ʈ ���� WHERE���� �׻� �⺻Ű�� Ȱ���Ѵ�.

CREATE TABLE copy_emp
AS
SELECT * FROM employees;

UPDATE copy_emp
SET salary = 24100
WHERE employee_id = 100;
commit;

--�⺻Ű�� ������� �ʾ� �ǵ�ġ �ʰ� �̸��� ���� ������� ������Ʈ ��
UPDATE COPY_EMP
SET salary = 24100
WHERE first_name = 'Steven';
commit;

--WHERE���� �Ƚ��� ��, ���� ��� �����Ͱ� �����Ǿ����
UPDATE copy_emp
SET phone_number = '123-456-789';

--���� 1
INSERT INTO copy_departments(department_id,department_name)
VALUES (280, 'Music');

UPDATE copy_departments
SET manager_id = 100, location_id = 1800
WHERE department_name = 'Music';
commit;

--���� 1
UPDATE copy_departments
SET manager_id = 100, location_id = 1800
WHERE department_id = 74;

UPDATE copy_departments
SET manager_id = 100, location_id = 1800
WHERE department_id = 75;

commit;

--���� 2 
UPDATE copy_departments
SET manager_id = 100
WHERE department_id  BETWEEN 150 AND 200;

COMMIT;





