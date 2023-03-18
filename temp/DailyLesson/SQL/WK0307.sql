SELECT TABLE_NAME FROM USER_TABLES;
--�ܼ��˻�?
DESC STUDENT;
DESC ENROL;
DESC SUBJECT;

--���̺��� ��� ������ �˻��ϴ� ��?
SELECT * FROM STUDENT;
--Ư������ �˻���?
SELECT STU_NO,STU_NAME FROM STUDENT;
--�ߺ�������?
SELECT STU_DEPT FROM STUDENT;

SELECT DISTINCT STU_DEPT FROM STUDENT;
SELECT DISTINCT STU_GRADE,STU_CLASS
FROM STUDENT;

--������ ������ �˻���?
SELECT * FROM ENROL;
SELECT STU_NO,SUB_NO,ENR_GRADE,ENR_GRADE+10
FROM ENROL;

--������� ��Ī(ALIAS)�ο��ϱ�?
--�л����̺��� �й��� ID,STU_NAME�� NAME�� ��Ÿ����
SELECT STU_NO ID,STU_NAME NAME
FROM STUDENT;

--���Ῥ����?
--�л����̺��� �й��� �л��̸��� �й��������� ����϶�?
SELECT STU_NO || STU_NAME AS �й�����
FROM STUDENT;

--���ǰ˻�?
--�а��̸��� ��ǻ���������� �л��̸� �а��̸� �г�� ���� ����϶�?
SELECT STU_NAME,STU_DEPT,STU_GRADE,STU_CLASS
FROM STUDENT
WHERE STU_DEPT='��ǻ������' OR STU_GRADE=2;

--��������?
--�л����̺��� �����԰� 60~70�� �л����� ������ �˻��϶�?
SELECT *
FROM STUDENT
WHERE STU_WEIGHT BETWEEN 60 AND 70;

--������������ 2014�й��� �л����� �˻��϶�?
SELECT *
FROM STUDENT
WHERE STU_NO BETWEEN 20140000 AND 20149999;

--LIKE�� �̿��� �˻�?
--�̰��� ���ϵ�ī�� ���ڿ� �Բ� �����.
--�达���� ���� �л����� ������ ����϶�?
SELECT *
FROM STUDENT
WHERE STU_NAME LIKE '��%'; --widcard
--���ϵ� ī�幮���� '_'�� �ڸ����� �ǹ���.
--�л��̸��� �ι�°�� ���� �л��� �˻��϶�?
SELECT *
FROM STUDENT
WHERE STU_NAME LIKE '_��%';-- �ι�°�� '��'��