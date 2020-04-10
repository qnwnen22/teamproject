drop table cart;

create table cart(
cart_idx number,
cell_type varchar2(200),
userid varchar2(500),
lecture_idx number,
price number
);

select * from cart where userid='qnwnen22';

insert into cart
(cart_idx, cell_type, userid, lecture_idx, price)
values
( 
(select nvl(max(cart_idx)+1, 1) from cart where userid='qnwnen12'),
'3','qnwnen12',1,30000
);

commit;
delete cart;


