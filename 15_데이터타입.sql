--문자형
--문자형 CHAR 와 VARCHAR2 비교
CREATE TABLE COMP (
    char_col CHAR(4),
    varcher_col VARCHAR2(4)
);

INSERT INTO comp VALUES ('AA', 'AA');
INSERT INTO comp VALUES ('AAA', 'AAA');
INSERT INTO comp VALUES ('AAAA', 'AAAA');
COMMIT;

SELECT * FROM comp;

SELECT * FROM comp
WHERE char_col = varcher_col;
--숫자형 데이터 타입 NUMBER
--NUMBER (p,s) : p는 유효자리수 1~38, s는 소수점 유효자리수

--DATE타입
SELECT hire_date, to_char(hire_date, 'YYYY-MM-DD') "날짜=>문자변환"
FROM employees;

SELECT*
FROM employees
WHERE hire_date < '2002-03-03';
--오라클이 자동으로 오른쪽 문자를 좌측 데이터 날짜형에 맞게 형 변환하여 비교










