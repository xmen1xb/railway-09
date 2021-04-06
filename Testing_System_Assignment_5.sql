DROP DATABASE IF EXISTS Testing_System_Assignment_5;
CREATE DATABASE    		Testing_System_Assignment_5;
USE 					Testing_System_Assignment_5;


DROP TABLE IF EXISTS 	Department;
CREATE TABLE			Department(
DepartmentID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
DepartmentName VARCHAR(50) NOT NULL UNIQUE KEY
);

DROP TABLE IF EXISTS 	`Position`;
CREATE TABLE `Position`(
PositionID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
PositionName VARCHAR(50) NOT NULL UNIQUE KEY
);




DROP TABLE IF EXISTS 	`Account`;
CREATE TABLE 			`Account`(
AccountID            TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Email                VARCHAR(50) NOT NULL UNIQUE KEY,
Username             VARCHAR(50) NOT NULL UNIQUE KEY,
Fullname             NVARCHAR(50) NOT NULL,
DepartmentID         TINYINT UNSIGNED NOT NULL,
PositionID           TINYINT UNSIGNED NOT NULL,
Createdate           DATETIME DEFAULT NOW(),
FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID),
FOREIGN KEY (PositionID) REFERENCES `position`(PositionID)
);


DROP TABLE IF EXISTS `Groupp`;
CREATE TABLE		 `Groupp`(
GroupID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Groupname VARCHAR(50) NOT NULL UNIQUE KEY,
CreatorID TINYINT UNSIGNED,
Createdate DATETIME DEFAULT NOW(),
FOREIGN KEY(CreatorID) 	REFERENCES`Account`(AccountID)
);


DROP TABLE IF EXISTS GroupAccount;
CREATE TABLE 		 GroupAccount(
GroupID TINYINT UNSIGNED NOT NULL,
AccountID TINYINT UNSIGNED NOT NULL,
Joindate DATETIME DEFAULT NOW(),
PRIMARY KEY (GroupID,AccountID),
FOREIGN KEY(GroupID) REFERENCES Groupp(GroupID),
FOREIGN KEY(AccountID) REFERENCES `Account`(AccountID)
);



DROP TABLE IF EXISTS Typequestion;
CREATE TABLE		 Typequestion(
TypeID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Typename VARCHAR(50) NOT NULL
);



DROP TABLE IF EXISTS CategoryQuestion;
CREATE TABLE		 CategoryQuestion(
CategoryID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
CategoryName VARCHAR(50) NOT NULL UNIQUE KEY
);



DROP TABLE IF EXISTS Question;
CREATE TABLE		 Question(
QuestionID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Content VARCHAR(200) NOT NULL,
CategoryID TINYINT UNSIGNED NOT NULL,
TypeID TINYINT UNSIGNED NOT NULL,
CreatorID TINYINT UNSIGNED NOT NULL,
CreateDate DATE,
FOREIGN KEY(TypeID) REFERENCES Typequestion(TypeID),
FOREIGN KEY(CategoryID) REFERENCES CategoryQuestion(CategoryID),
FOREIGN KEY(CreatorID) REFERENCES `Account`(AccountID)
);



DROP TABLE IF EXISTS  Answer;
CREATE TABLE		  Answer(
AnswerID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Content VARCHAR(200) NOT NULL,
QuestionID TINYINT UNSIGNED NOT NULL,
IsCorrect BIT,
FOREIGN KEY(QuestionID) REFERENCES Question(QuestionID)
);



DROP TABLE IF EXISTS	Exam;
CREATE TABLE			Exam(
ExamID       TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
`Code`        VARCHAR(50) NOT NULL,
Title        VARCHAR(100) NOT NULL,
CategoryID   TINYINT UNSIGNED NOT NULL,
Duration     TINYINT UNSIGNED NOT NULL,
CreatorID  	 TINYINT UNSIGNED NOT NULL,
CreateDate	 DATETIME DEFAULT NOW(),
FOREIGN KEY(CategoryID) REFERENCES CategoryQuestion(CategoryID),
FOREIGN KEY(CreatorID) REFERENCES `Account`(AccountID)
);



DROP TABLE IF EXISTS	ExamQuestion;
CREATE TABLE			ExamQuestion(
ExamID					TINYINT UNSIGNED NOT NULL,
QuestionID				TINYINT UNSIGNED NOT NULL,
PRIMARY KEY (ExamID,QuestionID),
FOREIGN KEY(ExamID) REFERENCES Exam(ExamID),
FOREIGN KEY(QuestionID) REFERENCES Question(QuestionID)
);


INSERT INTO Department(DepartmentName)
VALUES 			      ('sale'),
					  ('marketing'),
                      ('nhan su'),
                      ('san xuat'),
                      ('truyen thong'),
					  ('quang cao'),
                      ('thiet ke'),
                      ('van hoa'),
                      ('the thao'),
                      ('sale1'),
                      ('sale2'),
                      ('sale3'),
                      ('marketing1'),
                      ('marketing2'),
                      ('marketing3')
                      ;
					

