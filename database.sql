create database appsmith;
USE appsmith;

create table NguoiDung(
    sdt varchar(255) unique,
    diaChi varchar(255),
    matKhau varchar(255),
    vaiTro varchar(255),
    gioiTinh ENUM('Nam', 'Nữ', 'Khác'),
    ngaySinh date,
    email varchar(255)
);
create table HoatDong(
	id int not null primary key auto_increment,
    NguoiDung_id varchar(255),
    tenHoatDong varchar(255),
    moTa text,
    thoiGian date,
    diaDiem varchar(255),
    loaiHoatDong varchar(255),
    foreign key (NguoiDung_id) references NguoiDung(sdt)
);
create table ChuongtrinhTuThien(
    id int not null primary key auto_increment,
    tenChuongTrinh varchar(255),
    soTienDaDat BIGINT,
    image varchar(255),
    qrCode varchar(255),
    moTa text,
    ngayBatDau Date,
    trangThai ENUM('Chưa diễn ra', 'Đang diễn ra', 'Đã kết thúc'),
    soLuotTheoDoi int,
    soLuotThamGia int,
    soTienCanThiet BIGINT,
    diaDiem varchar(255)
);
create table DongGop(
    id int not null primary key auto_increment,
    NguoiDung_id varchar(255),
    ChuongTrinhTuThien_id int,
    soTien double default 0,
    thoiGian datetime default current_timestamp,
    tenVatPham varchar(255),
    soLuong real,
    ghiChu text,
    hinhThuc ENUM('Tự vận chuyển', 'Nhờ người đến lấy'),
    loaivatpham ENUM('Quần áo', 'Nguyên liệu nấu ăn', 'Đồ dùng cá nhân'),
    maHoaDon varchar(255),
    trangThai varchar(255),
    foreign key(ChuongTrinhTuThien_id) references ChuongTrinhTuThien(id),
    foreign key(NguoiDung_id) references NguoiDung(sdt)
);
create table NhiemVu(
	id int not null primary key auto_increment,
    ChuongTrinhTuThien_id int,
    tenNhiemVu varchar(255),
    moTa text,
    trangThai varchar(255),
    soNguoiThamGia int,
    soNguoiThamGiaYeuCau int,
    foreign key(ChuongTrinhTuThien_id) references ChuongTrinhTuThien(id)
);
create table TheoDoi (
    id int not null primary key auto_increment,
    NguoiDung_id varchar(255),
    ChuongTrinhTuThien_id int,
    foreign key(NguoiDung_id) references NguoiDung(sdt),
    foreign key(ChuongTrinhTuThien_id) references ChuongTrinhTuThien(id)
);
create table DangKyThamGia (
    id int not null primary key auto_increment,
    idNhiemVu int,
    NguoiDung_id varchar(255),
    foreign key(NguoiDung_id) references NguoiDung(sdt),
    foreign key(idNhiemVu) references NhiemVu(id)
);
INSERT INTO NguoiDung
(sdt, diaChi, matKhau, vaiTro, gioiTinh, ngaySinh, email)
VALUES
('1', 'Hà Nội', '1', 'admin', 'Nam', '2000-01-01', 'test@gmail.com');

