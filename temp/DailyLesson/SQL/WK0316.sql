--지금까지 구성된 테이블의 내용이니 참조하셔서
--테이블을 만드시기 바랍니다.
--/////////////////////////////////////////////////
SELECT TABLE_NAME FROM USER_TABLES;
--어제이어서...실전문제 계속
--11.가장최근에 입사한 5명의 사원번호,사원이름 입사일을 검색하라?
--인라인뷰:FROM 절에 SELECT문으로 테이블을 구성시켜서 진행하는 방법
SELECT EMPNO,ENAME,HIREDATE
FROM (SELECT EMPNO,ENAME,HIREDATE
FROM EMP
WHERE HIREDATE IS NOT NULL
ORDER BY HIREDATE DESC)
WHERE ROWNUM<=5;

SELECT EMPNO,ENAME,HIREDATE
FROM EMP
WHERE HIREDATE IS NOT NULL
ORDER BY HIREDATE DESC;

--12.급여와 커미션을 합한 금액으로 상위 7명의 사원번호와 사원이름을 검색하라?
SELECT A.EMPNO,A.ENAME,A.SALARY
FROM (SELECT EMPNO,ENAME,NVL2(COMM,SAL+COMM,SAL) AS SALARY
FROM EMP WHERE SAL IS NOT NULL ORDER BY 3 DESC) A
WHERE ROWNUM<=7;

SELECT * FROM EMP;
SELECT EMPNO,ENAME,NVL2(COMM,SAL+COMM,SAL) AS SALARY
FROM EMP ORDER BY 3 DESC;

--13.부서별 평균급여가 가장 큰 부서의 2개부서이름을 검색하라?
SELECT * FROM DEPT;
SELECT * FROM EMP;
SELECT DNAME
FROM (SELECT DNAME,AVG(SAL)
FROM EMP A,DEPT B
WHERE A.DEPTNO=B.DEPTNO
GROUP BY DNAME
ORDER BY 2 DESC)
WHERE ROWNUM<=2;
SELECT DNAME,AVG(SAL)
FROM EMP A,DEPT B
WHERE A.DEPTNO=B.DEPTNO
GROUP BY DNAME
ORDER BY 2 DESC;

--14.사원직무별 급여 표준편차가 큰 상위2개의 사원직무를 구하라?
SELECT JOB
FROM (SELECT JOB,STDDEV(SAL) FROM EMP
GROUP BY JOB ORDER BY 2 DESC)
WHERE ROWNUM<=2;

SELECT JOB,STDDEV(SAL) FROM EMP
GROUP BY JOB ORDER BY 2 DESC;

--#DDL연습문제
--1.ERD를 통하여 PRODUCT 테이블을 생성하라?
CREATE TABLE PRODUCT(
P_CODE CHAR(3),
CONSTRAINT PK_P_CODE PRIMARY KEY(P_CODE),
P_NAME VARCHAR2(30),
P_COST NUMBER,
P_GROUP VARCHAR2(30));

SELECT *
FROM USER_CONSTRAINTS
WHERE TABLE_NAME='PRODUCT';

DESC PRODUCT;

--2.상품정보(PRODUCT)테이블에 상품정보 데이터를 입력하라?
INSERT INTO PRODUCT VALUES('101','19인치모니터',150000,'모니터');
INSERT INTO PRODUCT VALUES('102','22인치모니터',200000,'모니터');
INSERT INTO PRODUCT VALUES('103','25인치모니터',260000,'모니터');
INSERT INTO PRODUCT VALUES('201','유선마우스',7000,'마우스');
INSERT INTO PRODUCT VALUES('202','무선마우스',18000,'마우스');
INSERT INTO PRODUCT VALUES('301','유선키보드',8000,'키보드');
INSERT INTO PRODUCT VALUES('302','무선키보드',22000,'키보드');
INSERT INTO PRODUCT VALUES('401','2채널스피커',8000,'스피커');
INSERT INTO PRODUCT VALUES('402','5.1채널스피커',120000,'스피커');

SELECT * FROM PRODUCT;

--3.실습에 사용될 거래내역(TRADE)테이블을 생성하라?
CREATE TABLE TRADE(
T_SEQ NUMBER,
CONSTRAINT PK_T_SEQ PRIMARY KEY(T_SEQ),
P_CODE CHAR(3),
CONSTRAINT FK_P_CODE FOREIGN KEY(P_CODE) REFERENCES PRODUCT(P_CODE),
C_CODE VARCHAR2(4),
CONSTRAINT FK_C_CODE FOREIGN KEY(C_CODE) REFERENCES CUSTOMER(C_CODE),
T_DATE DATE,
T_QTY NUMBER,
T_COST NUMBER,
T_TAX NUMBER);

