## 원하는 조건만 골라내기 - WHERE 절

```
SELECT [Column or Expression]
FROM [Table or View]
WHERE 원하는 조건;
```

- &(엠퍼센트) 기호를 통해 사용자에게 값을 입력받을 수 있다.
- 예시
```
SELECT empno, ename, sal
FROM emp
WHERE empno = &empno;
```