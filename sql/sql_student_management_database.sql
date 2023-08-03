CREATE DATABASE PROJECT1
GO
 /*
 - Xây dựng cơ sở dữ liệu quản lý sinh viên
 - Dữ liệu vào: 
	+ Danh sách các ngành học của khoa
	+ Danh sách hồ sơ sinh viên
	+ Danh sách các học phần ở mỗi học kỳ theo từng ngành
	+ Danh sách điểm học phần của mỗi sinh viên
- Dữ liệu vào:
	+ Tính số lượng sinh viên mỗi lớp, mỗi ngành, mỗi khoa,...
	+ Phân lớp và đánh mã sinh viên theo các yêu cầu khác nhau từ dễ đến khó
	+ Theo dõi chương trình giảng dạy các học phần theo từng ngành
	+ Theo dõi điểm học phần của mỗi sinh viên của từng học kỳ, năm và cả khoá.
	+ Đưa ra danh sách sinh viên tích luỹ, ngừng tiến độ học tập
	+ Xử lý dữ liệu: Tạo thủ tục (Procedure)  hiển thị dữ liệu, tính toán, bổ sung, cập nhật, xoá,...
	*/

USE PROJECT1
GO

-- Tạo và thêm dữ liệu vào bảng DMKHOA

CREATE TABLE DMKHOA
(
	Makhoa varchar(10) primary key not null,
	Tenkhoa nvarchar(100) not null,
)
GO
INSERT INTO DMKHOA (Makhoa, Tenkhoa) VAlUES ('CNTT', N'Công Nghệ Thông Tin')
INSERT INTO DMKHOA (Makhoa, Tenkhoa) VAlUES ('KT', N'Kế Toán')
INSERT INTO DMKHOA (Makhoa, Tenkhoa) VAlUES ('SP', N'Sư Phạm')

-- Tạo và thêm dữ liệu vào bảng DMKHOA

CREATE TABLE DMNGANH
(
	MaNganh int primary key not null,
	TenNganh nvarchar(100) not null,
	MaKhoa varchar(10) not null unique

)
GO
INSERT INTO DMNGANH (MaNganh, TenNganh, MaKHoa) VALUES (140902, N'Sư phạm toán tin', 'SP')
INSERT INTO DMNGANH (MaNganh, TenNganh, MaKHoa) VALUES (480202, N'Tin học ứng dụng', 'CNTT')

-- Tạo và thêm dữ liệu vào bảng DMLOP
CREATE TABLE DMLOP
(
	MaLop varchar(10) not null primary key,
	TenLop nvarchar(100) not null,
	MaNganh int not null,
	KhoaHoc int not null,
	HeDT nvarchar(5),
	NamNhapHoc int
)
GO
INSERT INTO DMLOP (Malop, TenLop, MaNganh, KhoaHoc, HeDT, NamNhapHoc) VALUES ('CT11', N'Cao đẳng tin hoc', 480202, 11,  'TC', 2013)
INSERT INTO DMLOP (Malop, TenLop, MaNganh, KhoaHoc, HeDT, NamNhapHoc) VALUES ('CT12', N'Cao đẳng tin hoc', 480202, 12,  'TC', 2013)
INSERT INTO DMLOP (Malop, TenLop, MaNganh, KhoaHoc, HeDT, NamNhapHoc) VALUES ('CT13', N'Cao đẳng tin hoc', 480202, 13,  'TC', 2014)

-- Tạo và thêm dữ liệu vào bảng SINHVIEN
CREATE TABLE SINHVIEN
(
	MaSV nchar(3) primary key,
	HoTen nvarchar(30) not null,
	MaLop nvarchar(10) not null,
	GioiTinh nvarchar(8) not null,
	NgaySinh date not null,
	DiaChi nvarchar(100)
)
GO
INSERT INTO SINHVIEN (MaSV, HoTen, MaLop, GioiTinh, NgaySinh, DiaChi) VALUES ('001', N'Phan Thanh', 'CT12', 'False', '09-12-1990', N'Tuy Phước')
INSERT INTO SINHVIEN (MaSV, HoTen, MaLop, GioiTinh, NgaySinh, DiaChi) VALUES ('002', N'Nguyễn Thị Cấm', 'CT12', 'True', '01-12-1994', N'Quy Nhơn')
INSERT INTO SINHVIEN (MaSV, HoTen, MaLop, GioiTinh, NgaySinh, DiaChi) VALUES ('003', N'Võ Thị Hà', 'CT12', 'True', '07-02-1995', N'An Nhơn')
INSERT INTO SINHVIEN (MaSV, HoTen, MaLop, GioiTinh, NgaySinh, DiaChi) VALUES ('004', N'Trần Hoài Nam', 'CT12', 'False', '04-05-1994', N'Tây Sơn')
INSERT INTO SINHVIEN (MaSV, HoTen, MaLop, GioiTinh, NgaySinh, DiaChi) VALUES ('005', N'Trần Văn Hoàng', 'CT13', 'False', '08-04-1995', N'Vĩnh Thạnh')
INSERT INTO SINHVIEN (MaSV, HoTen, MaLop, GioiTinh, NgaySinh, DiaChi) VALUES ('006', N'Đặng Thị Thảo', 'CT13', 'True', '06-12-1995', N'Quy Nhơn')
INSERT INTO SINHVIEN (MaSV, HoTen, MaLop, GioiTinh, NgaySinh, DiaChi) VALUES ('007', N'Lê Thị Sen', 'CT13', 'True', '08-12-1994', N'Phù Cát')
INSERT INTO SINHVIEN (MaSV, HoTen, MaLop, GioiTinh, NgaySinh, DiaChi) VALUES ('008', N'Nguyễn Văn Huy', 'CT11', 'False', '06-04-1995', N'Phù Mỹ ')
INSERT INTO SINHVIEN (MaSV, HoTen, MaLop, GioiTinh, NgaySinh, DiaChi) VALUES ('009', N'Trần Thị Hoa', 'CT11', 'True', '08-09-1994', N'Hoài Nhơn')

-- Tạo và thêm dữ liệu vào bảng DMHOCPHAN

CREATE TABLE DMHOCPHAN
(
	 MaHP nchar(3) not null primary key,
	 TenHP nvarchar(50) not null,
	 Sodvht int not null,
	 MaNganh int not null,
	 HocKy int not null,
)
GO

