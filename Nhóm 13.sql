--Bài 13: QUẢN LÝ COI THI TUYỂN SINH
-- Một hội đồng coi thi tuyển sinh có nhiều điểm thi, mỗi điểm thi được đặt tại một trường nào
-- đó. Các điểm thi (DIEMTHISO) được đánh số là điểm thi số 1, điểm thi số 2, điểm thi số
-- 3,...Mỗi điểm thi xác định địa chỉ (DIACHIDIEMTHI). Ví dụ: điểm thi số 1, đặt tại trường
-- PTTH Nguyễn Thị Minh Khai, điểm thi số 2 đặt tại trường PTTH Bùi Thị Xuân,...
-- Mỗi thí sinh có một số báo danh (SOBD) duy nhất, mỗi số báo danh xác định các thông tin:
-- họ và tên (HOTEN), ngày sinh (NGAYSINH), phái (PHAI), hộ khẩu thường trú (TINH), đối
-- tượng dự thi (DOITUONG), ngành đăng ký thi, khu vực của thí sinh (KHUVUC), số hiệu
-- phòng thi. Ví dụ: thí sinh Vũ Mạnh Cường, có số báo danh là 02978, sinh ngày 12/12/1984,
-- phái nam, hộ khẩu thường trú tại Chợ Gạo - Tiền Giang, thuộc khu vực 1, đối tượng là 5B,
-- đăng ký dự thi vào ngành có mã ngành là 01, thi tại phòng thi 0178, điểm thi số 1.
 --Mỗi ngành có một mã ngành (MANGANH) duy nhất, mỗi mã ngành xác định tên ngành
-- (TENNGANH)
-- Mỗi điểm thi có nhiều phòng thi – mỗi phòng thi (PHONGTHI) được đánh số khác nhau ở tất
-- cả các điểm thi. Trong một phòng thi, danh sách các thí sinh được sắp xếp theo thứ tự
-- alphabet (do đó trong một phòng thi có thể có thí sinh của nhiều ngành khác nhau).
-- Mỗi phòng thi có thêm cột ghi chú (GHICHU) - ghi thêm các thông tin cần thiết như phòng thi
-- đó nằm tại dãy nhà nào. Ví dụ phòng thi 0060 nằm ở dãy nhà H lầu 2 - điểm thi số 1 
--trường PTTH Bùi Thị Xuân.
-- Mỗi môn thi có một mã môn thi duy nhất (MAMT), mỗi mã môn thi biết các thông tin như :
-- tên môn thi (TENMT), ngày thi (NGAYTHI), buổi thi (BUOITHI), thời gian làm bài thi được
--tính bằng phút (PHUT). Thời gian làm bài thi của các môn tối thiểu là 90 phút và tối đa là
-- 180 phút (tuỳ theo kỳ tuyển sinh công nhân, trung cấp, cao đẳng hay đại học)
-- Mỗi ngành có một mã ngành, chẳng hạn ngành Công Nghệ Thông Tin có mã ngành là 01,
-- ngành Công Nghệ Hoá Thực Phẩm có mã ngành là 10,...
-- Mỗi đơn vị có cán bộ tham gia vào kỳ thi có một mã đơn vị duy nhất (MADONVI), mã đơn vị
-- xác định tên đơn vị (TENDONVI). Nếu là cán bộ, công nhân viên của trường thì đơn vị là
-- khoa/phòng quản lý cán bộ đó, nếu là giáo viên từ các trường khác thì ghi rõ tên đơn vị đó.
-- Chẳng hạn cán bộ Nguyễn Thanh Liêm đơn vị Khoa Công Nghệ Thông Tin, cán bộ coi thi
-- Nguyễn Thị Tuyết Mai, đơn vị trường PTTH Ngôi Sao - Quận 1,...
-- Mỗi cán bộ coi thi chỉ làm việc tại một điểm thi nào đó. Mỗi cán bộ có một mã số duy nhất
-- (MACANBO), mỗi MACANBO xác định các thông tin khác như : họ và tên (HOTENCB), đơn
-- vị công tác, chức vụ (CHUCVU) được phân công tại điểm thi, chẳng hạn chức vụ là điểm
-- trưởng, điểm phó, giám sát, thư ký, cán bộ coi thi, phục vụ,... Ví dụ cán bộ Nguyen Van
-- Thanh đơn vị Khoa Công Nghệ Thông Tin, làm nhiệm vụ thi tại điểm thi số 1, chức vụ là
-- giám sát phòng thi.
----------BÀI LÀM 

