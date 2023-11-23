CREATE DATABASE SQL_BTL
GO
USE SQL_BTL
GO

-- Cửa Hàng
CREATE TABLE CuaHang (
    MaCH NVARCHAR(15) PRIMARY KEY,
    TenCH NVARCHAR(400) NOT NULL,
    DiaChi NVARCHAR(400) NOT NULL
);
GO

-- Cửa Hàng - SDT
CREATE TABLE CuaHang_SDT (
    MaCH NVARCHAR(15) NOT NULL,
	SDT NVARCHAR(400) PRIMARY KEY
);
GO

-- Nhân Viên
CREATE TABLE NhanVien (
    MaNV NVARCHAR(15) PRIMARY KEY,
	MaCH NVARCHAR(15) NOT NULL,
    HoTen NVARCHAR(400) NOT NULL,
    GioiTinh NVARCHAR(400) NOT NULL,
    ChucVu NVARCHAR(400) NOT NULL,
    DiaChi NVARCHAR(400) NOT NULL
);
GO

-- Nhân Viên - SDT
CREATE TABLE NhanVien_SDT (
    MaNV NVARCHAR(15) NOT NULL,
	SDT NVARCHAR(400) PRIMARY KEY
);
GO

-- Người Thân
CREATE TABLE NguoiThan(
	ID INT IDENTITY(1,1) PRIMARY KEY,
	MaNV NVARCHAR(15) NOT NULL,
	HoTen NVARCHAR(400) NOT NULL,
	MoiQuanHe NVARCHAR(400) NOT NULL,
	SDT NVARCHAR(400) NOT NULL
)

-- Khách Hàng
CREATE TABLE KhachHang (
    MaKH NVARCHAR(15) PRIMARY KEY,
    TenKH NVARCHAR(400) NOT NULL,
    GioiTinh NVARCHAR(400) NOT NULL,
    DiaChi NVARCHAR(400) NOT NULL
);
GO

-- Khách Hàng - SĐT
CREATE TABLE KhachHang_SDT (
    MaKH NVARCHAR(15)	NOT NULL,   
	SDT NVARCHAR(400) PRIMARY KEY,
);
GO

-- Hoá Đơn Bán
CREATE TABLE HoaDonBan (
    MaHDB NVARCHAR(15) PRIMARY KEY,
	MaCH NVARCHAR(15),
    NgayBan DATE,
    TongGia INT,
    TongSo INT
);
GO

-- Kho
CREATE TABLE Kho (
    MaKho NVARCHAR(15) PRIMARY KEY,
	MaCH NVARCHAR(15),
    SoLoaiHang INT
);
GO

-- Hàng Hoá
CREATE TABLE HangHoa (
    MaHH NVARCHAR(15) PRIMARY KEY,
	MaKho NVARCHAR(15),
    TenHH NVARCHAR(400) NOT NULL,
	Hang NVARCHAR(400) NOT NULL,
    GiaBan INT NOT NULL,
    SoLuong INT NOT NULL
);
GO

-- Bán Hàng
CREATE TABLE BanHang (
	MaHDB NVARCHAR(15) PRIMARY KEY,
    MaKH NVARCHAR(15) NOT NULL,
	MaNV NVARCHAR(15) NOT NULL
);
GO

-- Điện Thoại
CREATE TABLE DienThoai (
    MaDT NVARCHAR(15) PRIMARY KEY,  
	KieuManHinh NVARCHAR(400) NOT NULL,
);
GO

-- Máy Tính
CREATE TABLE MayTinh (
    MaMT NVARCHAR(15) PRIMARY KEY,
	CardDoHoa NVARCHAR(400) NOT NULL,
	CPU NVARCHAR(400) NOT NULL
);
GO

-- Danh Mục Bán
CREATE TABLE DanhMucBan (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	MaHDB NVARCHAR(15) NOT NULL,
    MaHH NVARCHAR(15) NOT NULL,
	SoLuong INT
);
GO

-- Thêm khóa ngoại từ bảng CuaHang_SDT
    ALTER TABLE CuaHang_SDT ADD FOREIGN KEY (MaCH) REFERENCES CuaHang(MaCH)
-- Thêm khóa ngoại từ bảng NhanVien
	ALTER TABLE NhanVien ADD FOREIGN KEY (MaCH) REFERENCES CuaHang(MaCH)
