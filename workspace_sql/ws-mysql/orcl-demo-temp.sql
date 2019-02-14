-- ≤È—ØOracle∞Ê±æ
-- Oracle 11g 11.2.0.1.0 64bit
select * from v$version;
select * from product_component_version;
SET SERVEROUTPUT ON
EXEC dbms_output.put_line( dbms_db_version.version );

select * from user_tables;
select * from tab;
desc dept;
select * from dept;
select * from emp;
select * from  BONUS;
select * from  SALGRADE;
show parameter undo;
show recyclebin;
select * from recyclebin;
select * from user_recyclebin;
PURGE RECYCLEBIN;

drop table BONUS;
flashback table bonus to before drop;

show PARAMETERS undo;
select * from BONUS;
desc bonus;
insert into bonus(ename,job,sal,comm) values('zhao', 'cizhang', 13000, 88888);
commit;
delete from BONUS;
