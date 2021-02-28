--TAO CO SO DU LIEU
create database QLSV_Lenh
--SU DUNG CO SO DU LIEU
use QLSV_Lenh
--TAO CAC BANG
create table KHOA
(
	MAKHOA char(4) not null,
	TENKHOA char(100) not null,
	NAMTHANHLAP int
)
create table SVIEN
(
	MASV char(8) not null,
	TENSV char(100) not null,
	NAM int,
	MAKHOA char(4) not null
)
create table MHOC
(
	MAMH char(6) not null,
	TENMH char(100) not null,
	TINCHI int,
	MAKHOA char(4) not null
)
create table DKIEN
(
	MAMH char(6) not null,
	MAMH_TRUOC char(6) not null
)
create table HPHAN
(
	MAHP int not null,
	MAMH char(6) not null,
	HOCKY int,
	NAM int,
	GV char(50)
)
create table KQUA
(
	MASV char(8) not null,
	MAHP int not null,
	DIEM float,
)

--NHAP DU LIEU
--NHAP DU LIEU TABLE: KHOA
insert into KHOA(MAKHOA,TENKHOA,NAMTHANHLAP) values ('TOAN',N'Toan','1976')
insert into KHOA(MAKHOA,TENKHOA,NAMTHANHLAP) values ('HOA',N'Hoa','1980')
insert into KHOA(MAKHOA,TENKHOA,NAMTHANHLAP) values ('SINH',N'Sinh','1981')
insert into KHOA(MAKHOA,TENKHOA,NAMTHANHLAP) values ('VLY',N'Vat ly','1982')
--NHAP DU LIEU TABLE: SVIEN
insert into SVIEN(MASV,TENSV,NAM,MAKHOA) values ('K27.0017',N'Nguyen Cong Phu','1','TOAN')
insert into SVIEN(MASV,TENSV,NAM,MAKHOA) values ('K26.0008',N'Phan Anh Khanh','2','TOAN')
insert into SVIEN(MASV,TENSV,NAM,MAKHOA) values ('K25.0005',N'Ly Thanh','3','HOA')
insert into SVIEN(MASV,TENSV,NAM,MAKHOA) values ('K27.0018',N'Han Quoc Viet','2','VLY')
--NHAP DU LIEU TABLE: MHOC
insert into MHOC(MAMH,TENMH,TINCHI,MAKHOA) values ('TH0001',N'Tin hoc dai cuong A1','4','TOAN')
insert into MHOC(MAMH,TENMH,TINCHI,MAKHOA) values ('TH0002',N'Cau truc du lieu','4','TOAN')
insert into MHOC(MAMH,TENMH,TINCHI,MAKHOA) values ('TO0001',N'Toan roi rac','3','TOAN')
insert into MHOC(MAMH,TENMH,TINCHI,MAKHOA) values ('HH0001',N'Hoa dai cuong A1','5','HOA')
insert into MHOC(MAMH,TENMH,TINCHI,MAKHOA) values ('HH0002',N'Hoa dai cuong A2','5','HOA')
insert into MHOC(MAMH,TENMH,TINCHI,MAKHOA) values ('TH0003',N'Co so du lieu','5','TOAN')
insert into MHOC(MAMH,TENMH,TINCHI,MAKHOA) values ('VL0002',N'Vat ly dai cuong A2','4','VLY')
insert into MHOC(MAMH,TENMH,TINCHI,MAKHOA) values ('VL0001',N'Vat ly dai cuong A1','5','VLY')
--NHAP DU LIEU TABLE: HPHAN
insert into HPHAN(MAHP,MAMH,HOCKY,NAM,GV) values ('1','TH0001','1','1996',N'N.D.Lam')
insert into HPHAN(MAHP,MAMH,HOCKY,NAM,GV) values ('2','VL0001','1','1996',N'T.N.Dung')
insert into HPHAN(MAHP,MAMH,HOCKY,NAM,GV) values ('3','TH0002','1','1997',N'H.Tuan')
insert into HPHAN(MAHP,MAMH,HOCKY,NAM,GV) values ('4','TH0001','1','1997',N'N.D.Lam')
insert into HPHAN(MAHP,MAMH,HOCKY,NAM,GV) values ('5','TH0003','2','1997',N'N.C.Phu')
insert into HPHAN(MAHP,MAMH,HOCKY,NAM,GV) values ('6','HH0001','1','1996',N'L.T.Phuc')
insert into HPHAN(MAHP,MAMH,HOCKY,NAM,GV) values ('7','TH0002','1','1998',N'P.T.Nhu')
insert into HPHAN(MAHP,MAMH,HOCKY,NAM,GV) values ('8','TO0001','1','1996',N'N.C.Phu')
--NHAP DU LIEU TABLE: KQUA
insert into KQUA(MASV,MAHP,DIEM) values ('K27.0017','4','9.5')
insert into KQUA(MASV,MAHP,DIEM) values ('K26.0008','1','10')
insert into KQUA(MASV,MAHP,DIEM) values ('K25.0005','6','6')
insert into KQUA(MASV,MAHP,DIEM) values ('K27.0018','2','8')
insert into KQUA(MASV,MAHP,DIEM) values ('K26.0008','3','9')
--NHAP DU LIEU TABLE: DKIEN
insert into DKIEN(MAMH,MAMH_TRUOC) values ('TH0003','TO0001')
insert into DKIEN(MAMH,MAMH_TRUOC) values ('TH0003','TH0002')
insert into DKIEN(MAMH,MAMH_TRUOC) values ('TH0002','TH0001')
insert into DKIEN(MAMH,MAMH_TRUOC) values ('HH0002','HH0001')
insert into DKIEN(MAMH,MAMH_TRUOC) values ('VL0002','VL0001')
--TAO KHOA
--TAO KHOA CHINH
alter table KHOA add constraint PK_KHOA primary key (MAKHOA)
alter table SVIEN add constraint PK_SVIEN primary key (MASV)
alter table MHOC add constraint PK_MHOC primary key (MAMH)
alter table DKIEN add constraint PK_DKIEN primary key (MAMH,MAMH_TRUOC)
alter table HPHAN add constraint PK_HPHAN primary key (MAHP)
alter table KQUA add constraint PK_KQUA primary key (MASV,MAHP)
--TAO KHOA NGOAI
alter table SVIEN add constraint FK_SVIEN_KHOA foreign key (MAKHOA) references KHOA(MAKHOA)
alter table MHOC add constraint FK_MHOC_KHOA foreign key (MAKHOA) references KHOA(MAKHOA)
alter table KQUA add constraint FK_KQUA_MASV foreign key (MASV) references SVIEN(MASV)
alter table KQUA add constraint FK_KQUA_HPHAN foreign key (MAHP) references HPHAN(MAHP)
alter table HPHAN add constraint FK_HPHAN_MHOC foreign key (MAMH) references MHOC(MAMH)
alter table DKIEN add constraint FK_DKIEN_MHOC foreign key (MAMH) references MHOC(MAMH)
alter table DKIEN add constraint FK_DKIEN_MHOC_TRUOC foreign key (MAMH_TRUOC) references MHOC(MAMH)
select MASV,TENSV from SVIEN where MAKHOA = 'TOAN'

