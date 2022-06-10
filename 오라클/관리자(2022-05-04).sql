--관리자 화면
--TABLESPACE 생성하기
--이름 :iolist
--데이터 파일(물리적저장소)C:/oraclexe/data/iolist.dbf
--초기사이즈지정 B적으면 안됨
--초기크기:1MB
--용량부족할경우:자동증가1KB씩
CREATE TABLESPACE iolist
DATAFILE 'C:/oraclexe/data/iolist.dbf'
SIZE 1M AUTOEXTEND ON NEXT 1K;

--TableSpace 삭제하기
DROP TABLESPACE iolist 
INCLUDING CONTENTS AND DATAFILES
CASCADE CONSTRAINTS;