--DIEMTHI ( DIEMTHISO, DIACHIDIEMTHI)
--THISINH ( SOBD, HOTEN, NGAYSINH,PHAI, TINH, DOITUONG, MANGANH, KHUVUC, MAPHONG,DIEMTHISO) 
--NGANH (MANGANH, TENNGANH)
--PHONGTHI ( MAPHONG, GHICHU, DIEMTHISO)
--MONTHI ( MAMT, TENMT, NGAYTHI,BUOITHI, PHUT)
--DONVI ( MADONVI, TENDONVI)
--CANBO ( MACANBO, HOTENCB, MADONVI, DIEMTHISO,CHUCVU)   
--MONTHI_NGANH (MANGANH, MAMT)


-- TẠO DATABASE
Create Database  QLCTTS
on primary ( name=QLCTTS_data1, filename='D:\QLCTTS_data1.mdf', size=5, maxsize=20, filegrowth=1mb)
log on ( name=QLCTTS_log, filename='D:\QLCTTS_log.ldf', size=5, maxsize=20, filegrowth=1mb)
Go

-- SỬ DỤNG DATABASE VỪA TẠO 
USE QLCTTS
Go


--Tạo bảng DONVI
Create table DONVI (
    MADONVI varchar(10) not null,
    TENDONVI nvarchar(100))
GO
--Tạo bảng CANBO
Create table CANBO (
    MACANBO varchar(10)  not null,
    HOTENCB nvarchar(50),
    MADONVI varchar(10)  not null,
    DIEMTHISO varchar(10),
    CHUCVU nvarchar(50))
go

--Tạo bảng NGANH
Create table NGANH (
    MANGANH varchar(10) not null,
    TENNGANH nvarchar(100))
go
--Tạo bảng PHONGTHI
Create table PHONGTHI (
    MAPHONG varchar(10) not null ,
    GHICHU nvarchar(100),
    DIEMTHISO varchar(10) not null )
	go
--Tạo bảng THISINH
Create table THISINH (
    SOBD varchar(10) not null,
    HOTEN nvarchar(100),
    NGAYSINH DATE,
    PHAI nvarchar(5),
    TINH nvarchar(100),
    DOITUONG nvarchar(20),
    MANGANH varchar(10) not null,
    KHUVUC nvarchar(10),
    MAPHONG varchar(10)not null ,
    DIEMTHISO varchar(10  )not null)
	go
--Tạo bảng MONTHI
Create table MONTHI (
    MAMT varchar(10) not null ,
    TENMT nvarchar(100),
    NGAYTHI DATE,
    BUOITHI nvarchar(10),
    PHUT INT)
	go
--Tạo bảng DIEMTHI
Create table DIEMTHI (
    DIEMTHISO varchar(10) NOT NULL ,
    DIACHIDIEMTHI nvarchar(100))
