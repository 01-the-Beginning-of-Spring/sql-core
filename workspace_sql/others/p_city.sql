USE mytest
GO

IF EXISTS ( select * from dbo.sysobjects where id=OBJECT_ID('dbo.p_city') and type = 'P')
drop procedure p_city
GO

create procedure p_city
	@idx int,
	@idy int
	--,@cnt int output --solution 2.3
AS
BEGIN
	
	declare @sql nvarchar(2000)
	declare @param nvarchar(2000)

	
	/*
	--print 'solution - 1.1 - common situation'
	set @sql = N'select city_name from cities where city_id>=@id_start and city_id<=@id_end'
	set @param = N'@id_start int, @id_end int'
	EXEC sp_executesql @sql, @param, @id_start=@idx, @id_end=@idy
	*/

	
	--print 'solution - 1.2 - for some special situation'
	create table #tmp (city_name varchar(100))
	set @sql = N'insert into #tmp(city_name) select city_name from cities where city_id between @id_start and @id_end'
	set @param = N'@id_start int, @id_end int'
	EXEC sp_executesql @sql, @param, @id_start=@idx, @id_end=@idy
	select * from #tmp
	--set @cnt = (select count(1) from #tmp) --solution 2.3
	IF EXISTS (select name from tempdb..sysobjects where id=OBJECT_ID('tempdb..#tmp') and type='U')
		drop table #tmp
	

	/*
	-- not ok
	print 'solution - 1.3 - use table variable'
	exec( N'declare @ctname table(city_name varchar(100))')
	set @sql = N'insert into @ctname(city_name) select city_name from cities where city_id between @id_start and @id_end'
	set @param = N'@id_start int, @id_end int'
	EXEC sp_executesql @sql, @param, @id_start=@idx, @id_end=@idy
	exec(N'select * from @ctname')
	*/

END
