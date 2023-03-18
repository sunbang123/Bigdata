SELECT STUDENT.STU_NO, STUDENT.STU_NAME
FROM STUDENT
JOIN ENROL ON STUDENT.STU_NO = ENROL.STU_NO
JOIN SUBJECT ON ENROL.SUB_NO = SUBJECT.SUB_NO
WHERE SUBJECT.SUB_NAME = '�����۹�' OR SUBJECT.SUB_NAME = '�������ڽ���'
ORDER BY SUBJECT.SUB_NO;

SELECT * FROM SUBJECT;

SELECT STU_NO, STU_NAME
FROM STUDENT
NATURAL JOIN ENROL
NATURAL JOIN SUBJECT
WHERE SUB_NAME = '�����۹�' OR SUB_NAME = '�������ڽ���'
ORDER BY STU_NO;

SELECT STUDENT.STU_NO, STUDENT.STU_NAME
FROM STUDENT
JOIN ENROL ON STUDENT.STU_NO = ENROL.STU_NO
JOIN SUBJECT ON ENROL.SUB_NO = SUBJECT.SUB_NO
WHERE STUDENT.STU_GENDER = 'F' OR SUBJECT.SUB_PROF = '������'
ORDER BY STUDENT.STU_NO;

SELECT *
FROM SUBJECT;

---------------------------------------

SELECT TABLE_NAME
FROM USER_TABLES;

SELECT *
FROM STUDENT;

--�л����̺��� ������ Ű�� 160~170���̿� �л������� �˻��϶�.
SELECT *
FROM STUDENT
WHERE STU_GENDER='F'
AND STU_HEIGHT BETWEEN 160 AND 170;

--�������̺�(ENROL)���� 2015�й��̸��� �л��鿡 ���� ������ ���̺��� ������?
SELECT * FROM ENROL;
CREATE TABLE A_ENROL
AS
SELECT *
FROM ENROL
WHERE STU_NO<20150000;

SELECT * FROM A_ENROL;

--20151062�й��� ���� �������л��� 108�� ����Ʈ������� ������ �����Ͽ�
--92�� �����͸� �Է��ϴ� �����.
--INSERT()���� �����ϴ� ���?
--INSERT INTO <T/N>(C/N)VALUES(����)
INSERT INTO A_ENROL (SUB_NO,STU_NO,ENR_GRADE)
VALUES(108,20151062,92);
SELECT * FROM A_ENROL;
--���� ����� ���Ǽ���(��������) �����.
--20152088�л��� �����ȣ 109�л��� 85���� ����Ͽ���?
INSERT INTO A_ENROL VALUES(109,20152088,85);
SELECT * FROM A_ENROL;

--20152088���ο� �л��� �ڵ�����(110)���������� �������ϰ� �̸� ����ϴ°��
--����� ���.
INSERT INTO A_ENROL VALUES(110,20152088,NULL);
SELECT * FROM A_ENROL;
INSERT INTO A_ENROL(SUB_NO,STU_NO)
VALUES(110,20152088);
SELECT * FROM A_ENROL;

--����������ϴ� ���?
SELECT * FROM ENROL ORDER BY STU_NO;
SELECT * FROM A_ENROL;

INSERT INTO A_ENROL
SELECT * FROM ENROL
WHERE STU_NO LIKE '2015%';

SELECT * FROM A_ENROL;

--UPDATE()
--A_ENROL���̺��� ��� ������ 5���� �÷��� ����϶�?
--UPDATE <T/N> SET <C/N><����Ǵ� ���ప>
UPDATE A_ENROL
SET ENR_GRADE=ENR_GRADE+5;

--�����ȣ(SUB_NO)�� 101���� �л����� ������ 5�� �߰��϶�?
UPDATE A_ENROL
SET ENR_GRADE=ENR_GRADE+5
WHERE SUB_NO=101;

SELECT * FROM A_ENROL;

--�����̸�(SUB_NAME)�� '�ý��ۺм�����'�� �����ȣ�� �л������� 10��
-- �߰��϶�?
UPDATE A_ENROL
SET ENR_GRADE=ENR_GRADE+10
WHERE SUB_NO=(SELECT SUB_NO FROM SUBJECT WHERE SUB_NAME='�ý��ۺм�����');

SELECT SUB_NO FROM SUBJECT WHERE SUB_NAME='�ý��ۺм�����';

--DELETE()?
--DELETE FROM <T/N> WHERE <C>
DELETE FROM A_ENROL
WHERE STU_NO=20131001;
SELECT * FROM A_ENROL;

--�����ǹ��̶�? SELECT���� �� SELECT���� �ִ� �����̶� �ϴµ�..(���� �ΰ��ΰ�츦 �ǹ���)
SELECT * FROM STUDENT;
--�л����̺��� ����ö �л��� �����Ժ��� ���ſ� �л����� ������ ����϶�?
SELECT *
FROM STUDENT
WHERE STU_WEIGHT>(SELECT STU_WEIGHT FROM STUDENT WHERE STU_NAME='����ö');

--A_ENROL ���̺��� �����̸��� '����Ҽ���'�� �����ȣ�� ���� �а���ȣ�� �����϶�?
DELETE FROM A_ENROL
WHERE SUB_NO=(SELECT SUB_NO FROM SUBJECT WHERE SUB_NAME='����Ҽ���');
SELECT SUB_NO FROM SUBJECT WHERE SUB_NAME='����Ҽ���';
SELECT * FROM A_ENROL;

