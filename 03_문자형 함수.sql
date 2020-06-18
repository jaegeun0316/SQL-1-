--문자형 함수는 대소문자 함수와 문자 조작 함수로 나뉜다.

--1. 대소문자 조작 함수 (upper, lower, initcap)
SELECT 1+1
FROM DUAL; --듀얼 테이블은 연습용 테이블

SELECT LOWER('SQL COURSE'), UPPER('SQL COURSE'), INITCAP('SQL COURSE')
FROM DUAL;

--문자함수를 WHERE절에 사용
SELECT employee_id, first_name
FROM employees
WHERE UPPER(first_name) = 'PATRICK';

--2. 문자 조작 함수들

--CONCAP
SELECT first_name, last_name,
        CONCAT(first_name,last_name) 풀네임
FROM employees;

--SUBSTR (열이름, m ,n) m은 시작문자, n은 잘라낸 길이
SELECT employee_id, first_name, 
 SUBSTR (first_name, 1, 3),
 SUBSTR (first_name, 2, 4),
 SUBSTR (first_name, 2),
 SUBSTR (first_name, -3) --음수일 때는 끝에서 부터 카운트 
FROM employees;

--length 문자열의 길이
SELECT first_name, LENGTH(first_name)
FROM employees;

--INSTR (문자형, 찾을 문자, m, n)
--m은 검사 시작위치
--n은 찾을 횟수
-- 디폴트값은 m, n 각각 1
SELECT first_name,
INSTR(first_name, 'e', 2),
INSTR(first_name, 'e', 5),
INSTR(first_name, 'e', 1, 2)
FROM employees
WHERE first_name = 'Nanette';

--lpad / rpad (문자열, 자릿수, 채울문자)
SELECT employee_id, first_name, salary,
    LPAD(salary,10,'#'), RPAD(salary,10,'*')
FROM employees;

-- 공백을 이용해 문자열을 분리
SELECT
'홍 길동' 성명,
SUBSTR ('홍홍 길동',1,INSTR('홍홍 길동',' ')-1) 성,
SUBSTR ('홍홍 길동',INSTR('홍홍 길동',' ')+1) 이름
FROM DUAL;

--문자형 함수 예제
SELECT last_name, CONCAT('직업명이 ',job_id) AS 직업명
FROM employees
WHERE SUBSTR(job_id, 4, 3) = 'REP'; --job_id의 4번째 문자부터 REP 인 경우 

SELECT employee_id, 
    CONCAT(first_name, last_name) 전체이름, 
    last_name, 
    LENGTH(last_name) 길이, 
    INSTR(last_name, 'a') "a가 몇번째?"
FROM employees;

--문자 치환 : REPLACE
SELECT job_id, REPLACE(job_id,'ACCOUNT','ACCNT') 적용
FROM employees
WHERE job_id LIKE '%ACCOUNT%';

--예제1
SELECT last_name 이름 ,
        LOWER('last_name') AS LOWER적용 , UPPER('last_name') AS UPPER적용,
        email, INITCAP(email)
FROM employees;

--예제2
SELECT job_id 직업명,  SUBSTR (job_id, 1, 2)
FROM employees;






