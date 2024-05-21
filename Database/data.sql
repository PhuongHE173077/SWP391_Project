drop database SWP391_project
create database SWP391_project

--------------------
create table roles(
	id int primary key,
	roleName nvarchar(50), 
)

create table [User](
	user_id int IDENTITY (1,1) PRIMARY KEY,
	[name] nvarchar(100),
	email nvarchar (max),
	[password] nvarchar(max),
	dob nvarchar (50) null,
	phone nvarchar (50) null,
	img nvarchar(max) null,
	gender int null,
	balance money,
	[address] nvarchar(max) null,
	rid int references roles(id)
)

create table skill(
	id int primary key,
	skill nvarchar(50),
	
)

create table CategorySkill(
	id int primary key,
	CName nvarchar(50)

)create table course(
	id_course int primary key,
	Date_number int,
	price money,
	descpition nvarchar(max),
	images nvarchar(max),
	skill_id int references skill(id),
	cid int references CategorySkill(id)
)
create table mentor(
	mentor_id int IDENTITY (1,1) PRIMARY KEY,
	userId int references [User](user_id)
	
)
create table Cv_Mentor(
	cv_id int primary key,
	metor_id int references mentor(mentor_id),
	full_name nvarchar(max),
	email nvarchar(max),
	dob nvarchar(max),
	gender int,
	phone nvarchar(max),
	[address] nvarchar(max),
	img nvarchar(max),
	education nvarchar(max),
	word_experice nvarchar(max),
	achievements nvarchar(max) null,
	[status] int
)
create table skill_detail(
	skill_id int references skill(id),
	mentor_id int references mentor(mentor_id),
	primary key (skill_id,mentor_id)
)
create table time_slot(
	id int primary key,
	time_slot nvarchar(max)
)

create table request(
	id int IDENTITY (1,1) PRIMARY KEY,
	mentee_id int references [User](user_id),
	mentor_id int references mentor(mentor_id),
	time_slot_id int references time_slot(id),
	course_id int references course(id_course),
	[status] nvarchar(max)
)

create table feedback(
	id int IDENTITY (1,1) PRIMARY KEY,
	mentee_id int references [User](user_id),
	mentor_id int references mentor(mentor_id),
	comment nvarchar(max),
	rate int 
)
create table class(
	class_id int IDENTITY (1,1) PRIMARY KEY,
	mentee_id int references [User](user_id),
	mentor_id int references mentor(mentor_id),
	time_slot_id int references time_slot(id),
	course_id int references course(id_course),
	[status] nvarchar(max),
)


--------------------------------------------------
INSERT INTO [dbo].[roles]
           ([id]
           ,[roleName])
     VALUES
           (0,'mentee'),(1,'mentor'),(2,'admin')

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

INSERT INTO [dbo].[CategorySkill]
           ([id]
           ,[CName])
     VALUES
	 (1,'Font-End'),
	 (2,'Back-End'),
	 (3,'DevOps')



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


		  USE [SWP391_project]
GO

INSERT INTO [dbo].[skill]
           ([id]
           ,[skill])
     VALUES
           (1, 'Angular'),
		   (2, 'Docker'),
		   (3, 'React Native'),
		   (4, 'Go Lang'),
		   (5, 'Java Spring boot'),
		   (6, 'C++'),
		   (7, 'Reactjs'),
		   (8, 'C'),
		   (9, 'Javascript'),
		   (10, 'Java'),
		   (11, 'AWS'),
		   (12, 'Blockchain'),
		   (13, 'Ruby'),
		   (14, 'Python'),
		   (15, 'C#')

		   INSERT INTO [dbo].[course]
           ([id_course]
           ,[Date_number]
           ,[price]
           ,[descpition]
           ,[images]
           ,[skill_id]
           ,[cid])
     VALUES
           			(1, 10, 250.50, '1. Get acquainted with Angular
2. Introduction to Angular
3. Learn about RxJS
4. Angular Router
5. Angular Forms
6. Expand more about Angular' , 'img/Amazon_Web_Service.png' , 1,1 ),

			(2, 10, 230.50, '1. Introducing react native
2. React Native Basics
3. Core Components in React Native
4. Android Components and APIs
5. iOS Components and APIs
6. Other themes in React Native' , 'img/React_Native.png' , 3,1 ),

			(3, 10, 280.40, '1. Introducing Go Lang
2. Basic Go Lang
3. Control statements in Go Lang
4. Maps, Arrays and Slices in Go Lang
5. How to organize source code in Go Lang
6. Other topics in Go Lang' , 'img/Go_Lang.png' , 4,2 )
