-- ��������Ʈ member ���̺�
drop table member;

create table member(
userid varchar2(200) primary key, -- ���̵�
passwd varchar2(200) not null, -- ��й�ȣ
name varchar2(200) not null, -- �̸�
email varchar2(200) not null, -- �̸���
hp varchar2(200) not null, -- �ڵ���
birth varchar2(200) not null, -- �������
addr1 varchar2(200) not null, --�����ȣ
addr2 varchar2(200) not null, --�ּ�
addr3 varchar2(200) not null, --�� �ּ�
join_date date default sysdate, -- ���Գ�¥
point number default 0 -- ����Ʈ
);

delete member;

insert into member (userid,passwd,name,email,hp,birth,addr1,addr2,addr3)
values('cksgh1103','1234','����ȣ','cksgh1103@gmail.com','01011111111','000101','00001','�ּ�','�� �ּ�');
insert into member (userid,passwd,name,email,hp,birth,addr1,addr2,addr3)
values('khm932001','1234','������','khm932001@gmail.com','01022222222','000202','00002','�ּ�','�� �ּ�');
insert into member (userid,passwd,name,email,hp,birth,addr1,addr2,addr3)
values('jang6845','1234','�强��','jang6845@gmail.com','01033333333','000303','00003','�ּ�','�� �ּ�');
insert into member (userid,passwd,name,email,hp,birth,addr1,addr2,addr3)
values('hyun8503','1234','������','hyun8503@gmail.com','01044444444','000404','00004','�ּ�','�� �ּ�');
insert into member (userid,passwd,name,email,hp,birth,addr1,addr2,addr3)
values('weather543210','1234','������','weather543210@gmail.com','01055555555','000505','00005','�ּ�','�� �ּ�');
insert into member (userid,passwd,name,email,hp,birth,addr1,addr2,addr3)
values('qnwnen0228','1234','�̿���','qnwnen0228@gmail.com','01040817964','960228','12791','��⵵ ���ֽ� �ַɵ� 60-12 (�̷�������)','100�� 1000ȣ');

select * from member;

commit;