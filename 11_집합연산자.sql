--집합연산자 (UNION 외)

--UNION : 합집합 중복제거
SELECT employee_id, job_id
FROM employees
UNION
SELECT employee_id, job_id
FROM job_history ;

--UNION ALL : 합집합
SELECT employee_id, job_id
FROM employees
UNION ALL
SELECT employee_id, job_id
FROM job_history ;

--INTERSECT : 교집합
SELECT employee_id, job_id
FROM employees
INTERSECT
SELECT employee_id, job_id
FROM job_history ;

--MINUS : 차집합
SELECT employee_id, job_id
FROM employees
MINUS
SELECT employee_id, job_id
FROM job_history ;

--예제1
SELECT department_id
FROM employees
UNION
SELECT department_id
FROM departments;

--예제2
SELECT department_id
FROM employees
UNION ALL
SELECT department_id
FROM departments;

--예제3
SELECT department_id
FROM employees
INTERSECT
SELECT department_id
FROM departments;

--예제4
SELECT department_id
FROM departments
MINUS
SELECT department_id
FROM employees;