INSERT INTO DMHOCPHAN (MaHP, TenHP, Sodvht, MaNganh, HocKy) VALUES ('001', N'Toán cao cấp A1', 4, 480202, 1)
INSERT INTO DMHOCPHAN (MaHP, TenHP, Sodvht, MaNganh, HocKy) VALUES ('002', N'Tiếng Anh 1', 3, 480202, 1)
INSERT INTO DMHOCPHAN (MaHP, TenHP, Sodvht, MaNganh, HocKy) VALUES ('003', N'Vật lý đại cương', 4, 480202, 1)
INSERT INTO DMHOCPHAN (MaHP, TenHP, Sodvht, MaNganh, HocKy) VALUES ('004', N'Tiếng Anh 2', 7, 480202, 1)
INSERT INTO DMHOCPHAN (MaHP, TenHP, Sodvht, MaNganh, HocKy) VALUES ('005', N'Tiếng Anh 1', 3, 140909, 2)
INSERT INTO DMHOCPHAN (MaHP, TenHP, Sodvht, MaNganh, HocKy) VALUES ('006', N'Xác suất thống kê', 3, 140909, 2)

drop table dmhocphan
select * from dmhocphan
USE PROJECT1
GO

-- Tạo và thêm dữ liệu vào bảng DIEMHP
CREATE TABLE DIEMHP
(
	MaSV nchar(3),
	MaHP nchar(3),
	DiemHP  float,
	Primary key (MaSV, MaHP, DiemHP)
)
GO
INSERT INTO DIEMHP (MaSV, MaHP, DiemHP) VALUES ('002', '002', 5.9)
INSERT INTO DIEMHP (MaSV, MaHP, DiemHP) VALUES ('002', '003', 4.5)
INSERT INTO DIEMHP (MaSV, MaHP, DiemHP) VALUES ('003', '001', 4.3)
INSERT INTO DIEMHP (MaSV, MaHP, DiemHP) VALUES ('003', '002', 6.7)
INSERT INTO DIEMHP (MaSV, MaHP, DiemHP) VALUES ('003', '003', 7.3)
INSERT INTO DIEMHP (MaSV, MaHP, DiemHP) VALUES ('004', '001', 4.0)
INSERT INTO DIEMHP (MaSV, MaHP, DiemHP) VALUES ('004', '002', 5.2)
INSERT INTO DIEMHP (MaSV, MaHP, DiemHP) VALUES ('005', '001', 9.8)
INSERT INTO DIEMHP (MaSV, MaHP, DiemHP) VALUES ('005', '002', 7.9)
INSERT INTO DIEMHP (MaSV, MaHP, DiemHP) VALUES ('005', '003', 7.5)
INSERT INTO DIEMHP (MaSV, MaHP, DiemHP) VALUES ('006', '001', 6.1)
INSERT INTO DIEMHP (MaSV, MaHP, DiemHP) VALUES ('006', '002', 5.6)
INSERT INTO DIEMHP (MaSV, MaHP, DiemHP) VALUES ('006', '003', 4.0)
INSERT INTO DIEMHP (MaSV, MaHP, DiemHP) VALUES ('007', '001', 6.2)

/*
DẠNG I: CÂU LỆNH TRUY VẤN CÓ ĐIỀU KIỆN
Bài số 1: Câu lệnh SQL không kết nối
1. Hiển thị danh sách gồm: MaSV, HoTen, MaLop, NgaySinh (dd/mm/yyyy), Gioitinh (Nam, Nữ), Namsinh của những sinh viên
có họ không bắt đầu bằng chữ N,L,T.
*/
SELECT MaSV, HoTen, MaLop, 
	CONVERT (varchar(10), Ngaysinh, 103) AS NgaySinh,
		CASE GioiTinh 
		WHEN 'FALSE' THEN N'Nam' 
		ELSE N'Nữ'
		END AS Gioitinh,
	YEAR (Ngaysinh) AS Namsinh 
FROM SINHVIEN 
WHERE Hoten NOT LIKE N'[NLT]%'

--2. Hiển thị danh sách gồm: MaSV, HoTen, MaLop, NgaySinh (dd/mm/yyyy), GioiTinh (Nam, Nữ) , Namsinh 
-- của những sinh viên nam học lớp CT11.

SELECT MaSV, HoTen, MaLop, 
	CONVERT (varchar(10), Ngaysinh, 103) AS NgaySinh,
		CASE Gioitinh
		WHEN 'FALSE' THEN N'Nam'
		ELSE N'Nữ'
		END AS Gioitinh,
	YEAR (Ngaysinh) AS Namsinh
FROM SINHVIEN
WHERE MaLop = 'CT11' and GioiTinh = 'False'

-- 3. Hiển thị danh sách gồm: MaSV, HoTen, MaLop, NgaySinh, (dd/mm/yyyy),
-- GioiTinh (Nam, Nữ) của những sinh viên học lớp CT11,CT12,CT13.

-- Cách 1:
SELECT MaSV, HoTen, MaLop, CONVERT (Nchar(10), NgaySinh, 103) AS Ngaysinh,
	    CASE Gioitinh
		WHEN 'FALSE' THEN 'Nam'
		ELSE N'Nữ'
		END AS Gioitinh
FROM SINHVIEN WHERE MaLop = 'CT11' OR Malop = 'CT12' OR Malop = 'CT13'

-- Cách 2:

SELECT MaSV, HoTen, MaLop, CONVERT (Nchar(10), NgaySinh, 103) AS Ngaysinh,
	    CASE Gioitinh
		WHEN 'FALSE' THEN 'Nam'
		ELSE N'Nữ'
		END AS Gioitinh
FROM SINHVIEN WHERE MaLop IN ('CT11','CT12','CT13')

-- 4. Hiển thị danh sách gồm: MaSV, HoTen, MaLop, NgaySinh (dd/mm/yyyy), GioiTinh (Nam, Nữ), Tuổi của những sinh viên có tuổi từ 19-21	
SELECT MaSV, HoTen, MaLop, Convert( nchar(10), Ngaysinh, 103) as Ngaysinh,
	CASE GioiTinh
	WHEN 'FALSE' THEN 'NAM'
	ELSE 'NỮ'
	END GioiTinh,
	YEAR(GETDATE())-YEAR(Ngaysinh) as Tuoi
FROM SINHVIEN
WHERE YEAR(GETDATE())-YEAR(Ngaysinh) BETWEEN 19 AND 21

/* BÀI SỐ 2: CÂU LỆNH SQL CÓ KẾT NỐI
1. Hiển thị danh sách gồm MaSV, HoTên, MaLop, DiemHP, MaHP của 
những sinh viên có điểm HP >= 5.
*/

USE PROJECT1
GO

-- Cách 1:
SELECT Sinhvien.MaSV, HoTen, MaLop, DiemHP, MaHP 
FROM SINHVIEN, DIEMHP
WHERE SINHVIEN.MaSV = DIEMHP.MaSV
AND DiemHP >= 5

-- Cách 2:
SELECT Sinhvien.MaSV, HoTen, MaLop, DiemHP, MaHP 
FROM SINHVIEN INNER JOIN DIEMHP ON SINHVIEN.MaSV = DIEMHP.MaSV WHERE DIEMHP > 5

