--DISTINCT : 중복 값 제거
SELECT DISTINCT job_id FROM employees;

-- 연결 연산자 (||)
SELECT last_name||' is a '||job_id AS "직업 정보"
FROM employees;

--WHERE : 조건(식)에 맞는 행을 선택한다. 위치는 FROM 절 다음에 위치.
SELECT *
FROM employees
WHERE department_id = 90; --90번 부서만
/*
where 절을 사용할 때 주의점
문자 (string)과 날짜 (date) 값은 항상 따옴표(')로 표시
문자값은 대소문자를 구분한다.(Case-Sensitive)
날짜값은 날짜포맷에 벗어나지 않도록 (Format-Sensitive)
오라클의 날짜 포맷은 RR/MM/DD(RR은 2자리년도)
*/

--AND OR NOT
SELECT *
FROM employees
WHERE hire_date > '08/04/04' OR salary > 13000 AND job_id = 'AD_VP'; -- (괄호없으면 AND가 먼저)

--IN : OR를 간략하게
SELECT *
FROM employees
WHERE salary IN (4000, 3000, 2700);

--BETWEEN : A값에서 B값 사이
SELECT *
FROM employees
--WHERE salary >=9000 AND salary <=10000;
WHERE salary BETWEEN 9000 AND 10000;

/* LIKE, _와 % : 일치하는 글자 찾는 조건에 사용
%는 문자가 0개 또는 1개 이상
-는 문자가 1개
*/
SELECT *
FROM employees
WHERE first_name LIKE '_d%';

--IS NULL : 조건 - NULL만 검색할 때 / IS NOT NULL : 조건 - NOT NULL만 검색할 때
SELECT *
FROM employees
WHERE commission_pct IS NULL;

SELECT *
FROM employees
WHERE commission_pct IS NOT NULL;

--ORDER BY 정렬 순서 (ASC = 오름차순(기본), DESC = 내림차순) *문자는 알파벳순

--1. 대소문자 조작 함수 (upper, lower, initcap)

SELECT LOWER('SQL COURSE'), UPPER('SQL COURSE'), INITCAP('SQL COURSE')
FROM DUAL;

--문자함수를 대소문자 구별해야하는 WHERE절에 사용
SELECT employee_id, first_name
FROM employees
WHERE UPPER(first_name) = 'PATRICK';

--2. 문자 조작 함수들

--CONCAP : 열을 하나로 연결하기
SELECT first_name, last_name,
        CONCAT(first_name,last_name) 풀네임
FROM employees;

--length 문자열의 길이
SELECT first_name, LENGTH(first_name)
FROM employees;

--SUBSTR (열이름, m ,n) m은 시작문자, n은 잘라낸 길이
SELECT employee_id, first_name, 
 SUBSTR (first_name, 1, 3),
 SUBSTR (first_name, 2, 4),
 SUBSTR (first_name, 2),
 SUBSTR (first_name, -3) --음수일 때는 끝에서 부터 카운트 
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

3. 일반형 함수들
--NULL 관련 함수
--NVL : 널값을 다른 값으로 바꿀때 사용

SELECT last_name, manager_id, NVL(manager_id, 0) 매니저
FROM employees
WHERE last_name = 'King';

--NVL2 (ex, ex1, ex2) : ex값이 NULL값이 아니면 ex1으로, NULL값이면 ex2로 바꿈
SELECT last_name, manager_id, NVL2(manager_id, 1, 0) 매니저
FROM employees
WHERE last_name = 'King';

--NULLIF : (ex1, ex2) : ex1과 ex2값이 동일하면 NULL, 동일하지 않으면 ex1으로 출력
SELECT NULLIF(1,1), NULLIF(1,2)
FROM DUAL;

--COALESCE(ex1, ex2, ex3,...) : ex1이 NULL값이면 ex2반환, ex2도 NULL값이면 ex3반환....
SELECT last_name 이름, salary 월급, commission_pct 커미션pct, COALESCE((salary+(commission_pct*salary)),salary+2000) 월급인상
FROM employees
ORDER BY 3;

--DECODE 함수
SELECT last_name 이름, job_id, salary,
        DECODE(job_id, 'IT_PROG',  salary*1.10,
                       'ST_CLERK', salary*1.15,
                       'SA_REP',   salary*1.20,
                                   salary) 수정월급
FROM employees;

--CASE 함수
SELECT last_name 이름, job_id, salary,
    CASE WHEN salary<5000 THEN 'LOW'
        WHEN salary<10000 THEN 'MEDIUM'
        WHEN salary<20000 THEN 'GOOD'
        ELSE                   'EXCELLENT'
        END "급여 수준"
FROM employees;

--4.그룹 함수
--GPOUP BY로 나눠서 집계함수 사용
SELECT department_id, ROUND(AVG(salary)) 평균급여
FROM employees
GROUP BY department_id;

--예제1
SELECT department_id 부서번호, COUNT(department_id) 사원수, 
    MAX(salary) 최대급여, MIN(salary) 최소급여, SUM(salary) 급여합계, ROUND(AVG(salary)) 평균급여
FROM employees
GROUP BY department_id 
ORDER BY 급여합계 DESC;

--예제2
SELECT ROUND(AVG(MAX(salary))) 부서별최고월급평균, ROUND(AVG(MIN(salary))) 부서별최저월급평균
FROM employees
GROUP BY department_id;

--HAVING 절 : 그룹함수를 이용한 조건절
SELECT department_id 부서번호, SUM(salary) 급여합계
FROM employees
WHERE SUM(salary) > 100000  --WHERE절에 그룹함수 사용은 에러
GROUP BY department_id
ORDER BY department_id;
--그래서 아래와 같이.
SELECT department_id 부서번호, SUM(salary) 급여합계
FROM employees
GROUP BY department_id
HAVING SUM(salary) > 100000
ORDER BY department_id;

--예제1
SELECT job_id 직종, SUM(salary) 월급여합계
FROM employees
WHERE job_id != 'AC_MGR' --일반조건
GROUP BY job_id
HAVING AVG(salary) > 10000 --그룹함수 조건
ORDER BY 월급여합계 desc;






