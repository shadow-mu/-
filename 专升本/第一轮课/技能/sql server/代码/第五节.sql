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
VALUES('20200101','����',NULL,'1999-01-02','�����ϵ','���缼��'),
('20200201','����','Ů','2000-06-04','��Ϣϵ','��Ϣ����'),
('20200301','����','Ů','1999-12-23','���ϵ','�����Ӧ��'),
('20200202','����','��','1998-08-25','��Ϣϵ','��Ϣ����')

insert into course (cno,canme,credit) VALUES
('C01','���ݿ�',6),
('C02','��ѧ',6),
('C03','��Ϣϵͳ',4),
('C04','C����',7)
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
select sdept, gender, count(*) from student where gender='Ů' group by gender,sdept 
select sdept, gender, count(*) from student   group by gender,sdept having gender='Ů'

select sno, count(*) from sc group by sno having count(*)>2
-- ��ʽ������ѯ��2������ͬѧѡ���Ŀγ̺�
select cno ,count(*) from sc group by cno having count(*)>2
-- ��ѯѡ����C02�ſγ̵�ѧ����ѧ�š���ɼ�����ѯ���������(sc)�Ľ������С�
select sno,cno,degree from sc where cno='C02' order by degree desc
-- ��ѯȫ��ѧ���������ѯ���������ϵ�������У�ͬһϵ�е�ѧ�����������ڽ������С�
select * from student order by sdept asc, sbirth desc


-- �������Ůѧ����ѧ�š��������κż��ɼ���
select s.sno,s.sname,c.cno, c.degree from student s, sc c where s.sno=c.sno and s.gender='Ů'
select  s.sno,s.sname,c.cno, c.degree  from student s inner join sc c on s.sno=c.sno where s.gender='Ů'