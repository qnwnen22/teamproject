--��������Ʈ ���� ���̺�
drop table coupon;

-- ���� ��� ���̺�
create table coupon(
coupon_idx varchar2(200) primary key,
coupon_name varchar2(200) not null,
point number default 0,
coupon_text varchar2(200)
);

insert into coupon (coupon_idx,coupon_name,point,coupon_text)
values ('a','ȸ������ ����',10000,'ȸ������ �� ���޵Ǵ� ���������Դϴ�. (ȸ������ �� ����');
insert into coupon (coupon_idx,coupon_name,point,coupon_text)
values ('b','ģ����õ �̺�Ʈ ����',5000,'ģ������ ����Ʈ�� ��õ�ϰ� ������ ��������. (��õ�� ģ���� ȸ������ �� ����)');
insert into coupon (coupon_idx,coupon_name,point,coupon_text)
values ('c','���� ����Ʈ ���� ����',1000,'@@Ȩ���������� ȸ�������� �ϸ� ������ �����. (@@Ȩ������ ȸ������ �� ����');

select * from coupon;

drop table coupon_box;
-- ������ ���̺�
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

--userid�� a ��� ������ �ֽ��ϱ�?
select coupon_idx from coupon_box
where userid='qnwnen0228' and coupon_idx='a';

--userid�� a ��� ������ �ֽ��ϱ�?
select coupon_idx from coupon_box
where userid='qnwnen0228' and coupon_idx='b';

commit;