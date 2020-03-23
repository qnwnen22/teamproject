-- 팀프로젝트 member 테이블
drop table member;

create table member(
userid varchar2(200) primary key, -- 아이디
passwd varchar2(200) not null, -- 비밀번호
name varchar2(200) not null, -- 이름
email varchar2(200) not null, -- 이메일
hp varchar2(200) not null, -- 핸드폰
birth varchar2(200) not null, -- 생년월일
addr1 varchar2(200) not null, --우편번호
addr2 varchar2(200) not null, --주소
addr3 varchar2(200) not null, --상세 주소
join_date date default sysdate, -- 가입날짜
point number default 0 -- 포인트
);

delete member;

insert into member (userid,passwd,name,email,hp,birth,addr1,addr2,addr3)
values('cksgh1103','1234','박찬호','cksgh1103@gmail.com','01011111111','000101','00001','주소','상세 주소');
insert into member (userid,passwd,name,email,hp,birth,addr1,addr2,addr3)
values('khm932001','1234','문찬영','khm932001@gmail.com','01022222222','000202','00002','주소','상세 주소');
insert into member (userid,passwd,name,email,hp,birth,addr1,addr2,addr3)
values('jang6845','1234','장성열','jang6845@gmail.com','01033333333','000303','00003','주소','상세 주소');
insert into member (userid,passwd,name,email,hp,birth,addr1,addr2,addr3)
values('hyun8503','1234','이지현','hyun8503@gmail.com','01044444444','000404','00004','주소','상세 주소');
insert into member (userid,passwd,name,email,hp,birth,addr1,addr2,addr3)
values('weather543210','1234','노정민','weather543210@gmail.com','01055555555','000505','00005','주소','상세 주소');
insert into member (userid,passwd,name,email,hp,birth,addr1,addr2,addr3)
values('qnwnen0228','1234','이원혁','qnwnen0228@gmail.com','01040817964','960228','12791','경기도 광주시 쌍령동 60-12 (미래센스빌)','100동 1000호');

select * from member;

commit;