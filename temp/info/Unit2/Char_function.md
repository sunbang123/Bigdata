## 문자 함수

- INITCAP('abcd') -> Abcd
- LOWER('ABCD') -> abcd
- UPPER('abcd') -> ABCD
- LENGTH('한글') -> 2
- LENGTHHB('한글') -> 4 // 문자열의 길이의 바이트 값을 출력!
- CONCAT('A','B') -> AB
- SUBSTR('ABC', 1, 2) -> AB // 특정 바이트만 출력!
- INSTR('A*B#', '#') -> 4
- INSTRB('한글로', '로') -> 5
- LPAD('love', 6, '*') -> **love
- RPAD('love', 6, '*') -> love**
- REPLACE('AB', 'A', 'E') -> EB

```
--공백 이후의 문자를 출력!
REGEXP_SUBSTR('ABC* *DEF $GHI%KJL','[^ ]+[DEF]')
FROM dual;


REGE
----
*DEF
```