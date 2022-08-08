use student
-- 利用左外连接查询每个学生及其选修课的情况。
select s.*,c.cno ,c.degree from student s left join sc c on s.sno= c.sno
-- 右外连
select student.*,cno from sc  right join student  on student.sno= sc.sno
-- 查询选修了课程号C02的学生信息
select * from student where sno in(select sno from sc where cno='C02')
alter table student add sage int not null default 20 
-- 查询所有年龄大于平均年龄的学生信息
select * from student where sage > (select avg(sage) from student)
-- 查询与刘晨在同一个系学习的学生信息。
select * from student where sdept in(select sdept from student where sname='刘晨')
-- 统计选了“数据库”课程的学生的学号、选课门数和平均成绩
select sno,count(*),avg(degree) from sc where sno in(select sno from sc where cno in(select cno from course where canme='数据库')) group by sno
select * from sc
use student
-- 查询其他系中比计算机系学生年龄都小的学生。
select * from student where sage<all(select sage
from student where sdept='信息系' ) and sdept <> '信息系'
-- 查询其他系中比计算机系任一个学生年龄小的学生信息。
select * from student where sage <ANY(select sage
from student where sdept='信息系' ) and sdept <> '信息系'
-- 查询选修了课程号C02的学生信息
select * from student where exists( select * from sc where sno=student.sno and cno='C02')
-- 创建视图
-- 有条件的视图定义。定义视图v student,查询所有选修C01号 
-- 课程的学生的学号(sno)、姓名(sname)、课程名称(cname)和成绩(degree)
create view v_stdent with encryption as select student.sno,sname,sc.cno,degree from student ,sc,course where student.sno=sc.sno and sc.cno = course.cno and sc. cno='C01'
-- 使用视图
select * from v_stdent

-- 定义视图vstudent_count,查询不同性别的学生人数。
create view v_student_count(gender,学生人数) as
select gender,count(*) from student group by gender
-- 使用视图
select * from v_student_count 
-- 删除视图
drop view 视图名称
-- 通过视图查询性别人数超过1人
select * from v_student_count where 学生人数>1

 --为Student表的sno列创建一个唯一性的聚集索引：
 create unique clustered index idx_student_sno on student(sno)

 as select student.sno,sname,sc.cno,degree from student ,sc,course where student.sno=sc.sno and sc.cno = course.cno and sc. cno='C01'

 use student
-- 创建存储过程
-- 例：查询选修了课程号CO2(sc)的学生信息(sno,sname,gender,)student
-- 连接查询
create procedure proc_t1  as select student.*,cno from student,sc where student.sno=sc.sno and cno='C02'
-- 执行存储过程
execute proc_t1
-- 删除存储过程
drop procedure proc_t1



-- 例：查询选修了某课程号的学生信息(sno,sname,gender,)student
create procedure proc_t2 @cno char(4) as select student.*,cno from student,sc where student.sno=sc.sno and cno=@cno
-- 使用
execute proc_t2 'C01'
execute proc_t2  @cno='C01'
-- 修改存储过程
alter proc proc_t1  as select student.*,cno from student,sc where student.sno=sc.sno and cno='C02'


