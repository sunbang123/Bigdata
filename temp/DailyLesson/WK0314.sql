--실전문제 FOR DML?
--1. 사원테이블(EMP)을 이용하여 부서번호(DEPTNO)가 20,30번 부서인
--사원정보를 EMP1의 테이블로 만들어라?

CREATE TABLE EMP1
AS
SELECT * FROM EMP WHERE DEPTNO IN(20,30);
SELECT * FROM EMP1;

--2. 부서테이블(DEPT)을 복사하여 DEPT1테이블을 만들어라?
CREATE TABLE DEPT1
AS
SELECT * FROM DEPT;

--3. 급여등급테이블(SALGRADE)을 SALGRADE1테이블을 만들어라?
CREATE TABLE SALGRADE1
AS
SELECT * FROM SALGRADE;

--4. 사원번호 7703,사원이름JOSH,사원직무 SALESMAN, 상급자사원번호 7566,
--급여1400,커미션0,부서번호20인 사원이 오늘 입사하였다.
SELECT * FROM EMP1;
INSERT INTO EMP1
VALUES(7703, 'JOSH', 'SALESMAN', 7566, SYSDATE, 1400, 0, 20);

--5. 사원번호 7401, 사원이름 HOMER, 급여 1300, 부서번호 10인 사원이 입사하였다.

INSERT INTO EMP1(EMPNO,ENAME,SAL,DEPTNO)
VALUES(7401,'HOMER',1300,10);
SELECT * FROM EMP1;

--6. 사원번호 7323, 사원이름 BRANDA, 부서번호 30, 사원번호 7499와 동일한 급여를 받는
-- 사원이 오늘 입사하였다.

INSERT INTO EMP1(EMPNO, ENAME, SAL, DEPTNO)
VALUES(7323, 'BRANDA',(SELECT SAL FROM EMP WHERE EMPNO=7499),30);
SELECT * FROM EMP1;

--7. 사원테이블에서 부서번호가 10인 데이터를 EMP1테이블에 삽입하라?
INSERT INTO EMP1
SELECT * FROM EMP WHERE DEPTNO=10;
SELECT * FROM EMP1;
--8. 사원번호 7369의 사원직무를 ANALYST로 바꾸시오?
UPDATE EMP1
SET JOB='ANALYST'
WHERE EMPNO=7369;
SELECT * FROM EMP1;
--9. 부서번호 20인 직원들의 급여를 10%강하라?
SELECT * FROM EMP1 ORDER BY DEPTNO;
UPDATE EMP1
SET SAL=SAL-SAL*0.1
WHERE DEPTNO=20;
--10. 모든 사원의 급여를 100증가하라?
UPDATE EMP1
SET SAL=SAL+100;

--11.사원번호 7902의 상급자사원번호를 7654, 부서번호를 30으로 바꾸라?

UPDATE EMP1
SET MGR=7654, DEPTNO=30
WHERE EMPNO=7902;

--12. 지역이 DALLAS인 사원들의 급여를 10감하라?
SELECT * FROM DEPT;
SELECT * FROM EMP1;
UPDATE EMP1
SET SAL=SAL-10
WHERE DEPTNO=(SELECT DEPTNO FROM DEPT1 WHERE LOC='DALLAS');
--13. 급여등급이 2인 사원들의 급여를 20감하라?
SELECT * FROM SALGRADE;
UPDATE EMP1
SET SAL=SAL-20
WHERE EMPNO IN(SELECT EMPNO FROM EMP1, SALGRADE
WHERE SAL BETWEEN LOSAL AND HISAL
AND GRADE=2);
SELECT EMPNO FROM EMP1, SALGRADE
WHERE SAL BETWEEN LOSAL AND HISAL
AND GRADE=2;
SELECT * FROM EMP1;

--14. 사원번호 7499가 퇴사하였다.
DELETE FROM EMP1
WHERE EMPNO=7499;

