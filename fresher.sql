DROP DATABASE IF EXISTS fresher;
CREATE DATABASE    		fresher;
USE 					fresher;


DROP TABLE IF EXISTS 	Trainee;
CREATE TABLE			Trainee(
TraineeID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Full_Name NVARCHAR(50) NOT NULL ,
Birth_Date DATE,
Gender ENUM('MALE','FEMALE','UNKNOWN'),
ET_IQ TINYINT UNSIGNED NOT NULL CHECK (ET_IQ <=20), 
ET_Gmath TINYINT UNSIGNED NOT NULL CHECK (ET_Gmath <=20), 
ET_English TINYINT UNSIGNED NOT NULL CHECK (ET_English <=20),
Training_Class VARCHAR(50),
Evaluation_Notes VARCHAR(50)
);
INSERT INTO Trainee(Full_Name,			Birth_Date,		Gender,		ET_IQ,		ET_Gmath,	ET_English,		Training_Class,		Evaluation_Notes)
VALUES 			   ('nguyễn văn tân',	'1997-06-01',	'male',		'20',		'18',		'17',			'VTI001',				'DHBKHN'),
				   ('phạm văn đoàn',	'1995-09-12',	'male',		'19',		'17',		'17',			'VTI002',				'DHBKHN'),
                   ('phạm văn A',		'1995-09-12',	'female',	'19',		'17',		'17',			'VTI007',				'DHBKHN'),
                   ('phạm văn B',		'1995-09-12',	'male',		'19',		'17',		'17',			'VTI004',				'DHBKHN'),
                   ('nguyễn văn hưng',	'1998-06-18',	'male',		'18',		'16',		'12',			'VTI005',				'DHBKHN'),
                   ('phạm văn đoàn',	'1995-09-12',	'male',		'19',		'17',		'17',			'VTI006',				'DHBKHN'),
                   ('nguyễn văn đức',	'1997-08-3',	'male',		'15',		'13',		'14',			'VTI003',				'DHBKHN'),
                   ('nguyễn văn giang',	'1996-06-03',	'male',		'18',		'13',		'12',			'VTI001',				'DHBKHN'),
                   ('trần thị minh',	'1993-09-19',	'female',	'16',		'19',		'15',			'VTI009',				'HVBCVT'),
                   ('trần thị loan',	'1999-06-09',	'female',	'16',		'20',		'19',			'VTI003',				'HVBCVT'),
				   ('lê thị hà',		'1994-05-15',	'female',	'19',		'16',		'17',			'VTI002',				'DHQGHN'),
                   ('trần văn hưng',	'1995-06-05',	'male',		'16',		'18',		'20',			'VTI12',				'DHQGHN');
