--여기는 USER2화면
/*
처음을오 데이터를 저장하기 위해서 할일
1.등록된 사용자로 접속하기
2.TABLE생성
*/

/*입력되지않아도 되는 데이터가 추가되는경우를 방지하기위해 UNIQUE를 사용한다.
중복값안됨*/




/*TABLE을 만드는 SQL명령문 DDL이라고한다  표준SQL명령문, 데이터타입만다름 ex(nVARCHAR2(20)*/
CREATE TABLE tbl_student (        
	st_num	 VARCHAR2(5)	PRIMARY KEY,
	st_name	NVARCHAR2(20)   NOT NULL,
	st_tel	VARCHAR2(15)	UNIQUE NOT NULL,
	st_addr	nVARCHAR2(125)	NULL,
	st_dept	nVARCHAR2(5)	NULL,
	st_grad	NUMBER(1)	    NULL
);


--DROP TABLE tbl_student;
  
  --tbl_student table 에 데이터 추가하기
  --생성된 테이블에 데이터를 추가하는 행위를 data create라고 한다.
  
  INSERT INTO tbl_student(st_num,st_name,st_tel,st_dept)
  VALUES('00001','홍길동','010-111-1111','컴공과');
  
  INSERT INTO tbl_student(st_num,st_name,st_tel,st_dept)
  VALUES('00002','홍길','010-111-1112','전자과');
  
   INSERT INTO tbl_student(st_num,st_name,st_tel,st_dept)
  VALUES('00003','성춘향','010-111-1113','정보통신');  
  
  --저장된 데이터의 조회(query),읽기
  
  /*
  SELECT *:모든 칼럼을 다 표시하여 달라
  
  SELECT st_name,st_num:여러 칼럼중에서 st_name ,st_num만표시해달라
  projection:보고싶은 칼럼만보기
  */
  SELECT *
  FROM tbl_student;
  
  SELECT st_num, st_name,st_dept
  FROM tbl_student;
  
  
  --칼럼의 표시 순서를 변경하여보여달라
  
  SELECT st_num, st_name,st_tel,st_addr,st_grade,st_dept
  FROM tbl_student;
  
  /*selection:tbl_student에 저장된 이름이 홍길동인 사람만 보여달라 */
  SELECT *
  FROM tbl_student
  WHERE st_name='홍길동';
  /*
  SELECT명령수행
  PROJECTOIN:데이터를 조회할때 보고자 하는 칼럼만 표시하는것
  SELECTION:데이터를 조회할때 WHERE조건절을 붙여 필요한 데이터 리스트만 보는것
  
  PROJECTION을 하면 실제 칼럼보다 적은 양을 보여준다.
  SELECTION을 하면 실제 데이터 리스트보다 적은 야의 리스트를 보여준다.
  */
  /*
  전체 데이터를 조건없이 보여주되 이름(st_name칼럼)순으로 정렬(sort)하여 보여라.
  */
  --가나다(오름차순 정렬)
  SELECT *
  FROM tbl_student;
  ORDER BY st_name;
  
  --역순(내림림차순)
  SELECT *
  FROM tbl_student
  ORDER BY st_name DESC;
  
  INSERT INTO tbl_student( st_num, st_name,st_tel,st_dept)
  VALUES ('00004','장영실','010-3234-9007','컴공과');
  INSERT INTO tbl_student( st_num, st_name,st_tel,st_dept)
  VALUES ('00005','최순실','010-3234-9047','컴공과');
  
  --학과가 컴공과인 데이터만 SELECTION하여 이름 순으로 정렬해라
  SELECT *
  FROM tbl_student
  WHERE st_dept='컴공과'
  ORDER BY st_name;
  
  SELECT *
  FROM tbl_student
  WHERE st_dept='컴공과'
  ORDER BY st_name DESC;
  
  
  SELECT *
  FROM tbl_student
  ORDER BY st_dept,st_name;
  
  /*전체데이터를 학과명 순으로 정렬하고 학과명이 같은 데이터끼리는 이름순으로 정렬하라*/
  
  
  --전체 데이터의 개수가 몇개냐?
  SELECT COUNT(st_dept)
  FROM tbl_student;
  
  --학과별로 학생이 몇명인지 알고 싶다
  
  --3:묶인 그룹에 포함된 데이터가 몇개? 
SELECT st_dept,COUNT(st_dept) AS 학생수 
FROM tbl_student  --1:먼저 데이터 가져오기
GROUP BY st_dept;  --2:st_dept 가 같은 데이터까지 묶고

--*을쓰면 많은 양의 데이터를 읽어야해서 칼럼명을 쓰는게 좋다
SELECT COUNT (*)
FROM tbl_student;


--전체데이터중에 컴공과 학생이 몇명인가
SELECT COUNT(st_dept)
FROM tbl_student
WHERE st_dept='컴공과';

/*
도구에서 데이터를 추가,수정,삭제명령을 수행한 경우
ORCALE DBMS에게 요청을 한 상태가 된다
하지만 ORACLE DBMS는 아직 스토리지에 DBF 파일에 저장하지 않은 상태이다 
이상태에서 도구를 종료해버리면 ORACLE DBMS는 어떤 문제가 발생하여 종료된 것으로 생각하고 데이터를 지워버린다.
도구를 사용하여 접속하였을 경우느 도구를 종료하기 전에 반드시 COMMIT을 해주어야한다
*/
COMMIT;

SELECT *FROM tbl_student;
 
 INSERT INTO tbl_student (st_num,st_name,st_tel)
 VALUES('00006','신창원','010-111-2222');
 
 
 /*
 데이터를 추가 수정 삭제하고 아직 COMMIT되지 않은 상태에서추가, 수정, 삭제를 취소하는 명령
 */
 ROLLBACK;
 
 DELETE
 FROM tbl_student;
 
 
 /*
 DCL(Data Control Lang)
 사용자에게 권한을 부여(GRANT)하거나 회수(REVOKE)하는명령이 있고
 데이터를COMMIT또는 ROLLBACK하는 명령이 있다
 */

DROP TABLE tbl_student; 
 CREATE TABLE tbl_student(
 st_num	VARCHAR2(5)		PRIMARY KEY,
 st_name	nVARCHAR2(20)	NOT NULL,
 st_dept	nVARCHAR2(10)	,
 st_grade	NUMBER(1),	
st_tel	VARCHAR2(15)	NOT NULL UNIQUE,
 st_addr	NVARCHAR2(125)		
 );
 
 CREATE TABLE tbl_score(
 st_num	VARCHAR2(5)	PRIMARY KEY,
st_kor	NUMBER		,
st_ENG	NUMBER		,
st_MATH	NUMBER		,
st_HIS	NUMBER		,
st_MORAL	NUMBER	,	
sc_sci	NUMBER		
);

SELECT *
FROM tbl_student;

SELECT st_dept,COUNT(st_dept)
FROM tbl_student
GROUP BY st_dept
ORDER BY COUNT(st_dept) DESC;

SELECT st_dept,COUNT(st_dept) AS 학생수
FROM tbl_student
GROUP BY st_dept
ORDER BY COUNT(st_dept) DESC;

SELECT st_dept,COUNT(st_dept) AS 학생수
FROM tbl_student
GROUP BY st_dept
ORDER BY 학생수 DESC,st_dept;





 