-- Thêm khóa ngoại từ bảng NhanVien_SDT
	ALTER TABLE NhanVien_SDT ADD FOREIGN KEY (MaNV) REFERENCES NhanVien(MaNV)
-- Thêm khóa ngoại từ bảng NguoiThan
	ALTER TABLE NguoiThan ADD FOREIGN KEY (MaNV) REFERENCES NhanVien(MaNV)
-- Thêm khóa ngoại từ bảng KhachHang_SDT
	ALTER TABLE KhachHang_SDT ADD FOREIGN KEY (MaKH) REFERENCES KhachHang(MaKH)
-- Thêm khóa ngoại từ bảng HoaDonBan
	ALTER TABLE HoaDonBan ADD FOREIGN KEY (MaCH) REFERENCES CuaHang(MaCH)
-- Thêm khóa ngoại từ bảng Kho
	ALTER TABLE Kho ADD FOREIGN KEY (MaCH) REFERENCES CuaHang(MaCH)
-- Thêm khóa ngoại từ bảng HangHoa
	ALTER TABLE HangHoa ADD FOREIGN KEY (MaKho) REFERENCES Kho(MaKho)
-- Thêm khóa ngoại từ bảng BanHang
    ALTER TABLE BanHang ADD FOREIGN KEY (MaHDB) REFERENCES HoaDonBan(MaHDB)
    ALTER TABLE BanHang ADD FOREIGN KEY (MaKH) REFERENCES KhachHang(MaKH)
    ALTER TABLE BanHang ADD FOREIGN KEY (MaNV) REFERENCES NhanVien(MaNV)
-- Thêm khóa ngoại từ bảng DienThoai
	ALTER TABLE DienThoai ADD FOREIGN KEY (MaDT) REFERENCES HangHoa(MaHH)
-- Thêm khóa ngoại từ bảng MayTinh
	ALTER TABLE MayTinh ADD FOREIGN KEY (MaMT) REFERENCES HangHoa(MaHH)
-- Thêm khóa ngoại từ bảng DanhMucBan
	ALTER TABLE DanhMucBan ADD FOREIGN KEY (MaHH) REFERENCES HangHoa(MaHH)
	ALTER TABLE DanhMucBan ADD FOREIGN KEY (MaHDB) REFERENCES HoaDonBan(MaHDB)

-- insert data
USE SQL_BTL
GO
DELETE CuaHang
DELETE CuaHang_SDT
DELETE NhanVien
DELETE NhanVien_SDT
DELETE NguoiThan
DELETE KhachHang
DELETE KhachHang_SDT
DELETE HoaDonBan
DELETE HangHoa
DELETE BanHang
DELETE DienThoai
DELETE MayTinh
DELETE DanhMucBan

INSERT INTO CuaHang
VALUES
(N'MCH01', N'Phúc Anh Smart World', N'15 Trần Phú, Hà Đông, Hà Nội');

INSERT INTO CuaHang_SDT
VALUES
(N'MCH01', N'18006610'),
(N'MCH01', N'18006616');

