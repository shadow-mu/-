use student
-- �����������Ӳ�ѯÿ��ѧ������ѡ�޿ε������
select s.*,c.cno ,c.degree from student s left join sc c on s.sno= c.sno
-- ������
select student.*,cno from sc  right join student  on student.sno= sc.sno
-- ��ѯѡ���˿γ̺�C02��ѧ����Ϣ
select * from student where sno in(select sno from sc where cno='C02')
alter table student add sage int not null default 20 
-- ��ѯ�����������ƽ�������ѧ����Ϣ
select * from student where sage > (select avg(sage) from student)
-- ��ѯ��������ͬһ��ϵѧϰ��ѧ����Ϣ��
select * from student where sdept in(select sdept from student where sname='����')
-- ͳ��ѡ�ˡ����ݿ⡱�γ̵�ѧ����ѧ�š�ѡ��������ƽ���ɼ�
select sno,count(*),avg(degree) from sc where sno in(select sno from sc where cno in(select cno from course where canme='���ݿ�')) group by sno
select * from sc
use student
-- ��ѯ����ϵ�бȼ����ϵѧ�����䶼С��ѧ����
select * from student where sage<all(select sage
from student where sdept='��Ϣϵ' ) and sdept <> '��Ϣϵ'
-- ��ѯ����ϵ�бȼ����ϵ��һ��ѧ������С��ѧ����Ϣ��
select * from student where sage <ANY(select sage
from student where sdept='��Ϣϵ' ) and sdept <> '��Ϣϵ'
-- ��ѯѡ���˿γ̺�C02��ѧ����Ϣ
select * from student where exists( select * from sc where sno=student.sno and cno='C02')
-- ������ͼ
-- ����������ͼ���塣������ͼv student,��ѯ����ѡ��C01�� 
-- �γ̵�ѧ����ѧ��(sno)������(sname)���γ�����(cname)�ͳɼ�(degree)
create view v_stdent with encryption as select student.sno,sname,sc.cno,degree from student ,sc,course where student.sno=sc.sno and sc.cno = course.cno and sc. cno='C01'
-- ʹ����ͼ
select * from v_stdent

-- ������ͼvstudent_count,��ѯ��ͬ�Ա��ѧ��������
create view v_student_count(gender,ѧ������) as
select gender,count(*) from student group by gender
-- ʹ����ͼ
select * from v_student_count 
-- ɾ����ͼ
drop view ��ͼ����
-- ͨ����ͼ��ѯ�Ա���������1��
select * from v_student_count where ѧ������>1

 --ΪStudent���sno�д���һ��Ψһ�Եľۼ�������
 create unique clustered index idx_student_sno on student(sno)

 as select student.sno,sname,sc.cno,degree from student ,sc,course where student.sno=sc.sno and sc.cno = course.cno and sc. cno='C01'

 use student
-- �����洢����
-- ������ѯѡ���˿γ̺�CO2(sc)��ѧ����Ϣ(sno,sname,gender,)student
-- ���Ӳ�ѯ
create procedure proc_t1  as select student.*,cno from student,sc where student.sno=sc.sno and cno='C02'
-- ִ�д洢����
execute proc_t1
-- ɾ���洢����
drop procedure proc_t1



-- ������ѯѡ����ĳ�γ̺ŵ�ѧ����Ϣ(sno,sname,gender,)student
create procedure proc_t2 @cno char(4) as select student.*,cno from student,sc where student.sno=sc.sno and cno=@cno
-- ʹ��
execute proc_t2 'C01'
execute proc_t2  @cno='C01'
-- �޸Ĵ洢����
alter proc proc_t1  as select student.*,cno from student,sc where student.sno=sc.sno and cno='C02'


