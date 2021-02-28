--TAO CO SO DU LIEU
create database QLSV
--SU DUNG CO SO DU LIEU
use QLSV
--TAO CAC BANG
create table KHOA
(
	MAKHOA char(4) not null,
	TENKHOA char(100) not null
)
create table SVIEN
(
	MASV char(8) not null,
	TENSV char(100) not null,
	MAKHOA char(4) not null
)
create table MHOC
(
	MAMH char(6) not null,
	TENMH char(100) not null,
	MAKHOA char(4) not null
)
create table HPHAN
(
	MAHP int not null,
	MAMH char(6) not null
)
create table KQUA
(
	MASV char(8) not null,
	MAHP int not null,
	DIEM float,
)

--NHAP DU LIEU
--NHAP DU LIEU TABLE: KHOA
insert into KHOA(MAKHOA,TENKHOA) values ('K001',N'CNTT')
insert into KHOA(MAKHOA,TENKHOA) values ('K002',N'TCKT')
insert into KHOA(MAKHOA,TENKHOA) values ('K003',N'NNA')
insert into KHOA(MAKHOA,TENKHOA) values ('K004',N'GDMN')
--NHAP DU LIEU TABLE: SVIEN
insert into SVIEN(MASV,TENSV,MAKHOA) values ('sv001',N'Nguyễn Công Phú','K001')
insert into SVIEN(MASV,TENSV,MAKHOA) values ('sv002',N'Phan Anh Khanh','K001')
insert into SVIEN(MASV,TENSV,MAKHOA) values ('sv003',N'Lý Thành','K002')
insert into SVIEN(MASV,TENSV,MAKHOA) values ('sv004',N'Hàn Quốc Việt','K001')
insert into SVIEN(MASV,TENSV,MAKHOA) values ('sv005',N'Đoàn Thanh','K003')
insert into SVIEN(MASV,TENSV,MAKHOA) values ('sv006',N'Trần Kiến Bằng','K003')
insert into SVIEN(MASV,TENSV,MAKHOA) values ('sv007',N'Huỳnh Lý','K002')
insert into SVIEN(MASV,TENSV,MAKHOA) values ('sv008',N'Vương Tư Nhã','K004')
insert into SVIEN(MASV,TENSV,MAKHOA) values ('sv009',N'Lưu Ý','K004')
--NHAP DU LIEU TABLE: MHOC
insert into MHOC(MAMH,TENMH,MAKHOA) values ('M001',N'Toán rời rạc','K001')
insert into MHOC(MAMH,TENMH,MAKHOA) values ('M002',N'Cấu trúc dữ liệu','K001')
insert into MHOC(MAMH,TENMH,MAKHOA) values ('M003',N'Kinh tế học','K002')
insert into MHOC(MAMH,TENMH,MAKHOA) values ('M004',N'Kế toán doanh nghiệp','K002')
insert into MHOC(MAMH,TENMH,MAKHOA) values ('M005',N'Quốc tế mĩ','K003')
insert into MHOC(MAMH,TENMH,MAKHOA) values ('M006',N'Tiếng anh nâng cao','K003')
insert into MHOC(MAMH,TENMH,MAKHOA) values ('M007',N'Tâm lý học nhân cách','K004')
insert into MHOC(MAMH,TENMH,MAKHOA) values ('M008',N'Văn học trẻ em','K004')
--NHAP DU LIEU TABLE: HPHAN
insert into HPHAN(MAHP,MAMH) values ('1','M001')
insert into HPHAN(MAHP,MAMH) values ('2','M002')
insert into HPHAN(MAHP,MAMH) values ('3','M003')
insert into HPHAN(MAHP,MAMH) values ('4','M004')
insert into HPHAN(MAHP,MAMH) values ('5','M005')
insert into HPHAN(MAHP,MAMH) values ('6','M006')
insert into HPHAN(MAHP,MAMH) values ('7','M007')
insert into HPHAN(MAHP,MAMH) values ('8','M008')
--NHAP DU LIEU TABLE: KQUA
insert into KQUA(MASV,MAHP,DIEM) values ('sv001','1','9.5')
insert into KQUA(MASV,MAHP,DIEM) values ('sv002','1','10')
insert into KQUA(MASV,MAHP,DIEM) values ('sv003','3','6')
insert into KQUA(MASV,MAHP,DIEM) values ('sv004','1','8')
insert into KQUA(MASV,MAHP,DIEM) values ('sv005','5','9')
insert into KQUA(MASV,MAHP,DIEM) values ('sv006','5','6')
insert into KQUA(MASV,MAHP,DIEM) values ('sv007','3','7.5')
insert into KQUA(MASV,MAHP,DIEM) values ('sv008','7','8')
insert into KQUA(MASV,MAHP,DIEM) values ('sv009','7','6')
--TAO KHOA
--TAO KHOA CHINH
alter table KHOA add constraint PK_KHOA primary key (MAKHOA)
alter table SVIEN add constraint PK_SVIEN primary key (MASV)
alter table MHOC add constraint PK_MHOC primary key (MAMH)
alter table HPHAN add constraint PK_HPHAN primary key (MAHP)
alter table KQUA add constraint PK_KQUA primary key (MASV,MAHP)
--TAO KHOA NGOAI
alter table SVIEN add constraint FK_SVIEN_KHOA foreign key (MAKHOA) references KHOA(MAKHOA)
alter table MHOC add constraint FK_MHOC_KHOA foreign key (MAKHOA) references KHOA(MAKHOA)
alter table KQUA add constraint FK_KQUA_MASV foreign key (MASV) references SVIEN(MASV)
alter table KQUA add constraint FK_KQUA_HPHAN foreign key (MAHP) references HPHAN(MAHP)
alter table HPHAN add constraint FK_HPHAN_MHOC foreign key (MAMH) references MHOC(MAMH)
--Câu 1
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

