-- 1. Tạo table với các ràng buộc và kiểu dữ liệu
-- Thêm ít nhất 3 bản ghi vào table


DROP DATABASE IF EXISTS ThucTap;
CREATE DATABASE ThucTap;
USE ThucTap;

DROP TABLE IF EXISTS GiangVien;
CREATE TABLE GiangVien(
magv TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
hoten VARCHAR(50),
luong INT
);

DROP TABLE IF EXISTS SinhVien;
CREATE TABLE SinhVien(
masv SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
hoten VARCHAR(50),
namsinh DATE,
quequan VARCHAR(100) 
);

DROP TABLE IF EXISTS DeTai;
CREATE TABLE DeTai(
madt TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
tendt VARCHAR(50),
kinhphi INT,
NoiThucTap VARCHAR(100)
);

DROP TABLE IF EXISTS HuongDan;
CREATE TABLE HuongDan(
id SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
masv SMALLINT UNSIGNED,
madt TINYINT UNSIGNED,
magv TINYINT UNSIGNED,
ketqua BIT,
CONSTRAINT fk_HuongDan_SinhVien FOREIGN KEY (masv) REFERENCES SinhVien(masv),
CONSTRAINT fk_HuongDan_GiangVien FOREIGN KEY (magv) REFERENCES GiangVien(magv),
CONSTRAINT fk_HuongDan_detai FOREIGN KEY (madt) REFERENCES detai(madt)
);

INSERT INTO `thuctap`.`giangvien` (`hoten`, `luong`) VALUES ('nguyen van a', '8000000');
INSERT INTO `thuctap`.`giangvien` (`hoten`, `luong`) VALUES ('nguyen thi a', '7000000');
INSERT INTO `thuctap`.`giangvien` (`hoten`, `luong`) VALUES ('pham van a', '6000000');
INSERT INTO `thuctap`.`giangvien` (`hoten`, `luong`) VALUES ('tran thi b', '5000000');
INSERT INTO `thuctap`.`giangvien` (`hoten`, `luong`) VALUES ('nguyen van ', '6000000');
INSERT INTO `thuctap`.`giangvien` (`hoten`, `luong`) VALUES ('nguyen van b', '7000000');
INSERT INTO `thuctap`.`giangvien` (`hoten`, `luong`) VALUES ('nguyen van c', '8000000');
INSERT INTO `thuctap`.`giangvien` (`hoten`, `luong`) VALUES ('nguyen van d', '5000000');
INSERT INTO `thuctap`.`giangvien` (`hoten`, `luong`) VALUES ('nguyen thi b', '6000000');
INSERT INTO `thuctap`.`giangvien` (`hoten`, `luong`) VALUES ('nguyen thi d', '6000000');
INSERT INTO `thuctap`.`giangvien` (`hoten`, `luong`) VALUES ('pham van b', '5000000');
INSERT INTO `thuctap`.`giangvien` (`hoten`, `luong`) VALUES ('pham van c', '9000000');
INSERT INTO `thuctap`.`giangvien` (`hoten`, `luong`) VALUES ('tran thi b', '10000000');
INSERT INTO `thuctap`.`giangvien` (`hoten`, `luong`) VALUES ('tran thi c', '6000000');
INSERT INTO `thuctap`.`giangvien` (`hoten`, `luong`) VALUES ('tran thi d', '5000000');


INSERT INTO `thuctap`.`sinhvien` (`hoten`, `namsinh`, `quequan`) VALUES ('trinh thi a', '2000-03-06', 'thanh hoa');
INSERT INTO `thuctap`.`sinhvien` (`hoten`, `namsinh`, `quequan`) VALUES ('tran xuan a', '1999-05-09', 'ninh binh');
INSERT INTO `thuctap`.`sinhvien` (`hoten`, `namsinh`, `quequan`) VALUES ('nguyen tuan a', '1998-06-07', 'ha noi');
INSERT INTO `thuctap`.`sinhvien` (`hoten`, `namsinh`, `quequan`) VALUES ('trinh thi b', '1997-02-06', 'ninh binh');
INSERT INTO `thuctap`.`sinhvien` (`hoten`, `namsinh`, `quequan`) VALUES ('trinh thi c', '1999-06-19', 'ninh binh');
INSERT INTO `thuctap`.`sinhvien` (`hoten`, `namsinh`, `quequan`) VALUES ('trinh thi d', '1998-09-15', 'ninh binh');
INSERT INTO `thuctap`.`sinhvien` (`hoten`, `namsinh`, `quequan`) VALUES ('trinh thi e', '1998-05-29', 'thanh hoa');
INSERT INTO `thuctap`.`sinhvien` (`hoten`, `namsinh`, `quequan`) VALUES ('tran xuan b', '1999-08-26', 'ha noi');
INSERT INTO `thuctap`.`sinhvien` (`hoten`, `namsinh`, `quequan`) VALUES ('tran xuan c', '1999-08-15', 'ninh binh');
INSERT INTO `thuctap`.`sinhvien` (`hoten`, `namsinh`, `quequan`) VALUES ('tran xuan d', '1997-12-01', 'ha noi');
INSERT INTO `thuctap`.`sinhvien` (`hoten`, `namsinh`, `quequan`) VALUES ('nguyen tuan b', '1997-06-28', 'ha noi');
INSERT INTO `thuctap`.`sinhvien` (`hoten`, `namsinh`, `quequan`) VALUES ('nguyen tuan c', '1999-05-14', 'ninh binh');
INSERT INTO `thuctap`.`sinhvien` (`hoten`, `namsinh`, `quequan`) VALUES ('nguyen tuan d', '1998-08-18', 'thanh hoa');



