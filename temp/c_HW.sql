--�л����̺�� �������̺��� Natural Join �϶�.?

SELECT * 
FROM STUDENT NATURAL JOIN SUBJECT;

-- �й�, �̸�, �����̸�, ������ �˻��϶�.(equi join)
SELECT STUDENT.STU_NO,STU_NAME,STU_DEPT,ENR_GRADE
FROM STUDENT,ENROL
WHERE STUDENT.STU_NO=ENROL.STU_NO;

--?�����̸��� �й�, ������ �˻��϶�.(natural join)
SELECT STU_NO,STU_NAME,STU_DEPT,ENR_GRADE
FROM STUDENT NATURAL JOIN ENROL;

--?�����̸��� �й�, ������ �˻��϶�( join ~ using)
SELECT STU_NO,STU_NAME,STU_DEPT,ENR_GRADE
FROM STUDENT JOIN ENROL USING(STU_NO);

--?������ 70�� �̻��� �л� �̸��� �˻��϶�(equl join)
SELECT ENROL.STU_NO,STU_NAME
FROM STUDENT
JOIN ENROL ON(STUDENT.STU_NO=ENROL.STU_NO)
WHERE ENR_GRADE>=70;

--?������ 60�� �̻��� �л� �̸��� �˻��϶�(join ~ using)
SELECT STU_NAME
FROM STUDENT JOIN ENROL USING(STU_NO)
WHERE ENR_GRADE>=60;