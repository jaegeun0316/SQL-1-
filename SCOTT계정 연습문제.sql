--문제1 부서번호가 10인 부서의 사람 중 사원번호, 이름, 월급을 출력하라
SELECT empno, ename, sal
FROM emp
WHERE deptno =10;

--문제2 사원번호가 7369인 사람 중 이름, 입사일, 부서번호를 출력하라
SELECT ename, hiredate, deptno
FROM emp
WHERE empno = 7369;

--문제3 이름이 ALLEN인 사람의 모든 정보를 출력하라
SELECT *
FROM emp
WHERE ename LIKE 'ALLEN';

--문제4 입사일이81/02/20인 사원의 이름, 부서번호, 월급을 출력하라.
SELECT ename,deptno, sal
FROM emp
WHERE hiredate LIKE '81/02/20';

--문제5 직업이 MANAGER가 아닌 사람의 모든 정보를 출력하라
SELECT *
FROM emp
WHERE job != 'MANAGER';

--문제6 입사일이 81/04/02 이후에 입사한 사원의 정보를 출력하라
SELECT *
FROM emp
WHERE hiredate >= '81/04/02';

--문제 7 급여가 $800이상인 사람의 이름, 급여, 부서번호를 출력하라
SELECT ename, sal, deptno
FROM emp 
WHERE SAL >= 800;

--문제 8 부서 번호가 20번 이상인 사원의 모든 정보를 출력하라.
SELECT *
FROM emp 
WHERE deptno >= 20;

--문제 9 이름이 K로 시작하는 사람보다 높은 이름을 가진 사람의 모든정보를 출력하라.
SELECT *
FROM emp
WHERE ename >= 'L';

--문제 10 입사일이 81/12/09 보다 먼저 입사한 사람들의 모든 정보를 출력하라.
SELECT *
FROM emp
WHERE hiredate < '81/12/09';

--문제 11 직원번호가 7698보다 작거나 같은 사람들의 직원번호와 이름을 출력하라.
SELECT empno, ename
FROM emp
WHERE empno <= 7698;


--문제 12 입사일이 81/04/02보다 같거나 늦고 82/12/09 보다 같거나 빠른 사원의 이름, 월급, 부서번호를 출력하라.
SELECT ename, sal, deptno
FROM emp
WHERE hiredate BETWEEN'81/04/02' AND '82/12/09';

--문제 13 급여가 $1,600 보다 크고 $3,000보다 작은 직원의 이름, 직업, 급여를 출력하라.
SELECT ename, job, sal
FROM emp
WHERE sal BETWEEN 1601 AND 2999;

--문제 14 직원번호가 7654와 7782사이 이외의 직원의 모든 정보를 출력하라.
SELECT *
FROM emp
WHERE empno NOT BETWEEN 7654 AND 7782;

--문제 15 이름이 B와 J사이의 모든 직원의 정보를 출력하라.
SELECT *
FROM emp
WHERE ename BETWEEN 'B%' AND 'J%';

--문제 16 입사일이 81년 이외에 입사한 직원의 모든 정보를 출력하라.
SELECT *
FROM emp
WHERE hiredate NOT LIKE '81/%/%';

--문제 17 직업이 manager이거나 salesman인 직원의 모든 정보를 출력하라.
SELECT *
FROM emp
WHERE job = 'MANAGER' OR job = 'SALESMAN';

--문제 18 부서번호가 20,30번을 제외한 모든 직원의 이름,사원번호,부서번호를 출력하라.
SELECT ename, empno, deptno
FROM emp
WHERE NOT (deptno = 20 OR deptno = 30);

--문제 19 이름이 S로 시작하는 직원의 사원번호, 이름, 입사일, 부서번호를 출력하라.
SELECT empno, ename, hiredate, deptno
FROM emp
WHERE NOT ename LIKE 'S%';

--문제 20 입사일이 81년도인 사람의 모든 정보를 출력하라.
SELECT *
FROM emp
WHERE hiredate LIKE '81/%/%';

--문제 21 이름 중 S자가 들어가 있는 사람만 모든 정보를 출력하라.
SELECT *
FROM emp
WHERE ename LIKE '%S%';

--문제 22 이름이 M으로 시작하고 마지막 글자가 N인 사람의 모든 정보를 출력하라.
SELECT *
FROM emp
WHERE ename LIKE 'M%N';

--문제 23 이름이 첫 번째 문자는 관계없고, 두 번째 문자가 A인 사람의 정보를 출력하라.
SELECT *
FROM emp
WHERE ename LIKE '_A%';

