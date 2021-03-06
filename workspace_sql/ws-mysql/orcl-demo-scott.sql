-- Mysql版本SQL
--------------------------------------------------------
--  Oracle 示例模式 SCOTT
--------------------------------------------------------
DROP TABLE IF EXISTS BONUS;
DROP TABLE IF EXISTS DEPT;
DROP TABLE IF EXISTS EMP ;
DROP TABLE IF EXISTS SALGRADE;
--------------------------------------------------------
--  DDL for Table BONUS
CREATE TABLE 'BONUS' (
    'ENAME' VARCHAR2(10) DEFAULT NULL, 
    'JOB' VARCHAR2(9) DEFAULT NULL, 
    'SAL' INT(10) DEFAULT NULL,--NUMBER, 
    'COMM' INT(10) DEFAULT NULL, --NUMBER
) ENGINE=INNODB DEFAULT CHARSET=utf8;

SHOW CREATE TABLE dupdemo1;

COMMENT ON TABLE BONUS  IS '工资表';
COMMENT ON COLUMN BONUS.ENAME IS '雇员姓名';
COMMENT ON COLUMN BONUS.JOB IS '雇员职位';
COMMENT ON COLUMN BONUS.SAL IS '雇员工资';
COMMENT ON COLUMN BONUS.COMM IS '雇员奖金';

--------------------------------------------------------
--  DDL for Table DEPT
CREATE TABLE DEPT  (	
  DEPTNO NUMBER(2,0), 
	DNAME VARCHAR2(14), 
	LOC VARCHAR2(13)
) ;
COMMENT ON TABLE DEPT  IS '部门表';
COMMENT ON COLUMN DEPT.DEPTNO IS '部门编号';
COMMENT ON COLUMN DEPT.DNAME IS '部门名称';
COMMENT ON COLUMN DEPT.LOC IS '部门所在位置';

--  Data for Table DEPT
REM INSERTING into DEPT
SET DEFINE OFF;
Insert into DEPT (DEPTNO,DNAME,LOC) values (10,'ACCOUNTING','NEW YORK');
Insert into DEPT (DEPTNO,DNAME,LOC) values (20,'RESEARCH','DALLAS');
Insert into DEPT (DEPTNO,DNAME,LOC) values (30,'SALES','CHICAGO');
Insert into DEPT (DEPTNO,DNAME,LOC) values (40,'OPERATIONS','BOSTON');
commit;

--  DDL for Index PK_DEPT
CREATE UNIQUE INDEX PK_DEPT ON DEPT (DEPTNO) ;
--  Constraints for Table DEPT
ALTER TABLE DEPT ADD CONSTRAINT PK_DEPT PRIMARY KEY (DEPTNO) ENABLE;

--------------------------------------------------------
--  DDL for Table EMP
CREATE TABLE EMP (
  EMPNO NUMBER(4,0), 
	ENAME VARCHAR2(10), 
	JOB VARCHAR2(9), 
	MGR NUMBER(4,0), 
	HIREDATE DATE, 
	SAL NUMBER(7,2), 
	COMM NUMBER(7,2), 
	DEPTNO NUMBER(2,0)
) ;
COMMENT ON TABLE EMP  IS '雇员表';
COMMENT ON COLUMN EMP.EMPNO IS '雇员编号';
COMMENT ON COLUMN EMP.ENAME IS '雇员姓名';
COMMENT ON COLUMN EMP.JOB IS '雇员职位';
COMMENT ON COLUMN EMP.MGR IS '雇员领导?嗪?;
COMMENT ON COLUMN EMP.HIREDATE IS '雇员入职日期';
COMMENT ON COLUMN EMP.SAL IS '雇员基本工资';
COMMENT ON COLUMN EMP.COMM IS '雇员奖金';
COMMENT ON COLUMN EMP.DEPTNO IS '雇员部门编号';

--  Data for Table EMP
REM INSERTING into EMP
SET DEFINE OFF;
Insert into EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) values (7369,'SMITH','CLERK',7902,to_date('17-12月-80','DD-MON-RR'),800,null,20);
Insert into EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) values (7499,'ALLEN','SALESMAN',7698,to_date('20-2月 -81','DD-MON-RR'),1600,300,30);
Insert into EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) values (7521,'WARD','SALESMAN',7698,to_date('22-2月 -81','DD-MON-RR'),1250,500,30);
Insert into EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) values (7566,'JONES','MANAGER',7839,to_date('02-4月 -81','DD-MON-RR'),2975,null,20);
Insert into EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) values (7654,'MARTIN','SALESMAN',7698,to_date('28-9月 -81','DD-MON-RR'),1250,1400,30);
Insert into EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) values (7698,'BLAKE','MANAGER',7839,to_date('01-5月 -81','DD-MON-RR'),2850,null,30);
Insert into EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) values (7782,'CLARK','MANAGER',7839,to_date('09-6月 -81','DD-MON-RR'),2450,null,10);
Insert into EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) values (7788,'SCOTT','ANALYST',7566,to_date('19-4月 -87','DD-MON-RR'),3000,null,20);
Insert into EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) values (7839,'KING','PRESIDENT',null,to_date('17-11月-81','DD-MON-RR'),5000,null,10);
Insert into EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) values (7844,'TURNER','SALESMAN',7698,to_date('08-9月 -81','DD-MON-RR'),1500,0,30);
Insert into EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) values (7876,'ADAMS','CLERK',7788,to_date('23-5月 -87','DD-MON-RR'),1100,null,20);
Insert into EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) values (7900,'JAMES','CLERK',7698,to_date('03-12月-81','DD-MON-RR'),950,null,30);
Insert into EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) values (7902,'FORD','ANALYST',7566,to_date('03-12月-81','DD-MON-RR'),3000,null,20);
Insert into EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) values (7934,'MILLER','CLERK',7782,to_date('23-1月 -82','DD-MON-RR'),1300,null,10);
commit;

--  DDL for Index PK_EMP
CREATE UNIQUE INDEX PK_EMP ON EMP (EMPNO) ;
--  Constraints for Table EMP
ALTER TABLE EMP ADD CONSTRAINT PK_EMP PRIMARY KEY (EMPNO) ENABLE;
--  Ref Constraints for Table EMP
  ALTER TABLE EMP ADD CONSTRAINT FK_DEPTNO FOREIGN KEY (DEPTNO)
	  REFERENCES DEPT (DEPTNO) ENABLE;

--------------------------------------------------------
--  DDL for Table SALGRADE
CREATE TABLE SALGRADE (
  GRADE NUMBER, 
	LOSAL NUMBER, 
	HISAL NUMBER
);
COMMENT ON TABLE SALGRADE  IS '工资等级表';
COMMENT ON COLUMN SALGRADE.GRADE IS '工资等级';
COMMENT ON COLUMN SALGRADE.LOSAL IS '等级最低工资';
COMMENT ON COLUMN SALGRADE.HISAL IS '等级最高工资';

--  Data for Table SALGRADE
REM INSERTING into SALGRADE
SET DEFINE OFF;
Insert into SALGRADE (GRADE,LOSAL,HISAL) values (1,700,1200);
Insert into SALGRADE (GRADE,LOSAL,HISAL) values (2,1201,1400);
Insert into SALGRADE (GRADE,LOSAL,HISAL) values (3,1401,2000);
Insert into SALGRADE (GRADE,LOSAL,HISAL) values (4,2001,3000);
Insert into SALGRADE (GRADE,LOSAL,HISAL) values (5,3001,9999);
commit;