-- Question 1: Tạo table với các ràng buộc và kiểu dữ liệu
-- Question 2: Thêm ít nhất 10 bản ghi vào table
-- Question 3: Insert 1 bản ghi mà có điểm ET_IQ =30. Sau đó xem kết quả.
-- Question 4: Viết lệnh để lấy ra tất cả các thực tập sinh đã vượt qua bài test đầu vào,
-- và sắp xếp theo ngày sinh. Điểm ET_IQ >=12, ET_Gmath>=12, ET_English>=20
SELECT TraineeID FROM Trainee 
WHERE ET_IQ>=12 AND ET_Gmath>=12 AND ET_English>=12;
-- Question 5: Viết lệnh để lấy ra thông tin thực tập sinh có tên bắt đầu bằng chữ N và kết thúc
-- bằng chữ C
SELECT *
FROM Trainee WHERE Full_Name LIKE 'N%c';
-- Question 6: Viết lệnh để lấy ra thông tin thực tập sinh mà tên có ký thự thứ 2 là chữ G
SELECT * FROM Trainee WHERE Full_Name LIKE '_g%';
-- Question 7: Viết lệnh để lấy ra thông tin thực tập sinh mà tên có 10 ký tự và ký tự cuối cùng là C
SELECT * FROM Trainee WHERE length(Full_Name)=10 AND Full_Name LIKE '%c';
-- Question 8: Viết lệnh để lấy ra Fullname của các thực tập sinh trong lớp, lọc bỏ các tên trùng nhau
SELECT DISTINCT Full_Name FROM Trainee GROUP BY Full_Name;
-- Question 9: Viết lệnh để lấy ra Fullname của các thực tập sinh trong lớp, sắp xếp các tên này theo thứ tự từ A-Z.
SELECT Full_name FROM Trainee ORDER BY Full_name ASC;
-- Question 10: Viết lệnh để lấy ra thông tin thực tập sinh có tên dài nhất
SELECT * FROM Trainee a
WHERE length(a.Full_name)=(
SELECT max(length(b.Full_name)) FROM Trainee b
);
-- Question 11: Viết lệnh để lấy ra ID, Fullname và Ngày sinh thực tập sinh có tên dài nhất
SELECT TraineeID,Full_name,Birth_Date FROM Trainee a
WHERE length(a.Full_name)=(
SELECT max(length(b.Full_name)) FROM Trainee b
);
-- Question 12: Viết lệnh để lấy ra Tên, và điểm IQ, Gmath, English thực tập sinh có tên dài nhất
SELECT Full_name,ET_IQ,ET_Gmath,ET_English FROM Trainee c
WHERE length(c.Full_name)=(
SELECT max(length(d.Full_name)) FROM Trainee d
);
-- Question 13 Lấy ra 5 thực tập sinh có tuổi nhỏ nhất
SELECT * FROM Trainee ORDER BY Birth_Date DESC LIMIT 5;
-- Question 14: Viết lệnh để lấy ra tất cả các thực tập sinh là ET, 1 ET thực tập sinh là những người thỏa mãn số điểm như sau:
-- • ET_IQ + ET_Gmath>=20
-- • ET_IQ>=8
-- • ET_Gmath>=8
-- • ET_English>=18
SELECT Full_name AS ET FROM Trainee
WHERE ET_IQ + ET_Gmath>=20 AND ET_IQ>=8 AND ET_Gmath>=8 AND ET_English>=18;
-- Question 15: Xóa thực tập sinh có TraineeID = 5
DELETE FROM Trainee WHERE TraineeID=5;
SELECT * FROM Trainee;
-- Question 16: Xóa thực tập sinh có tổng điểm ET_IQ, ET_Gmath <=15
DELETE FROM Trainee WHERE (ET_IQ + ET_Gmath) <= 15;
-- Question 17: Xóa thực tập sinh quá 30 tuổi.
DELETE FROM Trainee WHERE year(current_timestamp()) - year(Birth_Date) >30;
-- Question 18: Thực tập sinh có TraineeID = 3 được chuyển sang lớp " VTI003". Hãy cập nhật thông tin vào database.
UPDATE Trainee SET Training_Class='VTI003' WHERE TraineeID = 3;
-- Question 19: Do có sự nhầm lẫn khi nhập liệu nên thông tin của học sinh số 10 đang bị sai, hãy cập nhật lại tên thành “LeVanA”
-- , điểm ET_IQ =10, điểm ET_Gmath =15, điểm ET_English = 30.
UPDATE Trainee SET  Full_name='Lê văn A',
					ET_IQ =10,
					ET_Gmath =15,
					ET_English = 20
WHERE TraineeID=10;
-- Question 20: Đếm xem trong lớp VTI001 có bao nhiêu thực tập sinh.
SELECT count(TraineeID) FROM Trainee;
-- Question 21: Đếm xem trong lớp VTI001 có bao nhiêu thực tập sinh.
SELECT Training_Class,count(Training_Class) FROM Trainee WHERE Training_Class='VTI001';
-- Question 22: Đếm tổng số thực tập sinh trong lớp VTI001 và VTI003 có bao nhiêu thực tập sinh.
SELECT  count(Training_Class) FROM Trainee WHERE Training_Class='VTI001' OR Training_Class='VTI003';
-- Question 23: Lấy ra số lượng các thực tập sinh theo giới tính: Male, Female, Unknown.
SELECT Gender,count(Gender) from Trainee GROUP BY Gender;
-- Question 24: Lấy ra lớp có lớn hơn 5 thực tập viên
SELECT Training_Class,count(Training_Class) FROM Trainee 
GROUP BY Training_Class 
HAVING count(Training_Class)>5;
-- Question 26: Lấy ra trường có ít hơn 4 thực tập viên tham gia khóa học
SELECT Evaluation_Notes AS 'tên trường',count(Evaluation_Notes) FROM Trainee
GROUP BY Evaluation_Notes HAVING count(Evaluation_Notes) <4;
-- Question 27: Bước 1: Lấy ra danh sách thông tin ID, Fullname, lớp thực tập viên có lớp 'VTI001'
-- *************Bước 2: Lấy ra danh sách thông tin ID, Fullname, lớp thực tập viên có lớp 'VTI002'
-- *************Bước 3: Sử dụng UNION để nối 2 kết quả ở bước 1 và 2
SELECT TraineeID,Full_Name,Training_Class FROM Trainee WHERE Training_Class='vti001';
SELECT TraineeID,Full_Name,Training_Class FROM Trainee WHERE Training_Class='vti002';
SELECT TraineeID,Full_Name,Training_Class FROM Trainee WHERE Training_Class='vti001'
UNION
SELECT TraineeID,Full_Name,Training_Class FROM Trainee WHERE Training_Class='vti002';
