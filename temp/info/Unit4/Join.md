## Join

- 정규화 : 컬럼이 많을 경우 중복되는 데이터의 비효율적인 작업을 줄이기 위한 방법.
    - 관계형 데이터베이스(RDBMS)에서 핵심적인 기능을 한다.
- 여러 테이블에 흩어져 있는 데이터들을 조합해서 가져오는 기술

- Oracle Join

```
SELECT table1.col1, table1.col1
FROM table1 alias1, table2 alias2
WHERE table1.col2 = table2.col2;
```

- ANSI Join

```
SELECT table1.col1, table1.col1
FROM table1 alias1 JOIN table2 alias2
ON table1.col2 = table2.col2;
```