INSERT INTO `thuctap`.`detai` (`tendt`, `kinhphi`, `NoiThucTap`) VALUES ('detai1', '1000000', 'vti1');
INSERT INTO `thuctap`.`detai` (`tendt`, `kinhphi`, `NoiThucTap`) VALUES ('detai2', '1500000', 'vti2');
INSERT INTO `thuctap`.`detai` (`tendt`, `kinhphi`, `NoiThucTap`) VALUES ('detai3', '2000000', 'vti3');
INSERT INTO `thuctap`.`detai` (`tendt`, `kinhphi`, `NoiThucTap`) VALUES ('CONG NGHE SINH HOC', '1000000', 'vti4');
INSERT INTO `thuctap`.`detai` (`tendt`, `kinhphi`, `NoiThucTap`) VALUES ('detai5', '2000000', 'fpt1');
INSERT INTO `thuctap`.`detai` (`tendt`, `kinhphi`, `NoiThucTap`) VALUES ('detai6', '1200000', 'fpt2');
INSERT INTO `thuctap`.`detai` (`tendt`, `kinhphi`, `NoiThucTap`) VALUES ('detai7', '1300000', 'fpt3');
INSERT INTO `thuctap`.`detai` (`tendt`, `kinhphi`, `NoiThucTap`) VALUES ('detai8', '1000000', 'fpt4');
INSERT INTO `thuctap`.`detai` (`tendt`, `kinhphi`, `NoiThucTap`) VALUES ('detai9', '2000000', 'fpt5');
INSERT INTO `thuctap`.`detai` (`tendt`, `kinhphi`, `NoiThucTap`) VALUES ('detai10', '1500000', 'viettel1');

INSERT INTO HuongDan (masv, madt, magv, ketqua) VALUES (3, 10, 12, 1);
INSERT INTO HuongDan (masv, madt, magv, ketqua) VALUES (5, 7, 9, 0);
INSERT INTO HuongDan (masv, madt, magv, ketqua) VALUES (4, 4, 4, 1);
INSERT INTO HuongDan (masv, madt, magv, ketqua) VALUES (8, 6, 9, 0);
INSERT INTO HuongDan (masv, madt, magv, ketqua) VALUES (7, 7, 6, 1);
INSERT INTO HuongDan (masv, madt, magv, ketqua) VALUES (10, 3, 6, 1);
INSERT INTO HuongDan (masv, madt, magv, ketqua) VALUES (1, 4, 3, 0);
INSERT INTO HuongDan (masv, madt, magv, ketqua) VALUES (4, 4, 3, 0);
INSERT INTO HuongDan (masv, madt, magv, ketqua) VALUES (6, 8, 6, 1);
INSERT INTO HuongDan (masv, madt, magv, ketqua) VALUES (10, 2, 10, 1);
INSERT INTO HuongDan (masv, madt, magv, ketqua) VALUES (6, 5, 3, 0);
INSERT INTO HuongDan (masv, madt, magv, ketqua) VALUES (6, 7, 1, 0);
INSERT INTO HuongDan (masv, madt, magv, ketqua) VALUES (2, 8, 5, 1);
INSERT INTO HuongDan (masv, madt, magv, ketqua) VALUES (9, 7, 7, 1);
INSERT INTO HuongDan (masv, madt, magv, ketqua) VALUES (7, 9, 12, 1);
INSERT INTO HuongDan (masv, madt, magv, ketqua) VALUES (9, 8, 5, 0);
INSERT INTO HuongDan (masv, madt, magv, ketqua) VALUES (1, 10, 7, 1);
INSERT INTO HuongDan (masv, madt, magv, ketqua) VALUES (2, 4, 5, 1);
INSERT INTO HuongDan (masv, madt, magv, ketqua) VALUES (4, 5, 4, 0);
INSERT INTO HuongDan (masv, madt, magv, ketqua) VALUES (6, 4, 3, 1);
INSERT INTO HuongDan (masv, madt, magv, ketqua) VALUES (7, 2, 2, 0);
INSERT INTO HuongDan (masv, madt, magv, ketqua) VALUES (8, 5, 10, 1);
INSERT INTO HuongDan (masv, madt, magv, ketqua) VALUES (4, 6, 9, 1);
INSERT INTO HuongDan (masv, madt, magv, ketqua) VALUES (8, 8, 1, 0);
INSERT INTO HuongDan (masv, madt, magv, ketqua) VALUES (4, 3, 12, 1);
INSERT INTO HuongDan (masv, madt, magv, ketqua) VALUES (5, 4, 6, 0);
INSERT INTO HuongDan (masv, madt, magv, ketqua) VALUES (8, 4, 12, 0);
INSERT INTO HuongDan (masv, madt, magv, ketqua) VALUES (3, 8, 9, 0);
INSERT INTO HuongDan (masv, madt, magv, ketqua) VALUES (3, 6, 8, 1);
INSERT INTO HuongDan (masv, madt, magv, ketqua) VALUES (6, 7, 11, 1);
INSERT INTO HuongDan (masv, madt, magv, ketqua) VALUES (4, 7, 2, 0);
INSERT INTO HuongDan (masv, madt, magv, ketqua) VALUES (9, 4, 9, 1);
INSERT INTO HuongDan (masv, madt, magv, ketqua) VALUES (1, 10, 8, 0);
INSERT INTO HuongDan (masv, madt, magv, ketqua) VALUES (5, 4, 1, 0);
INSERT INTO HuongDan (masv, madt, magv, ketqua) VALUES (9, 2, 5, 0);
INSERT INTO HuongDan (masv, madt, magv, ketqua) VALUES (10, 7, 2, 1);
INSERT INTO HuongDan (masv, madt, magv, ketqua) VALUES (10, 7, 7, 1);
INSERT INTO HuongDan (masv, madt, magv, ketqua) VALUES (2, 7, 12, 0);
INSERT INTO HuongDan (masv, madt, magv, ketqua) VALUES (8, 3, 10, 0);
INSERT INTO HuongDan (masv, madt, magv, ketqua) VALUES (6, 3, 2, 1);
INSERT INTO HuongDan (masv, madt, magv, ketqua) VALUES (2, 9, 7, 1);
INSERT INTO HuongDan (masv, madt, magv, ketqua) VALUES (1, 6, 10, 1);
INSERT INTO HuongDan (masv, madt, magv, ketqua) VALUES (3, 8, 5, 1);
INSERT INTO HuongDan (masv, madt, magv, ketqua) VALUES (4, 8, 10, 1);
INSERT INTO HuongDan (masv, madt, magv, ketqua) VALUES (10, 2, 3, 1);
INSERT INTO HuongDan (masv, madt, magv, ketqua) VALUES (7, 7, 8, 0);
INSERT INTO HuongDan (masv, madt, magv, ketqua) VALUES (8, 2, 6, 1);
INSERT INTO HuongDan (masv, madt, magv, ketqua) VALUES (3, 6, 3, 0);
INSERT INTO HuongDan (masv, madt, magv, ketqua) VALUES (2, 6, 11, 1);
INSERT INTO HuongDan (masv, madt, magv, ketqua) VALUES (3, 2, 12, 0);

