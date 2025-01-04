--1.1
SELECT *
FROM SINHVIEN
WHERE hodem like N'Lê%'
--1.2
SELECT *
FROM SINHVIEN
WHERE hodem like N'Thị%' or hodem like N'%Thị%'
--1.3
SELECT *
FROM SINHVIEN
WHERE hodem like N'% Văn'
--1.4
SELECT s.masinhvien, s.hodem+' '+s.ten as N'Họ và tên',s.ngaysinh, s.gioitinh,l.malop,l.tenlop
FROM SINHVIEN as s JOIN LOP as l ON s.malop = l.malop
WHERE s.hodem like N'Dư %' or s.hodem like N'Dư' or s.ten like N'V%'
--1.5
SELECT masinhvien,hodem+' '+ten as N'Họ và tên',ngaysinh,gioitinh,noisinh
FROM SINHVIEN
WHERE noisinh like N'%Huế%'
--1.6
SELECT s.masinhvien, s.hodem+' '+s.ten as N'Họ và tên',s.ngaysinh, s.gioitinh,l.malop,l.tenlop
FROM SINHVIEN as s JOIN LOP as l ON s.malop = l.malop
WHERE YEAR(s.ngaysinh) = '1992' and MONTH(s.ngaysinh) between 3 and 8
--1.7
SELECT s.masinhvien, s.hodem+' '+s.ten as N'Họ và tên',s.ngaysinh, s.gioitinh,l.malop,l.tenlop
FROM SINHVIEN as s JOIN LOP as l ON s.malop = l.malop
WHERE s.gioitinh = 0 and MONTH(s.ngaysinh) between 5 and 11
--1.8
SELECT s.masinhvien,s.hodem+' '+ s.ten as N'Họ và tên' ,s.ngaysinh,s.gioitinh,l.malop,l.tenlop 
from SINHVIEN  s join LOP  l on s.malop = l.malop
where s.hodem NOT LIKE N'Lê%' and s.hodem NOT LIKE N'Dư%' and s.hodem NOT LIKE N'Võ%' and s.hodem NOT LIKE N'Nguyễn%';
--1.9 (thiếu 1)
SELECT s.masinhvien, s.hodem+' '+s.ten as N'Họ và tên',s.ngaysinh, s.gioitinh,l.malop,l.tenlop
FROM SINHVIEN  s JOIN LOP  l ON s.malop = l.malop
WHERE s.hodem like N'Lê' and s.ten like N'Nga' or s.ten like N'Lý'
--1.10
SELECT masinhvien,hodem+' '+ten as N'Họ và tên',ngaysinh,gioitinh,noisinh
FROM SINHVIEN
WHERE noisinh is NULL
--1.11
SELECT l.malop,l.tenlop,COUNT(s.masinhvien) as N'Tổng số sinh viên'
FROM LOP l left join SINHVIEN s on l.malop = s.malop
GROUP BY l.malop,tenlop
--1.12
SELECT l.malop,l.tenlop
FROM LOP l left join SINHVIEN s on l.malop = s.malop
WHERE s.malop is NULL
--1.13
SELECT TOP 1 l.malop,l.tenlop,COUNT(s.masinhvien) as N'Tổng số sinh viên'
FROM LOP l left join SINHVIEN s on l.malop = s.malop
GROUP BY l.malop,tenlop
ORDER BY N'Tổng số sinh viên' DESC
--1.14
SELECT TOP 5 noisinh, COUNT(masinhvien) as TongSV
FROM SINHVIEN
GROUP BY noisinh
ORDER BY TongSV DESC
--1.15
SELECT TOP 5 s.masinhvien,s.hodem+' '+s.ten as N'Họ và tên',s.ngaysinh,s.gioitinh,l.malop,l.tenlop,(diemmon1+diemmon2+diemmon3)/3.0 as N'Điểm trung bình'
FROM SINHVIEN s JOIN DIEMTS d on s.masinhvien = d.masinhvien JOIN LOP l on l.malop = s.malop
ORDER BY N'Điểm trung bình' DESC,gioitinh ASC
--1.16
SELECT TOP 5 s.masinhvien,s.hodem+' '+s.ten as N'Họ và tên',s.ngaysinh,s.gioitinh,d.diemmon1
FROM SINHVIEN s JOIN DIEMTS d ON s.masinhvien = d.masinhvien
ORDER BY diemmon1 DESC
--1.17
SELECT TOP 5 s.masinhvien,s.hodem+' '+s.ten as N'Họ và tên',s.ngaysinh,s.gioitinh,(diemmon1+diemmon2+diemmon3)/3.0 as N'Điểm trung bình'
FROM SINHVIEN s JOIN DIEMTS d on s.masinhvien = d.masinhvien 
ORDER BY N'Điểm trung bình' DESC
--1.18
SELECT masinhvien,hodem+' '+ten as N'Họ và tên',ngaysinh,gioitinh,noisinh
FROM SINHVIEN
WHERE noisinh = ( SELECT noisinh
								FROM SINHVIEN
								WHERE masinhvien = 'DL03')
--1.19
CREATE TABLE [dbo].[SINHVIEN_HO_LE](
	[masinhvien] [nvarchar](10) NOT NULL,
	[hodem] [nvarchar](45) NOT NULL,
	[ten] [nvarchar](15) NOT NULL,
	[ngaysinh] [date] NOT NULL,
	[gioitinh] [bit] NOT NULL,
	[malop] [nvarchar](15) NOT NULL,
	[noisinh] [nvarchar](250) NULL,

);
--1.20
INSERT INTO [dbo].[SINHVIEN_HO_LE] (masinhvien, hodem, ten, ngaysinh, gioitinh, noisinh)
SELECT masinhvien, hodem, ten, ngaysinh, gioitinh, noisinh
FROM [dbo].[SINHVIEN]
WHERE hodem like N'Lê%'