--2. Hiển thị danh sách MaSV, HoTen , MaLop, MaHP, DiemHP được sắp xếp theo ưu tiên Mã lớp, Họ tên tăng dần.
SELECT Sinhvien.MaSV, HoTen, SinhVien.MaLop, MaHP, DiemHP
FROM SINHVIEN 
INNER JOIN DIEMHP ON SINHVIEN.MaSV = DIEMHP.MaSV 
INNER JOIN DMLOP ON SINHVIEN.MaLop = DMLOP.MaLop
ORDER BY MaLop, Hoten ASC

/*
-- 3. . Hiển thị danh sách gồm MaSV, HoTen, MaLop, DiemHP, MaHP của những sinh viên có điểm HP từ 5 đến 7 ở học kỳ I.
SELECT Sinhvien.MaSV, HoTen, Sinhvien.Malop, DIEMHP, MaHP, Hocky FROM SINHVIEN
INNER JOIN DIEMHP ON SINHVIEN.MASV = DIEMHP.MASV
WHERE DIEMHP BETWEEN 5 AND 7 AND Hocky='1'

SELECT SINHVIEN.MaSV, HoTen, MaLop, DiemHP, MaHP, Hocky
FROM SINHVIEN
INNER JOIN DIEMHP ON DIEMHP.MaSV=SINHVIEN.MaSV 
WHERE (DiemHP>=5 AND DiemHP<=7) AND SELECT Hocky = '1' from DMHOCPHAN WHEHE DMHOCPHAN.MAHP = DIEMHP.MAHP
*/

-- 4. Hiển thị danh sách sinh viên gồm MaSV, HoTen, MaLop, TenLop, MaKhoa của Khoa có mã CNTT

USE PROJECT1
GO
SELECT MaSV, HoTen, Sinhvien.MaLop, Tenlop, Makhoa FROM 
SINHVIEN inner join DMLOP on SINHVIEN.MaLop = DMLOP.MaLop
inner join DMNGANH ON DMNGANH.MaNganh = DMLOP.MaNganh WHERE MaKhoa = 'CNTT'

/* 
DẠNG 2: CÂU LỆNH TRUY VẤN CÓ PHÂN NHÓM
Bài số 1: Câu lệnh SQL có từ khoá Group By không điều kiện
1. Cho biết MaLop, TenLop, tổng số sinh viên trong lớp.
2. Cho biết điểm trung bình chung của mỗi sinh viên, xuất ra bảng mới có tên DIEMTBC, biết rằng công thức tính DiemTBC như sau:
 DiemTBC= (DiemHP*SoDvht)/(SoDvht)

3. Cho biết điểm trung bình chung của mỗi sinh viên ở mỗi học kỳ
4. Cho biết Malop, Tenlop, số lượng nam nữ theo học từng lớp.
*/

-- 1.
USE PROJECT1
GO
SELECT Sinhvien.Malop, TenLop, COUNT(masv) AS Totalsv FROM
Sinhvien INNER JOIN DMLop ON Sinhvien.Malop = DMlop.malop
GROUP BY SINHVIEN.MaLop, TenLop

-- 2.
SELECT MaSV, SUM(Diemhp*sodvht)/SUM(sodvht) AS TBC INTO TBC FROM
DIEMHP INNER JOIN DMHOCPHAN ON DMHOCPHAN.MaHP = DIEMHP.MaHP
GROUP BY MaSV

-- 3.
SELECT Hocky, MaSV, SUM(Diemhp*sodvht)/SUM(sodvht) AS TBC
FROM DIEMHP INNER JOIN DMHOCPHAN ON DMHOCPHAN.MaHP = DIEMHP.MaHP
GROUP BY Hocky, MaSV
ORDER BY Hocky
-- 4.
SELECT DMLOP.MALOP, TENLOP, CASE GIOITINH WHEN 'TRUE' THEN N'NỮ' ELSE 'NAM' END AS GIOITINH, COUNT(MASV) AS SOLUONG FROM
SINHVIEN INNER JOIN DMLOP ON DMLOP.MaLop = SINHVIEN.MaLop
GROUP BY DMLOP.MaLop, Tenlop, Gioitinh
ORDER BY DMLOP.MALOP

/*
Bài số 2: CÂU LỆNH SQL CÓ TỪ KHOÁ GROUP BY VỚI ĐIỀU KIỆN LỌC
1. Cho biết điểm trung bình chung của mỗi sinh viên ở học kỳ 1.
          DIEMTBC= Tổng(DIEMHP * Sodvht)/ Tổng(Sodvht)
2. Cho biết Masv, Hoten, Số các học phần thiếu điểm (DiemHP<5) của mỗi sinh viên
3. Đếm số sinh viên có điểm HP<5 của mỗi học phần
4. Tính tổng số đơn vị học trình có điểm HP<5 của mỗi sinh viên
*/

-- 1.
USE PROJECT1
GO
SELECT MASV, SUM(DIEMHP * SODVHT)/SUM(SODVHT) AS DIEMTBC FROM
Dmhocphan INNER JOIN DIEMHP ON DMHOCPHAN.MAHP = DIEMHP.MAHP
WHERE HOCKY = '1'
GROUP BY MASV

--2.
SELECT SINHVIEN.MaSV, HoTen, COUNT(DIEMHP.MaHP) AS SLuong
FROM DIEMHP
INNER JOIN SINHVIEN ON DIEMHP.MaSV=SINHVIEN.MaSV
INNER JOIN DMHOCPHAN ON DIEMHP.MaHP=DMHOCPHAN.MaHP
WHERE DiemHP < 5
GROUP BY SINHVIEN.MaSV, HoTen
--3.
SELECT MAHP, COUNT(MASV) AS SOSV FROM DIEMHP
WHERE DiemHP < 5
GROUP BY MaHP
--4.
SELECT SINHVIEN.MASV, Hoten, SUM(sodvht) AS SLHT from DMHOCPHAN
INNER JOIN DIEMHP ON DMHOCPHAN.MAHP = DIEMHP.MAHP
INNER JOIN SINHVIEN ON DIEMHP.MaSV = SINHVIEN.MaSV
WHERE DiemHP < 5
GROUP BY SINHVIEN.MaSV, HoTen

/*
Bài số 3: Câu lệnh SQL có từ khoá GROUP BY với điều kiện nhóm.
1. Cho biết Malop, Tenlop có tổng số sinh viên  > 10.
2. Cho biết Hoten sinh viên có điểm trung bình chung các học phần <3.
3. Cho biết Hoten sinh viên có ít nhất 2 học phần có điểm <5
4. Cho biết Hoten sinh viên học TẤT CẢ các học phần ở ngành 140902.
5. Cho biết Hoten sinh viên học ít nhất 3 học phần mã '001', '002', '003'.
*/

