create database furama;
use furama;
create table `position`(
position_code int primary key,
position_name varchar(45)
);
create table `level`(
level_code int primary key,
level_name varchar (45)
);
create table department (
department_code int primary key,
department_name varchar (45)
);
create table employee(
employee_code int primary key,
employee_name varchar (45) not null,
date_of_birth date not null,
id_card varchar (45) not null,
salary double not null,
number_phone varchar (45) not null,
email varchar (45),
address varchar(45),
position_code int,
level_code int,
department_code int,
foreign key (position_code) references `position`(position_code),
foreign key (level_code) references `level`(level_code),
foreign key (department_code) references department(department_code)
);
create table customer(
customer_code int primary key,
customer_type_code int,
customer_name varchar(45) not null,
date_of_birth date not null,
gender bit(1) not null,
id_card varchar(45),
number_phone varchar (45) not null,
email varchar (45),
address varchar(45),
foreign key (customer_type_code)references customer_type(customer_type_code)
);
create table customer_type(
customer_type_code int primary key,
customer_type_name varchar (45),

);
create table contract(
contract_code int primary key,
start_date_of_contract datetime not null,
end_date_of_contract datetime not null,
deposits double not null,
employee_code int,
customer_code int
);
