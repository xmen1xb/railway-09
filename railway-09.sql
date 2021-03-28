DROP DATABASE IF EXISTS Testing_System_Assignment_2;
CREATE DATABASE    		Testing_System_Assignment_2;
USE 					Testing_System_Assignment_2;


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
                      ('phong an'),
                      ('phong ngu');

INSERT INTO `Position`(PositionName)
VALUES                ('giam doc'),
					  ('thu ky'),
					  ('pho giam doc'),
                      ('nhan su'),
                      ('to truong');
INSERT INTO `Account`(Email						, Username			, FullName				, DepartmentID	, PositionID)
VALUES 				('nguyentan1@gmail.com'		, 'tutiton'		,'trần văn bé'				,   '1'			,   '3'		),
					('nguyentan2@gmail.com'		, 'tandeptrai'	,'nguyễn thị minh'		    ,   '4'			,   '5'		),
                    ('nguyentan3@gmail.com'		, 'linhkute'	,'nguyễn văn linh'			,	'2'			,	'4'		),
                    ('nguyentan4@gmail.com'		, 'anhxg'		,'lê ngọc anh'				,	'3'			,	'1'		),
                    ('nguyentan5@gmail.com'		, 'ducdaydu'	,'phạm văn đức'				,	'3'			,	'5'		); 
INSERT INTO `Groupp`( Groupname					, CreatorID)
VALUE   			('phuonghoanglua'			, '2'		),
					('bocautrang'				, '3'		),
                    ('tauhoatoc'				, '4'		),
                    ('maytrang'					, '1'		),
                    ('luayeuthuong'				, '5'		);
INSERT INTO Groupaccount(GroupID	,AccountID	,Joindate)
VALUE					('1'		,'3'		,'2019-12-26'),
						('3'		,'2'		,'2020-10-23'),
                        ('4'		,'1'		,'2020-05-12'),
                        ('2'		,'4'		,'2020-09-29'),
                        ('3'		,'1'		,'2021-01-01');
INSERT INTO Typequestion(Typename)
VALUE					('tuluan'),('tracnghiem');

INSERT INTO Categoryquestion(Categoryname)
VALUE					('cuocsong'),
						('vanhoa'),
                        ('thethao'),
                        ('dulich'),
                        ('toanhoc');
INSERT INTO Question(Content,CategoryID,TypeID,CreatorID,CreateDate)
VALUE				('question1','2','1','2','2021-01-01'),
					('question2','4','2','3','2019-09-04'),
					('question3','2','2','2','2019-08-19'),
                    ('question4','5','1','1','2019-12-08'),
                    ('question5','2','1','3','2020-01-28');
INSERT INTO Answer(Content,QuestionID,Iscorrect)
VALUE			('answer vti 1654','1',1),
				('answer vti 8963','3',1),
                ('answer vti 7455','2',0),
                ('answer vti 7563','4',1),
                ('answer vti 1246','5',0);
INSERT INTO Exam(`Code` , Title , CategoryID , Duration , CreatorID , CreateDate)
VALUE			('vtiQ01','De thi java','3','60','2','2020-03-25'),
				('vtiw34','De thi android','2','90','1','2021-01-19'),
                ('vtiR06','De thi windown','1','120','4','2021-02-03'),
                ('vtiK21','De thi macos','3','60','1','2020-10-12'),
                ('vtiL54','De thi iOS','3','60','4','2020-12-30');
INSERT INTO Examquestion(ExamID,QuestionID)
VALUE					('2','3'),
						('3','1'),
                        ('2','4'),
                        ('4','5'),
                        ('5','3'),
                        ('2','1'),
                        ('1','2'),
                        ('1','3'),
                        ('2','5');
