--팀프로젝트 vod테이블
drop table vod;

create table vod(
type number default 1, -- 판매타입
idx varchar2(200) primary key,-- 판매하는 상품의 index number
cetegory varchar2(200) not null, -- 상품 카테고리
subject varchar2(200) not null, -- 영상 제목
userid varchar2(200) not null, -- 아이디 foreign = member-userid
name varchar2(200) not null, -- 이름 foreign = member-name
image varchar2(200) not null, -- 영상 이미지
text varchar2(200) default '', -- 영상 설명
upload date default sysdate -- 업로드 날짜
);

delete vod;

insert into vod (type, idx, cetegory, subject, userid, name, image, text)
values (1,'00001','외국어','중국어 강의 1장','hyun8503','이지현','이미지파일.jpg','강의에 대한 내용');
insert into vod (type, idx, cetegory, subject, userid, name, image, text)
values (1,'00002','외국어','중국어 강의 2장','hyun8503','이지현','이미지파일.jpg','강의에 대한 내용');
insert into vod (type, idx, cetegory, subject, userid, name, image, text)
values (1,'00003','외국어','중국어 강의 3장','hyun8503','이지현','이미지파일.jpg','강의에 대한 내용');
insert into vod (type, idx, cetegory, subject, userid, name, image, text)
values (1,'00004','외국어','중국어 강의 4장','hyun8503','이지현','이미지파일.jpg','강의에 대한 내용');
insert into vod (type, idx, cetegory, subject, userid, name, image, text)
values (1,'00005','외국어','중국어 강의 5장','hyun8503','이지현','이미지파일.jpg','강의에 대한 내용');

select * from vod order by idx asc;

update vod set subject='중국어 강의' where userid='hyun8503';

commit;