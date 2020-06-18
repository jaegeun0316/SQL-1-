--서브쿼리

-- Abel 직원보다 급여를 더 많이 받는 직원들은?
--Abel의 급여 확인
SELECT salary
FROM employees
WHERE  last_name = 'Abel';

--서브쿼리를 사용
--단일행 연산자(=, >, <, <=, >=, <>, !=)
SELECT employee_id, last_name, salary
FROM employees
WHERE salary > (SELECT salary
                FROM employees
                WHERE  last_name = 'Abel');
                
--에러가 나는 경우
SELECT employee_id, last_name, salary
FROM employees
WHERE salary > (SELECT salary
                FROM employees
                WHERE  department_id = 30);
                
--그룹함수를 서브쿼리로 이용
--그룹함수 예로 MAX는 가장 높은 급여를 받는 사람의 정보는 알 수 없음.
SELECT *
FROM employees
WHERE salary = (SELECT MAX(salary) FROM employees);
                
--예제 2
SELECT employee_id 직원번호, last_name 이름, department_id 부서번호, salary 급여
FROM employees
WHERE salary > 
(SELECT salary
FROM employees
WHERE last_name = 'Bull') 
AND 
department_id = 
(SELECT department_id
FROM employees
WHERE last_name = 'Bull');

--예제3
SELECT last_name 이름, salary 급여, manager_id
FROM employees
WHERE manager_id = ( SELECT employee_id FROM employees WHERE last_name = 'Russell');
             
--예제 4
SELECT *
FROM employees
WHERE job_id = (SELECT job_id FROM jobs WHERE job_title = 'Stock Manager');
                
                
                
                