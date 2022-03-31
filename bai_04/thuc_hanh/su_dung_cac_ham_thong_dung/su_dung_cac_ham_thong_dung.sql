create database su_dung_cac_ham_thong_dung;
use su_dung_cac_ham_thong_dung;

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
status bit default 1
);

create table mark(
mark_id int not null primary key auto_increment,
sub_id int not null ,
student_id int not null ,
mark float default 0 check (mark between 0 and 100),
exam_times tinyint default 1,
foreign key (sub_id) references  `Subject`(sub_id),
foreign key (student_id) references  Student(student_id)
);

insert into student (student_name,address,phone,`status`,class_id) value
('Hung','dn','0123456789',1,111),
('Hoa','dn','0123456788',1,111),
('Hoang','dn','0123456787',1,111);

insert into `subject`(sub_name,credit,`status`) value
('java',1,1),
('java',1,1),
('java',1,1),
('php',1,1),
('php',1,1),
('php',1,1);

insert into mark (sub_id,student_id,mark,exam_times) value
(1,1,9,1),
(1,2,8,1),
(1,3,10,1),
(2,1,5,1),
(2,2,6,1),
(2,3,7,1);


select address, count(student_id) as 'so luong hoc vien'
from student
group by address;

select student.student_id, student.student_name, avg(mark)
from student 
join mark
on student.student_id=mark.student_id
group by student.student_id, student.student_name
having avg(mark)>15;

select student.student_id, student.student_name, avg(mark)
from student 
join mark
on student.student_id=mark.student_id
group by student.student_id, student.student_name
having avg(mark)>= all (select avg(mark) from mark group by mark.student_id);