--1
USE PROJECT1
GO
SELECT DMLop.Malop, Tenlop, Count(Sinhvien.masv) AS SLSV FROM 
SINHVIEN INNER JOIN DMLOP ON SINHVIEN.Malop = DMLOP.Malop
GROUP BY DMLop.Malop, Tenlop
Having Count(Masv) > 10
--2.
SELECT SINHVIEN.MASV, HOTEN, SUM(DIEMHP*Sodvht)/SUM(Sodvht) AS DIEMTBC
FROM SINHVIEN INNER JOIN DIEMHP ON SINHVIEN.MASV = DIEMHP.MASV
INNER JOIN DMHOCPHAN ON DMHOCPHAN.MaHP = DIEMHP.MaHP
GROUP BY SINHVIEN.MASV, HOTEN
HAVING SUM(DiemHP*Sodvht)/SUM(Sodvht) < 3
--3.
SELECT SINHVIEN.MASV, HOTEN, COUNT(DIEMHP) AS SL FROM
SINHVIEN INNER JOIN DIEMHP ON DIEMHP.MASV = SINHVIEN.MASV
WHERE DIEMHP < 5
GROUP BY SINHVIEN.MASV, HOTEN
HAVING COUNT(DIEMHP) >=2
--4.
SELECT MANGANH, SINHVIEN.MASV, HOTEN FROM
SINHVIEN INNER JOIN DIEMHP ON SINHVIEN.MASV = DIEMHP.MASV
INNER JOIN DMHOCPHAN ON DMHOCPHAN.MAHP = DIEMHP.MAHP
GROUP BY MANGANH
HAVING MANGANH =140902

SELECT HOTEN, COUNT(MAHP) AS SOLUONG FROM DIEMHP
INNER JOIN SINHVIEN ON SINHVIEN.MASV = DIEMHP.MASV
INNER JOIN DMLOP ON DMLOP.MALOP = SINHVIEN.MALOP
WHERE MANGANH ='140902'
GROUP BY HOTEN
HAVING COUNT(MAHP) = (SELECT COUNT(MAHP) FROM DMHOCPHAN WHERE MANGANH ='140902')

--5. Cho biết Hoten sinh viên học ít nhất 3 học phần mã '001', '002', '003'.
USE PROJECT1
GO

SELECT HoTen, COUNT(MaHP) AS Soluong 
FROM DIEMHP INNER JOIN SINHVIEN ON DIEMHP.MaSV=SINHVIEN.MaSV
WHERE MaHP IN ('001','002','003')
GROUP BY HoTen
HAVING COUNT(MaHP)>=3

/*
Bài số 4: CÂU LỆNH SQL CÓ TỪ KHOÁ TOP.
1. Cho biết MASV, HOTEN sinh viên có điểm TBC cao nhất ở học kỳ 1.
2. Cho biết MASV, HOTEN sinh viên có số học phần điểm HP < 5 nhiều nhất.
3. Cho biết MAHP, TENHP có số sinh viên điểm HP < 5 nhiều nhất.
*/

--1. Cho biết MASV, HOTEN sinh viên có điểm TBC cao nhất ở học kỳ 1.
SELECT TOP 1  SINHVIEN.MASV, HOTEN, SUM(DIEMHP * Sodvht)/SUM(Sodvht) AS DIEMTBC FROM SINHVIEN 
INNER JOIN DIEMHP ON SINHVIEN.MASV = DIEMHP.MASV
INNER JOIN DMHOCPHAN ON DIEMHP.MAHP = DMHOCPHAN.MAHP
WHERE HOCKY = '1'
GROUP BY SINHVIEN.MASV, HOTEN
ORDER BY SUM(DIEMHP * Sodvht)/SUM(Sodvht) DESC

--2. Cho biết MASV, HOTEN sinh viên có số học phần điểm HP < 5 nhiều nhất.
SELECT TOP 1 SINHVIEN.MASV, HOTEN, COUNT(DIEMHP) AS SOHP FROM SINHVIEN
INNER JOIN DIEMHP ON SINHVIEN.MASV = DIEMHP.MASV
WHERE DIEMHP < 5
GROUP BY SINHVIEN.MASV, HOTEN
ORDER BY COUNT(DIEMHP) DESC

--3. Cho biết MAHP, TENHP có số sinh viên điểm HP < 5 nhiều nhất.
USE PROJECT1
GO
SELECT TOP 1 DMHOCPHAN.MAHP, TENHP, COUNT(MASV) AS 'So Sinh Vien' FROM DIEMHP
INNER JOIN DMHOCPHAN ON DIEMHP.MAHP = DMHOCPHAN.MAHP
WHERE DIEMHP < 5
GROUP BY DMHOCPHAN.MAHP, TENHP
ORDER BY COUNT(MASV) DESC

/*
DẠNG 3: CÂU LỆNH TRUY VẤN VỚI CẤU TRÚC LỒNG NHAU
BẦI SỐ 1: Cấu trúc lồng nhau phủ định (KHÔNG, CHƯA).
1. Cho biết Họ tên sinh viên Không chứa học phần nào.
2. Cho biết Họ tên sinh viên chưa học học phần có mã '001'
3. Cho biết Tên học phần Không có sinh viên điểm HP < 5
4. Cho biết Họ tên sinh viên Không có học phần điểm HP < 5
*/
-- 1. Cho biết Họ tên sinh viên Không chứa học phần nào.
SELECT MASV, HOTEN FROM SINHVIEN
WHERE MASV NOT IN ( SELECT MASV FROM DIEMHP)

-- 2. Cho biết Họ tên sinh viên chưa học học phần có mã '001'
SELECT MASV, HOTEN FROM SINHVIEN
WHERE MASV NOT IN (SELECT MASV FROM DIEMHP WHERE MAHP = '001')
-- 3. Cho biết Họ tên học phần không có sinh viên điểm HP < 5	
SELECT MAHP, TENHP FROM DMHOCPHAN
WHERE MAHP NOT IN (SELECT MAHP FROM DIEMHP WHERE DIEMHP < 5)
-- 4. Cho biết Họ tên sinh viên không có học phần có điểm HP < 5.
SELECT DISTINCT SINHVIEN.MASV, HOTEN FROM SINHVIEN
WHERE MASV NOT IN (SELECT MASV FROM DIEMHP WHERE DIEMHP < 5)

/*
Bài 2: Cấu trúc lồng nhau không kết nối.
1. Cho biết tên lớp sinh viên tên Hoa.
2. Cho biết Hoten sinh viên có điểm học phần '001' là <5.
3. Cho biết danh sách các học phần có số đơn vị học trình lớn hơn hoặc bằng số đơn vị học trình của học phần mã  001.
*/