-- 2. Viết lệnh để
-- a) Lấy tất cả các sinh viên chưa có đề tài hướng dẫn
SELECT s.masv,s.hoten FROM HuongDan h
RIGHT JOIN sinhvien s ON s.masv=h.masv
WHERE h.masv IS NULL;
-- b) Lấy ra số sinh viên làm đề tài ‘CONG NGHE SINH HOC’
SELECT count(madt) FROM HuongDan
WHERE madt =(
			SELECT madt FROM detai
            WHERE tendt LIKE 'CONG NGHE SINH HOC');
-- 3. Tạo view có tên là "SinhVienInfo" lấy các thông tin về học sinh bao gồm:
-- mã số, họ tên và tên đề tài
-- Nếu sinh viên chưa có đề tài thì column tên đề tài sẽ in ra "Chưa có")

DROP VIEW IF EXISTS SinhVienInfo;
CREATE VIEW SinhVienInfo AS(
SELECT s.masv,s.hoten,d.tendt
FROM HuongDan h
INNER JOIN sinhvien s ON s.masv=h.masv
INNER JOIN detai d ON d.madt=h.madt
UNION
SELECT s.masv,s.hoten,'chưa có'
FROM HuongDan h 
RIGHT JOIN sinhvien s ON s.masv=h.masv
WHERE h.masv IS NULL);
SELECT * FROM SinhVienInfo;
-- 4. Tạo trigger cho table SinhVien khi insert sinh viên có năm sinh <= 1900
-- thì hiện ra thông báo "năm sinh phải > 1900"
DROP TRIGGER IF EXISTS check_sv;
DELIMITER //
CREATE TRIGGER check_sv
BEFORE INSERT ON sinhvien
FOR EACH ROW
BEGIN
	IF year(NEW.namsinh)<=1900
    THEN SIGNAL SQLSTATE '12345'
    SET MESSAGE_TEXT ='năm sinh phải > 1900';
    END IF;
    END//
DELIMITER ;

-- 5. Hãy cấu hình table sao cho khi xóa 1 sinh viên nào đó thì sẽ tất cả thông
-- tin trong table HuongDan liên quan tới sinh viên đó sẽ bị xóa đi
ALTER TABLE HuongDan DROP FOREIGN KEY fk_HuongDan_SinhVien;
ALTER TABLE HuongDan ADD CONSTRAINT fk_HuongDan_SinhVien FOREIGN KEY (masv) REFERENCES SinhVien(masv) ON DELETE CASCADE;
