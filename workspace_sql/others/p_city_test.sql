use mytest
go

exec p_city 2,4


exec p_city_cnt 2,3


select stuff((select ',' + city_id from cities for xml path('')),1,1,'') concatStr
select stuff((select ',' + city_name from cities for xml path('')),1,1,'') concatStr