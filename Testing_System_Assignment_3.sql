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
-- bai tap testing system 3
select* from department;
select departmentid from department where DepartmentName = 'Sale';
select  max(fullname) from `account`;
select max(fullname) from `account` where departmentid=3;
select groupname from  `groupp` where CreateDate > 20/12/2019;
select s.questionid,count(s.questionid) from answer s group by questionid having count(s.questionid)>=4;
SELECT examid from exam where duration>=60 and CreateDate < 20/12/2019;
SELECT * from `groupp` ORDER BY CreateDate desc limit 5;
select * from department;
select a.departmentid,count(a.departmentid) as soluong from department a 
where DepartmentID=2;
select Username from `account` where (SUBSTRING_INDEX(FullName, ' ', -1)) LIKE 'D%o' ;
update 	`account` set fullname='nguyễn bá lộc' , email='locnguyenba@vti.com.vn' where accountid=5;
update groupaccount set groupid=4 where accountid=5;
select * from groupaccount;




-- bai tap testing system 4
-- question 1
SELECT accountid,departmentid from `account`	;
-- question 2
SELECT * from `account` where createdate>'2010-12-20';
-- question 3
select accountid,positionID from `account` where positionid =4;
-- question 4
select a.departmentid,count(a.departmentid) as 'so luong nv' from `account` a GROUP BY departmentid having count(a.departmentid)>3;
-- question 5