go
--Tạo bảng MONTHI_NGANH 
create table MONTHI_NGANH (
MANGANH varchar(10)  not null  ,
MAMT varchar(10)  not null )
go
---Khóa chính
Alter table DIEMTHI add constraint pk_DIEMTHI primary key (DIEMTHISO)
Alter table THISINH add constraint pk_THISINH primary key (SOBD)
Alter table NGANH add constraint pk_NGANH primary key (MANGANH)
Alter table PHONGTHI add constraint pk_PHONGTHI primary key (MAPHONG)
Alter table MONTHI add constraint pk_MONTHI primary key (MAMT)
Alter table DONVI add constraint pk_DONVI primary key (MADONVI)
Alter table CANBO add constraint pk_CANBO primary key (MACANBO)
Alter table MONTHI_NGANH add constraint pk_MONTHINGANH primary key (MANGANH,MAMT) 
--- KHOA NGOAI
Alter table PHONGTHI add constraint fk_DIEMTHI_PHONGTHI foreign key ( DIEMTHISO) references DIEMTHI(DIEMTHISO) 
Alter table THISINH add constraint fk_THISINH_PHONGTHI foreign key ( MAPHONG) references PHONGTHI(MAPHONG) 
Alter table THISINH add constraint fk_THISINH_NGANH foreign key ( MANGANH) references NGANH(MANGANH) 
Alter table CANBO add constraint fk_DIEMTHI_CANBO foreign key (DIEMTHISO) references DIEMTHI(DIEMTHISO) 
Alter table MONTHI_NGANH add constraint fk_MONTHINGANH_NGANH foreign key (MANGANH) references NGANH(MANGANH) 
Alter table MONTHI_NGANH add constraint fk_MONTHINGANH_MONTHI foreign key (MAMT) references MONTHI(MAMT)
Alter table CANBO add constraint fk_DIEMTHI_DONVI foreign key (MADONVI) references DONVI(MADONVI) 
go

--CHÈN DỮ LIỆU VÀO CÁC BẢNG
--- Bảng MONTHI
insert into MONTHI( MAMT,TENMT, NGAYTHI,BUOITHI,PHUT)
VALUES 
('A001',N'Toán','03/06/2025',N'Sáng',90),
('A002',N'Lý','05/06/2025',N'Chiều',90),
('A003',N'Hóa','07/06/2025',N'Sáng',90),
('D001',N'Anh Văn','07/06/2025',N'Chiều',90),
('D003',N'Sinh Học','03/06/2025',N'Chiều',90),
('D002',N'Ngữ Văn','03/06/2025',N'Chiều',120),
('C001',N'Lịch Sử','08/06/2025',N'sáng',90)
go 


-- Bảng DIEMTHI
insert into DIEMTHI ( DIEMTHISO, DIACHIDIEMTHI)			
VALUES
('1', N'Trường THPT Lê Quý Đôn'),
('2', N'Trường THPT Nguyễn Du'),
('3', N'Trường THPT Trần Hưng Đạo'),
('4', N'Trường THPT Gia Định'),
('5', N'Trường THPT Nguyễn Thị Minh Khai'),
('6', N'Trường THPT Bùi Thị Xuân')
GO

-- Bảng NGANH
insert into NGANH (MANGANH, TENNGANH)	
VALUES
('1024', N'Công nghệ thông tin'),
('1025', N'Quản trị kinh doanh'),
('0234', N'Kế toán'),
('0125', N'Ngôn ngữ Anh'),
('1098', N'Du lịch'),
('1055', N'Thương mại điện tử')
GO

-- Bảng PHONGTHI
insert into PHONGTHI ( MAPHONG, GHICHU, DIEMTHISO)	
VALUES
('178', N'Dãy nhà H lầu 2', '1'),
('105', N'Dãy nhà A lầu 3', '2'),
('132', N'Dãy nhà H lầu 1', '1'),
('110', N'Dãy nhà B lầu 2', '3'),
('120', N'Dãy nhà H lầu 1', '1'),
('145', N'Dãy nhà C lầu 4', '6')
GO

-- Bảng THISINH
insert into THISINH (SOBD, HOTEN, NGAYSINH, PHAI, TINH, DOITUONG, KHUVUC, MANGANH, MAPHONG, DIEMTHISO)							
VALUES							
('2978', N'Vũ Mạnh Cường', '11/2/2007', N'Nam', N'Chợ Gạo - Tiền Giang', '5B', 'KV1', '1024', '178', '1'),							
('4521', N'Trần Thị Thu Hà', '06/03/2007', N'Nữ', N'Long Xuyên - An Giang', '3A', 'KV2', '1055', '105', '2'),							
('3897', N'Lê Văn Hùng', '09/08/2007', N'Nam', N'Bến Tre', '2C', 'KV2', '1098', '132', '1'),							
('5644', N'Nguyễn Minh Tuấn', '12/11/2006', N'Nam', N'Cái Bè - Tiền Giang', '1A', 'KV1', '0234', '110', '3'),							
('6102', N'Phạm Thị Lan', '09/03/2007', N'Nữ', N'Tân Phú - TP.HCM', '4D', 'KV3', '0125', '120', '2'),							
('3456', N'Đặng Quốc Khánh', '01/05/2006', N'Nam', N'Trà Ôn - Vĩnh Long', '6E', 'KV1', '1025', '145', '1')	
go 

