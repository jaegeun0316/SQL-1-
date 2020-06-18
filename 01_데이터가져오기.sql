--  한줄의 주석입니다. 단축기는 ctrl+/
/*
    여러줄 주석입니다.
*/
-- 1. 테이블의 모든 행과 열을 읽어오기. *
SELECT * FROM departments;

-- 2. 특정 열만 읽어오기.
SELECT department_id, department_name FROM departments;

-- 3. 산술 연산자 사용 (열에서 사용가능) +, -, *, /
SELECT employee_id, first_name, salary, salary+100, salary+(salary*0.1) FROM employees;

-- 4. NULL이란?
-- 입력되지 않은 사용가능하지 않은 알 수 없는 값, 제로(0) 또는 공백("")과는 다르다.
SELECT last_name, job_id, salary, commission_pct, commission_pct+10
FROM employees;

--5. 중복된 값 제거 : distinct
SELECT DISTINCT job_id FROM employees;

--예제 1. 
SELECT employee_id, first_name, last_name
FROM employees;

--예제 2.
SELECT first_name, salary, salary*1.1 AS 뉴셀러리
FROM employees;

--예제 3.
SELECT employee_id 사원번호, first_name 이름, last_name 성
FROM employees;

-- 연결 연산자 (||)
SELECT last_name||' is a '||job_id AS "직업 정보"
FROM employees;

--예제 4.
SELECT employee_id, first_name||' '||last_name, email||'@company.com'
FROM employees;