INSERT INTO NhanVien
VALUES
(N'MNV01', N'MCH01', N'Nguyễn Duy Hùng', N'Nam', N'Quản Lý', N'87 Trần Phú, Hà Đông, Hà Nội'),
(N'MNV02', N'MCH01', N'Hoàng Duy Minh', N'Nam', N'Nhân Viên', N'4 Triều Khúc, Hà Đông, Hà Nội'),
(N'MNV03', N'MCH01', N'Nguyễn Xuân Mai', N'Nữ', N'Nhân Viên', N'100 Triều Khúc, Hà Đông, Hà Nội'),
(N'MNV04', N'MCH01', N'Trần Thu Ngọc', N'Nữ', N'Nhân Viên', N'74 Lê Văn Lương, Thanh Xuân, Hà Nội'),
(N'MNV05', N'MCH01', N'Hoàng Chi Duy', N'Nam', N'Nhân Viên', N'31 Nguyễn Thị Đình, Thanh Xuân, Hà Nội'),
(N'MNV06', N'MCH01', N'Trần Huy Minh', N'Nam', N'Nhân Viên', N'26 Trần Đạo Thúy, Thanh Xuân, Hà Nội'),
(N'MNV07', N'MCH01', N'Trần Thị Duyên', N'Nữ', N'Nhân Viên', N'29 Tân Triều, Hà Đông, Hà Nội'),
(N'MNV08', N'MCH01', N'Trần Đình Minh', N'Nam', N'Nhân Viên', N'93 Trần Phú, Hà Đông, Hà Nội'),
(N'MNV09', N'MCH01', N'Lê Mai Thu', N'Nữ', N'Nhân Viên', N'35 Tố Hữu, Thanh Xuân, Hà Nội'),
(N'MNV10', N'MCH01', N'Hoàng Lê Nga', N'Nữ', N'Nhân Viên', N'58 Trường Chinh, Thanh Xuân, Hà Nội'),
(N'MNV11', N'MCH01', N'Nguyễn Anh Anh', N'Nữ', N'Nhân Viên', N'81 Triều Khúc, Hà Đông, Hà Nội'),
(N'MNV12', N'MCH01', N'Nguyễn Mai Ngọc', N'Nữ', N'Nhân Viên', N'48 Nguyễn Khuyển, Hà Đông, Hà Nội'),
(N'MNV13', N'MCH01', N'Phạm Manh Minh', N'Nam', N'Nhân Viên', N'84 Trần Phú, Hà Đông, Hà Nội'),
(N'MNV14', N'MCH01', N'Nguyễn Minh Huy', N'Nam', N'Nhân Viên', N'5 Mộ Lao, Hà Đông, Hà Nội'),
(N'MNV15', N'MCH01', N'Phạm Anh Duyên', N'Nữ', N'Nhân Viên', N'88 Nguyễn Xiển, Thanh Xuân, Hà Nội'),
(N'MNV16', N'MCH01', N'Phạm Chi Duy', N'Nam', N'Nhân Viên', N'Nguyễn Thị Đình, Thanh Xuân, Hà Nội'),
(N'MNV17', N'MCH01', N'Hoàng Hải Anh', N'Nam', N'Nhân Viên', N'92 Trần Đạo Thúy, Thanh Xuân, Hà Nội'),
(N'MNV18', N'MCH01', N'Nguyễn Kiên Đức', N'Nam', N'Nhân Viên', N'43 Trường Chinh, Thanh Xuân, Hà Nội'),
(N'MNV19', N'MCH01', N'Nguyễn Thị Mai', N'Nữ', N'Nhân Viên', N'60 Trần Phú, Hà Đông, Hà Nội'),
(N'MNV20', N'MCH01', N'Phạm Thu Giang', N'Nữ', N'Nhân Viên', N'30 Nguyễn Trãi, Thanh Xuân, Hà Nội');

INSERT INTO NhanVien_SDT
VALUES
(N'MNV01', N'099657978'),
(N'MNV02', N'095179902'),
(N'MNV02', N'097711983'),
(N'MNV03', N'099856747'),
(N'MNV04', N'090314868'),
(N'MNV05', N'097712891'),
(N'MNV05', N'099935772'),
(N'MNV06', N'093221700'),
(N'MNV07', N'090096673'),
(N'MNV08', N'096100235'),
(N'MNV09', N'094023459'),
(N'MNV10', N'097962302'),
(N'MNV10', N'093880859'),
(N'MNV11', N'090543529'),
(N'MNV12', N'095710267'),
(N'MNV13', N'097572383'),
(N'MNV14', N'095458690'),
(N'MNV15', N'095396947'),
(N'MNV16', N'096312307'),
(N'MNV17', N'090696088'),
(N'MNV18', N'091928239'),
(N'MNV19', N'095114276'),
(N'MNV20', N'091534110');

