--�ǽð� ���� ���̺�
drop table lecture;

create table lecture(
type number not null, -- �Ǹ�Ÿ��
id varchar2(200) not null primary key,-- �Ǹ��ϴ� ��ǰ�� index number
cetegory varchar2(200) not null, --��ǰ ī�װ�
userid varchar2(200) not null, -- ���̵� foreign = member-userid
name varchar2(200) not null, -- �̸� foreign = member-name
title varchar2(200) not null, -- ��ǰ ����
start_time varchar2(200) not null, -- ���۽ð�(view ����)
end_time varchar2(200) not null, -- ����ð�(view ����)
addr1 varchar2(200) not null, -- ���� �ּ�
addr2 varchar2(200) not null, -- 
lectrue_price number default 0,
lectrue_count number default 1
);

insert into lecture values
(1,'10001','IT','kim0001','��ö��','���� ���������� �ǹ�����','14:00','16:00','����','##��##��� ���',10000,10);

select * from lecture;