--15. 부서번호50, 부서이름'PLANNING', 지역 'MIAMI'가 추가되었다.
SELECT * FROM DEPT1;
INSERT INTO DEPT1
VALUES(50,'PLANNING','MIAMI');
--16.부서번호가 40인 부서가 60으로 변경되었다.
UPDATE DEPT1
SET DEPTNO=60
WHERE DEPTNO=40;
--17.부서번호가 30인 부서가 폐지 되었다.
DELETE FROM DEPT1
WHERE DEPTNO=30;
--18.DEPT1 테이블에 없는 부서번호들을 갖고 있는 사원들의 부서번호를 99로 변경하라?
UPDATE EMP1
SET DEPTNO=99
WHERE DEPTNO NOT IN(SELECT DEPTNO FROM DEPT1);
--19.EMP1에서 99번 부서번호를 삭제하라.
DELETE FROM EMP1
WHERE DEPTNO=99;
SELECT * FROM EMP1;

--20.상급자 사원번호가 없는 사원의 급여를 100올렸다.
UPDATE EMP1
SET SAL=SAL+100
WHERE MGR IS NULL;

--21.JONEW,JOSH,CLARJ가 부서번호를 30번부서로 바뀌었다.
SELECT * FROM EMP1;
UPDATE EMP1
SET DEPTNO=30
WHERE ENAME IN('JONES','JOSH','CLARK');
--22.커미션이 NULL인 데이터를 0으로 바꾸어라?
UPDATE EMP1
SET COMM=0
WHERE COMM IS NULL;
--23.EMP1전체 테이블을 삭제하라?
DELETE FROM EMP1;
SELECT * FROM EMP1;

--연습문제
SELECT * FROM STUDENT;
CREATE TABLE STUDENT1
AS
SELECT * FROM STUDENT;

CREATE TABLE SUBJECT1
AS
SELECT * FROM SUBJECT;

CREATE TABLE ENROL1
AS
SELECT * FROM ENROL;

SELECT * FROM STUDENT1;
DROP TABLE STUDENT1;
CREATE TABLE STUDENT1
AS
SELECT * FROM STUDENT WHERE STU_GRADE IN(1,2);
SELECT * FROM SUBJECT1;
SELECT * FROM ENROL1;
--1.학번 20101059, 이름 조병준, 학과 컴퓨터정보,
--학년 1, 반 B, 키 164, 몸무게 70인 남학생이 추가되었다.
SELECT * FROM STUDENT1;
INSERT INTO STUDENT1
VALUES(20101059, '조병준', '컴퓨터정보', 1, 'B', 'M', 164, 70);

--2.학번 20102038, 이름 남지선, 학과 전기전자,
--학년 1, 반 C, 여학생이 추가되었다.
SELECT * FROM STUDENT1;
INSERT INTO STUDENT1(STU_NO,STU_NAME,STU_DEPT,STU_GRADE,STU_CLASS,STU_GENDER)
VALUES(20101059, '남지선', '전기전자', 1, 'C', 'F');

--3.학번 20103009, 이름 박소신, 학과 기계,
--20153075 학생과 같은 학년, 반을 갖는 남학생이 추가되었다.
SELECT * FROM STUDENT1;
INSERT INTO STUDENT1(STU_NO,STU_NAME,STU_DEPT,STU_GRADE,STU_CLASS,STU_GENDER)
VALUES(20103009, '박소신', '기계', 1, 'C', 'M');
(SELET STU_GRADE FROM STUDENT1 WHERE STU_NO=20153075),
(SELET STU_GRADE FROM STUDENT1 WHERE STU_NO=20153075),'M');

--4.student1 테이블에 학생(student) 테이블의 3학년 학생들 데이터를 입력하라
INSERT INTO STUDENT1
SELECT * FROM STUDENT WHERE STU_GRADE=3;

--5.학번 20131001의 반을 B로 바꾸어라
UPDATE STUDENT1
SET STU_CLASS='B'
WHERE STU_NO=20131001;

--6.20152088 학생의 키가 2cm 자랐다.
UPDATE STUDENT1
SET STU_HEIGHT=STU_HEIGHT+2
WHERE STU_NO=20152088;

--7. 모든 학생의 학년이 올랐다.
UPDATE STUDENT1
SET STU_GRADE=STU_GRADE+1;

--8. 20142021의 학생의 학과를 컴퓨터정보로 바꾸어라.
UPDATE STUDENT1
SET STU_DEPT='컴퓨터정보'
WHERE STU_NO=20142021;

--9. 전자회로실험 과목의 점수를 10점 감점하라.
UPDATE ENROL1
SET ENR_GRADE=ENR_GRADE-10
WHERE SUB_NO=(SELECT SUB_NO FROM SUBJECT WHERE SUB_NAME='전자회로실험');

