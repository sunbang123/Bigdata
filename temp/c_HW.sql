--학생테이블과 수강테이블을 Natural Join 하라.?

SELECT * 
FROM STUDENT NATURAL JOIN SUBJECT;

-- 학번, 이름, 과목이름, 점수를 검색하라.(equi join)
SELECT STUDENT.STU_NO,STU_NAME,STU_DEPT,ENR_GRADE
FROM STUDENT,ENROL
WHERE STUDENT.STU_NO=ENROL.STU_NO;

--?과목이름과 학번, 점수를 검색하라.(natural join)
SELECT STU_NO,STU_NAME,STU_DEPT,ENR_GRADE
FROM STUDENT NATURAL JOIN ENROL;

--?과목이름과 학번, 점수를 검색하라( join ~ using)
SELECT STU_NO,STU_NAME,STU_DEPT,ENR_GRADE
FROM STUDENT JOIN ENROL USING(STU_NO);

--?점수가 70점 이상인 학생 이름을 검색하라(equl join)
SELECT ENROL.STU_NO,STU_NAME
FROM STUDENT
JOIN ENROL ON(STUDENT.STU_NO=ENROL.STU_NO)
WHERE ENR_GRADE>=70;

--?점수가 60점 이상인 학생 이름을 검색하라(join ~ using)
SELECT STU_NAME
FROM STUDENT JOIN ENROL USING(STU_NO)
WHERE ENR_GRADE>=60;