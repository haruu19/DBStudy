
/* 테이블 제약조건 -- 회사 주 질문 !!
	1. primary key : not null + unique
	2. not null : 값이 반드시 입력되어야 한다.
    3. unique : 입력된 값이 고유해야한다. (null은 허용)
    4. check : 입력값을 체크
    5. foreign key : 같은 테이블 또는 다른 테이블의 컬럼을 참조한다.
*/

-- 컬럼 레벨 제약조건 설정
create table tb_book(
	id int auto_increment primary key,
    name varchar(30) not null,
    price int check(price>0),
    isbn varchar(14) unique,
    pub_date datetime default now()
);
-- foreign key 제외한 제약조건을 살펴보자
insert into tb_book(price, isbn) values(100,'abcde');

insert into tb_book(name, price, isbn) values('hong',-100,'abcde');
insert into tb_book(name, price, isbn) values('hong',100,'abcde');

select * from tb_book;

insert into tb_book(name, price, isbn) values('kang',200,'abcde');

-- 테이블 레벨 제약조건 설정 : not null 제약조건은 컬럼레벨만 가능, 복합컬럼 primary key 설정은 테이블 레벨만 가능
drop table tb_board;
create table tb_board(
	no int auto_increment,
    title varchar(30) not null,
    primary key(no)
);

create table tb_comment (
	comment_no int auto_increment primary key,
    no int,
	foreign key(no) references tb_board(no)
);

insert into tb_board(title) values('a');
insert into tb_board(title) values('b');
select * from tb_board;
insert into tb_comment(no) values(3);
-- Error Code: 1452. 
-- Cannot add or update a child row: a foreign key constraint fails 
-- (`scott`.`tb_comment`, CONSTRAINT `tb_comment_ibfk_1` FOREIGN KEY (`no`) REFERENCES `tb_board` (`no`))
insert into tb_comment(no) values(1);
select * from tb_comment;

-- tb_comment 자식테이블에서 참조하기 때문에 삭제 불가능
delete from tb_board where no=1;

-- tb_comment 자식테이블에서 참조하기 때문에 삭제 불가능
update tb_board set no = 100 where no = 1;

-- tb_board 의 no가 1인 값을 참조하는 모든 자식들의 데이터를 삭제하고 tb_board no가 1인것을 삭제(성공)
-- 굉장히 불편하다..
delete from tb_comment where no = 1;
delete from tb_board where no = 1; -- 부모를 삭제하려면 먼저 부모를 참조하는 자식들을 순서대로 삭제한다

drop table tb_comment;
drop table tb_board;

create table tb_board(
	no int auto_increment,
    title varchar(30) not null,
    primary key(no)
);
insert into tb_board(title) values('a');
insert into tb_board(title) values('b');
create table tb_comment (
	comment_no int auto_increment primary key,
    no int,
	foreign key(no) references tb_board(no) on delete cascade
);

select * from tb_board;
insert into tb_comment(no) values(1);


drop table tb_comment;
drop table tb_board;

create table tb_board(
	no int auto_increment,
    title varchar(30) not null,
    primary key(no)
);
insert into tb_board(title) values('a');
insert into tb_board(title) values('b');

-- 부모 컬럼의 값이 삭제되면 자신도 같이 삭제
-- foreign key(no) references tb_board(no) on delete cascade

-- 부모 컬럼 값이 삭제되면 자신의 컬럼 값을 널로 설정
create table tb_comment (
	comment_no int auto_increment primary key,
    no int,
	foreign key(no) references tb_board(no) on delete set null
);
select * from tb_board;
insert into tb_comment(no) values(1);
select * from tb_comment;
delete from tb_board where no = 1;

/*
	트랜잭션
    
    데이터를 완전하게 데이터베이스에 적용한다. (커밋 : commit)
    이전 커밋한 위치까지 되돌린다. (롤백 : rollback)
    DDL 명령어(create, drop..)는 자동 커밋이 된다.
    DML(insert, delete, update)이 트랜잭션의 대상이 된다.
*/
create table tb_tran(
	no int,
    title varchar(30)
);
commit; -- 자동 발생함

insert into tb_tran(no, title) values(1,'a');

select * from tb_tran;

rollback;