INSERT INTO NguoiThan
VALUES
(N'MNV01', N'Hồ Chi Huyền', N'Chị gái', N'093418203'),
(N'MNV02', N'Lý Lê Anh', N'Anh trai', N'091558159'),
(N'MNV03', N'Lê Huy Thắng', N'Bố', N'099922749'),
(N'MNV04', N'Phạm Mai Tuyết', N'Chị gái', N'093490942'),
(N'MNV05', N'Trương Hoa Giang', N'Mẹ', N'090664987'),
(N'MNV06', N'Võ Huy Hải', N'Bố', N'095191808'),
(N'MNV07', N'Trần Thu Hạnh', N'Mẹ', N'098786638'),
(N'MNV08', N'Hồ Chi Nam', N'Anh trai', N'090396092'),
(N'MNV09', N'Nguyễn Mỹ Hương', N'Mẹ', N'099091438'),
(N'MNV10', N'Phạm Hoa Liên', N'Mẹ', N'092392219'),
(N'MNV11', N'Võ Văn Tùng', N'Bố', N'098189479'),
(N'MNV12', N'Ngô Anh Hương', N'Chị gái', N'095626655'),
(N'MNV13', N'Lý Văn Nam', N'Bố', N'098343471N'),
(N'MNV14', N'Trương Hải Kiên', N'Anh trai', N'091409972'),
(N'MNV15', N'Ngô Minh Huy', N'Bố', N'095071829'),
(N'MNV16', N'Ngô Mỹ Nhi', N'Mẹ', N'098405791'),
(N'MNV17', N'Nguyễn Duy Khải', N'Anh trai', N'093663087'),
(N'MNV18', N'Hồ Mai Uyên', N'Chị gái', N'092345451'),
(N'MNV19', N'Hoàng Mỹ Phương', N'Chị gái', N'093582224'),
(N'MNV20', N'Lê Mỹ Uyên', N'Mẹ', N'090624946');

INSERT INTO KhachHang
VALUES
(N'MKH001', N'Trần Công Anh', N'Nam', N'47 Cầu Diễn, Nam Từ Liêm, Hà Nội'),
(N'MKH002', N'Hoàng Minh Hà', N'Nữ', N'20 Tân Triều, Hà Đông, Hà Nội'),
(N'MKH003', N'Trần Văn Đức', N'Nam', N'71 Triều Khúc, Hà Đông, Hà Nội'),
(N'MKH004', N'Lê Thị Nhung', N'Nữ', N'44 Hồ Tùng Mậu, Nam Từ Liêm, Hà Nội'),
(N'MKH005', N'Trần Công Duy', N'Nam', N'20 Đại An, Hà Đông, Hà Nội'),
(N'MKH006', N'Lê Văn Nhung', N'Nữ', N'11 Bạch Mai, Hai Bà Trưng, Hà Nội'),
(N'MKH007', N'Nguyễn Anh Hùng', N'Nam', N'63 Nguyễn Khuyển, Hà Đông, Hà Nội'),
(N'MKH008', N'Hoàng Công Duy', N'Nam', N'94 Trần Phú, Hà Đông, Hà Nội'),
(N'MKH009', N'Lê Văn Duy', N'Nam', N'7 Trần Phú, Hà Đông, Hà Nội'),
(N'MKH010', N'Trần Ngọc Hà', N'Nữ', N'7 Lê Trọng Tấn, Nam Từ Liêm, Hà Nội'),
(N'MKH011', N'Lê Ngọc Nam', N'Nam', N'57 Mộ Lao, Hà Đông, Hà Nội'),
(N'MKH012', N'Hoàng Minh Hoàng', N'Nam', N'14 Lê Đức Thọ, Nam Từ Liêm, Hà Nội'),
(N'MKH013', N'Nguyễn Anh Dũng', N'Nam', N'30 Trần Phú, Hà Đông, Hà Nội'),
(N'MKH014', N'Nguyễn Ngọc Đức', N'Nam', N'57 Tân Triều, Hà Đông, Hà Nội'),
(N'MKH015', N'Vũ Thị Hà', N'Nữ', N'49 Đại Cồ Việt, Hai Bà Trưng, Hà Nội');

INSERT INTO KhachHang_SDT
VALUES
(N'MKH001', N'077129664'),
(N'MKH002', N'091390288'),
(N'MKH003', N'036728957'),
(N'MKH004', N'070195844'),
(N'MKH005', N'033611499'),
(N'MKH006', N'076375587'),
(N'MKH007', N'035965677'),
(N'MKH008', N'093980897'),
(N'MKH009', N'079107843'),
(N'MKH010', N'099168075'),
(N'MKH011', N'092819573'),
(N'MKH012', N'031283294'),
(N'MKH013', N'073332143'),
(N'MKH014', N'030262485'),
(N'MKH015', N'090421578');

