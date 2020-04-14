-- 상품정보를 저장할 수 있는 테이블을 구성하여 보자.
create table product(
	pcode int,
    pname varchar(20),
    price int,
    pcompany varchar(10),
    pnum int,
    primary key(pcode)
);

-- 상품 데이터를 5개 이상 저장하는 SQL을 작성하여 보자.
insert into product values(101,'aaatv',1500000,'samsung',5);
insert into product values(103,'bbbref',2000000,'samsung',3);
insert into product values(301,'ccctv',3000000,'samsung',5);
insert into product values(501,'dddref',6000000,'lg',2);
insert into product values(503,'eeetv',2500000,'lg',4);

-- 상품을 세일하려고 한다. 15% 인하된 가격의 상품 정보를 출력하세요.
select pcode, pname, round(price*0.85) as saledprice, pcompany, pnum 
  from product;

-- TV 관련 상품을 가격을 20% 인하하여 저장하세요. 그 결과를 출력하세요
update product set price = 0.8 * price;
select * from product;

-- 저장된 상품 가격의 총 금액을 출력하는 SQL 문장을 작성하세요.
select sum(price) as '총 금액'
from product;