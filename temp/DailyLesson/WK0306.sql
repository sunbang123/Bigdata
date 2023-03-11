--��������� ���̺��� ���Ǵ� ��ɹ�
SELECT TABLE_NAME
FROM USER_TABLES;

--���̺��� ��Ȳ�� ������ϴ� ��ɾ��?
SELECT *
FROM EMP;

SELECT *
FROM DEPT;

SELECT *
FROM SALGRADE;
SELECT *
FROM BONUS;

--���̺��� ������ �����ִ� ��ɾ��?
DESC BONUS;

--������̺��� ������ �޿��� ����϶�?
SELECT JOB,SAL
FROM EMP;

--������̺��� ������ ������ �ߺ��� ���Ͽ� ����϶�
SELECT DISTINCT JOB
FROM EMP;

--������̺��� �����ȣ�� ����̸��� ���ļ� ����϶�
SELECT EMPNO ||'�� '|| ENAME -- ��ħ!
FROM EMP;

SELECT * FROM EMP;
--COMM�� ���� �ƴ� ���� ����϶�!
SELECT *
FROM EMP
WHERE COMM IS NOT NULL;

SELECT EMPNO AS �����ȣ,ENAME AS ����̸� -- AS ���� ����.
FROM EMP;

--������̺��� ������ SALES�� ����� ������ ����϶�?
SELECT *
FROM EMP
WHERE JOB='SALESMAN';

SELECT * FROM EMP;
--������̺��� SAL�� 1000-2000������ ����� ����϶�?
SELECT *
FROM EMP
WHERE SAL NOT BETWEEN 1000 AND 2000;

--������̺��� ������ �����̰ų� ��������� ��츦 ����϶�?
SELECT *
FROM EMP
WHERE JOB NOT IN('CLERK','SALESMAN');

--�������Լ�?
SELECT ABS(-100),ROUND(123,456,2),
CELL(-3.1),TRUNC(123.99956),FLOOR(3.998),FLOOR(-3.1)
FROM DUAL;

SELECT LOWER('ABCDEFG'),
UPPER('abcdefg') FROM DUAL;

SELECT INITCAP('abcdef defghi') FROM DUAL;
SELECT SUBSTR('ABCDEFG',3,2) FROM DUAL;
SELECT LENGTH('abcdefg') FROM DUAL;
SELECT INSTR('oRacle','c') from dual;
SELECT LPAD(ENAME,15,'#') FROM EMP;
SELECT RPAD(ENAME,15,'#') FROM EMP;
SELECT TRIM('O' FROM 'ORACLE') FROM DUAL;
SELECT SYSDATE+1 FROM DUAL;
SELECT LAST_DAY(SYSDATE) FROM DUAL;

SELECT * FROM EMP;
SELECT ENAME,SAL,COMM,NVL(COMM,0) FROM EMP;
SELECT ENAME,NVL2(COMM,SAL+COMM,SAL) AS SALARY
FROM EMP;

SELECT * FROM EMP;
--������̺��� �������� ��ձ޿��� ����϶�?
SELECT DEPTNO,ROUND(STDDEV(SAL),1)
FROM EMP
GROUP BY DEPTNO -- group �Լ��� ���������ν�...
ORDER BY 2; -- ��������!

SELECT MAX(SAL),MIN(SAL),MEDIAN(SAL),AVG(SAL),STDDEV(SAL)
ROUND(STDDEV(SAL))
FROM EMP;

--������̺��� ������ ��ձ޿��� 2000�̻��� ������� ������ ����϶�
SELECT JOB,ROUND(AVG(SAL),1)
FROM EMP
GROUP BY JOB
HAVING AVG(SAL)>=2000;