--1. Cho biết tên lớp sinh viên tên Hoa.

SELECT Tenlop FROM DMLOP WHERE
MALOP IN (SELECT MALOP FROM SINHVIEN WHERE HOTEN LIKE N'% Hoa')

--2. Cho biết Họ tên sinh viên có điểm HP '001' là < 5
SELECT SINHVIEN.MASV, HOTEN FROM SINHVIEN WHERE
MASV IN (SELECT MASV FROM DIEMHP WHERE MAHP = '001' AND DIEMHP <5)

--3. Cho biết danh sách các học phần có số đơn vị học trình lớn hơn hoặc bằng số đơn vị học trình của học phần mã 001.
SELECT * FROM DMHOCPHAN WHERE
Sodvht >= (SELECT Sodvht FROM DMHOCPHAN WHERE MAHP = '001')

/*
DẠNG 4: CÂU LỆNH TRUY VẤN VỚI LƯỢNG TỪ ALL, ANY, EXISTS.
Bài số 1: Lượng từ ALL
1. Cho biết Hoten sinh viên có DIEMHP CAO NHẤT
2. Cho biết Hoten sinh viên có tuổi CAO NHẤT
3. Cho biết MASV, Hoten sinh viên có điểm học phần mã '001' CAO NHẤT
*/

-- 1. Cho biết Hoten sinh viên có DIEMHP CAO NHẤT

SELECT SINHVIEN.MASV, HOTEN, MAHP, DIEMHP FROM DIEMHP
INNER JOIN SINHVIEN ON SINHVIEN.MASV = DIEMHP.MASV
WHERE DIEMHP >= ALL (SELECT DIEMHP FROM DIEMHP)

SELECT SINHVIEN.MASV, HOTEN FROM SINHVIEN
WHERE SINHVIEN.MASV IN (SELECT MASV FROM DIEMHP WHERE DIEMHP >= ALL(SELECT DIEMHP FROM DIEMHP))

-- 2. Cho biết Hoten sinh viên có tuổi CAO NHẤT

SELECT TOP 1 SINHVIEN.MASV, HOTEN, YEAR(GETDATE())-YEAR(NGAYSINH) AS TUOI FROM SINHVIEN
ORDER BY YEAR(GETDATE())-YEAR(NGAYSINH) DESC

SELECT SINHVIEN.MASV, HOTEN, YEAR(GETDATE())-YEAR(NGAYSINH) AS TUOI FROM SINHVIEN
WHERE YEAR(GETDATE())-YEAR(NGAYSINH) >= ALL(SELECT YEAR(GETDATE())-YEAR(NGAYSINH) FROM SINHVIEN)

--  3. Cho biết MASV, HOTEN SINH VIEN có điểm học phần mã '001' cao nhất.
USE PROJECT1
GO
SELECT SINHVIEN.MASV, HOTEN, DIEMHP FROM SINHVIEN
INNER JOIN DIEMHP ON SINHVIEN.MASV = DIEMHP.MASV
WHERE DIEMHP >= ALL (SELECT DIEMHP FROM DIEMHP WHERE MAHP = '001')

SELECT SINHVIEN.MASV, HOTEN FROM DIEMHP
INNER JOIN SINHVIEN ON SINHVIEN.MASV = DIEMHP.MASV
WHERE MAHP ='001' AND DIEMHP >= ALL (SELECT DIEMHP FROM DIEMHP WHERE MAHP = '001')

/*
Bài số 2: Lượng từ ANY
1. Cho biết Masv, MaHP có điểm HP lớn hơn bất kỳ các điểm HP của sinh viên mã '001'
2. Cho biết sinh viên có điểm học phần nào đó lớn hơn gấp rưỡi điểm trung bình chung của sinh viên đó.')
*/
-- 1. Cho biết Masv, MaHP có điểm HP lớn hơn bất kỳ các điểm HP của sinh viên mã '001'.

SELECT MASV, MAHP FROM DIEMHP
WHERE DIEMHP >= ANY (SELECT DIEMHP FROM DIEMHP WHERE MASV = '001')

-- 2. Cho biết sinh viên có điểm học phần nào đó lớn hơn gấp rưỡi điểm trung bình chung của sinh viên đó.
SELECT SINHVIEN.MASV, HOTEN, DIEMHP FROM SINHVIEN
INNER JOIN DIEMHP ON SINHVIEN.MASV = DIEMHP.MASV
INNER JOIN DMHOCPHAN ON DMHOCPHAN.MAHP = DIEMHP.MAHP
WHERE SUM(DIEMHP * Sodvht)/SUM(Sodvht)*1.5 < ANY (SELECT DIEMHP FROM DIEMHP)

SELECT MASV FROM TBC
WHERE TBC*1.5 < ANY (SELECT DIEMHP FROM DIEMHP WHERE DIEMHP.MASV = TBC.MASV)

-- Chú ý: bảng DIEMTBC được tạo ra khi thực hiện lệnh GROUP BY sau:

SELECT MaSV SUM(DiemHP*Sodvht)/SUM(Sodvht) AS DiemTBC INTO DIEMTBC
FROM DMHOCPHAN INNER JOIN DIEMHP ON DMHOCPHAN.MaHP=DIEMHP.MaHP
GROUP BY MaSV

/*
Bài số 3: Lượng từ EXISTS
1. Cho biết MASV, Hoten sinh viên đã có ít nhất một lần học học phần nào đó.
2. Cho biết MASV, Hoten sinh viên đã không học học phần nào.
3. Cho biết MALOP, TenLop đã không có sinh viên nào học.
*/

--1. Cho biết MASV, Hoten sinh viên đã có ít nhất một lần học học phần nào đó.
SELECT MASV, HOTEN FROM SINHVIEN 
WHERE MASV IN (SELECT MASV FROM DIEMHP)

SELECT MASV, HOTEN FROM SINHVIEN
WHERE EXISTS (SELECT * FROM DIEMHP WHERE SINHVIEN.MASV=DIEMHP.MASV)
-- 2. Cho biết MASV, Hoten sinh viên đã không học học phần nào.

SELECT MASV, HOTEN FROM SINHVIEN
WHERE NOT EXISTS (SELECT * FROM DIEMHP WHERE SINHVIEN.MASV=DIEMHP.MASV)

-- 3. Cho biết MALOP, TENLOP đã không có sinh viên nào học.
SELECT MALOP, TENLOP FROM DMLOP
WHERE NOT EXISTS (SELECT * FROM SINHVIEN WHERE SINHVIEN.MALOP = DMLOP.MALOP)


