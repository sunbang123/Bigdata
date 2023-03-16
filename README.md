# Bigdata
빅데이터 분석 및 시각화 공부 기록입니다.

# 사용자 등록

* ID/PW 생성
CREATE USER (사용 예정 임의 ID) IDENTIFED BY (임의 비밀번호);

* 권한 부여
GRANT RESOURCE,CONNECT DBA (위에서 부여한  ID);

# view table 만들기

SQLPLUS SYSTEM/123456

SQL> GRANT CREATE VIEW TO SCOTT;
