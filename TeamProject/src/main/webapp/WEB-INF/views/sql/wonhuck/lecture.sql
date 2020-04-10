drop table lecture;

create table lecture(
lecture_idx number not null, --������ �ε��� ��ȣ
cell_type varchar2(200), --�Ǹ� Ÿ��(����=1, �¶���=2, ��������=3)
main_category varchar2(500), --���� ī�װ�
sub_category varchar2(500), -- ���� ī�װ�
userid varchar2(200) not null, -- kmodymember-userid foreign
subject varchar2(500), --���� ����
main_img clob, --���� �����(���� �̹���)
videofile clob, -- �������� �����̸�
content clob, --���� ���� ����
upload_date date default sysdate, --���� ���ε� ��¥
price number default 0, -- ���� ����
-- ���⼭ ���ʹ� �ǽð�/���� ���� Į��
lecture_date varchar2(500), --���� ��¥
lecture_start varchar2(500), --���� ���� ����
lecture_time varchar2(500), -- ���� �� �ð�
lecture_address varchar2(500), -- ������ �ּ�
lecture_address2 varchar2(500) --������ �� �ּ�
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

--������ ������ �׽�Ʈ�� ���� ���ڵ� �Է�
declare --�����
    i number := 1;
begin --�����
    while i<=200 loop
        insert into lecture 
        (lecture_idx, cell_type, main_category,
		 sub_category, userid, subject, price, content )
        values
        (
        (select nvl(max(lecture_idx)+1,1) from lecture),
        '2','main'||i,'sub'||i,'qnwnen12','iop'||i,10000,'iop'||i
        );
        i := i+1; --���� ����
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
lecture_idx number, --������ �ε��� ��ȣ
cell_type varchar2(200), --�Ǹ� Ÿ��(����=1, �¶���=2, ��������=3)
main_category varchar2(500), --���� ī�װ�
sub_category varchar2(500), -- ���� ī�װ�
userid varchar2(200), -- kmodymember-userid foreign
subject varchar2(500), --���� ����
main_img clob, --���� �����(���� �̹���)
videofile clob, -- �������� �����̸�
content clob, --���� ���� ����
upload_date date default sysdate, --���� ���ε� ��¥
price number default 0, -- ���� ����
-- ���⼭ ���ʹ� �ǽð�/���� ���� Į��
lecture_date varchar2(500), --���� ��¥
lecture_start varchar2(500), --���� ���� ����
lecture_time varchar2(500), -- ���� �� �ð�
lecture_postcode varchar2(500), --���� �����ȣ
lecture_address varchar2(500), -- ������ �ּ�
lecture_address2 varchar2(500) --������ �� �ּ�
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

--������ ������ �׽�Ʈ�� ���� ���ڵ� �Է�
declare --�����
    i number := 1;
begin --�����
    while i<=200 loop
        insert into lecture 
        (lecture_idx, cell_type, main_category,
		 sub_category, userid, subject, price, content )
        values
        (
        (select nvl(max(lecture_idx)+1,1) from lecture),
        '3','main'||i,'sub'||i,'iop'||i,'iop'||i,10000,'iop'||i
        );
        i := i+1; --���� ����
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