/*
DẠNG 5: CÂU LỆNH TRUY VẤN VỚI CẤU TRÚC TẬP HỢP
1. Cho biết MASV đã học ít nhất một trong 2 học phần có mã là '001'
2. Cho biết MaSV chưa học học phần nào.
3. Cho biết MaSV học ít nhất hai học phần có mã '001' và '002'
*/

--1. Cho biết MASV đã học ít nhất một trong 2 học phần có mã là '001'
SELECT MASV FROM DIEMHP WHERE MAHP = '001'
UNION 
SELECT MASV FROM DIEMHP WHERE MAHP = '002'

-- 2. Cho biết MASV chưa học học phần nào.
SELECT MASV FROM SINHVIEN WHERE
NOT EXISTS (SELECT * FROM DIEMHP WHERE DIEMHP.MASV = SINHVIEN.MASV)

SELECT MaSV FROM SINHVIEN 
EXCEPT (SELECT MaSV FROM DIEMHP)
-- 3. Cho biết MaSV học ít nhất 2 học phần có mã '001' và '002'

SELECT MASV FROM DIEMHP WHERE MAHP = '001'
INTERSECT
SELECT MASV FROM DIEMHP WHERE MAHP = '002'


/*
DẠNG 6: CÂU LỆNH BỔ SUNG, CẬP NHẬT, XOÁ DỮ LIỆU
Bài số 1: Lệnh INSERT bổ sung dữ liệu
1. Bổ sung một dòng dữ liệu cho bảng DMKHOA bổ giá trị sau:		('KT', 'Kế toán')
2. Bổ sung một sinh viên cho bảng SINHVIEN (dữ liệu bất kỳ)
3. Bổ sung điểm học phần cho bảng DIEMHP (dữ liệu bất kỳ)
*/

--1. Bổ sung một dòng dữ liệu cho bảng DMKHOA bổ giá trị sau:		('KT', 'Kế toán')

INSERT INTO DMKHOA VALUES ('HC', N'Kế toán')

--2. Bổ sung một sinh viên cho bảng SINHVIEN (dữ liệu bất kỳ)
USE PROJECT1
Go
INSERT INTO SINHVIEN VALUES ('010', N'Lê Thị Linh', 'CT11', 'True', '1998-01-03', N'Nghệ An')

--3. Bổ sung điểm học phần cho bảng DIEMHP (dữ liệu bất kỳ)
INSERT INTO DIEMHP VALUES ('001', '002','9.9')

/*
Bài số 2: Lệnh DELETE xoá dữ liệu
1. Xoá những sinh viên có DTBC < 3 (sinh viên buộc thôi học).
2. Xoá những sinh viên không học học phần nào.
3. Xoá khỏi bảng DMLOP những lớp không có sinh viên nào.
*/

--1. Xoá những sinh viên có DTBC < 3 (sinh viên buộc thôi học).

-- TRƯỚC HẾT TÍNH ĐIỂM TBC CỦA MỖI SINH VIÊN VÀ XUẤT RA BẢNG DIEMTBC
SELECT MaSV, Sum(DIEMHP* Sodvht)/Sum(Sodvht) AS DIEMTBC INTO DIEMTBC
FROM DMHOCPHAN INNER JOIN DIEMHP ON DMHOCPHAN.MAHP = DIEMHP.MAHP
GROUP BY MASV
ORDER BY Sum(DIEMHP*Sodvht)/Sum(Sodvht) DESC

DELETE FROM SINHVIEN
WHERE MASV IN (SELECT MASV FROM DIEMTBC WHERE DIEMTBC < 3)

--2. Xoá những sinh viên không học học phần nào.
DELETE FROM SINHVIEN
WHERE MASV NOT IN (SELECT DISTINCT MASV FROM DIEMHP)

-- 3. Xoá khỏi bảng DMLOP những lớp không có sinh viên nào.
DELETE FROM DMLOP
WHERE MALOP NOT IN (SELECT DISTINCT MALOP FROM SINHVIEN)

/*
Bài số 3: Lệnh UPDATE cập nhật dữ liệu
1. Thêm cột XEPLOAI, cập nhật dữ liệu cột Excel theo yêu cầu sau:
Nếu DiemTBC>=8 thì xếp loại Giỏi, ngược lại
Nếu DiemTBC>=7 thì xếp loại Khá, ngược lại
Nếu DiemTBC>=5 thì xếp loại Trung Bình, ngược lại là yếu
2. Thêm cột XEPLOAILOP, cập nhật dữ liệu cho cột với yêu cầu sau:
Nếu DiemTBC>=5 thì được lên lớp, ngược lại
Nếu DiemTBC>=3 thì ngừng tiến độ học tập
Ngược lại buộc thôi học.
*/

-- BẢNG DIEMTBC được tạo ra từ câu lệnh GROUP BY bên trên.
-- Thêm cột Xeploai, Xeplenlop cho bảng DIEMTBC

ALTER TABLE DIEMTBC ADD Xeploai Nvarchar(10)
ALTER TABLE DIEMTBC ADD Xeplenlop Nvarchar(60)
UPDATE DIEMTBC SET Xeploai = CASE
	WHEN DIEMTBC >= 8 THEN N'Giỏi'
	WHEN DIEMTBC >= 7 THEN N'Khá'
	WHEN DIEMTBC >= 5 THEN N'Trung Bình'
    ELSE N'Yếu'
END
ALTER TABLE DIEMTBC DROP COLUMN Xeplenlop

UPDATE DIEMTBC SET Xeplenlop = CASE
	WHEN DIEMTBC >=5 THEN N'Được lên lớp'
	WHEN DIEMTBC >=3 THEN N'Ngưng tiến độ học tập'
	ELSE N'Buộc thôi học'
END

