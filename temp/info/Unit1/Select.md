## SELECT 명령을 이용하여 데이터 조회하기

```
SELECT [컬럼명 또는 표현식] FROM [테이블명, 뷰 명]
```

- 작은따옴표('')로 리터럴(상수, 문자)를 섞어서 쓸 수 있습니다.
    - 문자나 날짜 처리할때 무조건 사용합니다.

- 별칭 NAME AS

```
SELECT [컬럼명] NAME AS [별칭]
FROM [테이블명, 뷰 명]
```

- 중복값 제거

```
SELECT DISTINCT [컬럼명] FROM [테이블명, 뷰 명]
```

- 연결연산자 ||

```
SELECT [컬럼명] || [컬럼명]
FROM [테이블명, 뷰 명]
```