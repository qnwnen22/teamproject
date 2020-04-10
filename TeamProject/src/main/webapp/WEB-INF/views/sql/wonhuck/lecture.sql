drop table lecture;

create table lecture(
lecture_idx number not null, --영상의 인덱스 번호
cell_type varchar2(200), --판매 타입(영상=1, 온라인=2, 오프라인=3)
main_category varchar2(500), --메인 카테고리
sub_category varchar2(500), -- 서브 카테고리
userid varchar2(200) not null, -- kmodymember-userid foreign
subject varchar2(500), --영상 제목
main_img clob, --영상 썸네일(메인 이미지)
videofile clob, -- 동영상의 파일이름
content clob, --영상에 대한 설명
upload_date date default sysdate, --최초 업로드 날짜
price number default 0, -- 영상 가격
-- 여기서 부터는 실시간/현장 강의 칼럼
lecture_date varchar2(500), --강의 날짜
lecture_start varchar2(500), --강의 시작 시작
lecture_time varchar2(500), -- 강의 총 시간
lecture_address varchar2(500), -- 강의장 주소
lecture_address2 varchar2(500) --강의장 상세 주소
);

--drop sequence seq_lecture;

--create sequence seq_lecture
--start with 1
--increment by 1;
--
--alter table lecture add constraint fk_kmodymember
--foreign key(userid) references kmodymember(userid);
--
--commit;

select * from lecture where cell_type='2';
desc lecture;
commit; 
    
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--페이지 나누기 테스트를 위해 레코드 입력
declare --선언부
    i number := 1;
begin --실행부
    while i<=200 loop
        insert into lecture 
        (lecture_idx, cell_type, main_category,
		 sub_category, userid, subject, price, content )
        values
        (
        (select nvl(max(lecture_idx)+1,1) from lecture),
        '2','main'||i,'sub'||i,'qnwnen12','iop'||i,10000,'iop'||i
        );
        i := i+1; --조건 변경
    end loop;
end;
/

commit;

insert into lecture
		(lecture_idx, cell_type, main_category,
		 sub_category, userid, subject,
		 price, content, main_img, 
		 lecture_date, lecture_start, lecture_time,
		 lecture_address, lecture_address2 )
		values
		(
		 (select nvl(max(lecture_idx)+1, 1) from lecture),
		 '3', 'main1', 'sub1',
		 'kim', 'kim', 30000,
		 'kim', 'kim', 'kim',
		 'kim', 'kim', 'kim',
		 'kim'
);

select count(*) from lecture where cell_type=3 order by lecture_idx;

select * from lecture; where cell_type=1;

select * from kdemymember;
drop table lecture;

create table lecture(
lecture_idx number, --영상의 인덱스 번호
cell_type varchar2(200), --판매 타입(영상=1, 온라인=2, 오프라인=3)
main_category varchar2(500), --메인 카테고리
sub_category varchar2(500), -- 서브 카테고리
userid varchar2(200), -- kmodymember-userid foreign
subject varchar2(500), --영상 제목
main_img clob, --영상 썸네일(메인 이미지)
videofile clob, -- 동영상의 파일이름
content clob, --영상에 대한 설명
upload_date date default sysdate, --최초 업로드 날짜
price number default 0, -- 영상 가격
-- 여기서 부터는 실시간/현장 강의 칼럼
lecture_date varchar2(500), --강의 날짜
lecture_start varchar2(500), --강의 시작 시작
lecture_time varchar2(500), -- 강의 총 시간
lecture_postcode varchar2(500), --강의 우편번호
lecture_address varchar2(500), -- 강의장 주소
lecture_address2 varchar2(500) --강의장 상세 주소
);

--drop sequence seq_lecture;

--create sequence seq_lecture
--start with 1
--increment by 1;
--
--alter table lecture add constraint fk_kmodymember
--foreign key(userid) references kmodymember(userid);
--
--commit;

insert into lecture
		(lecture_idx, cell_type, main_category,
		 sub_category, userid, subject,
		 price, content, main_img, 
		 lecture_date, lecture_start, lecture_time,
		 lecture_address, lecture_address2 )
		values
		(
		 (select nvl(max(lecture_idx)+1, 1) from lecture),
		 '3', 'test', 'test',
		 'ttt', 'wwwqwww', 30000,
		 'test', 'test', 'test',
		 'test', 'test', 'test',
		 'test'
		);

desc lecture;

select * from lecture where cell_type=3;

select * from lecture 
where 
userid like '%%' or 
main_category like '%%'or
sub_category like '%%'or
subject like '%%'or
content like '%%'
;
select * from lecture where cell_type='3' order by lecture_idx desc;

select count(*) from lecture 
where cell_type='3' and
(userid like '%%' or 
main_category like '%%' or
sub_category like '%%' or
subject like '%%' or
content like '%%');

select * from lecture
where cell_type=3 and
userid like '%q%'
;
select count(*) from lecture where cell_type=3;

;


select count(*) from lecture where cell_type=3;
commit; 

select count(*) from lecture
		where cell_type=3 and
		(
		userid like '%q%' or 
		main_category like '%q%' or
		sub_category like '%q%' or
		subject like '%q%' or
		content like '%q%'
		);
        
        delete lecture;
        
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--페이지 나누기 테스트를 위해 레코드 입력
declare --선언부
    i number := 1;
begin --실행부
    while i<=200 loop
        insert into lecture 
        (lecture_idx, cell_type, main_category,
		 sub_category, userid, subject, price, content )
        values
        (
        (select nvl(max(lecture_idx)+1,1) from lecture),
        '3','main'||i,'sub'||i,'iop'||i,'iop'||i,10000,'iop'||i
        );
        i := i+1; --조건 변경
    end loop;
end;
/


insert into lecture
		(lecture_idx, cell_type, main_category,
		 sub_category, userid, subject,
		 price, content, main_img, 
		 lecture_date, lecture_start, lecture_time,
		 lecture_address, lecture_address2 )
		values
		(
		 (select nvl(max(lecture_idx)+1, 1) from lecture),
		 '3', 'main1', 'sub1',
		 'kim', 'kim', 30000,
		 'kim', 'kim', 'kim',
		 'kim', 'kim', 'kim',
		 'kim'
);

select count(*) from lecture where cell_type=3 order by lecture_idx;

select * from lecture where cell_type=1;


commit;
select * from kdemymember;


select * from coupon;

create table coupon(
coupon_idx varchar2(200) primary key,
coupon_name varchar2(200) not null,
point number default 0,
coupon_text varchar2(200)
);

delete lecture;

commit;