USE mytest
GO

IF EXISTS ( select name from sysobjects where name = 'p_city_cnt' and type = 'P')
drop procedure p_city_cnt
GO

create procedure p_city_cnt
	@idx int,
	@idy int
AS
BEGIN

	--print 'solution - 2.1'
	create table #tmp (
		city_name varchar(100)
	)
	insert into #tmp(city_name) exec p_city @idx, @idy
	--select count(1) as number from #tmp
	select @@ROWCOUNT as number
	drop table #tmp



	/*
	--print 'solution - 2.2'
	declare @ctname table(
		city_name varchar(100)
	)
	insert into @ctname (city_name) exec p_city @idx, @idy
	select count(1) as number from @ctname
	*/
	/*
	-- solution 2.3.1, will response 2 result sets.
	declare @cnt int
	exec p_city @idx, @idy, @cnt out
	select @cnt as number

	-- solution 2.3.2, will response only one result set.
	create table #tmp (
		city_name varchar(100)
	)
	declare @cnt int
	insert into #tmp(city_name) exec p_city @idx, @idy, @cnt out
	select @cnt as number
	drop table #tmp
	*/
END