INSERT INTO HoaDonBan
VALUES
(N'HDB001', 'MCH01', '2023-11-23', '25990000', '1'),
(N'HDB002', 'MCH01', '2023-11-30', '43980000', '2'),
(N'HDB003', 'MCH01', '2023-12-03', '41980000', '2'),
(N'HDB004', 'MCH01', '2023-12-14', '35980000', '2'),
(N'HDB005', 'MCH01', '2023-12-25', '39990000', '1'),
(N'HDB006', 'MCH01', '2023-01-06', '79980000', '2'),
(N'HDB007', 'MCH01', '2023-01-07', '29990000', '1'),
(N'HDB008', 'MCH01', '2023-01-18', '49980000', '2'),
(N'HDB009', 'MCH01', '2023-01-29', '29990000', '1'),
(N'HDB010', 'MCH01', '2023-01-30', '54990000', '1'),
(N'HDB011', 'MCH01', '2023-02-04', '34990000', '1'),
(N'HDB012', 'MCH01', '2023-02-07', '33980000', '2'),
(N'HDB013', 'MCH01', '2023-02-18', '29990000', '1'),
(N'HDB014', 'MCH01', '2023-02-20', '29990000', '1'),
(N'HDB015', 'MCH01', '2023-02-25', '39990000', '1');

INSERT INTO Kho 
VALUES
('MK01', 'MCH01', '29');

INSERT INTO HangHoa
VALUES
(N'MaDT001', 'MK01', N'Samsung Galaxy S23 Ultra', N'Samsung', 31990000, 2),
(N'MaDT002', 'MK01', N'iPhone 14 Pro Max', N'Apple', 39990000, 3),
(N'MaDT003', 'MK01', N'Xiaomi 12S Ultra', N'Xiaomi', 29990000, 6),
(N'MaDT004', 'MK01', N'OPPO Find X5 Pro', N'OPPO', 25990000, 4),
(N'MaDT005', 'MK01', N'Vivo X80 Pro', N'Vivo', 24990000, 3),
(N'MaDT006', 'MK01', N'Realme GT 2 Pro', N'Realme', 18990000, 6),
(N'MaDT007', 'MK01', N'OnePlus 10 Pro', N'OnePlus', 17990000, 3),
(N'MaDT008', 'MK01', N'Motorola Edge 30 Pro', N'Motorola', 16990000, 2),
(N'MaDT009', 'MK01', N'Google Pixel 7 Pro', N'Google', 15990000, 2),
(N'MaDT010', 'MK01', N'Samsung Galaxy S23', N'Samsung', 14990000, 5),
(N'MaDT011', 'MK01', N'Xiaomi 12S', N'Xiaomi', 12990000, 7),
(N'MaDT012', 'MK01', N'OPPO Find X5', N'OPPO', 12990000, 4),
(N'MaDT013', 'MK01', N'Vivo X80', N'Vivo', 12990000, 6),
(N'MaDT014', 'MK01', N'Realme GT 2', N'Realme', 11990000, 7),
(N'MaMT001', 'MK01', N'MacBook Air M2', N'Apple', 24990000, 2),
(N'MaMT002', 'MK01', N'MacBook Pro 13 inch M2', N'Apple', 32990000, 1),
(N'MaMT003', 'MK01', N'MacBook Pro 14 inch M2', N'Apple', 42990000, 1),
(N'MaMT004', 'MK01', N'MacBook Pro 16 inch M2', N'Apple', 62990000, 0),
(N'MaMT005', 'MK01', N'Dell XPS 13 Plus', N'Dell', 28990000, 2),
(N'MaMT006', 'MK01', N'Dell XPS 13', N'Dell', 24990000, 1),
(N'MaMT007', 'MK01', N'Dell XPS 15', N'Dell', 39990000, 2),
(N'MaMT008', 'MK01', N'HP Spectre x360 14', N'HP', 29990000, 2),
(N'MaMT009', 'MK01', N'HP Spectre x360 16', N'HP', 39990000, 2),
(N'MaMT010', 'MK01', N'ASUS ZenBook 14', N'ASUS', 25990000, 1),
(N'MaMT011', 'MK01', N'ASUS ZenBook 15', N'ASUS', 39990000, 2),
(N'MaMT012', 'MK01', N'Lenovo ThinkPad X1 Carbon Gen 10', N'Lenovo', 25990000, 1),
(N'MaMT013', 'MK01', N'Lenovo ThinkPad X1 Yoga Gen 7', N'Lenovo', 54990000, 1),
(N'MaMT014', 'MK01', N'Acer Swift X', N'Acer', 29990000, 2),
(N'MaMT015', 'MK01', N'Acer Nitro 5', N'Acer', 34990000, 1);

