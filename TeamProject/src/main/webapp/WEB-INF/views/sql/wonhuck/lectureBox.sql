drop table lectureBox;

create table lectureBox(
box_idx number,
cell_type varchar2(500),
userid varchar2(500),
lecture_idx number,
buy_date date default sysdate
);

insert into lectureBox(box_idx,cell_type,userid,lecture_idx)
values(
(select nvl(max(box_idx)+1, 1) from lectureBox ), '3', 'qnwnen22', 1
);

select * from lectureBox;
select * from cart where userid='qnwnen22';

delete lectureBox;
commit;

select count(*) from lectureBox
where userid='qnwnen22' and lecture_idx=801;

insert into lectureBox(box_idx,cell_type,userid,lecture_idx)
values(1,'2','qnwnen22',801);


insert into lectureBox
		(userid,lecture_idx)
		values
		('qnwnen22',806);
        
        delete lectureBox;
        commit;
        
        
        
        
        
update kdemymember set point=100000 where userid='qnwnen22';
        
select point from kdemymember where userid='qnwnen22'; 
select * from lectureBox;
select * from cart where userid='qnwnen22';
commit;
        
        
        