INSERT INTO `Position`(PositionName)
VALUES                ('giam doc'),
					  ('thu ky'),
					  ('pho giam doc'),
                      ('nhan su'),
                      ('to truong'),
					  ('to pho'),
                      ('thu ngan'),
                      ('thu quy'),
                      ('truong phong'),
                      ('pho phong'),
                      ('bao ve'),
                      ('an toan'),
					  ('6s'),
                      ('nhan vien'),
                      ('thu kho');
INSERT INTO `Account`(Email						, Username			, FullName				, DepartmentID	, PositionID)
VALUES 				('nguyentan1@gmail.com'		, 'tutiton'		,'trần văn bé'				,   '1'			,   '3'		),
					('nguyentan2@gmail.com'		, 'tandeptrai'	,'nguyễn thị minh'		    ,   '4'			,   '5'		),
                    ('nguyentan3@gmail.com'		, 'linhkute'	,'nguyễn văn linh'			,	'2'			,	'4'		),
                    ('nguyentan4@gmail.com'		, 'anhxg'		,'lê ngọc anh'				,	'3'			,	'1'		),
                    ('nguyentan5@gmail.com'		, 'ducdaydu'	,'phạm văn đức'				,	'3'			,	'5'		),
                    ('nguyentan6@gmail.com','bieub','hoàng văn biểu','5','12'),
                    ('nguyentan7@gmail.com','hieux','hoàng văn hiểu','8','10'),
                    ('nguyentan8@gmail.com','tuang','nguyễn văn tuấn','11','7'),
                    ('nguyentan9@gmail.com','changchang','nguyễn thị trang','15','3'),
                    ('nguyentan10@gmail.com','hahonho','nguyễn thị hà','14','2'),
                    ('nguyentan11@gmail.com','doanganh','phạm văn đoàn','12','1'),
                    ('nguyentan12@gmail.com','huyhihung','đỗ văn huy','10','3'),
                    ('nguyentan13@gmail.com','hacodon','trịnh mạnh hà','11','2'),
                    ('nguyentan14@gmail.com','tuyettrang','lê thị tuyết','10','4'),
                    ('nguyentan15@gmail.com','tungtutin','lê thanh tùng','11','4');
                    
                     
INSERT INTO `Groupp`( Groupname					, CreatorID)
VALUE   			('phuonghoanglua'			, '2'		),
					('bocautrang'				, '3'		),
                    ('tauhoatoc'				, '4'		),
                    ('maytrang'					, '1'		),
                    ('luayeuthuong'				, '5'		),
                    ('daibangnon'				, '6'),
                    ('chimhaiau','12'),
                    ('mainhatranh','10'),
                    ('bautroi','5'),
                    ('doantau','2'),
                    ('thaibinhduong','1'),
                    ('buctuong','5'),
                    ('luacaonguyen','13'),
                    ('giacmo','11'),
                    ('laban','12'),
                    ('vongtaynhanai','8');
INSERT INTO Groupaccount(GroupID	,AccountID	,Joindate)
VALUE					('1'		,'3'		,'2019-12-26'),
						('3'		,'2'		,'2020-10-23'),
                        ('4'		,'1'		,'2020-05-12'),
                        ('2'		,'4'		,'2020-09-29'),
                        ('3'		,'1'		,'2021-01-01'),
                        ('2','5','2020-02-12'),
                        ('3','3','2019-02-17'),
                        ('5','6','2019-06-09'),
                        ('9','6','2020-09-18'),
                        ('15','9','2019-12-29'),
                        ('12','11','2020-06-16'),
                        ('13','6','2020-11-12'),
                        ('9','8','2019-05-04'),
                        ('7','6','2020-03-09'),
                        ('6','9','2021-02-01')
                        ;
INSERT INTO Typequestion(Typename)
VALUE					('tuluan'),('tracnghiem');

INSERT INTO Categoryquestion(Categoryname)
VALUE					('cuocsong'),
						('vanhoa'),
                        ('thethao'),
                        ('dulich'),
                        ('toanhoc'),
                        ('vanhoc'),
                        ('tinhoc'),
                        ('sinhhoc'),
                        ('lichsu'),
                        ('dialy'),
                        ('vatly'),
                        ('tienganh'),
                        ('amnhac'),
                        ('hoahoc'),
                        ('vutru');
INSERT INTO Question(Content,CategoryID,TypeID,CreatorID,CreateDate)
VALUE				('question1','2','1','2','2021-01-01'),
					('question2','4','2','2','2019-09-04'),
					('question3','2','2','2','2019-08-19'),
                    ('question4','5','1','1','2019-12-08'),
                    ('question5','2','1','5','2020-01-28'),
                    ('question6','7','2','8','2020-01-09'),
                    ('question7','9','1','6','2021-01-02'),
                    ('question8','11','1','7','2020-09-08'),
                    ('question9','12','2','13','2021-09-30'),
                    ('question10','13','1','10','2020-10-29'),
                    ('question11','14','1','12','2020-03-19'),
                    ('question12','9','1','14','2021-01-05'),
                    ('question13','12','1','8','2020-12-31'),
                    ('question14','6','1','9','2021-01-06'),
                    ('question15','9','2','8','2020-12-25');
