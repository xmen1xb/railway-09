DROP DATABASE IF EXISTS Testing_System_Assignment_1;
CREATE DATABASE    		Testing_System_Assignment_1;
USE 					Testing_System_Assignment_1;


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
VALUES 				('nguyentan1@gmail.com'		, 'tutiton'		,'tr???n v??n b??'				,   '1'			,   '3'		),
					('nguyentan2@gmail.com'		, 'tandeptrai'	,'nguy???n th??? minh'		    ,   '4'			,   '5'		),
                    ('nguyentan3@gmail.com'		, 'linhkute'	,'nguy???n v??n linh'			,	'2'			,	'4'		),
                    ('nguyentan4@gmail.com'		, 'anhxg'		,'l?? ng???c anh'				,	'3'			,	'1'		),
                    ('nguyentan5@gmail.com'		, 'ducdaydu'	,'ph???m v??n ?????c'				,	'3'			,	'5'		),
                    ('nguyentan6@gmail.com','bieub','ho??ng v??n bi???u','5','12'),
                    ('nguyentan7@gmail.com','hieux','ho??ng v??n hi???u','8','10'),
                    ('nguyentan8@gmail.com','tuang','nguy???n v??n tu???n','11','7'),
                    ('nguyentan9@gmail.com','changchang','nguy???n th??? trang','15','3'),
                    ('nguyentan10@gmail.com','hahonho','nguy???n th??? h??','14','2'),
                    ('nguyentan11@gmail.com','doanganh','ph???m v??n ??o??n','12','1'),
                    ('nguyentan12@gmail.com','huyhihung','????? v??n huy','10','3'),
                    ('nguyentan13@gmail.com','hacodon','tr???nh m???nh h??','11','2'),
                    ('nguyentan14@gmail.com','tuyettrang','l?? th??? tuy???t','10','4'),
                    ('nguyentan15@gmail.com','tungtutin','l?? thanh t??ng','11','4');
                    
                     
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
-- bai tap testing system 4
-- question 1 Vi???t l???nh ????? l???y ra danh s??ch nh??n vi??n v?? th??ng tin ph??ng ban c???a h???
SELECT accountid,departmentid from `account`	;
-- question 2Vi???t l???nh ????? l???y ra danh s??ch nh??n vi??n v?? th??ng tin ph??ng ban c???a h???
SELECT * from `account` where createdate>'2010-12-20';
-- question 3: Vi???t l???nh ????? l???y ra t???t c??? c??c developer (positionname)
select w.positionid as ms1,v.positionid as ms2
 from `position` w
 join `account` v on w.positionid=(select positionid from `position` where positionname='development');
-- question 4: Vi???t l???nh ????? l???y ra danh s??ch c??c ph??ng ban c?? >3 nh??n vi??n
select a.departmentid,count(a.departmentid) as 'so luong nv' from `account` a GROUP BY departmentid having count(a.departmentid)>3;
-- question 5Vi???t l???nh ????? l???y ra danh s??ch c??u h???i ???????c s??? d???ng trong ????? thi nhi???u nh???t
SELECT QuestionID,count(ExamID) FROM examquestion GROUP BY QuestionID;
SELECT QuestionID,count(QuestionID) AS 's??? l?????ng' FROM examquestion;
SELECT a.questionid,b.questionid from question a INNER JOIN examquestion b ON a.questionid=b.questionid ORDER BY a.questionid DESC;
SELECT 		Q.QuestionID, Q.Content, Q.CategoryID, Q.TypeID, Q.CreatorID, Q.CreateDate, Count(Q.Content) AS 'SO LUONG'
FROM		Question Q 
INNER JOIN 	ExamQuestion EQ ON Q.QuestionID = EQ.QuestionID
GROUP BY	Q.Content
HAVING		COUNT(Q.Content) = (SELECT	MAX(CountQ)
								FROM		
										(SELECT 		COUNT(Q.QuestionID) AS CountQ
										FROM			ExamQuestion EQ 
										INNER JOIN 		Question Q ON EQ.QuestionID = Q.QuestionID
										GROUP BY		Q.QuestionID) AS MaxContent);
-- Question 6: Th??ng k?? m???i category Question ???????c s??? d???ng trong bao nhi??u Question
SELECT a.CategoryID,count(b.categoryID) AS sl 
from categoryquestion a 
join question b on a.CategoryID=b.categoryid 
GROUP BY a.categoryid;
-- Question 7: Th??ng k?? m???i Question ???????c s??? d???ng trong bao nhi??u Exam
SELECT a.questionid,count(b.questionid) AS sl
FROM question a 
INNER JOIN examquestion b ON a.questionid = b.questionid
GROUP BY a.questionid;
-- Question 8: L???y ra Question c?? nhi???u c??u tr??? l???i nh???t
SELECT 		Q.QuestionID, Q.Content, COUNT(A.QuestionID) AS 'SO LUONG'
FROM		Question Q 
INNER JOIN 	Answer A ON	Q.QuestionID = A.QuestionID
GROUP BY	Q.QuestionID
HAVING		COUNT(A.QuestionID) =	(SELECT 	MAX(CountQ)
									 FROM		(SELECT 		COUNT(A.QuestionID) AS CountQ
												FROM			Answer A 
												RIGHT JOIN  Question Q ON A.QuestionID = Q.QuestionID 
												GROUP BY		A.QuestionID)
                                                AS MaxCountQ);