INSERT INTO ChuongtrinhTuThien 
(tenChuongTrinh, soTienDaDat, image, qrCode, moTa, ngayBatDau, trangThai, soLuotTheoDoi, soLuotThamGia, soTienCanThiet, diaDiem) 
VALUES 
('Xây cầu tại Bến Tre', 150000000, 'https://cellphones.com.vn/sforum/wp-content/uploads/2024/02/avatar-anh-meo-cute-1.jpg', 'https://img.vietqr.io/image/VCB-9971671504-compact.png', 'Xây dựng cầu bê tông cho người dân vùng sâu', '2024-01-01', 'Đang diễn ra', 120, 45, 300000000, "hanoi"),
('Cung cấp nước sạch tại Đồng Tháp', 50000000, 'https://cellphones.com.vn/sforum/wp-content/uploads/2024/02/avatar-anh-meo-cute-2.jpg', 'https://img.vietqr.io/image/VCB-1234567890-compact.png', 'Lắp đặt hệ thống lọc nước cho người dân', '2024-02-15', 'Đang diễn ra', 80, 30, 100000000, "dongthap"),
('Hỗ trợ giáo dục tại Quảng Ngãi', 20000000, 'https://cellphones.com.vn/sforum/wp-content/uploads/2024/02/avatar-anh-meo-cute-3.jpg', 'https://img.vietqr.io/image/VCB-0987654321-compact.png', 'Cung cấp sách vở và dụng cụ học tập cho học sinh', '2024-03-10', 'Đang diễn ra', 50, 20, 50000000, "quangngai"),
('Xây dựng nhà tình thương tại Cà Mau', 100000000, 'https://cellphones.com.vn/sforum/wp-content/uploads/2024/02/avatar-anh-meo-cute-4.jpg', 'https://img.vietqr.io/image/VCB-1122334455-compact.png', 'Xây dựng nhà ở cho các hộ gia đình khó khăn', '2024-04-05', 'Đang diễn ra', 150, 60, 200000000, "camau"),
('Trồng cây xanh tại Bình Dương', 30000000, 'https://cellphones.com.vn/sforum/wp-content/uploads/2024/02/avatar-anh-meo-cute-5.jpg', 'https://img.vietqr.io/image/VCB-6677889900-compact.png', 'Trồng cây xanh tại các khu vực công cộng', '2024-05-20', 'Đang diễn ra', 100, 40, 70000000, "binhduong");

INSERT INTO NhiemVu
(ChuongTrinhTuThien_id, tenNhiemVu, moTa, trangThai, soNguoiThamGia, soNguoiThamGiaYeuCau)
VALUES
(1, 'Khảo sát địa điểm', 'Khảo sát địa điểm xây cầu', 'Chưa hoàn thành', 0, 5),
(1, 'Chuẩn bị vật liệu', 'Chuẩn bị vật liệu xây dựng', 'Chưa hoàn thành', 0, 10),
(1, 'Xây dựng cầu', 'Tiến hành xây dựng cầu', 'Chưa hoàn thành', 0, 20),
(2, 'Khảo sát nguồn nước', 'Khảo sát nguồn nước tại Đồng Tháp', 'Chưa hoàn thành', 0, 5),
(2, 'Lắp đặt hệ thống lọc', 'Lắp đặt hệ thống lọc nước', 'Chưa hoàn thành', 0, 10),
(2, 'Kiểm tra chất lượng nước', 'Kiểm tra chất lượng nước sau khi lắp đặt', 'Chưa hoàn thành', 0, 5),
(3, 'Thu thập sách vở', 'Thu thập sách vở và dụng cụ học tập', 'Chưa hoàn thành', 0, 10),
(3, 'Phân phát sách vở', 'Phân phát sách vở cho học sinh', 'Chưa hoàn thành', 0, 15),
(3, 'Tổ chức lớp học', 'Tổ chức lớp học hỗ trợ giáo dục', 'Chưa hoàn thành', 0, 5),
(4, 'Khảo sát gia đình', 'Khảo sát các hộ gia đình khó khăn', 'Chưa hoàn thành', 0, 5),
(4, 'Chuẩn bị vật liệu', 'Chuẩn bị vật liệu xây dựng nhà', 'Chưa hoàn thành', 0, 10),
(4, 'Xây dựng nhà', 'Tiến hành xây dựng nhà tình thương', 'Chưa hoàn thành', 0, 20),
(5, 'Khảo sát khu vực', 'Khảo sát khu vực trồng cây', 'Chưa hoàn thành', 0, 5),
(5, 'Chuẩn bị cây giống', 'Chuẩn bị cây giống và dụng cụ', 'Chưa hoàn thành', 0, 10),
(5, 'Trồng cây', 'Tiến hành trồng cây xanh', 'Chưa hoàn thành', 0, 20);