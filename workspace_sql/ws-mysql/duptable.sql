
CREATE TABLE dupdemo2 AS SELECT * FROM dupdemo1 ;
#一列重复
#找到数据重复的记录
SELECT * FROM dupdemo1 WHERE NAME IN (
    SELECT NAME FROM dupdemo1 GROUP BY NAME HAVING COUNT(NAME)>1);
 
#找到无重复的记录
SELECT * FROM dupdemo1 WHERE UUID IN (
    SELECT MAX(UUID) FROM dupdemo1 GROUP BY NAME
);
    
#两列重复
#找到数据重复的记录
SELECT * FROM dupdemo2 WHERE (NAME, age) IN (
    SELECT NAME,age FROM dupdemo2 GROUP BY NAME, age HAVING COUNT(NAME&age)>1
);

#找到无重复的记录
SELECT * FROM dupdemo2 WHERE UUID IN (
    SELECT * FROM dupdemo2 GROUP BY NAME&age
)