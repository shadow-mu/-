create table teach(
    tid varchar(6) primary key,
    xm varchar(8)   unique null,
    xb varchar(4)   check(xb in('男','女')),
    mz varchar(8)   default '汉' ,
    zc varchar(10) check,
    sfzh varchar(18) unique
)

select * from teacher where xm like '王%'
select kch,kcm,kss from course,tc,teacher where  teacher.tid=tc.tid and course.kch=tc.kch and xm='张三'
create unique clustered index sno_stu student(sno desc)
