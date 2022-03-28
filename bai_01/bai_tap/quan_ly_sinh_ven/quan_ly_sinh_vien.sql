create database `quan_ly_sinh_vien`;
use quan_ly_sinh_vien;
create table `Class`(
`id` int auto_increment,
`name` varchar(45) not null ,
primary key (`id`));
create table `teacher`(
`id` int  auto_increment,
`name` varchar(45) not null,
`age` int not null,
`country` varchar(45) not null,
primary key (`id`));


