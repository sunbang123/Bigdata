--JOIN()�� ��������...
--1. ������̺�� �μ����̺��� NATURAL JOIN���� �����϶�?
SELECT * FROM EMP;
SELECT * FROM DEPT;
SELECT * FROM EMP NATURAL JOIN DEPT;
--2. ���� ������ ���뱸���� ���ι����� �����϶�?(EQUAL JOIN)
SELECT EMP.DEPTNO,DNAME,ENAME
FROM EMP,DEPT
WHERE EMP.DEPTNO=DEPT.DEPTNO;
--3. ���� ������ ���̺��� �����ȣ,����̸�,�μ��̸��� �˻��϶�(NATURAL JOIN)
SELECT EMPNO,ENAME,DEPTNO
FROM EMP NATURAL JOIN DEPT;
--4. �����ȣ, ����̸�, �μ��̸��� �˻��϶�(JOIN~USING)
SELECT EMPNO,ENAME,DNAME FROM EMP JOIN DEPT USING(DEPTNO);
--5. ���� ������ JOIN~ON���� �˻��϶�?
SELECT EMPNO,DEPT.DEPTNO,ENAME,DNAME FROM EMP JOIN DEPT ON(EMP.DEPTNO=DEPT.DEPTNO);
--6. ������ NEW YORK�� ����̸��� �˻��϶�?(EQUAL JOIN)
SELECT ENAME
FROM EMP,DEPT
WHERE EMP.DEPTNO=DEPT.DEPTNO
AND LOC='NEW YORK';
--7. ���� ������ NATURAL JOIN���� �����϶�?
SELECT A.ENAME
FROM EMP A JOIN DEPT B ON(A.DEPTNO=B.DEPTNO)
WHERE LOC='NEW YORK'
ORDER BY EMPNO;
--8. ���� ������ JOIN~USING���� �˻��϶�?

--9. ���� ������ JOIN~ON���� �˻��϶�?

--10. ������ NEW YORK�� ����� �����ȣ, ����̸��� �����ȣ ������ �˻��϶�?
SELECT EMPNO,ENAME
FROM EMP,DEPT
WHERE EMP.DEPTNO=DEPT.DEPTNO
AND LOC='NEW YORK'
ORDER BY EMPNO;

--11.ADAMS����� �ٹ����� �μ��̸��� ������ �˻��϶�?(EQUAL JOIN)
--12.���� ������ JOIN~USING�� �˻��϶�?
--13.���� ������ JOIN~ON���� �˻��϶�?
--14.���� ������ NATURAL JOIN���� �˻��϶�?
--15.�޿��� 2000�̻��� ������� ������ ������ �˻��϶�?
--[EQUAL JOIN/NATURAL JOIN/JOIN~USING/JOIN~ON]

--16.�޿��� 1000�̻� 2000������ ������� �����ȣ,����̸�
--�����ȣ ������ �˻��϶�?
--[EQUAL JOIN/NATURAL JOIN/JOIN~USING/JOIN~ON]


--17.��������� SALESMAN�̸鼭 CHICAGO������ �ٹ����� ������� �˻��϶�?
--[EQUAL JOIN/NATURAL JOIN/JOIN~USING/JOIN~ON]

--18.NEW YORK�̳� DALLAS������ �ٹ��ϴ� ������� �����ȣ�� ����̸��� �����ȣ
--�˻��϶�?(EQUAL JOIN)

--19.�μ��̸��� ACCOUNTING�̰ų� ������ CHICAGO�� ����� �����ȣ�� ����̸���
--�˻��϶�?(EQUAL JOIN)

--20.18�� ������ NATURAL JOIN���� �˻��϶�?

--HAVING���� GROUP BY������ ������ �ʿ��� �ó������� ������ ����.
--��1)���� �л����� �г⺰ ��ս����� 160�̻��� �г�� ��ս����� ���϶�?
SELECT STU_GRADE,ROUND(AVG(STU_HEIGHT),1) AHT
FROM STUDENT
WHERE STU_DEPT='���'
GROUP BY STU_GRADE HAVING AVG(STU_HEIGHT)>=160;

--��2)�ִ������ 175�̻��� �а��� �а��� �ִ������ ���϶�?
SELECT STU_DEPT,MAX(STU_HEIGHT)
FROM STUDENT
GROUP BY STU_DEPT HAVING MAX(STU_HEIGHT)>=175;

--21.19�� ������ NATURAL JOIN���� �����϶�?
SELECT EMPNO,ENAME,DNAME,LOC
FROM EMP NATURAL JOIN DEPT
WHERE DNAME='ACCOUNTING' AND LOC='CHICAGO'
ORDER BY 2;
--22.�����ȣ, ����̸�, �޿�, �޿������ �޿���޺� �����ȣ ������ �˻��϶�?
SELECT EMPNO,ENAME,SAL,GRADE
FROM EMP,SALGRADE
WHERE SAL BETWEEN LOSAL AND HISAL
ORDER BY GRADE,EMPNO;

