--UPDATE : 데이터 수정하기

--업데이트 사용시 WHERE절에 항상 기본키를 활용한다.

CREATE TABLE copy_emp
AS
SELECT * FROM employees;

UPDATE copy_emp
SET salary = 24100
WHERE employee_id = 100;
commit;

--기본키를 사용하지 않아 의도치 않게 이름이 같은 사람들이 업데이트 됨
UPDATE COPY_EMP
SET salary = 24100
WHERE first_name = 'Steven';
commit;

--WHERE절을 안썼을 때, 열의 모든 데이터가 수정되어버림
UPDATE copy_emp
SET phone_number = '123-456-789';

--예제 1
INSERT INTO copy_departments(department_id,department_name)
VALUES (280, 'Music');

UPDATE copy_departments
SET manager_id = 100, location_id = 1800
WHERE department_name = 'Music';
commit;

--예제 1
UPDATE copy_departments
SET manager_id = 100, location_id = 1800
WHERE department_id = 74;

UPDATE copy_departments
SET manager_id = 100, location_id = 1800
WHERE department_id = 75;

commit;

--예제 2 
UPDATE copy_departments
SET manager_id = 100
WHERE department_id  BETWEEN 150 AND 200;

COMMIT;