/*
CHƯƠNG 3: LẬP TRÌNH VỚI SQL.
A. KIẾN THỨC CẦN NHỚ
1. Khai báo và sử dụng biến.
- Có 2 loại biến: Cục bộ và toàn cục.
  + Biến cục bộ: Là biến chỉ sử dụng trong đoạn chương trình khai báo nó như QUERY BATCH, STORED PROCEDURE, FUNCTION
	chứa giá trị thuộc một kiểu nhất định.
	Biến cục bộ bắt đầu bằng ký hiện: @

	KHAI BÁO: 
		DECLARE <@Tên_biến><Kiểu_dữ_liệu>,....
	GÁN GIÁ TRỊ CHO BIẾN:
		SET @tên_biến ={ giá_trị\biến\biểu_thức\SELECT,...}

   + Biến toàn cục: là biến được sử dụng bất kỳ đâu trong hệ thống. Trong SQL biến toàn cục là các biến hệ thống
   do SQL SERVER cung cấp.
   SQL Tự cập nhật giá trị cho các biến này, người sử dụng không thể gán giá trị trực tiếp cho biến này.
   Bản chất là 1 HÀM (FUNCTION) và bắt đầu bằng ký tự @@
   
   MỘT SỐ BIẾN TOÀN CỤC TRONG SQL:
	@@ERROR        : Mã số lỗi của câu lệnh T-SQL
	@@FETCH_STATUS : Trạng thái truy cập con trỏ: 
													0: nếu trạng thái truy cập thành công
													-1: nếu trạng thái truy cập không thành công
	@@IDENTITY     : Gía trị xác định (identity) được thêm vào
	@@ROWCOUNT	   : Số lượng dòng của kết quả câu lệnh SQL
	@@SERVERNAME   : Tên của server địa phương
	@@TRANSCOUNT   : Số lượng những giao dịch đang được mở
	@@VERSION      : Thông tin về phiên bản SQL server đang dùng
	@@CURROR_ROWS  : Số lượng các dòng dữ liệu của con trỏ

2. Một số cấu trúc lệnh cơ bản
2.1 Cấu trúc IF
 Cú pháp: IF<Điều kiện> 
		  Lệnh\Khối_lệnh 1
		  [ELSE Lệnh\Khối_lệnh]

	Khối lệnh là một hay nhiều lệnh nằm trong cặp từ khoá BEGIN ...END
	Gỉai thích cấu trúc: 
	Kiểm tra điều kiện, nếu điều kiện đúng thì thực hiện khối lệnh 1, ngược lại thực hiện khối lệnh 2 và kết thúc

2.2 Cấu trúc CASE
 Cú pháp: Có 2 dạng
      DẠNG 1:
	  CASE Biểu thức
	  WHEN giá trị 1 THEN kết quả 1
	  WHEN giá trị 2 THEN kết quả 2
	  -----
	  ELSE kết quả khác
	  END
	  DẠNG 2: 
	  CASE Biểu thức
	  WHEN điều kiện 1 THEN kết quả 1
	  WHEN điều kiện 2 THEN kết quả 2
	  ------
	  ELSE kết quả khác
	  END

2.3: Cấu trúc WHILE
	 WHILE <điều kiên>
	 BEGIN
	  Lệnh\Khối lệnh
	  [BREAK]
	  [CONTINUE]
	 END
Có thể thêm BREAK và CONTINUE trong khối lệnh của WHILE
	BREAK: thoái khỏi vòng WHILE hiện hành.
	CONTINUE: trở lại đầu vòng WHILE, bỏ qua các lệnh sau đó.

Gỉai thích cấu trúc: Kiểm tra điều kiện, nếu điều kiện đúng thì thực hiện khối lệnh, tiếp tục kiểm tra điều kiện,
cho đến khi nào điều kiện sai thì thoái khỏi WHILE.
Để vòng lặp không bị vô hạn thì trong nhóm lệnh phải có lệnh thay đổi điểu kiện và sau một số vòng lặp thì đièu kiện sai và kết thúc WHILE

3. THỦ TỤC (Stored Procedure)
 Thủ tục là đối tượng trong hệ quản trị CSDL bao gồm các câu lệnh SQL, chúng được kết hợp nhau thành một khối lệnh, dùng để thực hiện
 một số công việc nào đó như cập nhật, thêm mới, xoá, hiển thị, tính toán và có thể trả	về các giá trị.

 Thủ tục hệ thống: là những thủ tục do SQL cung cấp (tự nghiên cứu System Stored Procedures) tên có tiếp đầu ngữ Sp_
 Thủ tục người dùng: do người dùng tạo ra, để dễ dàng phân biệt chúng ta quy định thủ tục có tiếp đầu ngữ usp_

	+ TẠO THỦ TỤC:
				CREATE PROCEDURE <Tên thủ tục>
					Danh sách tham số vào
					[Danh sách tham số ra <Output>]
				AS 
					<Đoạn chương trình xử lý>
					[RETURN [giá trị trả về]]
				GO
	Lưu ý:
	Lệnh RETURN được sử dụng để kết thúc thủ tục và trả về giá trị là một số.
	Gía trị mặc định là RETURN 0 nghĩa là công việc thành công,
	RETURN -1 nghĩa là công việc không thành công

	+ Lời gọi thủ tuc:
				EXECUTE tên thủ tục [danh sách ác đối số]
	Số lượng cũng như thứ tự của chúng phải phù hợp với số lượng và thứ tự của các tham số khi định nghĩa thủ tục.

	+ Chỉnh sửa thủ tục: ALTER
	+ Xoá thủ tục: DROP
	+ Mã hoá thủ tục: Thủ tục sẽ được mã hoá nếu tuỳ chọn WITH ENCRYPTION được chỉ định.
	+ Biên dịch lại thủ tục: Khi người sử dụng làm thay đổi tới những INDEX của hãng. STORED PROCEDURES phải được
	biên dịch lại (recomplied) để chấp nhận những thay đổi đó.
	
		Thêm từ khoá WITH RECOMPLIED trong lệnh ALTER thủ tục.

4. HÀM (Function)
	Hàm là một đối tượng trong hệ quản trị CSDL, tương tự thủ tục.
	Điểm khác biệt: Là hàm trả về một giá trị. Giá trị có thể là một bảng có được từ một câu truy vấn.

	Hàm hệ thống: System Function
	Hàm người dùng: Do người dùng tạo ra gồm 3 dạng:
	. Scalar_valued Function: Trả về là kiểu dữ liệu cơ sở (int, varchar, float, datetime,..)
	. Table_valued Function: Giá trị trả về là một table có được từ một câu truy vấn
	. Agrgregate Function: Gía trị trả về là một bảng mà dữ liệu có được nhờ tích luỹ dần sau một chuỗi thao tác xử lý và insert.

	TẠO HÀM:
			CREATE FUNCTION tên hàm ([danh sách tham số vào])
			RETURNS (kiểu trả về của hàm\table)
			AS
			BEGIN
			các câu lệnh của hàm
			RETURN {Gía trị\biến\biểu thức\câu lệnh truy vấn}
			END

5. CON TRỎ (Cursor)	
	Là một cấu trúc dữ liệu, ánh xạ đến một danh sách gồm các dòng dữ liệu từ một kết quả truy vấn (SELECT), cho phép duyệt tuần tự các
	dòng dự liệu và đọc giá trị từng dòng trong danh sách kết quả.

	+ Định nghĩa con trỏ
			DECLARE <Tên con trỏ> CURSOR
			FOR <Câu lệnh truy vấn SELECT>
	Con trỏ là cấu trúc toàn cục, duyệt theo một chiều từ đầu đến cuối, nội dung của con trỏ có thể thay đổi.

	+ Kiểm tra tình trạng con trỏ:
		Biến hệ thống @@FETCH_STATUS: Cho biết lệnh đã duyệt đến cuối danh sách chưa.
		- Nếu = 0 thì thành công.  Con trỏ đang ở vị trí dòng thoả mãn điều kiện trong kết quả truy vấn.
		- Nếu <>0 thì không thành công. Con trỏ đang ở vị trí vượt qua dòng cuối cùng kết quả truy vấn.

CÁC BƯỚC SỬ DỤNG CON TRỎ TRONG LẬP TRÌNH:
B1. Định nghĩa CURSOR từ một kết quả SELECT
	DECLARE <tên con trỏ> CURSOR FOR <Câu lệnh SELECT>
B2. Mở Cursor.
	OPEN <tên con trỏ>, con trỏ tham chiếu đến dòng 0
B3. Truy cập đến các bản ghi
	FETCH NEXT FROM <Cursor name> INTO <ds biến>
B4. Kiểm tra có thành công không:
	Nếu @FETCH_STATUS = 0 thì xử lý lệnh, quay lại B3
	Nếu @FETCH_STATUS <>0 thì sang B5
B5. Đóng Cursor.
	CLOSE <Cursor name>
B6. Xoá tham chiếu của CURSOR
	DEALLOCATE <Cursor name>
Sử dụng con trỏ có thể đến vị trí một dòng nhất định trong tập kết quả.

6. MỘT SỐ HÀM CƠ BẢN
6.1 CÁC HÀM TOÁN HỌC:
	 
	 1. ABS(x): Trị tuyệt đối của x.
	 2. SQRT(x): Căn bậc 2 của x.
	 3. SQUARE(x): x bình phương.
	 4. POWER(y,x): y luỹ thừa x.
	 5. LOG(x): Logarit của x.
	 6. EXP(x): Hàm mũ cơ số e của x.
	 7. SIGN(x): Lấy dấu của số x (-1:x<0, 0: x=0, +1: x>1)
	 8. ROUND(x,n): Làm tròn tới n số thập phân.
	 9. CEILING(x): Số nguyên nhỏ nhất nhưng lớn hơn x.
	 10. FLOOR(x): Số nguyên lớn nhất nhưng nhỏ hơn x.
	 11. Và các hàm lượng giác: SIN, COS, TAN, ASIN, ACOS, ATAN,...

6.2 CÁC HÀM XỬ LÝ CHUỖI:

	1. ACSII(ch): MÃ ASCII của ký tự ch.
	2. CHAR(n): Ký tự có mã ASCII là n.
	3. LOWER(str): Trả về chuỗi chữ thường.
	4. UPPER(str): Trả về chuỗi in hoa.
	5. LTRIM(str): Trả về chuỗi không có dấu cách bên trái.
	6. RTRIM(str): Trả về chuỗi không có dấu cách bên phải.
	7. LEFT(str,n): Lấy n ký tự bên trái dãy str.
	8. RIGHT(str,n): Lấy n ký tự bên phải dãy str.
	9. SUBSTRING(str, start,n): Lấy n ký tự của dãy str kể từ vị trí start trong dãy.
	10. REPLACE(str1,str2,str3): Thay thế tất cả str2 trong str1 bằng str3.
	11. STUFF(str1, start, n, str2): Thay thế n ký tự trong str1 từ vị trí start bằng chuỗi str2.
	12. STR(x, len[, Dec]): Chuỗi số x thành chuỗi.

6.3 HÀM XỬ LÝ NGÀY THÁNG.
	1. GETDATE(): Cho ngày tháng năm hiện tại.
	2. DAY(dd): Cho số thứ tự ngày trong tháng của dd.
	3. MONTH(dd): Cho số thứ tự tháng trong năm của dd.
	4. YEAR(dd): Cho năm của biểu thức ngày dd.

6.4 HÀM CHUYỂN ĐỔI KIỂU DỮ LIỆU.
	1. CAST(biểu thức AS kiểu dữ liệu): Chuyển đổi giá trị của biểu thức sang kiểu được chỉ định.
	2. CONVERT (kiểu dữ liệu, biểu thức, kiểu chuyển đổi): Chuyển đổi giá trị của biểu thức sang kiểu dữ liệu
	được chỉ định. Tham số kiểu chuyển đổi là một giá trị thường được sử dụng khi chuyển đổi giá trị kiểu ngày sang
	kiểu chuỗi nhằm qui định khuôn dạng dữ liệu hiện thị và được quy định như sau:

	KIỂU CHUYỂN ĐỔI:
		101 mm/dd/yy
		102 yy.mm.dd
		103 dd.mm.yy
*/		

