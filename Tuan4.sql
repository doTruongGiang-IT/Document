--TAO CO SO DU LIEU
create database QLDA
--SU DUNG CO SO DU LIEU
use QLDA
--TAO CAC BANG
create table NHANVIEN
(
	MANV varchar(8) not null,
	HONV varchar(50) not null,
	TENLOT varchar(50) not null,
	TENNV varchar(50) not null,
	NGSINH datetime not null,
	PHAI varchar(5) not null,
	DCHI varchar(100) not null,
	MLUONG float,
	MA_NQL varchar(8),
	PHONG varchar(4) not null
)
create table PHONGBAN
(
	MAPHG varchar(4) not null,
	TENPHG char(100) not null,
	TRPHG varchar(8) not null,
	NGNC datetime
)
create table DIADIEM_PHG
(
	MAPHG varchar(4) not null,
	DIADIEM varchar(30) not null
)
create table PHANCONG
(
	MANV varchar(8) not null,
	MADA varchar(6) not null,
	THOIGIAN float
)
create table DEAN
(
	MADA varchar(6) not null,
	MAPHG varchar(4) not null,
	TENDA varchar(50) not null,
	DDIEM_DA varchar(100) not null,
	NGBD_DK datetime,
	NGKT_DK datetime
)
create table THANNHAN
(
	MATN varchar(8) not null,
	MANV varchar(8) not null,
	TENTN varchar(50) not null,
	PHAI varchar(5) not null,
	NGSINH datetime not null,
	QUANHE varchar(30) not null
)
--TAO KHOA
--TAO KHOA CHINH
alter table NHANVIEN add constraint PK_NHANVIEN primary key (MANV)
alter table PHONGBAN add constraint PK_PHG primary key (MAPHG)
alter table DIADIEM_PHG add constraint PK_DIADIEMPHG primary key (MAPHG,DIADIEM)
alter table PHANCONG add constraint PK_PHANCONG primary key (MANV,MADA)
alter table DEAN add constraint PK_DEAN primary key (MADA)
alter table THANNHAN add constraint PK_THANNHAN primary key (MANV,MATN)
--TAO KHOA NGOAI
alter table NHANVIEN add constraint FK_NHANVIEN foreign key (MA_NQL) references NHANVIEN(MANV)
alter table NHANVIEN add constraint FK_NHANVIEN1 foreign key (PHONG) references PHONGBAN(MAPHG)
alter table PHONGBAN add constraint FK_PHG foreign key (TRPHG) references NHANVIEN(MANV)
alter table DIADIEM_PHG add constraint FK_DIADIEMPHG foreign key (MAPHG) references PHONGBAN(MAPHG)
alter table PHANCONG add constraint FK_PHANCONG foreign key (MANV) references NHANVIEN(MANV)
alter table PHANCONG add constraint FK_PHANCONG1 foreign key (MADA) references DEAN(MADA)
alter table DEAN add constraint FK_DEAN foreign key (MAPHG) references PHONGBAN(MAPHG)
alter table THANNHAN add constraint FK_THANNHAN foreign key (MANV) references NHANVIEN(MANV)
--NHAP DU LIEU
--NHAP DU LIEU TABLE: PHONGBAN
INSERT INTO PHONGBAN VALUES ('QL','QuanLy','001','2000-05-22')
INSERT INTO PHONGBAN VALUES ('DH','DieuHanh','003','2002-10-10')
INSERT INTO PHONGBAN VALUES ('NC','QuanLy','002','2000-03-15')
--NHAP DU LIEU TABLE: NHANVIEN
INSERT INTO NHANVIEN VALUES('001','Vuong','Ngoc','Quyen','1957-10-22','Nu','450 Trung Vuong, Ha Noi','3000000','','QL')
INSERT INTO NHANVIEN VALUES('002','Nguyen','Thanh','Tung','1955-01-09','Nam','731 Tran Hung Dao, Q1, TpHCM','2500000','001','NC')
INSERT INTO NHANVIEN VALUES('003','Le','Thi','Nhan','1960-12-18','Nu','291 Ho Van Hue, QPN, TpHCM','2500000','001','DH')
INSERT INTO NHANVIEN VALUES('004','Dinh','Ba','Tien','1968-01-09','Nam','638 Nguyen Van Cu, Q5, TpHCM','2200000','002','NC')
INSERT INTO NHANVIEN VALUES('005','Bui','Thuy','Vu','1972-07-19','Nam','332 Nguyen Thai Hoc, Q1, TpHCM','2200000','003','DH')
INSERT INTO NHANVIEN VALUES('006','Nguyen','Manh','Hung','1973-09-15','Nam','978 Ba Ria, Vung Tau','2000000','002','NC')
INSERT INTO NHANVIEN VALUES('007','Tran','Thanh','Tam','1975-07-31','Nu','543 Mai Thi Luu, Q1, TpHCM','2200000','002','NC')
INSERT INTO NHANVIEN VALUES('008','Tran','Hong','Van','1976-07-04','Nu','980 Le Hong Phong, Q10, TpHCM','1800000','004','NC')
--NHAP DU LIEU TABLE: DEAN
insert into DEAN(MADA,TENDA,DDIEM_DA,MAPHG,NGBD_DK,NGKT_DK) values ('TH001','Tin hoc hoa 1','HANOI','NC','01/02/2003','01/02/2004')
insert into DEAN(MADA,TENDA,DDIEM_DA,MAPHG,NGBD_DK,NGKT_DK) values ('TH002','Tin hoc hoa 2','TPHCM','NC','01/02/2003','01/02/2004')
insert into DEAN(MADA,TENDA,DDIEM_DA,MAPHG,NGBD_DK,NGKT_DK) values ('DT001','Dao tao 1','NHATRANG','DH','01/02/2002','01/02/2006')
insert into DEAN(MADA,TENDA,DDIEM_DA,MAPHG,NGBD_DK,NGKT_DK) values ('DT002','Dao tao 1','HANOI','DH','01/02/2002','01/02/2006')
--NHAP DU LIEU TABLE: PHANCONG
insert into PHANCONG(MANV,MADA,THOIGIAN) values ('001','TH001','30.0')
insert into PHANCONG(MANV,MADA,THOIGIAN) values ('001','TH002','12.5')
insert into PHANCONG(MANV,MADA,THOIGIAN) values ('002','TH001','10.0')
insert into PHANCONG(MANV,MADA,THOIGIAN) values ('002','TH002','10.0')
insert into PHANCONG(MANV,MADA,THOIGIAN) values ('002','DT001','10.0')
insert into PHANCONG(MANV,MADA,THOIGIAN) values ('002','DT002','10.0')
insert into PHANCONG(MANV,MADA,THOIGIAN) values ('003','TH001','37.5')
insert into PHANCONG(MANV,MADA,THOIGIAN) values ('004','DT001','22.5')
insert into PHANCONG(MANV,MADA,THOIGIAN) values ('004','DT002','10.0')
insert into PHANCONG(MANV,MADA,THOIGIAN) values ('006','DT001','30.5')
insert into PHANCONG(MANV,MADA,THOIGIAN) values ('007','TH001','20.0')
insert into PHANCONG(MANV,MADA,THOIGIAN) values ('007','TH002','10.0')
insert into PHANCONG(MANV,MADA,THOIGIAN) values ('008','TH001','10.0')
insert into PHANCONG(MANV,MADA,THOIGIAN) values ('008','DT002','12.5')
--NHAP DU LIEU TABLE: DIADIEM_PHG
insert into DIADIEM_PHG(MAPHG,DIADIEM) values ('NC','HANOI')
insert into DIADIEM_PHG(MAPHG,DIADIEM) values ('NC','TPHCM')
insert into DIADIEM_PHG(MAPHG,DIADIEM) values ('QL','TPHCM')
insert into DIADIEM_PHG(MAPHG,DIADIEM) values ('DH','HANOI')
insert into DIADIEM_PHG(MAPHG,DIADIEM) values ('DH','TPHCM')
insert into DIADIEM_PHG(MAPHG,DIADIEM) values ('DH','NHATRANG')
--NHAP DU LIEU TABLE: THANHNHAN
insert into THANNHAN(MANV,MATN,TENTN,PHAI,NGSINH,QUANHE) values ('003','1','Tran Minh Tien','Nam','1990-12-11','Con')
insert into THANNHAN(MANV,MATN,TENTN,PHAI,NGSINH,QUANHE) values ('003','2','Tran Ngoc Linh','Nu','1993-03-10','Con')
insert into THANNHAN(MANV,MATN,TENTN,PHAI,NGSINH,QUANHE) values ('003','3','Tran Minh Long','Nam','1957-10-10','Vo Chong')
insert into THANNHAN(MANV,MATN,TENTN,PHAI,NGSINH,QUANHE) values ('001','1','Le Nhat Minh','Nam','1955-04-27','Vo Chong')
insert into THANNHAN(MANV,MATN,TENTN,PHAI,NGSINH,QUANHE) values ('002','1','Le Hoai Thuong','Nu','1960-12-05','Vo Chong')
insert into THANNHAN(MANV,MATN,TENTN,PHAI,NGSINH,QUANHE) values ('004','1','Le Thi Phung','Nu','1972-12-23','Vo Chong')
insert into THANNHAN(MANV,MATN,TENTN,PHAI,NGSINH,QUANHE) values ('005','1','Tran Thu Hong','Nu','1978-04-11','Vo Chong')
insert into THANNHAN(MANV,MATN,TENTN,PHAI,NGSINH,QUANHE) values ('005','2','Nguyen Manh Tam','Nam','2003-01-13','Con')
--Câu 1: Liệt kê danh sách nhân viên được phân công tất cả đề án do phòng có MAPHG chủ trì
alter function lietke(@maphong varchar(4))
	returns table
	as
	return
	(select nv.MANV, nv.TENNV
	from NHANVIEN nv join PHANCONG pc on nv.MANV=pc.MANV
					join  DEAN da on pc.MADA=da.MADA
	where @maphong=da.MAPHG
	group by nv.MANV,nv.TENNV
	having count(pc.MADA)=(select count(*) from DEAN where MAPHG=@maphong)
	)
GO
select * from dbo.lietke('DH')
--Câu 2: Liệt kê k nhân viên có tổng thời gian tham gia các đề án cao nhất
alter function lietkenhanhvien(@k int)
	returns table return
	select TOP(@k) NHANVIEN.TENNV, sum(THOIGIAN)AS TONGTHOIGIAN
	from NHANVIEN , PHANCONG
	where NHANVIEN.MANV=PHANCONG.MANV
	GROUP BY TENNV
	ORDER BY SUM(THOIGIAN) DESC
go
select * from dbo.lietkenhanhvien(3)
--Câu 3: Liệt kê danh sách các nhân viên có tuổi lớn hơn một độ tuổi cho trước
alter function lietketuoilonnhat (@tuoi int)
	returns table return
	select *, (year(getdate()) - year(NGSINH)) as TUOI
	from NHANVIEN
	where year(getdate()) - year(NGSINH) > @tuoi
go
select * from dbo.lietketuoilonnhat(60)