-- Bảng DONVI
insert into DONVI (MADONVI, TENDONVI) 
VALUES
('DV01', N'Khoa Thương mại du lịch'),
('DV02', N'Khoa Công nghệ thông tin'),
('DV03', N'Khoa Cơ khí ô tô'),
('DV04', N'Khoa Quản trị kinh doanh'),
('DV05', N'Khoa Tài chính ngân hàng'),
('DV06', N'Khoa Ngôn ngữ')

GO

-- Bảng CANBO
insert into CANBO (MACANBO, HOTENCB, CHUCVU, DIEMTHISO, MADONVI) 
VALUES
('CB01', N'Nguyễn Văn Thanh', N'Điểm trưởng', '1', 'DV02'),
('CB02', N'Lê Thị Kim Hương', N'Điểm phó', '2', 'DV04'),
('CB03', N'Trần Văn Sáng', N'Giám sát', '3', 'DV03'),
('CB04', N'Phạm Thị Kim Thoa', N'Thư ký', '4', 'DV06'),
('CB05', N'Hồ Nhật Thanh', N'Cán bộ coi thi', '1', 'DV01'),
('CB06', N'Đặng Thị Mỹ Dung', N'Phục vụ', '3', 'DV01')
go
--- Bảng MONTHI_NGANH
insert into MONTHI_NGANH (MAMT,	MANGANH)
values 
('A001',	'1024'),
('A002',	'1024'),
('A003',	'1024'),
('D001',	'0125'),
('D002',	'0125'),
('A001',	'1025'),
('A002',	'1025'),
('D002',	'1025')

go 


---------- 13 CÂU TRUY VẤN 


--1.4.1 2 câu truy vấn kết nối nhiều bảng 
--a) Cho biết các thôn tin của những thí sinh nào thi môn toán. Thông tin gồm: SOBD, HOTEN, MANGANH, TENNGANH, TENMT, DIACHIDIEMTHI
Select t.SOBD , t.HOTEN,n.MANGANH,n.TENNGANH, m.TENMT, d.DIACHIDIEMTHI
From 
[dbo].[NGANH] as n, 
[dbo].[MONTHI] as m, 
[dbo].[MONTHI_NGANH] as mn, 
[dbo].[THISINH] as t, 
[dbo].[DIEMTHI] as d
Where 
m.MAMT=mn.MAMT 
and n.MANGANH=mn.MANGANH 
and t.MANGANH=mn.MANGANH 
and  t.DIEMTHISO=d.DIEMTHISO
and m.TENMT='Toán'
--b) Cho biết thông tin của những thí sinh thi buổi 'Sáng'. 
Select t.*, m.BUOITHI
From 
[dbo].[THISINH] as t, 
[dbo].[MONTHI] as m, 
[dbo].[MONTHI_NGANH] as n 
Where 
t.MANGANH=n.MANGANH 
and n.MAMT=m.MAMT 
and m.BUOITHI='Sáng' 
--1.4.2 2 câu update
--a) Sau khi rà soát bên phía nhà trường quyết định tháy đổi thời gian thi của các môn thi xuống 60 ngoại trừ 2 môn toán , ngữ văn . Đồng thời các môn có thời gian thi 60 thì chuyển sang thi vào buổi sáng vào ngày 5/6/2025, còn lại thi vào buổi chiều vào ngày hôm sau.
Update MONTHI set PHUT = 60 Where TENMT not in (N'Toán', N'Ngữ Văn')
Update MONTHI set BUOITHI = N'Sáng', NGAYTHI = '2025-06-05' 
where PHUT = 60
Update MONTHI set BUOITHI = N'Chiều', NGAYTHI = '2025-06-06'
Where PHUT <> 60
--b) Hãy cập nhật ở bảng DIEMTHI như sau, sau khi ra soát thì chúng tôi phát hiện ở DIEMSOTHI nhỏ nhất bị sai tên Trường và cần bạn cập nhật lại thành  'Trường THPT Nguyễn Trãi'
Update DIEMTHI set DIACHIDIEMTHI = N'Trường THPT Nguyễn Trãi'
Where 
DIEMTHISO = (select min(cast(DIEMTHISO as INT)) from DIEMTHI)
--1.4.3 2 câu delete
--a) Xóa tất cả thí sinh thi ngành "Thương mại điện tử" tại điểm thi số 2.
Delete from THISINH
Where MANGANH = ( select MANGANH 
                  from NGANH 
                   where TENNGANH =  N'Thương mại điện tử')