-- Question 9: Th???ng k?? s??? l?????ng account trong m???i group
SELECT b.groupid,count(a.accountid) AS 'sl'
FROM groupaccount a 
RIGHT JOIN `groupp` b on a.groupid=b.groupid
GROUP BY b.groupid ;

-- Question 10: T??m ch???c v??? c?? ??t ng?????i nh???t
SELECT 		P.PositionID, P.PositionName, COUNT(A.PositionID) AS 'SO LUONG'
FROM		Position P 
INNER JOIN 	`Account` A ON P.PositionID = A.PositionID
GROUP BY 	P.PositionID
HAVING		COUNT(A.PositionID)	=	(SELECT 	MIN(CountP)
									 FROM		(SELECT 	COUNT(P.PositionID) AS CountP
												FROM		Position P 
												INNER JOIN 	`Account` A ON P.PositionID = A.PositionID		
												GROUP BY	P.PositionID) AS MinCountP);
-- Question 11: Th???ng k?? m???i ph??ng ban c?? bao nhi??u dev, test, scrum master, PM
SELECT a.positionid,count(b.positionid)
FROM `account` b JOIN `position` a ON a.positionid=b.positionid
GROUP BY a.positionid;
-- Question 12: L???y th??ng tin chi ti???t c???a c??u h???i bao g???m: th??ng tin c?? b???n c???a
 -- question, lo???i c??u h???i, ai l?? ng?????i t???o ra c??u h???i,noi dung cua cau hoi, c??u tr??? l???i l?? g??, ngay tao ra cau hoi???
 SELECT a.typename AS `loai cau hoi`,b.creatorid AS `nguoi tao`,b.content AS `noi dung cau hoi`,c.content AS `noi dung cau tra loi`,b.createdate AS `ngay tao`
 from question b
 INNER JOIN answer c ON b.questionid=c.questionid
 INNER JOIN typequestion a ON b.typeid=a.typeid;
 -- Question 13: L???y ra s??? l?????ng c??u h???i c???a m???i lo???i t??? lu???n hay tr???c nghi???m
 SELECT a.typename,count(b.typeid) AS `so luong cau hoi`
 FROM question b
 INNER JOIN typequestion a ON a.typeid=b.typeid
 GROUP BY a.typename;
 -- Question 14:L???y ra group kh??ng c?? account n??o
SELECT a.groupname
FROM groupp a 
LEFT JOIN groupaccount b
ON a.groupid=b.groupid
WHERE b.groupid IS NULL;
-- Question 16: L???y ra question kh??ng c?? answer n??o
SELECT a.questionid,a.content
FROM question a 
LEFT JOIN answer b ON a.questionid=b.questionid
WHERE b.questionid IS NULL;
-- Exercise 2: Union
-- Question 17:
-- a) L???y c??c account thu???c nh??m th??? 1
-- b) L???y c??c account thu???c nh??m th??? 2
-- c) Gh??p 2 k???t qu??? t??? c??u a) v?? c??u b) sao cho kh??ng c?? record n??o tr??ng nhau
SELECT a.username,b.departmentname AS ph??ng
FROM `account` a
INNER JOIN department b ON a.departmentid=b.departmentid
WHERE b.departmentname='marketing'
UNION ALL
SELECT c.username,d.departmentname AS ph??ng
FROM `account` c
INNER JOIN department d ON c.departmentid=d.departmentid
WHERE d.departmentname='nh??n s???';
-- Question 18:
-- a) L???y c??c group c?? l???n h??n 5 th??nh vi??n
-- b) L???y c??c group c?? nh??? h??n 7 th??nh vi??n
-- c) Gh??p 2 k???t qu??? t??? c??u a) v?? c??u b)
SELECT a.groupname,count(b.accountid) AS `so thanh vien`
FROM groupp a
INNER JOIN groupaccount b ON a.groupid=b.groupid
GROUP BY a.groupname
HAVING count(b.accountid)>5
UNION
SELECT a.groupname,count(b.accountid) AS `so thanh vien`
FROM groupp a
INNER JOIN groupaccount b ON a.groupid=b.groupid
GROUP BY a.groupname
HAVING count(b.accountid)<7;