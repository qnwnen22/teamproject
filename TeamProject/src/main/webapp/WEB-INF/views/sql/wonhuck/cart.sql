drop table cart;

create table cart(
main_img clob,
cart_idx number,
cell_type varchar2(200),
userid varchar2(500),
main_category varchar2(500),
sub_category varchar2(500),
subject varchar2(500),
lecture_idx number,
price number
);

commit;
