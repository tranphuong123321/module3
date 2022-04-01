create database furama_case_study;
use furama_case_study;

create table `user`(
username varchar(255) primary key,
`password` varchar(255)
);
create table `role` (
role_id int primary key AUTO_INCREMENT,
role_name varchar(255)
);
create table user_role (
role_id int not null,
username varchar(255) not null,
foreign key (username) references `user`(username),
foreign key (role_id) references `role`(role_id)
);
create table division (
division_id int primary key AUTO_INCREMENT,
division_name varchar(45)
);
create table education_degree (
education_degree_id int primary key AUTO_INCREMENT,
education_degree_name varchar(45)
);
create table position (
position_id int primary key AUTO_INCREMENT,
position_name varchar(45)
);
create table customer_type (
customer_type_id int primary key AUTO_INCREMENT,
customer_type_name varchar(45)
);
create table service_type (
service_type_id int primary key AUTO_INCREMENT,
service_type_name varchar(45)
);
create table customer (
customer_id int primary key AUTO_INCREMENT,
customer_name varchar(45),
customer_birthday date not null,
customer_gender bit(1) not null,
customer_id_card varchar(45) not null,
customer_phone varchar(45) not null,
customer_email varchar(45),
customer_address varchar(45),
customer_type_id int not null,
foreign key (customer_type_id) references customer_type(customer_type_id)
);

create table rent_type (
rent_type_id int primary key AUTO_INCREMENT,
rent_type_name varchar(45),
rent_type_cost double
);
create table service (
service_id int primary key AUTO_INCREMENT,
service_name varchar(45) not null,
service_area int,
service_cost double not null,
service_max_people int,
standard_room varchar(45),
description_other_convenience varchar(45),
pool_area double,
number_of_floors int,
rent_type_id int not null,
service_type_id int not null,
foreign key (rent_type_id) references rent_type (rent_type_id),
foreign key (service_type_id) references service_type (service_type_id)
);
create table attach_service (
attach_service_id int primary key AUTO_INCREMENT,
attach_service_name varchar(45) not null,
attach_service_cost double not null,
attach_service_unit varchar(45) not null,
attach_service_status varchar(45)
);
create table employee (
employee_id int primary key AUTO_INCREMENT,
employee_name varchar(45) not null,
employee_birthday varchar(45) not null,
employee_id_card varchar(45) not null,
employee_salary double not null,
employee_phone varchar(45) not null,
employee_email varchar(45),
employee_address varchar(45),
position_id int not null,
education_degree_id int not null,
division_id int not null,
username varchar(255),
foreign key (position_id) references position (position_id),
foreign key (education_degree_id) REFERENCES education_degree (education_degree_id),
foreign key (division_id) references division (division_id),
foreign key (username) references `user`(username)
);
create table contract (
contract_id int primary key AUTO_INCREMENT,
contract_start_date varchar(45) not null,
contract_end_date varchar(45) not null,
contract_deposit double not null,
contract_total_money double not null,
employee_id int not null,
customer_id int not null,
service_id int not null,
foreign key (employee_id) references employee (employee_id),
foreign key (customer_id) references customer (customer_id),
foreign key (service_id) references service (service_id)
);
create table contract_detail (
contract_detail_id int primary key AUTO_INCREMENT,
quantity int not null,
contract_id int not null,
attach_service_id int not null,
foreign key (contract_id) references contract (contract_id),
foreign key (attach_service_id) references attach_service (attach_service_id)
);

