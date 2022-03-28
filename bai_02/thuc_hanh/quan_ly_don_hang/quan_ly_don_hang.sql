create database `quan_ly_don_hang`;
use quan_ly_don_hang;
create table `don_dat_hang`(
`so_don_hang` int not null,
`ten_don_vi` varchar(45) not null,
`dia_chi` varchar(45) not null,
`dien_thoai` int not null,
`ngay_dat` varchar(45) not null,
`ten_hang` varchar(45) not null,
`mo_ta` varchar(255) not null,
`don_vi_tinh` varchar(45) not null,
`so_luong` int  not null,
`ho_ten_nguoi_dat` varchar(45) not null);
create table `phieu_giao_hang`(
`so_phieu_giao_hang` int not null,
`ten_don_vi` varchar(45) not null,
`dia_chi` varchar(45) not null,
`noi_giao_hang` varchar(45) not null,
`ngay_giao` varchar(45) not null,
`ten_hang` varchar(45) not null,
`don_vi_tinh` varchar(45) not null,
`so_luong` int not null,
`don_gia` int not null,
`thanh_tien` int not null,
`ten_nguoi_nhan` varchar(45) not null,
`ten_nguoi_giao` varchar(45)not null);