select dbo.SVDiem1('Toán rời rạc') as 'TEN SV'
--Ví dụ xuất năm hiện tại
ALTER  FUNCTION GetCurrYear () 
RETURNS int
AS 
BEGIN
 RETURN   YEAR(getdate())
END
GO
select dbo.GetCurrYear() 
--Câu 2
ALTER FUNCTION KTthu(@ngay DATETIME)
	RETURNS NVARCHAR(100)
AS
     BEGIN
          DECLARE @a NVARCHAR(100)
          SELECT @a=CASE DATEPART(DW,@ngay)
                        WHEN 1 THEN N'Chủ nhật'
                        WHEN 2 THEN N'Thứ hai'
                        WHEN 3 THEN N'Thứ ba'
                        WHEN 4 THEN N'Thứ tư'
                        WHEN 5 THEN N'Thứ năm'
                        WHEN 6 THEN N'Thứ sáu'
                        ELSE N'Thứ bảy'
                      END   
          RETURN (@a)  
END
GO	
select dbo.KTthu('2020-09-23') 

--Câu 3
ALTER FUNCTION Ds(@makhoa char(4))
	RETURNS TABLE RETURN
		SELECT sv.MASV, sv.TENSV, k.TENKHOA
		FROM SVIEN sv INNER JOIN KHOA k
						ON	sv.MAKHOA=k.MAKHOA
		WHERE k.MAKHOA=@makhoa
GO
select * from dbo.Ds('k004') 

--Câu 4
ALTER FUNCTION thongke(@makhoa nvarchar(100))
	RETURNS TABLE RETURN
		SELECT k.MAKHOA, k.TENKHOA, COUNT(sv.MAKHOA) SOLUONG,
		(case
		when COUNT(sv.MAKHOA) >=2 then N'Tuyển đủ'
		else N'Cần tuyển thêm'
		end) as 'TINHTRANG'
		FROM KHOA k INNER JOIN SVIEN sv
						ON	sv.MAKHOA=k.MAKHOA
		WHERE sv.MAKHOA=@makhoa
		GROUP BY k.MAKHOA, k.TENKHOA
GO
select * from dbo.thongke('k004') 

