create database thao_tac_csdl_quan_ly_ban_hang;
use thao_tac_csdl_quan_ly_ban_hang;
create table customer(
c_id int primary key,
c_name varchar(45),
c_age varchar(10)
);
create table oder(
o_id int primary key,
c_id int,
o_date date,
o_total_price varchar(20),
foreign key (c_id) references customer (c_id)
);
create table product(
p_id int primary key,
p_name varchar(45),
p_price varchar(45)
);
create table oder_detail(
o_id int,
p_id int,
od_qty varchar(45),
primary key(o_id,p_id),
foreign key (o_id) references oder(o_id),
foreign key (p_id) references product (p_id)
);

insert into customer  value
(1,'Minh Quan',10),
(2,'Ngoc Oanh',20),
(3,'Hong Ha',50);

insert into oder value
(1,1,'2006-03-21','Null'),
(2,2,'2006-03-23','Null'),
(3,1,'2006-03-16','Null');

insert into product value
(1,'May Giat',3),
(2,'Tu Lanh',5),
(3,'Dieu Hoa',7),
(4,'Quat',1),
(5,'Bep Dien',2);

insert into oder_detail value 
(1,1,3),
(1,3,7),
(1,4,2),
(2,1,1),
(3,1,8),
(2,5,4),
(2,3,3);

select o_id,o_date,o_total_price
from oder;

select customer.c_name,product.p_name
from oder_detail
inner join product on oder_detail.p_id=product.p_id
inner join oder on oder_detail.o_id=oder.o_id
inner join customer on oder.c_id=customer.c_id;

select customer.c_name,oder.c_id
from oder
right join customer on oder.c_id=customer.c_id where oder.c_id is null;

select oder_detail.o_id,`oder`.o_date, sum(oder_detail.od_qty*product.p_price) as 'total price'
from oder 
inner join oder_detail on oder.o_id=oder_detail.o_id
inner join product on oder_detail.p_id=product.p_id
group by oder.o_id;