--HIEN THI SO LUONG SINH VIEN KHI NHAP MA KHOA
--C1
alter proc SoluongSV
	@khoa varchar(10)
as
begin
	declare @a nvarchar
	select @a=count(MASV) from SVIEN sv,KHOA k where sv.MAKHOA = k.MAKHOA and TENKHOA=@khoa
	if((select count(MASV) from SVIEN sv,KHOA k where sv.MAKHOA = k.MAKHOA and TENKHOA=@khoa)>=2)
		print N'Số lương sinh viên:'+ @a + N'(Đã tuyển sinh đủ)'
	else
		print N'Số lương sinh viên:'+ @a + N'(Cần tuyển sinh đủ)'
end
go
exec SoluongSV 'TOAN'
--C2
alter proc SoluongSV1
	@khoa varchar(10)
as
begin
	declare @sl int
	select @sl=count(MASV) from SVIEN sv,KHOA k where sv.MAKHOA = k.MAKHOA and TENKHOA=@khoa
	if(@sl>=2)
		print N'Số lương sinh viên:'+ @sl + N'(Đã tuyển sinh đủ)'
	else
		print N'Số lương sinh viên:'+ @sl+ N'(Cần tuyển sinh đủ)'
end
go
exec SoluongSV 'TOAN'
-- HIEN THI THONG TIN SINH VIEN KHI NHAP MA SV
alter proc KetQuaHocTap
	@masv nvarchar(20)
as 
begin
	select TENSV, TENMH, DIEM  
	from SVIEN sv, MHOC mh, HPHAN hp, KQUA kq
	where sv.MASV=@masv and hp.MAMH=mh.MAMH and kq.MAHP=hp.MAHP and sv.MASV=kq.MASV
end
go

exec KetQuaHocTap 'K27.0017'
--HIEN THI THONG TIN SINH VIEN KHI NHAP MASV, MAMH
alter proc KetQuaMon
	@masv varchar(10),
	@mamh varchar(10)
as 
begin
	select TENSV,TENMH, DIEM,
	(case
		when DIEM >=5 then N'Đạt'
		else N'Chưa đạt'
	end) as 'GHICHU'
	from SVIEN sv, MHOC mh, HPHAN hp, KQUA kq
	where sv.MASV=@masv and kq.MASV=sv.MASV and mh.MAMH=@mamh and hp.MAMH=mh.MAMH and kq.MAHP=hp.MAHP 
	
end
go

exec KetQuaMon 'K26.0008', 'TH0002'

alter function SVDiem1 (@tenmh varchar(100))
	returns varchar(100)
as
begin
	declare @tensv varchar(100)
	select top(1) @tensv=TENSV
	from SVIEN sv, MHOC mh, HPHAN hp, KQUA kq
	where mh.TENMH=@tenmh and hp.MAMH=mh.MAMH and kq.MAHP=hp.MAHP and sv.MASV=kq.MASV
	order by DIEM desc
	return @tensv;
end
go
select dbo.SVDiem1('Cau truc du lieu') as 'TEN SV'