--10.20151062 학생이 소프트웨어공학 시험 중 부정행위로 0점이되었다.
UPDATE ENROL
SET ENR_GRADE=0
WHERE STU_NO=20151062;
--11.20153088 학생이 자퇴하였다.
DELETE FROM STUDENT1
WHERE STU_NO=20153088;

--12.과목번호 112, 과목이름 자동화시스템, 교수명 고종민, 학년 3, 학과 기계가 추가되었다.
INSERT INTO SUBJECT VALUES(112,'자동화시스템','고종민',3,'기계');
--13.과목번호가 110에서 501로 변경되었다.
UPDATE SUBJECT SET SUN_NO=501 WHERE SUB_NO=110;

--14.과목번호 101이 폐강되었다.
DELETE FROM SUBJECT WHERE SUB_NO=101;

--15.enroll 테이블에서 subject1에 없는 과목번호를 999로 변경하라.
UPDATE FROM ENROL1 SET SUB_NO=999 WHERE SUB_NO NOT IN(SELECT SUB_NO FROM SUBJECT1);
--16.enroll 테이블에서 student1에 없는 학번을 99999999로 변경하라.
UPDATE ENROL1 SET STU_NO=99999999
WHERE STU_NO NOT IN (SELECT STU_NO FROM STUDENT1);
--17.enroll에서 과목번호 999를 삭제하라.
DELETE FROM ENROL1 WHERE SUB_NO = 999;
--18.enroll에서 학번 99999999를 삭제하라.
DELETE FROM ENROL1 WHERE STU_NO=99999999;
--19.enroll에 없는 과목들을 삭제하라.
DELETE FROM SUBJECT1
WHERE SUB_NO NOT IN (SELECT SUB_NO FROM ENROLL);
--20.enroll 전체 테이블의 데이터를 삭제하라.
DELETE FROM ENROL1;

--DDL(Data Definition Language)
--테이블 생성?
CREATE TABLE TEST1
(KID VARCHAR2(10),
U_DATE DATE);
DESC TEST1;

DESC STUDENT;
DESC EMP;

--학생테이블에서 기계과 학생들에 대한 테이블을 만들어라?
CREATE TABLE T_STUDENT1
AS
SELECT * FROM STUDENT1 WHERE STU_DEPT='기계';

SELECT * FROM T_STUDENT1;
DESC T_STUDENT1;
--Column명과 데이터 타입에 따라 구성해서 말합니다.

--새로운 열을 추가하는 방법?
ALTER TABLE T_STUDENT1
ADD(ARMY CHAR(5));
DESC T_STUDENT1;
SELECT * FROM T_STUDENT1;
--열의 구조를 변겨아는 방법?
ALTER TABLE T_STUDENT
MODIFY(ARMY NUMBER(5));
DESC T_STUDENT;

--열의 삭제하는 방법?
ALTER TABLE T_STUDENT
DROP(ARMY);
DESC T_STUDENT;

--컬럼명을 바꾸는 방법?
ALTER TABLE T_STUDENT
RENAME COLUMN STU_HEIGHT TO STU_HT;
DESC T_STUDENT;
SELECT EMPNO AS 사원번호 FROM EMP;
DESC EMP;
--테이블 이름변경하는 방법?
RENAME T_STUDENT1 TO TEST_STUDENT1;
SELECT * FROM TEST_STUDENT1;

TRUNCATE TABLE TEST_STUDENT1;
DELETE FROM TEST_STUDENT1;
SELECT * FROM TEST_STUDENT1;
ROLLBACK;
DESC TEST_STUDENT1;
DROP TABLE TEST_STUDENT1;
SELECT * FROM TEST_STUDENT1;

--제약조건?
--NOT NULL?
CREATE TABLE T_STUDENT(
STU_NO CHAR(9),
STU_NAME VARCHAR2(12),
STU_DEPT VARCHAR2(20)
CONSTRAINT NN_STU_DEPT NOT NULL,
STU_GRADE NUMBER(5),
STU_CLASS CHAR(1),
STU_GENDER CHAR(1),
STU_HEIGHT NUMBER(5),
STU_WEIGHT NUMBER(5));
DESC T_STUDENT;

--제약조건을 모니터하는 방법?
SELECT *
FROM USER_CONSTRAINTS
WHERE TABLE_NAME='T_STUDENT';