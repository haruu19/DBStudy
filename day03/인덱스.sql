-- 인덱스
/*
데이터를 빠르게 검색하기 위한 개체
B*트리 검색방식으로 디스크 입출력 횟수를 줄이다.
논리적, 물리적으로 테이블과 독립적인 공간으로 관리된다.
인덱스는 자동으로 만들어지거나 사용자가 필요에 따라서 생성할 수 있다.
*/
-- 인덱스 생성하기
create index temp_emp_sal
on emp(sal);
-- 삭제
alter table emp drop index temp_emp_sal;