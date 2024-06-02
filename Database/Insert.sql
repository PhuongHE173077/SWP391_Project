INSERT INTO [dbo].[roles]
           ([id]
           ,[roleName])
     VALUES
           (0,'mentee'),(1,'mentor'),(2,'manager')

INSERT INTO [dbo].[User]
           ([name]
           ,[email]
           ,[password]
           ,[dob]
           ,[phone]
           ,[gender]
           ,[balance]
           ,[address]
           ,[rid])
     VALUES
           ('Do Dang Phuong','phuongbg0910@gmail.com','123456p','09-10-2003','122455151',1,0,'abc',0)

INSERT INTO [dbo].[categorySkill]
           ([id]
           ,[categoryName])
     VALUES
	 (1,'Font-End'),
	 (2,'Back-End'),
	 (3,'DevOps'),
	 (4,'Others')

INSERT INTO [dbo].[skill]
           ([id]
           ,[skill]
           ,[images]
           ,[cid])
     VALUES
	 
	 (1, 'Angular', 'img/Angular.png',1 ),
		   (2, 'Docker', 'img/Docker.png' ,3 ),
		   (3, 'React Native', 'img/React_Native.png' ,1 ),
		   (4, 'Go Lang', 'img/Go_Lang.png' ,2),
		   (5, 'Java Spring boot', 'img/Java_spring_boot.png' ,2),
		   (6, 'C++' ,'img/C++.png' ,2 ),
		   (7, 'Reactjs','img/reactjs.png' ,1 ),
		   (8, 'C', 'img/C.png' ,2 ),
		   (10, 'Java', 'img/Java.png' ,2),
		   (9, 'Javascript', 'img/Java.png' ,2),
		   (11, 'AWS','img/Amazon_Web_Service.png' ,3),
		   (12, 'Blockchain', 'img/Blockchain.png' ,2),
		   (13, 'Ruby','img/Ruby.png' ,2),
		   (14, 'Python','img/Python.png' ,2),
		   (15, 'C#','img/Csap.png' ,2)

INSERT INTO [dbo].[User]
           ([name]
           ,[email]
           ,[password]
           ,[dob]
           ,[phone]           
           ,[gender]
           ,[balance]
           ,[address]
           ,[rid])
     VALUES
           ('Nguyen Van Nam', 'namnn@gmail.com', '123', '18-08-1988', '0139472817', '1', '0', 'Ha Noi', '1');
		  INSERT INTO [dbo].[User] ([name] ,[email] ,[password] ,[dob] ,[phone] ,[gender] ,[balance] ,[address] ,[rid]) Values ('Ngueyn Dang Khoa', 'khoand23@gmail.com', '123', '23-03-2003', '0683928174', '1', '0', 'Ha Noi', 1);
		   INSERT INTO [dbo].[User] ([name] ,[email] ,[password] ,[dob] ,[phone] ,[gender] ,[balance] ,[address] ,[rid]) Values ('Nguyen Minh Anh', 'anhnm08@gmail.com', '123', '08-08-2003', '0134398075', '2', '0', 'Thai Binh', 1);
		   INSERT INTO [dbo].[User] ([name] ,[email] ,[password] ,[dob] ,[phone] ,[gender] ,[balance] ,[address] ,[rid]) Values ('Nguyen Thanh Chi', 'chint01@gmail.com', '123', '01-04-1991', '0133472837', '2', '0', 'Hai Phong', 1);
		   INSERT INTO [dbo].[User] ([name] ,[email] ,[password] ,[dob] ,[phone] ,[gender] ,[balance] ,[address] ,[rid]) Values ('Nguyen Quynh Trang', 'trangnq@gmail.com', '123', '01-02-2000', '0139472892', '2', '0', 'Nghe An', 1);
		   INSERT INTO [dbo].[User] ([name] ,[email] ,[password] ,[dob] ,[phone] ,[gender] ,[balance] ,[address] ,[rid]) Values ('Bui Diem Quynh', 'quynhbd22@gmail.com', '123', '22-05-2005', '0827519065', '2', '0', 'Hue', 1);
		  INSERT INTO [dbo].[User] ([name] ,[email] ,[password] ,[dob] ,[phone] ,[gender] ,[balance] ,[address] ,[rid]) Values ('Phan Thuy Linh', 'linhphan03@gmail.com', '123', '03-01-2004', '0875189064', '2', '0', 'Ho Chi Minh', 1);
		  INSERT INTO [dbo].[User] ([name] ,[email] ,[password] ,[dob] ,[phone] ,[gender] ,[balance] ,[address] ,[rid]) Values ('Bui Van Quy', 'quybv26@gmail.com', '123', '26-09-2001', '0856297462', '1', '0', 'Da Lat', 1);
		  INSERT INTO [dbo].[User] ([name] ,[email] ,[password] ,[dob] ,[phone] ,[gender] ,[balance] ,[address] ,[rid]) Values ('Nguyen Xuan Duc', 'ducnx14@gmail.com', '123', '14-07-2003', '098746724', '1', '0', 'Thanh Hoa', 1);
		  INSERT INTO [dbo].[User] ([name] ,[email] ,[password] ,[dob] ,[phone] ,[gender] ,[balance] ,[address] ,[rid]) Values ('Tran Thi Dung', 'dungtt@gmail.com', '123', '01-01-2003', '0984373678', '2', '0', 'Ha Noi', 1);
INSERT INTO [dbo].[mentor]
           ([userId])
     VALUES
            (2),
			(3),
			(4),
			(5),
			(6)

/*Cv  mentor co 3 trang thai do la processing, reject, approve*/
INSERT INTO [dbo].[Cv_Mentor]
           ([cv_id]
           ,[metor_id]
           ,[full_name]
           ,[email]
           ,[dob]
           ,[gender]
           ,[phone]
           ,[address]
           ,[img]
           ,[education]
           ,[word_experice]
           ,[achievements]
		   ,[status])
     VALUES
		   (1, 1 , 'Nguyen Van Nam', 'namnn@gmail.com', '18-08-1988', 1, '0139472817', 'Ha Noi', 'img/namnv.png', 'FPT University', '15', 'Tu tru FPT','approve'),
           (2, 2 , 'Ngueyn Dang Khoa', 'khoand23@gmail.com', '23-03-2003', 1, '0683928174', 'Ha Noi', 'img/khoand.png', 'FPT University', '8', 'Best mentor 2018','approve'),
           (3, 3, 'Nguyen Minh Anh', 'anhnm08@gmail.com', '08-08-2003', 2, '0134398075', 'Thai Binh', 'img/anhhnm.png', 'FPT University', '12', 'Outstanding educator 2020','approve'),
           (4, 4 , 'Nguyen Thanh Chi', 'chint01@gmail.com', '01-04-1991', 2, '0133472837', 'Hai Phong', 'img/chint.png', 'FPT University', '7', 'Top performer 2019','approve'),
           (5, 5 , 'Nguyen Quynh Trang', 'trangnq@gmail.com', '01-02-2000', 0, '0139472892', 'Nghe An', 'img/trangnq.png', 'FPT University', '10', 'Excellence in leadership 2021','approve')

		   INSERT INTO skill_detail (skill_id, mentor_id)
VALUES
(10,4),
    (2, 1),
    (6, 1),
    (9, 1),
    (4, 2),
    (5, 2),
    (1, 2),
    (3, 3),
    (7, 3),
    (8, 4),
    (11, 4);
	
