--��������Ʈ vod���̺�
drop table vod;

create table vod(
type number default 1, -- �Ǹ�Ÿ��
idx varchar2(200) primary key,-- �Ǹ��ϴ� ��ǰ�� index number
cetegory varchar2(200) not null, -- ��ǰ ī�װ�
subject varchar2(200) not null, -- ���� ����
userid varchar2(200) not null, -- ���̵� foreign = member-userid
name varchar2(200) not null, -- �̸� foreign = member-name
image varchar2(200) not null, -- ���� �̹���
text varchar2(200) default '', -- ���� ����
upload date default sysdate -- ���ε� ��¥
);

delete vod;

insert into vod (type, idx, cetegory, subject, userid, name, image, text)
values (1,'00001','�ܱ���','�߱��� ���� 1��','hyun8503','������','�̹�������.jpg','���ǿ� ���� ����');
insert into vod (type, idx, cetegory, subject, userid, name, image, text)
values (1,'00002','�ܱ���','�߱��� ���� 2��','hyun8503','������','�̹�������.jpg','���ǿ� ���� ����');
insert into vod (type, idx, cetegory, subject, userid, name, image, text)
values (1,'00003','�ܱ���','�߱��� ���� 3��','hyun8503','������','�̹�������.jpg','���ǿ� ���� ����');
insert into vod (type, idx, cetegory, subject, userid, name, image, text)
values (1,'00004','�ܱ���','�߱��� ���� 4��','hyun8503','������','�̹�������.jpg','���ǿ� ���� ����');
insert into vod (type, idx, cetegory, subject, userid, name, image, text)
values (1,'00005','�ܱ���','�߱��� ���� 5��','hyun8503','������','�̹�������.jpg','���ǿ� ���� ����');

select * from vod order by idx asc;

update vod set subject='�߱��� ����' where userid='hyun8503';

commit;