And DIEMTHISO = 2
--b) Xóa tất cả các thí sinh sinh sau năm 2000 và thi tại điểm thi ở "Trường THPT Lê Quý Đôn".
Delete t from THISINH t
JOIN PHONGTHI p ON t.MAPHONG = p.MAPHONG
JOIN DIEMTHI d ON p.DIEMTHISO = d.DIEMTHISO
WHERE YEAR(t.NGAYSINH) > 2000
AND d.DIACHIDIEMTHI = N'Trường THPT Lê Quý Đôn'
--1.4.4 2 câu group by
--a) Liệt kê các điểm thi mà số lượng cán bộ phân công ít hơn số phòng thi có thí sinh dự thi.
Select 
  CB.DIEMTHISO,
  count(distinct CB.MACANBO) as SoCanBo,
  count(distinct TS.MAPHONG) as SoPhongThi
From CANBO CB
Join THISINH TS on CB.DIEMTHISO = TS.DIEMTHISO
Group by CB.DIEMTHISO
Having count(distinct CB.MACANBO) < count(distinct TS.MAPHONG)
--b) Thống kê số lượng cán bộ theo điểm thi số và chức vụ, đồng thời hiển thị thêm tên đơn vị tương ứng.
Select 
  cb.DIEMTHISO,
  cb.CHUCVU,
  dv.TENDONVI,
  Count(*) as SoLuongCanBo
From  CANBO cb
Join  DONVI dv on cb.MADONVI = dv.MADONVI
Group by  cb.DIEMTHISO, cb.CHUCVU, dv.TENDONVI
Order by  cb.DIEMTHISO
--1.4.5 2 câu sub query
--a) Tìm tên thí sinh có điểm thi tại điểm thi "Trường THPT Bùi Thị Xuân"
SELECT HOTEN
FROM THISINH
WHERE MAPHONG IN (
    SELECT MAPHONG
    FROM PHONGTHI
WHERE DIEMTHISO = (
    SELECT DIEMTHISO
    FROM DIEMTHI
    WHERE DIACHIDIEMTHI = N'Trường THPT Bùi Thị Xuân'))

--b) Tìm tất cả các cán bộ làm việc ở các đơn vị có tên chứa từ 'Khoa Thương'.
SELECT HOTENCB
FROM CANBO
WHERE MADONVI IN (
    SELECT MADONVI
    FROM DONVI
    WHERE TENDONVI LIKE N'%Khoa Thương%')
--1.4.6 3 câu bất kì
--a) Cho biết những thí sinh nào không học ngành "Công nghệ thông tin"
Select t.SOBD,t.HOTEN, n.TENNGANH,n.MANGANH
From 
[dbo].[THISINH] as t, 
[dbo].[NGANH] as n
Where 
t.MANGANH=n.MANGANH 
and n.TENNGANH not like N'Công nghệ thông tin'
--b) Danh sách các môn thi không có thí sinh dự thi.
Select M.MAMT, M.TENMT
From MONTHI M
Where M.MAMT not in 
( select distinct MN.MAMT
From THISINH TS
Join MONTHI_NGANH MN on TS.MANGANH = MN.MANGANH)
--c) Tìm các phòng có điểm thi số lớn hơn hoặc bằng 3 và ghi chú chứa chữ "Dãy nhà B".
Select MAPHONG, GHICHU, DIEMTHISO
From PHONGTHI
Where DIEMTHISO >= 3 and GHICHU like N'%Dãy nhà B%'
 