INSERT INTO BanHang
VALUES
(N'HDB001', N'MKH001', N'MNV01'),
(N'HDB002', N'MKH002', N'MNV12'),
(N'HDB003', N'MKH003', N'MNV09'),
(N'HDB004', N'MKH004', N'MNV20'),
(N'HDB005', N'MKH005', N'MNV16'),
(N'HDB006', N'MKH006', N'MNV17'),
(N'HDB007', N'MKH007', N'MNV05'),
(N'HDB008', N'MKH008', N'MNV11'),
(N'HDB009', N'MKH009', N'MNV02'),
(N'HDB010', N'MKH010', N'MNV14'),
(N'HDB011', N'MKH011', N'MNV06'),
(N'HDB012', N'MKH012', N'MNV03'),
(N'HDB013', N'MKH013', N'MNV13'),
(N'HDB014', N'MKH014', N'MNV19'),
(N'HDB015', N'MKH015', N'MNV15');

INSERT INTO DienThoai
VALUES
(N'MaDT001', N'AMOLED'),
(N'MaDT002', N'OLED'),
(N'MaDT003', N'AMOLED'),
(N'MaDT004', N'AMOLED'),
(N'MaDT005', N'AMOLED'),
(N'MaDT006', N'AMOLED'),
(N'MaDT007', N'AMOLED'),
(N'MaDT008', N'AMOLED'),
(N'MaDT009', N'OLED'),
(N'MaDT010', N'AMOLED'),
(N'MaDT011', N'AMOLED'),
(N'MaDT012', N'AMOLED'),
(N'MaDT013', N'AMOLED'),
(N'MaDT014', N'AMOLED');

INSERT INTO MayTinh
VALUES
(N'MaMT001', N'M2', N'M2'),
(N'MaMT002', N'M2', N'M2'),
(N'MaMT003', N'M2', N'M2'),
(N'MaMT004', N'M2', N'M2'),
(N'MaMT005', N'Intel Arc A370M', N'Intel Core i7-1260P'),
(N'MaMT006', N'Intel Iris Xe Graphics', N'Intel Core i5-1235U'),
(N'MaMT007', N'Intel Arc A370M', N'Intel Core i7-12700H'),
(N'MaMT008', N'Intel Arc A370M', N'Intel Core i7-1255U'),
(N'MaMT009', N'Intel Arc A370M', N'Intel Core i7-12700H'),
(N'MaMT010', N'Intel Iris Xe Graphics', N'Intel Core i5-1240P'),
(N'MaMT011', N'Intel Arc A370M', N'Intel Core i7-12700H'),
(N'MaMT012', N'Intel Arc A370M', N'Intel Core i7-12700H'),
(N'MaMT013', N'Intel Arc A370M', N'Intel Core i7-12700H'),
(N'MaMT014', N'NVIDIA GeForce RTX 3050', N'AMD Ryzen 7 6800U'),
(N'MaMT015', N'NVIDIA GeForce RTX 3060', N'AMD Ryzen 7 6800U');

INSERT INTO DanhMucBan
VALUES
(N'HDB001', N'MaDT004', 1),
(N'HDB002', N'MaMT005', 1),
(N'HDB002', N'MaDT010', 1),
(N'HDB003', N'MaDT014', 1),
(N'HDB003', N'MaDT003', 1),
(N'HDB004', N'MaDT007', 2),
(N'HDB005', N'MaMT009', 1),
(N'HDB006', N'MaMT011', 1),
(N'HDB006', N'MaDT002', 1),
(N'HDB007', N'MaDT003', 1),
(N'HDB008', N'MaDT005', 2),
(N'HDB009', N'MaMT014', 1),
(N'HDB010', N'MaMT013', 1),
(N'HDB011', N'MaMT015', 1),
(N'HDB012', N'MaDT010', 1),
(N'HDB012', N'MaDT006', 1),
(N'HDB013', N'MaMT014', 1),
(N'HDB014', N'MaMT014', 1),
(N'HDB015', N'MaMT011', 1);

-- Truy Van

