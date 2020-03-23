--팀프로젝트 쿠폰 테이블
drop table coupon;

-- 쿠폰 목록 테이블
create table coupon(
coupon_idx varchar2(200) primary key,
coupon_name varchar2(200) not null,
point number default 0,
coupon_text varchar2(200)
);

insert into coupon (coupon_idx,coupon_name,point,coupon_text)
values ('a','회원가입 쿠폰',10000,'회원가입 시 지급되는 무료쿠폰입니다. (회원가입 시 지급');
insert into coupon (coupon_idx,coupon_name,point,coupon_text)
values ('b','친구추천 이벤트 쿠폰',5000,'친구에게 사이트를 추천하고 쿠폰을 받으세요. (추천한 친구가 회원가입 시 지급)');
insert into coupon (coupon_idx,coupon_name,point,coupon_text)
values ('c','제휴 사이트 가입 쿠폰',1000,'@@홈페이지에서 회원가입을 하면 쿠폰을 드려요. (@@홈페이지 회원가입 시 지급');

select * from coupon;

drop table coupon_box;
-- 쿠폰함 테이블
create table coupon_box(
userid varchar2(200) not null,
coupon_idx varchar2(200) not null
);

alter table coupon_box add constraint fk_coupon
foreign key(coupon_idx) references coupon(coupon_idx);

alter table coupon_box add constraint fk_member
foreign key(userid) references member(userid);

insert into coupon_box(userid,coupon_idx)
values('qnwnen0228','a');


select * from member;
select * from coupon;
select * from coupon_box;

desc coupon_box;

--userid에 a 라는 쿠폰이 있습니까?
select coupon_idx from coupon_box
where userid='qnwnen0228' and coupon_idx='a';

--userid에 a 라는 쿠폰이 있습니까?
select coupon_idx from coupon_box
where userid='qnwnen0228' and coupon_idx='b';

commit;