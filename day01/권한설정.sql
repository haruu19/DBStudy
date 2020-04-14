show grants;
-- 권한설정
-- grant 권한목록 on 데이터베이스.객체 to '사용자아이디'@'외부접속정보'
-- grant select, delete, update, insert on gumiDB.emp to 'gumi3'@'%';
-- grant select, delete, update, insert on gumiDB.*
-- grant select, delete, update, insert on *.* 모든 db의 모든 객체
-- grant all privileges on *.*
grant all privileges on *.* to 'gumi3'@'%' with grant option;

-- revoke 
