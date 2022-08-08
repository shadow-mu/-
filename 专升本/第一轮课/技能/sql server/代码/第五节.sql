create database student
use student
create table student(
sno char(8)primary key  not null,
sname varchar(8) not null,  
gender char(2) null,  
sbirth date null,
sdept varchar(15) null, 
major  varchar(20) null,
remark varchar(200) null  
)
create table course(
cno char(4)primary key not null,
canme varchar(30)null,
credit int null
)
create table sc(
sno char(8)not null foreign key references student(sno),
cno char(4)not null foreign key references course(cno),
degree int null,
primary key(sno,cno)
)

INSERT INTO student(sno,sname,gender,sbirth,sdept,major)
VALUES('20200101','李勇',NULL,'1999-01-02','计算机系','网络技术'),
('20200201','刘晨','女','2000-06-04','信息系','信息管理'),
('20200301','王敏','女','1999-12-23','软件系','计算机应用'),
('20200202','张力','男','1998-08-25','信息系','信息管理')

insert into course (cno,canme,credit) VALUES
('C01','数据库',6),
('C02','数学',6),
('C03','信息系统',4),
('C04','C语言',7)
insert into sc values('20200101','C01',65),
('20200101','C02',85),
('20200101','C03',75),
('20200201','C02',91),
('20200201','C03',73),
('20200301','C01',75),
('20200301','C02',null)


select sdept, count(*) from student group by sdept
select gender, count(*) from student group by gender
select sdept, gender, count(*) from student group by gender,sdept
select sdept, gender, count(*) from student where gender='女' group by gender,sdept 
select sdept, gender, count(*) from student   group by gender,sdept having gender='女'

select sno, count(*) from sc group by sno having count(*)>2
-- 变式处理：查询被2个以上同学选过的课程号
select cno ,count(*) from sc group by cno having count(*)>2
-- 查询选修了C02号课程的学生的学号、其成绩，查询结果按分数(sc)的降序排列。
select sno,cno,degree from sc where cno='C02' order by degree desc
-- 查询全体学生情况，查询结果按所在系升序排列，同一系中的学生按出生口期降序排列。
select * from student order by sdept asc, sbirth desc


-- 输出所有女学生的学号、姓名、课号及成绩。
select s.sno,s.sname,c.cno, c.degree from student s, sc c where s.sno=c.sno and s.gender='女'
select  s.sno,s.sname,c.cno, c.degree  from student s inner join sc c on s.sno=c.sno where s.gender='女'