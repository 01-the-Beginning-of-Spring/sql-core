select * from T;

update T set indept_nm = '部门'||indept;
commit;

update T set V1=round(DBMS_RANDOM.VALUE()*10), V2=round(DBMS_RANDOM.VALUE()*10);
commit;
select * from T;
select distinct YYYYMM from T;

-- 1
select to_char(ADD_MONTHS(to_date(sysdate),1-rownum),'YYYYMM') as YYYYMM
from dual connect by rownum<=MONTHS_BETWEEN(to_date('201601','YYYYMM'),to_date('201511','YYYYMM'))+1
order by YYYYMM;
-- 2
select distinct indept from T where length(indept)=2;
-- 3
select * 
from (select to_char(ADD_MONTHS(to_date(sysdate),1-rownum),'YYYYMM') as YYYYMM
      from dual connect by rownum<=MONTHS_BETWEEN(to_date('201601','YYYYMM'),to_date('201511','YYYYMM'))+1
      )  a,
     (select distinct indept from T where length(indept)=2)  b
;

select * from T;

-- ok
select b.indept
      ,b.indept_nm --,b.indept_nm
      ,b.YYYYMM
      ,a.v1,a.v2
--      ,case when b.YYYYMM in (select YYYYMM from T where YYYYMM=a.YYYYMM ) then a.v1 else null end as V1
--      ,case when b.YYYYMM in (select YYYYMM from T where YYYYMM=a.YYYYMM ) then a.v2 else null end as V2
from ( select * from T where length(indept)=2 ) a,
     ( select * 
       from (select distinct indept,indept_nm from T where length(indept)=2),
            (select to_char(ADD_MONTHS(to_date(sysdate),1-rownum),'YYYYMM') as YYYYMM
            from dual connect by rownum<=MONTHS_BETWEEN(to_date('201601','YYYYMM'),to_date('201511','YYYYMM'))+1)
      ) b
where a.indept(+)=b.indept
and   a.YYYYMM(+)=b.YYYYMM
order by b.indept, b.YYYYMM;


-- 等值连接
select * from ta, tb where ta.a = tb.a;
-- 外连接  左
select ta.*, tb.* from ta left join tb on ta.a=tb.a;
select ta.*, tb.* from ta,tb where ta.a=tb.a(+);
select ta.*, tb.* from tb,ta where ta.a=tb.a(+);
select ta.*, tb.* from ta,tb where tb.a(+)=ta.a;
select ta.*, tb.* from tb,ta where tb.a(+)=ta.a;
-- 外连接 右
select ta.*, tb.* from ta right join tb on ta.a=tb.a;
select ta.*, tb.* from ta,tb where ta.a(+)=tb.a;
select ta.*, tb.* from tb,ta where ta.a(+)=tb.a;
select ta.*, tb.* from ta,tb where tb.a=ta.a(+);
select ta.*, tb.* from tb,ta where tb.a=ta.a(+);
-- 全外连接
select ta.*, tb.* from ta full join tb on ta.a = tb.a;
select ta.*, tb.* from ta left join tb on ta.a = tb.a
union
select ta.*, tb.* from ta right join tb on ta.a = tb.a;