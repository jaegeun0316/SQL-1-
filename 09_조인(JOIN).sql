--조인
SELECT e.employee_id, e.department_id, d.department_name
FROM employees e
JOIN departments d
ON e.department_id = d.department_id;

-- 네추럴 조인 : ON 절 생략
SELECT employee_id, first_name, job_id, job_title
FROM employees 
NATURAL JOIN jobs;

--기본 동등조인
SELECT e.employee_id, j.job_id, j.job_title
FROM employees e
JOIN jobs j
ON e.job_id = j.job_id;

--WHERE 절 추가
SELECT e.employee_id, e.department_id, d.department_name
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
WHERE d.department_id = 50;

--3개 테이블 조인
SELECT e.employee_id, d.department_name, lo.city
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations lo ON d.location_id = lo.location_id;

--예제
SELECT d.department_name 부서명, l.city 도시명, c.country_name 국가명
FROM departments d
JOIN locations l ON d.location_id = l.location_id
JOIN countries c ON l.country_id = c.country_id
WHERE (l.city = 'Seattle' OR l.city = 'London')
            AND c.country_name LIKE 'United%';
            
            
--자체조인
SELECT e.last_name 직원, e.employee_id 직원번호, m.last_name 매니저, m.employee_id 직원번호2
FROM employees e
JOIN employees m
 ON e.manager_id = m.employee_id;

--외부조인(OUTER JOIN)
--LEFT OUTER JOIN
SELECT e.last_name 직원, e.department_id 부서번호, d.department_name 부서명
FROM employees e
LEFT OUTER JOIN departments d
    ON e.department_id = d.department_id;
    
--RIGHT OUTER JOIN
SELECT e.last_name 직원, e.department_id 부서번호, d.department_name 부서명
FROM employees e
RIGHT OUTER JOIN departments d
    ON e.department_id = d.department_id;

--FULL OUTER JOIN
SELECT e.last_name 직원, e.department_id 부서번호, d.department_name 부서명
FROM employees e
FULL OUTER JOIN departments d
    ON e.department_id = d.department_id;
    
--예제
SELECT c.country_name 국가, c.country_id 국가번호, l.location_id 지역번호, l.city 도시
FROM countries c
LEFT OUTER JOIN locations l
ON c.country_id = l.country_id
ORDER BY location_id DESC;

--크로스 조인 예제
SELECT c.country_name 국가, r.region_name 지역이름
FROM countries c
CROSS JOIN regions r;

--리뷰 예제 1
SELECT d.department_name 부서명,
       d.manager_id 매니저번호,
       e.last_name||' '||e.first_name 풀네임,
       e.phone_number
FROM departments d
JOIN employees e
    ON d.manager_id = e.employee_id;

--리뷰 예제2
SELECT e.employee_id 직원번호, e.hire_date 고용일자, j.job_id 직종, j.job_title 직책
FROM employees e
JOIN jobs j
    ON e.job_id = j.job_id;
    
--리뷰 예제3
SELECT to_char(e.hire_date,'yyyy') 입사년도, ROUND(AVG(e.salary)) 평균급여
FROM employees e
JOIN jobs j ON e.job_id = j.job_id
WHERE j.job_title = 'Sales Manager'
GROUP BY to_char(e.hire_date,'yyyy')
ORDER BY 1;

--리뷰 예제4
SELECT l.city, ROUND(AVG(e.salary)),COUNT(*)
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
GROUP BY l.city
HAVING COUNT(*) < 10 
ORDER BY 2;

--리뷰 예제5
SELECT e.employee_id, e.last_name, e.salary, m.last_name, m.salary
FROM employees e
JOIN employees m ON e.manager_id = m.employee_id
WHERE e.salary > m.salary;