--4.거래처정보(CUSTOMER)테이블을 생성하라?
CREATE TABLE CUSTOMER(
C_CODE VARCHAR2(4),
CONSTRAINT PK_C_CODE PRIMARY KEY(C_CODE),
C_NAME VARCHAR2(30),
C_CEO VARCHAR2(12),
C_ADDR VARCHAR2(100),
C_PHONE VARCHAR2(13));

--5.실습에 사용되 거래내역(TRADE)테이블에 다음과 같은 거래내역정보를
--삽입하라?
SELECT * FROM TRADE;
DESC TRADE;
SELECT * 
FROM USER_CONSTRAINTS
WHERE TABLE_NAME='TRADE';
INSERT INTO TRADE VALUES(61,'101','101',TO_DATE('2016-04-01','YYYY-MM-
DD'),10,150000,150000);

INSERT INTO TRADE VALUES(5,'102','102',TO_DATE('2016-04-26','YYYY-MM-
DD'),8,200000,160000);

INSERT INTO TRADE VALUES(8,'103','101',TO_DATE('2016-05-20','YYYY-MM-
DD'),2,260000,52000);

INSERT INTO TRADE VALUES(3,'201','101',TO_DATE('2016-04-13','YYYY-MM-
DD'),7,7000,4900);

INSERT INTO TRADE VALUES(2,'201','101',TO_DATE('2016-04-12','YYYY-MM-
DD'),5,7000,3500);

INSERT INTO TRADE VALUES(9,'202','104',TO_DATE('2016-06-02','YYYY-MM-
DD'),8,18000,14400);

INSERT INTO TRADE VALUES(6,'301','103',TO_DATE('2016-05-02','YYYY-MM-
DD'),12,8000,9600);

INSERT INTO TRADE VALUES(10,'302','103',TO_DATE('2016-06-09','YYYY-MM-
DD'),9,22000,19800);

INSERT INTO TRADE VALUES(4,'401','104',TO_DATE('2016-04-20','YYYY-MM-
DD'),15,10000,15000);

INSERT INTO TRADE VALUES(11,'401','105',TO_DATE('2016-06-15','YYYY-MM-
DD'),20,10000,20000);

INSERT INTO TRADE VALUES(7,'402','102',TO_DATE('2016-05-08','YYYY-MM-
DD'),5,120000,60000);

--6.거래처정보(CUSTOMER) 데이터를 삽입하여라?
INSERT INTO CUSTOMER VALUES('101','늘푸른회사','김수종','경기도 안산시','010-1234-
5678');
INSERT INTO CUSTOMER VALUES('102','사랑과바다','박나리','경기도 평택시','010-1122-
3344');
INSERT INTO CUSTOMER VALUES('103','대한회사','이민수','서울시 구로구','010-3785-8809');
INSERT INTO CUSTOMER VALUES('104','하얀기판','허진수','경상북도 포항시','010-8569-
3468');
INSERT INTO CUSTOMER VALUES('105','한마음한뜻','하민우','인천시 남동구','010-9455-
6033');

SELECT * FROM CUSTOMER;
SELECT * FROM TRADE;
--7.상품재고(STOCK)테이블을 생성하라?
CREATE TABLE STOCK(
P_CODE CHAR(3),
CONSTRAINT PK1_P_CODE PRIMARY KEY(P_CODE),
S_QTY NUMBER,
S_LASTDATE DATE);

--8.위의 상품재고(STOCK)테이블에 아래와 같은 데이터를 삽입하라?
INSERT INTO STOCK VALUES('101',50,TO_DATE('2016-04-01','YYYY-MM-
DD'));

INSERT INTO STOCK VALUES('102',20,TO_DATE('2016-04-26','YYYY-MM-
DD'));

INSERT INTO STOCK VALUES('103',5,TO_DATE('2016-05-20','YYYY-MM-
DD'));

INSERT INTO STOCK VALUES('201',2,TO_DATE('2016-04-13','YYYY-MM-
DD'));

INSERT INTO STOCK VALUES('202',15,TO_DATE('2016-06-02','YYYY-MM-
DD'));

INSERT INTO STOCK VALUES('301',0,TO_DATE('2016-05-02','YYYY-MM-
DD'));

INSERT INTO STOCK VALUES('302',20,TO_DATE('2016-06-09','YYYY-MM-
DD'));

INSERT INTO STOCK VALUES('401',10,TO_DATE('2016-06-15','YYYY-MM-
DD'));

INSERT INTO STOCK VALUES('402',7,TO_DATE('2016-05-08','YYYY-MM-
DD'));

SELECT * FROM STOCK;