--23.�����ȣ ����̸�, ����ڻ����ȣ, ����� �̸��� �˻��϶�(EQUAL JOIN)
SELECT * FROM EMP;
SELECT A.EMPNO �����ȣ,A.ENAME ����̸�,B.EMPNO ����ڻ����ȣ,B.ENAME ����ڻ���̸�
FROM EMP A,EMP B 
WHERE A.MGR=B.EMPNO;
--24.���� ������ JOIN~ON���� �˻��϶�?
SELECT * FROM EMP;
SELECT A.EMPNO �����ȣ,A.ENAME ����̸�,B.EMPNO ����ڻ����ȣ,B.ENAME ����ڻ���̸�
FROM EMP A JOIN EMP B ON(A.MGR=B.EMPNO);
--25.BLAKE������� ���� �޿��� �޴� ����̸��� �˻��϶�(������)
SELECT ENAME
FROM EMP
WHERE SAL>(SELECT SAL FROM EMP WHERE ENAME='BLAKE');
--26.���� ������ SELF JOIN���� �����Ͻÿ�?
SELECT B.ENAME,B.SAL
FROM EMP A, EMP B
WHERE B.SAL>A.SAL
AND ENAME='BLAKE';
--27.FORD����� ���� �μ��� �ٹ��ϴ� ����̸��� �˻��϶�?
SELECT ENAME
FROM EMP
WHERE DEPTNO=(SELECT DEPTNO FROM EMP WHERE ENAME='FORD')
AND ENAME<>'FORD';
SELECT DEPTNO FROM EMP WHERE ENAME='FORD';
SELECT ENAME FROM EMP WHERE DEPTNO=20;
--28.FORD����� ���� �޿��� �޴� ����� �����ȣ�� �˻��϶�?
SELECT EMPNO, ENAME
FROM EMP
WHERE SAL=(SELECT SAL FROM EMP WHERE ENAME='FORD');
--29.�μ��� �ο����� �μ��̸��� �Բ� ����� ���� �μ������� �˻��϶�?
SELECT DNAME,COUNT(*)
FROM EMP NATURAL JOIN DEPT
GROUP BY DNAME
ORDER BY 2 DESC;
--30.�����ȣ, ����̸��� �������� ���� ���� ������ �˻��϶�?
SELECT B.EMPNO,B.ENAME,COUNT(*)
FROM EMP A JOIN EMP B ON(A.MGR=B.EMPNO)
GROUP BY B.EMPNO,B.ENAME
ORDER BY 3 DESC;
--31.�μ��̸��� 'SALES'�̸鼭 ��������� 'MANAGER'�� ����� �����ȣ, ����̸���
--����̸� ������ �˻��϶�?
SELECT EMPNO,ENAME
FROM EMP NATURAL JOIN DEPT
WHERE DNAME='SALES' AND JOB='MANAGER'
ORDER BY 2;
--32.SCOTT������� ���� �޿��� �޴� ��������� �˻��϶�?
SELECT * FROM EMP
WHERE SAL>(SELECT SAL FROM EMP WHERE ENAME='SCOTT');
--33.ALLEN������� ���� �޿��� �޴� ��������� �˻��϶�?
SELECT * FROM EMP
WHERE SAL<(SELECT SAL FROM EMP WHERE ENAME='ALLEN');
SELECT SAL FROM EMP WHERE ENAME='ALLEN';
--34.20�� �μ������ ��������� ���� �ٸ��μ��� ��������� �˻��϶�?
SELECT *
FROM EMP
WHERE JOB IN(SELECT JOB FROM EMP WHERE DEPTNO=20)
AND DEPTNO<>20;
--35.��ü����� ��ձ޿����� �޿��� ���� ��������� �˻��϶�?
SELECT * FROM EMP
WHERE SAL>(SELECT AVG(SAL) FROM EMP);
SELECT AVG(SAL) FROM EMP;
--36.�޿��� ��� �μ����� ��ձ޿����� ���� ��������� �˻��϶�?
SELECT * FROM EMP
WHERE SAL>ALL(SELECT AVG(SAL)
FROM EMP GROUP BY DEPTNO);
SELECT AVG(SAL) FROM EMP WHERE DEPTNO IN(10,20,30);
--37.20�� �μ��� �ִ�޿����� �ִ� �޿��� ū �μ��� ��ȣ�� �ִ�޿��� �˻��϶�?
SELECT DEPTNO,MAX(SAL)
FROM EMP
WHERE SAL>(SELECT MAX(SAL) FROM EMP GROUP BY DEPTNO HAVING DEPTNO=20)
GROUP BY DEPTNO;
--38.CHICAGO������ �ٹ��ϴ� ��ġ�ϴ� �μ����� �ٹ��ϴ� ��������� �˻��϶�(�� ������ ����Ұ�)
SELECT * FROM EMP WHERE DEPTNO=(SELECT DEPTNO
FROM DEPT WHERE LOC='CHICAGO');

-- HW. C, D, E!