insert into customer_type(customer_type_name) values ("Diamond"),("Platinium"),("Gold"),("Silver"),("Member");
insert into customer(customer_name,customer_birthday,customer_gender,customer_id_card,customer_phone,customer_email,customer_address,customer_type_id)
values ("Nguyễn Thị Hào","1970-11-07",0,"643431213","0945423362","thihao07@gmail.com","23 Nguyễn Hoàng,Đà Nẵng",5),
("Phạm Xuân Diệu","1992-08-08",1,"865342123","0954333333","xuandieu92@gmail.com","K77/22 Thái Phiên, Quảng Trị",3),
("Trương Đình Nghệ","1990-02-27",1,"488645199","0373213122","nghenhan2702@gmail.com","K323/12 Ông Ích Khiêm, Vinh",1),
("Dương Văn Quan","1981-07-08",1,"543432111","0490039241","duongquan@gmail.com","K453/12 Lê Lợi, Đà Nẵng",1),
("Hoàng Trần Nhi Nhi","1995-12-09",0,"795453345","0312345678","nhinhi123@gmail.com","224 Lý Thái Tổ, Gia Lai",4),
("Tôn Nữ Mộc Châu","2005-12-06",0,"732434215","0988888844","tonnuchau@gmail.com","37 Yên Thế, Đà Nẵng",4),
("Nguyễn Mỹ Kim","1984-04-08",0,"856453123","0912345698","kimcuong84@gmail.com","K123/45 Lê Lợi, Hồ Chí Minh",1),
("Nguyễn Thị Hào","1999-04-08",0,"965656433","0763212345","haohao99@gmail.com","55 Nguyễn Văn Linh, Kon Tum",3),
("Trần Đại Danh","1994-07-01",1,"432341235","0643343433","danhhai99@gmail.com","24 Lý Thường Kiệt, Quảng Ngãi",1),
("Nguyễn Tâm Đắc","1989-07-01",1,"344343432","0987654321","tdactam@gmail.com","22 Ngô Quyền, Đà Nẵng",2);


INSERT INTO attach_service(attach_service_name,attach_service_cost,attach_service_unit,attach_service_status)
VALUE ("massage",10000,"giờ","tiện nghi" ),
		("karaoke",5000,"giờ","tiện nghi, hiện tại" ),
        ("thức ăn",15000,"suất","đầy đủ đồ ăn, tráng miệng"),
        ("nước uống",7000,"chai","đầy đủ đồ uống"),
        ("thuê xe",50000,"chiếc","hỏng 1 chiếc");
        
insert into  position values ("1", "Quản Lí");
insert into  position values ("2", "Nhân Viên");
insert into  position values ("3", "Lễ tân");
insert into  position values ("4", "Phục vụ");
insert into  position values ("5", "Chuyên viên");
insert into  position values ("6", "giám sát");
insert into  position values ("7", "giám đốc");

insert into education_degree values (1, "Trung Cấp");
insert into education_degree values (2, "Cao Đẳng");
insert into education_degree values (3, "Đại Học");
insert into education_degree values (4, "Sau Đại Học");
insert into division values ("1","Sale-Marketting");
insert into division values ("2","Hành Chính");
insert into division values ("3","Dịch Vụ");
insert into division values ("4","Quản Lí");


        
insert into employee(employee_id, employee_name, employee_birthday, employee_id_card, employee_salary, employee_phone, employee_email,
 employee_address, position_id, education_degree_id, division_id)
values
(1, "Nguyễn Văn An", "1970-11-07","456231786", 10000000, "0123456789", "annguyen@gmail.com", "295 Nguyễn Tất Thành, Đà Nẵng", 1, 3, 1),
(2, "Lê Văn Bình", "1997-04-09", "654231234", 7000000, "0984534758", "binhlv@gmail.com", "22 Yên Bái, Đà Nẵng", 1, 2, 2),
(3, "Hồ Thị Yến", "1995-12-12", "999231723", 14000000, "0456764542", "thiyen@gmail.com", "K234/11 Điện Biên Phủ, Gia Lai", 1, 3, 2),
(4, "Võ Công Toản", "1980-04-04", "123231365", 17000000, "0379853432", "toan0404@gmail.com", "77 Hoàng Diệu, Quảng Trị", 1, 4, 4),
(5, "Nguyễn Bỉnh Phát", "1999-12-09", "454363232", 6000000, "0902433454", "phatphat@gmail.com", "43 Yên Bái, Đà Nẵng", 2, 1, 1),
(6, "Khúc Nguyễn An Nghi", "2000-11-08", "964542311", 7000000, "0978650000", "annghi20@gmail.com", "294 Nguyễn Tất Thành, Đà Nẵng", 2, 2, 3),
(7, "Nguyễn Hữu Hà", "1993-01-01", "534323231", 8000000, "0941234553", "nhh0101@gmail.com", "4 Nguyễn Chí Thanh, Huế", 2, 3, 2),
(8, "Nguyễn Hà Đông", "1989-09-03", "234414123", 9000000, "0642123111", "donghanguyen@gmail.com", "11 Hùng Vương, Hà Nội", 2, 4, 4),
(9, "Tòng Hoang", "1982-09-03", "256781231", 6000000, "0245144444", "hoangtong@gmail.com", "213 Hàm Nghi, Đà Nẵng", 2, 4, 4),
(10, "Nguyễn Công Đạo", "1994-01-08", "755434343", 8000000, "0988767111", "nguỹenongdao12@gmail.com", "6 Hoà Khánh, Đồng Nai", 2, 3, 2);
        
        
insert into rent_type(rent_type_id,rent_type_name,rent_type_cost) values
(1,'year',20000),
(2,'month',2000),
(3,'day',500),
(4,'hour',200);
insert into service_type(service_type_id,service_type_name) values
(1,"Villa"),
(2,'House'),
(3,'Room');
insert into service(service_name,service_area,service_cost,service_max_people,standard_room,description_other_convenience,pool_area,number_of_floors,rent_type_id,service_type_id)
values("Villa Beach Front","25000",10000000,10,"vip","Có hồ bơi",500,4,3,1),
("House Princess 01","14000",5000000,7,"vip","Có thêm bếp nướng",null,3,2,2),
("Room Twin 01","5000",1000000,2,"vip","Có tivi",null,null,4,3),
("Villa No Beach Front","22000",9000000,8,"normal","Có hồ bơi",300,3,3,1),
("House Princess 02","10000",4000000,5,"normal","Có thêm bếp nướng",null,2,3,2),
("Room Twin 02","3000",900000,2,"normal","Có tivi",null,null,4,3);        
        
