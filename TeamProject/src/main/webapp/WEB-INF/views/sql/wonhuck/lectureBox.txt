drop table lectureBox;

create table lectureBox(
box_idx number,
cell_type varchar2(100), 
userid varchar2(500),
nickname varchar2(200),
lecture_idx number,
buy_date date default sysdate,
up varchar2(10) default 'down',
onlinechat varchar2(10),
price number
);

commit;