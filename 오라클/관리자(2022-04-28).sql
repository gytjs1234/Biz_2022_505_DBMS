--여기는 관리자 화면
--C:\oraclexe\data

/*

오라클 DBMS에 데이터를 저장하고 관리하기 위한 절차

관리자 접속하여
1. TABLESPACE생성
2.사용자생성 및TABLESPASE연결
3.사용자에게 권한부여

*/
CREATE TABLESPACE school
DATAFILE 'C:/oraclexe/data/school.dbf'/*다른운영체제와 호환하기위해 공통으로 쓰기위해*/
SIZE 1M AUTOEXTEND ON NEXT 1K;     

/*TABLESPACE생성완료*/

--사용자와 데이터연결
CREATE USER user2 IDENTIFIED BY 12341234
DEFAULT TABLESPACE   school;


/*user생성완료*/

GRANT DBA TO user2;