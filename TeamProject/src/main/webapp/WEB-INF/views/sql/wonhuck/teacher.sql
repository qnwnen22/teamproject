drop table chatmessage;

create table chatmessage (
chatroom_id number,
chatmsg varchar2(2000),
chatdate date default sysdate
);

commit;

desc teacher;


drop table teacher;

drop table teacher;

create table teacher(
teacher_num number,
userid varchar2(200) not null,
username varchar2(200),
nickname varchar2(200),
teacher_thumbnail clob,     
finaleducation varchar2(200),
schoolname varchar2(200),
department varchar2(200),
spec1 varchar2(200),
spec1_getdate varchar2(200),
spec1_img clob,     
spec2 varchar2(200),
spec2_getdate varchar2(200),
spec2_img clob,     
spec3 varchar2(200),
spec3_getdate varchar2(200),
spec3_img clob,     
spec4 varchar2(200),
spec4_getdate varchar2(200),
spec4_img clob,     
spec5  varchar2(200),
spec5_getdate varchar2(200),
spec5_img clob,     
career clob,     
request_date date default sysdate
);

commit;