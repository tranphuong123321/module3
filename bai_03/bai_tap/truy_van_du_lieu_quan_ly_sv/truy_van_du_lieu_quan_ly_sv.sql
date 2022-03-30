create database truy_van_du_lieu_quan_ly_sv;
use truy_van_du_lieu_quan_ly_sv;
create table Class(
class_id int not null primary key auto_increment,
class_name varchar(60) not null,
start_date datetime not null,
status bit 
);
create table Student(
student_id int not null primary key auto_increment,
student_name varchar (30) not null,
address varchar(50),
phone varchar(20),
status bit,
class_id int not null
);
create table `Subject`(
sub_id int not null primary key auto_increment,
sub_name varchar(30) not null,
credit tinyint not null default 1 check (credit >= 1),
`status` bit default 1
);
create table mark(
mark_id int not null primary key auto_increment,
sub_id int not null ,
student_id int not null,
mark float default 0 check (mark between 0 and 100),
exam_times tinyint default 1,
foreign key (sub_id) references  `Subject`(sub_id),
foreign key (student_id) references  Student(student_id));



insert into class value(1, 'A1', '2008-12-20',1);
insert into class value(2, 'A2', '2008-12-22',1);
insert into class value(3, 'B3', current_date(),0);
insert into student (student_name,address,phone,`status`,class_id) 
value ('Hung','Ha Noi','0912113113',1,1);
insert into student (student_name,address,`status`,class_id) 
value('Hoa', 'Hai Phong',1,1);
insert into student (student_name,address,phone,`status`,class_id) 
value('Manh','HCM',0123123123,0,2);

insert into `subject` value (1,'CF',5,1),
(2,'C',6,1),
(3,'HDJ',5,1),
(4,'RDBMS',10,1);
insert into mark (sub_id,student_id,mark,exam_times)
value (1,1,8,1),
(1,2,10,2),
(2, 1, 12, 1);


select *from student where student_name like 'h%';
select *from class where start_date like '%-12-%';
select * from `subject` where credit between 3 and 5;

set sql_safe_updates=0;
update student set class_id=2 where student_name='Hung';
set sql_safe_updates=1;
select student.student_name,`subject`.sub_name,`mark`.mark
 from student
 inner join  mark on student.student_id=mark.student_id
 inner join `subject` on mark.sub_id=`subject`.sub_id
 order by mark desc,student.student_name asc;