----------------------------------------------------------------------------------------

/*
B. PHÂN LOẠI BÀI TẬP
DẠNG 1: HÀM
Bài số 1: Viết hàm phân loại dựa vào điểm.
*/	

CREATE FUNCTION XEPLOAI
(@Diem numeric(4,1)) RETURNS nvarchar(10)
AS
BEGIN
	DECLARE @xl nvarchar(10)
	SET @xl = CASE
		WHEN @Diem >= 8 then N'Giỏi'
		WHEN @Diem >= 7 then N'Khá'
		WHEN @Diem >= 5 then N'Trung Bình'
		ELSE N'Yếu'
		END
		RETURN @xl
END
-- Hiển thị danh sách gồm: Masv, DiemTBC, Xếp loại của mỗi sinh viên và xuất ra bảng mới tên là DIEMTBC
USE PROJECT1
GO
SELECT MASV, SUM(DiemHP*Sodvht)/Sum(Sodvht) AS DIEMTBC2, dbo.XEPLOAI(SUM(DiemHP*Sodvht)/SUM(Sodvht)) AS N'Xếp loại'
INTO DIEMTBC2
FROM DMHOCPHAN INNER JOIN DIEMHP ON DMHOCPHAN.MAHP = DIEMHP.MAHP
GROUP BY MASV

SELECT * FROM DIEMTBC2
GO

/*
Bài số 2: Viết hàm tách tên từ chuỗi Họ tên
*/	

CREATE FUNCTION TACHTEN (@HT Nvarchar(30)) RETURNS Nvarchar(10)
AS
BEGIN
	DECLARE @Ten varchar(10), @L int, @i int, @j int, @kt varchar(10)
	SET @L = LEN(@HT)
	SET @i = 1
	WHILE @i <= @L   -- Độ dài của i luôn < Độ dài của cả tên
	BEGIN 
		SET @kt =SUBSTRING (@HT, @i, 1)  -- Lấy kt là vị trí bất kỳ + 1
		IF @kt = ' ' SET @i = @j  -- Nếu kt là khoảng trống thì @j là khoảng trống + 1
		SET @i =@j +1 --
	END
	SET @ten=SUBSTRING(@HT, @j+1, 10) --Tên là lấy từ vị trí @j+1 lấy thêm khoảng 10 ký tự
RETURN @ten
END
