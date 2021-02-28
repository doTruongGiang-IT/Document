Use Tuan2
--KT Chan Le
drop proc KTChanle
create proc KTChanle
	@n int
as
begin
	if @n%2=0
	begin
		print 'Day la so chan'
	end
	else
	begin
		print 'Day la so le'
	end
end
go
exec KTChanle 4
--TINH TONG 2 SO
--C1:
create proc Tong
	@a int,
	@b int,
	@Tong int output
as
begin
	set @Tong = @a + @b
end
go
declare @kq int
exec Tong 2, 3, @kq output
print @kq
drop proc Tong
--C2:
drop proc Tong1
create proc Tong1
	@a int,
	@b int
as
begin
	declare @kq int
	set @kq = @a + @b
	print @kq
end
go
exec Tong1 4, 5
--PT BAC 1
alter proc spnd_PTBac01
	@a float,
	@b float
as
begin
	declare @x float
	if(@a = 0)
	begin
		if(@b=0)
		begin
			print 'Phuong trinh vo so nghiem'
		end
		else
		begin
			print 'Phuong trinh vo nghiem'
		end
	end
	else
	begin
		set @x=(-@b)/@a
		print @x
	end
end
go
exec spnd_PTBac01 0, 3 
--BANG CUU CHUONG
alter proc CC
	@n int
as
begin
	declare @dem int
	declare @kq int
	set @dem=1
	while (@dem<11)
		begin
			set @kq=@n*@dem
			print cast(@n as nvarchar) +'x'+cast (@dem as nvarchar) +'='+cast(@kq as nvarchar)
			set @dem=@dem+1
		end
end
go
exec CC 5