-- 1.tinh tong so luong san pham ban ra vao thang 1 nam 2023

Select ngayban, SUM(TongSo) as tongsodonhang
from HoaDonBan
where month(NgayBan) = 1 and year(NgayBan) = 2023
group by NgayBan



-- 2. liet ke tat ca cac cua hang va so luong nhan vien cua cua hang gioi tinh nam
select CuaHang.MaCH, TenCH, COUNT(NhanVien.MaNV) as tongsonhanvien
from CuaHang 
left JOIN NhanVien
on CuaHang.MaCH = NhanVien.MaCH
WHERE NhanVien.GioiTinh = N'Nam'
and NhanVien.ChucVu = N'Nhân Viên'
group by CuaHang.MaCH, TenCH



-- 3. dua ra ten cac quan ly cua hang so 1 
select MaNV, HoTen
from NhanVien
where MaCH = 'MCH01'
and ChucVu = N'Quản lý'



-- 4. liet ke cac loai hang hoa co su ton kho lon hon 5 trong kho cua cua hang so 1
select MaHH, TenHH
from HangHoa 
where MaKho in (
    select makho 
    from Kho
    where MaCH = 'MCH01'
) and SoLuong > 5



-- 5. tinh tong doanh thu dien thoai ban duoc 
select sum(TongGia) as tongsotienbanduoc
from(
    select MaCH, TongGia, MaHH
    from HoaDonBan
    join DanhMucBan
    on HoaDonBan.MaHDB = DanhMucBan.MaHDB
) as Bang
where MaHH like 'MaDT%'

-- 6. dua ra san pham may tinh co gia ban thap nhat tai cua hang so 1
select top 1 MaHH, TenHH, GiaBan
from HangHoa
where MaKho in (
    select MaKho
    from Kho
    join CuaHang 
    on Kho.MaCH = CuaHang.MaCH
    where CuaHang.MaCH = 'MCH01'
)
and HangHoa.MaHH like 'MaMT%'
ORDER BY GiaBan ASC

-- 8. danh sach nhan vien co nguoi than la chi gai
select NhanVien.MaNV, NhanVien.HoTen
from NhanVien 
join NguoiThan
on NhanVien.MaNV = NguoiThan.MaNV
where NguoiThan.MoiQuanHe = N'Chị Gái'


-- 9. tong so luong ton kho
select HangHoa.TenHH, Sum(HangHoa.SoLuong) as sl
from HangHoa
join Kho
on HangHoa.MaKho = Kho.MaKho 
group by HangHoa.TenHH
HAVING Sum(HangHoa.SoLuong) > 3
ORDER by sl ASC

-- --10. in ra nhan vien co so lan ban hang nhieu nhat trong 2023
select NhanVien.MaNV, NhanVien.HoTen, count(*) as slgdonban
from NhanVien
where maNV in (
    select MaNV
    from BanHang
    join HoaDonBan
    on BanHang.MaHDB = HoaDonBan.MaHDB
    where month(HoaDonBan.NgayBan) = 2 and year(HoaDonBan.ngay)
)
group by NhanVien.MaNV, NhanVien.HoTen

-- 11. cho biet danh sashc cac khach hang co so lan mua hang nhieu nhat
select top 1 KhachHang.MaKH, KhachHang.TenKH, count(*) as sohoadon 
from KhachHang
join BanHang
on KhachHang.MaKH = BanHang.MaKH
group by KhachHang.MaKH, KhachHang.TenKH
order by sohoadon desc

SELECT sum(TongSo) as sl
from HoaDonBan
where month(NgayBan) = 1 

-- 12. danh sach cac mat hang ban chay nhat trong quy 3 nam 2023, duoc sap xep theo doanh thu tang dan

select NhanVien.HoTen, sum(HoaDonBan.TongGia) as doanhthu
from NhanVien 
join BanHang 
on NhanVien.MaNV = BanHang.MaNV
join HoaDonBan
on BanHang.MaHDB = HoaDonBan.MaHDB
where NhanVien.HoTen like N'Nguyễn%'
group by NhanVien.HoTen
order by doanhthu asc





-- hay liet ke len thong tin cua moi khach hang cung so lan mua hang 
-- chi duoc ban boi nhung nhan vien co ki tu dau cua ho ten la H va dia chi o ha noi






