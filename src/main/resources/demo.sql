create table 博客
( id int,
	标题 nchar(30) ,
	内容 ntext ,
	用户id int ,
	日期 date,
	primary key (id,用户id) ,--表级约束主键
	foreign key(id) references "用户"(id) --表级外键，列级外键去掉key后的"(id)"就好了
	)
insert 用户
 values (1,'wy','女','2001-02-02',DEFAULT,1,2)  --插入表，默认值用deafault代替，可以不用指定列名，如果按顺序
 insert into 博客
(id,标题,"内容",[用户id],日期) values (1,'我想你','我想你',1,'2020-08-27')
select   姓名,id,count(distinct 密码) as hehe
from 用户
where id in(0,1,2,3)
GROUP BY 姓名 ,id having count(密码)>=1 and id>0
order by hehe asc,id desc

select 用户.id,用户2.姓名
from 用户 inner join 用户 as 用户2 on 用户.id>用户2.id

select 用户.id ,用户2.姓名
from 用户,用户 as 用户2
where 用户.id>用户2.id
select 用户.姓名,博客.内容
from 用户 left join 博客
on 用户.id>博客.id

declare @hehe int ,@name nchar(2),@yy char(4) --变量的作用域是到批出或者存储过程结尾。
set @name='wy' --声明成2个最低字节才可以表达
set @yy='开始' --四个字节才可以

 if(@name='wy')
				begin
				select @hehe=id --带@的是变量，不带是别名，带@不会返回结果，只是赋值
				from [用户]
				-- where "id" >0 --返回多个行，最后一个行的记录值会赋值给变量
				end
	else
				begin --语句块的开始
				print 'not wy'
				end

		while(@name='xiaobai')--条件循环
						begin
							continue --结束本次循环
							print 'byebye'+@@servicename  --输出只有两种，一种是这个只能输出一句，select可以输出一个集合，都是输出到标准输出
							print 1+ascii('q')  --不同数值类型的变量或者常量，不能互相加
							select @name as kk --select的特殊用法，以表格输出
							break --中断循环
						end

			print
						case 1 --这叫做case表达式，只会返回一个值
							when 2 then 'bingo'
							when 1 then 'hehe'
							else 'll' --没有结果任何匹配的时候
						end

			print
						case  --这是case搜索表达式，只返回第一个正确的when后的布尔表达式值
							when @name='wy' then 'hh'
							when 1=1 then 'kk'
							else 'ee'
						end
				print @yy
--go --变量结束，批处理结束，也是下一个批处理的开始
-- return --退出整个t-sql语句的执行
--也有 try catch语句
execute sp_databases --执行一个存储过程

declare @a int ,@b int
INSERT into 用户 VALUES(4,'lb','男','2000-02-09','4','4',4) --因为没有包含进显示提交中，所以自己默认提交
begin transaction --显示开始，可以没有对应的结束，批处理后自动提交
set @a=1
set @b=2
INSERT into 用户 VALUES(3,'lw','女','2000-02-09','3','3',3)
if @a=1
	commit transaction

	else
	rollback transaction
	go --批处理结束
SET IMPLICIT_TRANSACTIONS ON --开始隐式事务，
INSERT into 用户 VALUES(3,'lw','女','2000-02-09','3','3',3) --一个持久化的操作，会自动开启一个显示事务，一定要提交才行，有点麻烦

GO
COMMIT
SET IMPLICIT_TRANSACTIONS OFF --关闭这个模式

create nonclustered --选类型，可以选unique唯一索引，那么选的列就是是个候选码列了，clustered是聚集索引。
index wy on 用户(性别 asc ,出生日期 desc) --可以挑选多个列，后面可加上一句 with fillfactor=x;x是占据所引用的百分比（0-100)
alter index wy on 专升本.用户 rebuild --重新生成索引，如果用专升本...这样的数据库等级的引用，需要管理员身份
drop index wy on 用户 --删除索引
alter index wy on 用户 disable --禁用这个索引，
--当然还有其他很多操作
select * from 用户 with(index=wy) --使用特定的索引查询，一般系统会自动选择优化

create view 视图 (id,改名) --(,,,)列是可以省略不写的，写了就要和实际子查询的数量对应，可以改名字对列
as
select id ,姓名
from 用户
where id>=0
with check option --加上这个以后对视图进行持久化操作会自动加上条件（where的条件)，比如修改，有点方便；
drop view 视图
use 专升本
go
create  procedure 存储过程
@name int output, --输出参数，在过程执行完后，它的值可以保存到调用者的变量中
@winput int=2 --输入类的参数不用写input
as
begin
select * from 用户 --过程化sql块
set @name=1
end
go

declare @it int   --可通过三种方法将数据从过程返回到调用程序：结果集、输出参数和返回代码，这里是输出参数
execute 存储过程 @name=@it output , @winput=1; --输出参数的用法就在这里，参数里只要有一个使用显示输入，其他都要用显示的
print @it

alter proc 存储过程   --修改存储过程的内容
as
print 'oo'

EXEC sp_rename '存储过程', '改名了'; --使用内置的改名存储过程

drop proc 改名了

create proc 返回 --创建一个int值的存储过程
@name int
as
begin
return @name
print 'end' --不执行了
end

declare @hh int
exec @hh=返回 2  --调用存储过程的格式，@hh就是普通变量
drop proc 返回

CREATE PROCEDURE 游标
    @CurrencyCursor CURSOR varying OUTPUT  --必须加上varying
AS
    SET @CurrencyCursor = CURSOR
    FORWARD_ONLY STATIC FOR
      SELECT id,姓名
      FROM 用户;

    OPEN @CurrencyCursor;  --打开游标，数据放入缓存区
GO

DECLARE @MyCursor CURSOR;
EXEC 游标 @CurrencyCursor = @MyCursor OUTPUT;
BEGIN;
    FETCH  FROM @MyCursor;  --返回当前，返回的方式和select的一样，都是输出到标准输出，
		  FETCH NEXT FROM @MyCursor;  --返回下一个，还有好多其他的参数
END;
CLOSE @MyCursor;  --关闭游标，但没有释放这个游标，还可以再次使用
DEALLOCATE @MyCursor;  --释放游标
GO

drop proc 游标

create trigger 触发器 --创建触发器
	on 用户  --在某个基本表上
	after   --选择发送的时间，还有befor
	 insert --类型，还有delete,update,
	as	--后面跟的是触发器的sql执行体
	print 'gogo'
	 drop trigger 触发器