INSERT INTO Answer(Content,QuestionID,Iscorrect)
VALUE			('answer vti 1654','1',1),
				('answer vti 8963','3',1),
                ('answer vti 7455','2',0),
                ('answer vti 7563','4',1),
                ('answer vti 1246','5',0),
                ('answer vti 1355','9',1),
                ('answer vti 4669','3',0),
                ('answer vti 6315','2',1),
                ('answer vti 4878','4',0),
                ('answer vti 4996','5',0),
                ('answer vti 9875','3',1),
                ('answer vti 7856','8',1),
                ('answer vti 9654','9',0),
                ('answer vti 4566','3',1),
                ('answer vti 7852','4',1)
                ;
INSERT INTO Exam(`Code` , Title , CategoryID , Duration , CreatorID , CreateDate)
VALUE			('vtiQ01','De thi java','3','60','2','2020-03-25'),
				('vtiw34','De thi android','2','90','1','2021-01-19'),
                ('vtiR06','De thi windown','1','120','4','2021-02-03'),
                ('vtiK21','De thi macos','3','60','1','2020-10-12'),
                ('vtiL54','De thi iOS','3','60','4','2020-12-30'),
                ('vti123','De thi java1','6','60','6','2020-12-12'),
                ('vti456','De thi java2','8','90','9','2020-12-13'),
                ('vti789','De thi java3','6','60','5','2020-12-14'),
                ('vti234','De thi java4','4','120','8','2020-12-15'),
                ('vti345','De thi java5','12','120','5','2020-11-25'),
                ('vti678','De thi windown1','13','90','5','2020-11-26'),
                ('vti654','De thi windown2','3','120','6','2020-11-27'),
                ('vti987','De thi windown3','4','60','8','2020-11-28'),
                ('vti976','De thi windown4','5','60','1','2020-11-29'),
                ('vti653','De thi windown5','15','45','4','2020-11-30')
                ;
INSERT INTO Examquestion(ExamID,QuestionID)
VALUE					('2','3'),
						('3','1'),
                        ('2','4'),
                        ('4','5'),
                        ('5','3'),
                        ('2','1'),
                        ('1','2'),
                        ('1','3'),
                        ('14','5'),
                        ('13','3'),
                        ('8','6'),
                        ('7','2'),
                        ('10','1'),
                        ('4','9'),
                        ('8','10'),
                        ('5','12'),
                        ('6','9')
                        ;
-- Exercise 1: Tiếp tục với Database Testing System
-- (Sử dụng subquery hoặc CTE)
-- Question 1: Tạo view có chứa danh sách nhân viên thuộc phòng ban sale
CREATE OR REPLACE VIEW vw_sale AS
SELECT * FROM `account` WHERE DepartmentID=(
SELECT d.DepartmentID FROM department d WHERE DepartmentName='sale') ;
SELECT * FROM vw_sale;
-- Question 2: Tạo view có chứa thông tin các account tham gia vào nhiều group nhất
CREATE or REPLACE VIEW sla AS (SELECT a.AccountID,count(a.AccountID) AS sl FROM `account` a INNER JOIN groupaccount b ON a.AccountID=b.AccountID GROUP BY a.AccountID);
SELECT * FROM `account` WHERE AccountID = (
SELECT AccountID FROM (
SELECT AccountID,sl FROM sla
HAVING sl =(
SELECT max(sl) from sla )
) as dff
);
-- cach 2
SELECT * FROM groupaccount;
WITH CTE_getcountaccountid AS(
SELECT count(ga.AccountID) AS sl FROM groupaccount ga
GROUP BY ga.AccountID
)
SELECT ga.AccountID,a.Username,a.Fullname,count(ga.AccountID) FROM groupaccount ga
INNER JOIN `account` a ON a.AccountID=ga.AccountID
GROUP BY ga.AccountID 
HAVING count(ga.AccountID)=(
SELECT max(sl) FROM CTE_getcountaccountid);
-- Question 3: Tạo view có chứa câu hỏi có những content quá dài (content quá 300 từ được coi là quá dài) và xóa nó đi
CREATE OR REPLACE VIEW vw_longquestion as (
SELECT questionid FROM question WHERE length(Content)>13);
-- Question 4: Tạo view có chứa danh sách các phòng ban có nhiều nhân viên nhất
CREATE OR REPLACE VIEW vw_dev_have_most_staff AS(
WITH cte_pb AS(
SELECT d.departmentid,count(d.departmentid) AS sl FROM department d INNER JOIN account a ON d.DepartmentID=a.DepartmentID GROUP BY d.DepartmentID
)
SELECT departmentid FROM cte_pb WHERE sl=(SELECT max(sl) FROM cte_pb)
);
SELECT * FROM vw_dev_have_most_staff;
-- Question 5: Tạo view có chứa tất các các câu hỏi do user họ Nguyễn tạo
CREATE OR REPLACE VIEW vw_question_of_nguyen AS(
SELECT q.QuestionID,q.Content FROM question q INNER JOIN `account` a ON q.CreatorID=a.AccountID
WHERE a.Fullname LIKE 'Nguyễn%');
SELECT * FROM vw_question_of_nguyen;