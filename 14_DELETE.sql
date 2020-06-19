--DELETE 데이터의 삭제

--부서번호 71번~75번 삭제
DELETE FROM departments
WHERE department_id BETWEEN 71 AND 75;
COMMIT;

--직원 테이블 id 1,2 삭제
DELETE FROM employees
WHERE employee_id IN (1,2);
COMMIT;

--테이블 내의 데이터 전체를 삭제
DELETE FROM copy_departments;
rollback;

--TRUNCATE : 전체삭제인데 ROLLBACK이 안됨
TRUNCATE TABLE copy_departments;
ROLLBACK;

-- DROP 테이블 : 테이블 삭제
DROP TABLE copy_departments;
DROP TABLE copy_DEPT;
DROP TABLE XX_EMP;

--세이브 포인트
SELECT * FROM copy_emp
WHERE employee_id = 108; --salary 12008

UPDATE copy_emp
SET salary = salary + 10
WHERE employee_id = 108; -- salary 12018
--이제 세이브포인트 A만들기
SAVEPOINT A;

UPDATE copy_emp
SET salary = salary + 20
WHERE employee_id = 108; -- salary 12038

--세이브포인트 A로 롤백
ROLLBACK TO SAVEPOINT A;

--롤백하면 세이브포인트 이전의 최초상태로 돌아감
ROLLBACK;

COMMIT;










