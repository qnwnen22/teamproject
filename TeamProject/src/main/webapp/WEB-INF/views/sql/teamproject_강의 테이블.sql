--실시간 강의 테이블
drop table lecture;

create table lecture(
type number not null, -- 판매타입
id varchar2(200) not null primary key,-- 판매하는 상품의 index number
cetegory varchar2(200) not null, --상품 카테고리
userid varchar2(200) not null, -- 아이디 foreign = member-userid
name varchar2(200) not null, -- 이름 foreign = member-name
title varchar2(200) not null, -- 상품 제목
start_time varchar2(200) not null, -- 시작시간(view 전용)
end_time varchar2(200) not null, -- 종료시간(view 전용)
addr1 varchar2(200) not null, -- 강의 주소
addr2 varchar2(200) not null, -- 
lectrue_price number default 0,
lectrue_count number default 1
);

insert into lecture values
(1,'10001','IT','kim0001','김철수','현직 웹개발자의 실무수업','14:00','16:00','강남','##동##어디 어디',10000,10);

select * from lecture;