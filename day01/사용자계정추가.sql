-- 사용자 계정 추가하기
-- create 객체[table, user, view, function, ....] 객체명;
-- create user '사용자아이디'@'외부접속정보' identified by '패스워드';
-- create user 'gumi3'@'192.168.0.144' identified by '패스워드';
-- create user 'gumi3'@'localhost' identified by '패스워드';
-- 실행 시 ctrl + Enter키
create user 'gumi3'@'%' identified by 'gumi3';

-- 데이터베이스 보기
show databases;

-- 권한 보기
show grants;

-- 특정 유저에게 권한 부여하기
-- create database 데이터베이스명;
-- create database 데이터베이스명 default character set 값 collate 값;

create database gumiDB default character set utf8 collate utf8_general_ci;