--문제 24 커미션이 NULL인 사람의 모든 정보를 출력하라.
SELECT *
FROM emp
WHERE comm IS NULL;

--문제 25 커미션이 NULL이 아닌 사람의 모든 정보를 출력하라.
SELECT *
FROM emp
WHERE comm IS NOT NULL;

--문제 26 부서가 30번 부서이고 급여가 $1,500 이상인 사람의 이름, 부서, 월급을 출력하라.
SELECT ename, deptno, sal
FROM emp
WHERE deptno = 30 AND sal >= 1500 ;

--문제 27 이름의 첫 글자가 K로 시작하거나 부서번호가 30인 사람의 사원번호, 이름, 부서번호를 출력하라.
SELECT empno, ename, deptno
FROM emp
WHERE ename LIKE 'K%' OR deptno = 30 ;

--문제 28 급여가 $1,500 이상이고 부서번호가 30번인 사원 중 직업이 MANAGER인 사람의 정보를 출력하라.
SELECT *
FROM emp
WHERE sal > 1500 AND deptno = 30 AND job = 'MANAGER' ;

--문제 29 부서번호가 30인 사람의 모든정보를 출력하고 직원번호로 SORT하라.
SELECT *
FROM emp
WHERE deptno = 30
ORDER BY empno ASC;

--문제 30 직원들의 급여가 많은 순으로 SORT하라.
SELECT *
FROM emp
ORDER BY sal DESC;

--문제 31 부서번호로 ASCENDING SORT한 후 급여가 많은 사람 순으로 출력하라.
SELECT *
FROM emp
ORDER BY deptno ASC, sal DESC;

--문제 32 부서번호가 DESCENDING SORT, 이름 순으로 ASCENDING SORT 급여 순으로 DESCENDING SORT 하라.
SELECT deptno, ename, sal
FROM emp
ORDER BY deptno DESC, ename ASC, sal DESC;

--문제 33 10번 부서의 모든 직원에게 급여의 13%를 보너스로 지급하기로 하였다.
--이름, 급여, 보너스금액, 부서번호를 출력하라.
SELECT ename, sal, ROUND(sal*0.13),deptno
FROM emp
WHERE deptno = 10;

--문제 34 직원의 이름, 급여, 커미션, 총액(급여+커미션)을 구하여 총액이 많은 순서로 출력하라.
SELECT ename, sal, NVL(comm,0), (sal+NVL(comm,0)) TOTAL
FROM emp
ORDER BY TOTAL DESC;

--문제 35 급여가 $1,500부터 $3,000 사이의 사원에 대해서만 급여의 15%를 회비로 지불하기로 하였다.
--모든 사원의 이름, 급여, 회비(소수이하 2자리에서 반올림)를 출력하여라.
--(단, 회비는 달러표시 $로 시작하고 소수점 1자리 까지 출력)
SELECT ename, sal, to_char(round(sal*0.15,1),'$999.9') 회비
FROM emp
WHERE sal BETWEEN 1500 AND 3000;

--문제 36 사원수가 5명이 넘는 부서의 부서명과 사원조회
SELECT d.dname, COUNT(e.empno)
FROM emp e
JOIN dept d ON e.deptno = d.deptno
GROUP BY d.dname
HAVING COUNT(e.empno)>5;

--문제 37 직업별 급여합계가 5000을 초과하는 각 직무에 대해서 직무와 월 급여 합계를 조회
--단 판매원('SALESMAN')은 제외하고 월 급여 합계로 내림차순 정렬
SELECT job, SUM(sal) 급여합계
FROM emp  
WHERE job != 'SALESMAN'     
GROUP BY job          
HAVING SUM(sal) > 5000;    

--문제 38 사원들의 사원번호(empno), 사원명(ename), 급여(sal), 급여등급(grade)를 출력하시오
--(테이블 salgrade 조인)
select e.empno,e.ename,e.sal,s.grade
from emp e 
JOIN salgrade s
ON e.sal between s.losal and s.hisal;

--문제 39 부서별로 사원의 수와 커미션을 받은 사원의 수를 출력하여 보시오
select deptno, count(*) as "사원수",
count(comm) as "커미션 받은 사원수"
from emp
group by deptno;

--문제 40 부서번호가 10은 총무부 20은 개발부 30인 영업부라고 하여 이름, 부서번호, 부서명 순으로 출력하여 보세요
--(decode나 case 함수 사용)
select ename,deptno,
     decode(deptno, 10, '총무부',
                    20, '개발부',
                    30, '영업부'
           ) 부서명
from emp;