insert into contract values (1,"08-12-2020","08-12-2020",0,0,3,1,3),
(2,"14-07-2020","21-07-2021",200000,0,7,3,1),
(3,"15-03-2021","17-03-2021",50000,0,7,3,1),
(4,"14-01-2021","18-01-2021",100000,0,7,5,5),
(5,"14-07-2021","15-07-2021",0,0,7,2,6),
(6,"01-06-2021","03-06-2021",0,0,7,7,6),
(7,"02-09-2021","05-09-2021",100000,0,7,4,4),
(8,"17-06-2021","18-06-2021",150000,0,3,4,1),
(9,"19-11-2020","19-11-2020",0,0,3,4,3),
(10,"12-04-2021","14-04-2021",0,0,10,3,5),
(11,"25-04-2021","25-04-2021",0,0,2,2,1),
(12,"25-05-2021","27-05-2021",0,0,7,10,1)
;

insert into contract_detail (quantity, contract_id, attach_service_id) values
(5, 2, 4),
(8, 2, 5),
(15, 2, 5),
(1, 3, 1),
(11, 3, 2),
(1, 1, 3),
(2, 1, 2),
(2, 12, 2);

create table complimentary(
id_complimentary int primary key AUTO_INCREMENT,
name_complimentary varchar(50)
);

insert into complimentary(name_complimentary)values
("nước lọc"),
("trà"),
("khăn"),
("internet");

-- task 2
select * 
from employee 
where employee_name  regexp '^H|^T|^K' 
and length(employee_name) < 15;

-- task 3
select*
from customer
where  ((datediff(now(), customer_birthday)/365 between 18 and 50)
and ((customer_address like "%Đà Nẵng") or (customer_address like "%Quảng Trị")));

-- task 4
select contract.customer_id,customer.customer_name,customer_type.customer_type_name,count(contract.customer_id) as 'so lan dat hang' 
from contract
inner join customer
on contract.customer_id =customer.customer_id 
inner join customer_type
on customer.customer_type_id=customer_type.customer_type_id
where customer.customer_type_id= 1
group by customer.customer_id;

-- task 5
SELECT 
    customer.customer_id,
    customer.customer_name,
    customer_type.customer_type_name,
    contract.contract_id,
    service.service_name,
    contract.contract_start_date,
    contract.contract_end_date,
    IF(contract_detail.quantity IS NULL,
        service.service_cost,
        SUM(service.service_cost + contract_detail.quantity * attach_service.attach_service_cost)) AS 'Tong tien'
FROM
    customer
        LEFT JOIN
    customer_type ON customer.customer_type_id = customer_type.customer_type_id
        LEFT JOIN
    contract ON customer.customer_id = contract.customer_id
        LEFT JOIN
    service ON contract.service_id = service.service_id
        LEFT JOIN
    contract_detail ON contract.contract_id = contract_detail.contract_id
        LEFT JOIN
    attach_service ON  contract_detail.attach_service_id = attach_service.attach_service_id
GROUP BY contract.contract_id;

