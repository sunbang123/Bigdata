## 집합 연산자

- UNION : 두 집합의 결과를 합쳐서 출력, 중복값 제거, 정렬
- UNION ALL : 두 집합의 결과를 합쳐서 출력, 중복값 제거 안하고 정렬 안함.
- INTERSECT : 두 집합의 교집합을 출력 정렬
    - 정렬을 통해 교집합을 찾아내는 연산자이다.
    ```
    FROM STUDENT
    WHERE DEPTNO1 = 101
    INTERSECT
    SELECT STUNO, NAME
    FROM STUDENT
    WHERE DEPTNO2 = 201;
     STUDNO NAME
    ------- ------------
       9411 James Seo 
    ```
- MINUS : 두 집합의 차집합 결과를 출력 정렬.
    - 큰 결과를 가진 SELECT를 먼저 쓴 뒤 작은 결과를 가진 SELECT를 나중에 쓴다.