--������ ����?
DELETE FROM A_ENROL;

--TCL(TRANACTION CONTROL LANGUAGE):COMMIT/ROLLBACK
CREATE TABLE A_STUDENT
AS
SELECT *
FROM STUDENT
WHERE STU_DEPT IN('���', '��������');
CREATE TABLE B_STUDENT
AS
SELECT *
FROM STUDENT
WHERE STU_DEPT IN('��������', '��ǻ������');

SELECT * FROM A_STUDENT;
SELECT * FROM B_STUDENT;

DELETE FROM B_STUDENT;
SELECT * FROM B_STUDENT;
ROLLBACK;

--���࿡ DDL(CREATE()/ALTER()/TRUNCATE()/DROP())�� ����Ǹ�
--�ڵ����� COMMIT()�� �ǹ�����.
CREATE TABLE C_STUDENT(
STU_NO NUMBER,
STU_AME CHAR(10));

SELECT * FROM A_STUDENT;
DELETE FROM A_STUDENT;
ROLLBACK;

SELECT * FROM A_STUDENT;
INSERT INTO A_STUDENT(STU_NO,STU_NAME)
VALUES(10,'ȫ');
SELECT * FROM A_STUDENT;
COMMIT;
SELECT TABLE_NAME FROM USER_TABLES;

-- DML�� ���������Դϴ�.
--�������� FOR DML?
--1.������̺�(EMP)�� �̿��Ͽ� �μ���ȣ(DEPTNO)�� 20,30�� �μ���
--��������� EMP1�� ���̺�� ������?

CREATE TABLE EMP1 AS
SELECT *
FROM EMP
WHERE DEPTNO IN (20, 30);

SELECT * FROM EMP;
SELECT * FROM EMP1;

--2.�μ����̺�(DEPT)�� �����Ͽ� DEPT1���̺��� ������?

CREATE TABLE DEPT1 AS
SELECT *
FROM DEPT;

--3.�޿�������̺�(SALGRADE)�� SALGRADE1���̺��� ������?

SELECT TABLE_NAME FROM USER_TABLES;
SELECT * FROM ENROL;

CREATE TABLE SALGRADE1 (
    GRADE NUMBER,
    LOSAL NUMBER,
    HISAL NUMBER
);

INSERT INTO SALGRADE1 (GRADE, LOSAL, HISAL) VALUES (1, 700, 1200);
INSERT INTO SALGRADE1 (GRADE, LOSAL, HISAL) VALUES (2, 1201, 1400);
INSERT INTO SALGRADE1 (GRADE, LOSAL, HISAL) VALUES (3, 1401, 2000);
INSERT INTO SALGRADE1 (GRADE, LOSAL, HISAL) VALUES (4, 2001, 3000);
INSERT INTO SALGRADE1 (GRADE, LOSAL, HISAL) VALUES (5, 3001, 9999);

SELECT * FROM SALGRADE1;


--4.�����ȣ7703,����̸�JOSH,������� SALESMAN,����ڻ����ȣ 7566,
--�޿�1400,Ŀ�̼�0,�μ���ȣ20�� ����� ���� �Ի��Ͽ���.

INSERT INTO EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES (7703, 'JOSH', 'SALESMAN', 7566, SYSDATE, 1400, 0, 20);

INSERT INTO SALGRADE (GRADE, LOSAL, HISAL)
VALUES (6, 1400, 1400);


--5.�����ȣ7401,����̸� HOMER,�޿�1300,�μ���ȣ10�� ����� �Ի��Ͽ���.

--6.�����ȣ7323,����̸� BRANDA,�μ���ȣ30,�����ȣ7499�� ������ �޿��� �޴�
--����� ���� �Ի��Ͽ���.

--7.������̺��� �μ���ȣ��10�� �����͸� EMP1���̺� �����϶�?

--8.�����ȣ 7369�� ��������� ANALYST�� �ٲٽÿ�?

--9.�μ���ȣ 20�� �������� �޿��� 10%���϶�?

--10.��� ����� �޿��� 100�����϶�?

--11.�����ȣ 7902�� ����ڻ����ȣ�� 7654, �μ���ȣ�� 30���� �ٲٶ�?

--12.������ DALLAS�� ������� �޿��� 10���϶�?

--13.�޿������ 2�� ������� �޿��� 20���϶�?

--14.�����ȣ 7499�� ����Ͽ���.

--15.�μ���ȣ50,�μ��̸�'PLANNING',���� 'MIAMI'�� �߰��Ǿ���.

--16.�μ���ȣ�� 40�� �μ��� 60���� ����Ǿ���.

--17.�μ���ȣ�� 30�� �μ��� ���� �Ǿ���.

--18.DEPT1 ���̺� ���� �μ���ȣ���� ���� �ִ� ������� �μ���ȣ�� 99�κ����϶�?

--19.EMP1���� 99�� �μ���ȣ�� �����϶�

--20.����� �����ȣ�� ���� ����� �޿��� 100�÷ȴ�.

--21.JONES,JOSH,CLARJ�� �μ���ȣ�� 30���μ��� �ٲ����.

--22.Ŀ�̼��� NULL�� �����͸� 0���� �ٲپ��?

--23.EMP1��ü ���̺��� �����϶�?
