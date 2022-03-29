create database quan_ly_vat_tu;
use quan_ly_vat_tu;
create table nha_cung_cap(
ma_nha_cung_cap varchar(255) primary key ,
ten_nha_cung_cap varchar(255),
dia_chi varchar(255)
);
create table so_dien_thoai(
so_thu_tu int primary key auto_increment ,
ma_nha_cung_cap varchar(255),
so_dien_thoai varchar(20),
foreign key (ma_nha_cung_cap) references nha_cung_cap(ma_nha_cung_cap)
);
create table don_dat_hang(
so_dat_hang int auto_increment primary key,
ngay_dat_hang date,
ma_nha_cung_cap varchar(255),
foreign key (ma_nha_cung_cap) references nha_cung_cap(ma_nha_cung_cap)
);
create table vat_tu(
ma_vat_tu int auto_increment primary key,
ten_vat_tu varchar(255)
);
create table quan_ly_dat_hang(
so_thu_tu int unique,
so_dat_hang int,
ma_vat_tu int,
primary key(so_dat_hang,ma_vat_tu),
foreign key (so_dat_hang) references don_dat_hang (so_dat_hang),
foreign key (ma_vat_tu) references vat_tu(ma_vat_tu)
);
create table phieu_nhap(
so_phieu_nhap int auto_increment primary key,
ngay_nhap date
);
create table quan_ly_nhap_vat_tu(
ma_vat_tu int ,
so_phieu_nhap int,
don_gia_nhap int,
so_luong_nhap int,
primary key (ma_vat_tu,so_phieu_nhap),
foreign key (ma_vat_tu) references vat_tu(ma_vat_tu),
foreign key (so_phieu_nhap) references phieu_nhap (so_phieu_nhap)
);
create table phieu_xuat(
so_phieu_xuat int auto_increment primary key,
ngay_xuat date
);
create table quan_ly_xuat_vat_tu(
don_gia_xuat int,
so_luong_xuat int,
so_phieu_xuat int,
ma_vat_tu int,
primary key(so_phieu_xuat,ma_vat_tu),
foreign key (so_phieu_xuat) references phieu_xuat(so_phieu_xuat),
foreign key (ma_vat_tu) references vat_tu(ma_vat_tu)
);
