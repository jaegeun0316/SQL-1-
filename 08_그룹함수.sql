-- 그룹함수

--MAX MIN
SELECT MAX(salary), MIN(salary)
FROM employees;
--MAX MIN 문자열에 적용
SELECT MAX(first_name), MIN(first_name)
FROM employees;
--MAX MIN 날짜에 적용
SELECT MAX(hire_date), MIN(hire_date)
FROM employees;

-- SUM, AVG : 합계와 평균
SELECT SUM(salary), AVG(salary)
FROM employees;

-- COUNT
SELECT COUNT(*) --직원테이블의 모든 행의 개수
FROM employees;

SELECT COUNT(commission_pct) --NULL값을 제외한 행의 개수
FROM employees;

SELECT COUNT(NVL(commission_pct,0)) --NULL값을 0으로 바꿔서 포함한 행의 개수
FROM employees;

SELECT COUNT(department_id) 
FROM employees;

SELECT COUNT(DISTINCT department_id) --DISTINCT 중복을 제외 : 부서의 개수
FROM employees;

SELECT COUNT(employee_id) --90번 부서의 직원 수
FROM employees
WHERE department_id = 90;

SELECT AVG(commission_pct) -- NULL값은 제외한 평균
FROM employees;

--GPOUP BY로 나눠서 집계함수 사용
SELECT department_id, ROUND(AVG(salary)) 평균급여
FROM employees
GROUP BY department_id;

SELECT department_id 부서번호, 
    ROUND(AVG(salary)) 평균급여,
    SUM(salary) 총급여합계,
    COUNT(*) 부서인원수
FROM employees
GROUP BY department_id;


SELECT department_id 부서번호, job_id 직업, 
    ROUND(AVG(salary)) 평균급여,
    SUM(salary) 총급여합계,
    COUNT(*) --부서별, 직업별 인원수
FROM employees
GROUP BY department_id,job_id;

--예제1
SELECT department_id 부서번호, COUNT(department_id) 사원수, 
    MAX(salary) 최대급여, MIN(salary) 최소급여, SUM(salary) 급여합계, ROUND(AVG(salary)) 평균급여
FROM employees
GROUP BY department_id 
ORDER BY 급여합계 DESC;

--예제2
SELECT department_id 부서번호, job_id 직업, manager_id 상사번호, 
        SUM(salary) 급여합계, COUNT(*) 사원수
FROM employees
GROUP BY department_id, job_id, manager_id
ORDER BY 부서번호;

--예제3
SELECT ROUND(AVG(MAX(salary))) 부서별최고월급평균, ROUND(AVG(MIN(salary))) 부서별최저월급평균
FROM employees
GROUP BY department_id;

--HAVING 절 : 그룹함수를 이용한 조건절
SELECT department_id 부서번호, SUM(salary) 급여합계
FROM employees
WHERE SUM(salary) > 100000  --WHERE절에 그룹함수 사용은 에러
GROUP BY department_id
ORDER BY department_id;

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

--예제2
SELECT department_id 부서번호, ROUND(AVG(salary)) 평균급여
FROM employees
WHERE department_id !=40
GROUP BY department_id
HAVING AVG(salary) <= 7000 ;

--예제3
SELECT job_id 직종, SUM(salary) 월급여합계
FROM employees
WHERE job_id NOT LIKE '%REP%' --일반조건
GROUP BY job_id
HAVING SUM(salary) > 13000 --그룹함수 조건
ORDER BY 월급여합계 desc;







