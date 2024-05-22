


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
create table CategorySkill(
	id int primary key,
	CName nvarchar(50)

)
create table skill(
	id int primary key,
	skill nvarchar(50),
	descpition nvarchar(max),
	images nvarchar(max),
	cid int references CategorySkill(id),
	
)
create table mentor(
	mentor_id int IDENTITY (1,1) PRIMARY KEY,
	userId int references [User](user_id),
	price money null,
	[status] int
	
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
	[subject] nvarchar(max),
	mentee_id int references [User](user_id),
	mentor_id int references mentor(mentor_id),
	DeadlineTime nvarchar(max),
	DeadTime nvarchar(max),
	content nvarchar(max),
	time_slot_id int references time_slot(id),
	day_number int ,
	[status] nvarchar(max)
	
)
create table requestSkill(
	rid int references request(id),
	skid int references skill(id)
)

create table feedback(
	id int IDENTITY (1,1) PRIMARY KEY,
	mentee_id int references [User](user_id),
	mentor_id int references mentor(mentor_id),
	comment nvarchar(max),
	rate int 
)

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

USE [SWP391_project]
GO

INSERT INTO [dbo].[skill]
           ([id]
           ,[skill]
           ,[descpition]
           ,[images]
           ,[cid])
     VALUES
           (1, 'Angular','1. Get acquainted with Angular
2. Introduction to Angular
3. Learn about RxJS
4. Angular Router
5. Angular Forms
6. Expand more about Angular', 'img/Angular.png',1 ),
		   (2, 'Docker','1. Introduce and install Docker
2. Knowledge of docker
3. Practice with Docker', 'img/Docker.png' ,3 ),
		   (3, 'React Native','1. Introducing react native
2. React Native Basics
3. Core Components in React Native
4. Android Components and APIs
5. iOS Components and APIs
6. Other themes in React Native' , 'img/React_Native.png' ,1 ),
		   (4, 'Go Lang','1. Introducing Go Lang
2. Basic Go Lang
3. Control statements in Go Lang
4. Maps, Arrays and Slices in Go Lang
5. How to organize source code in Go Lang
6. Other topics in Go Lang' , 'img/Go_Lang.png' ,2),
		   (5, 'Java Spring boot', '1. Overview of Spring
2. Basic concepts about Spring
3. Basic Spring Boot
4. Thymeleaf
5. Spring JPA and Hibernate
6. Testing
7. RESTful API Document
8. Spring security' , 'img/Java_spring_boot.png' ,2),
		   (6, 'C++', '1. Overview of the C++ course
2. Get familiar with C++ language
3. Structures in C++' , 'img/C++.png' ,2 ),
		   (7, 'Reactjs', '1. Introduction
2. Installation
3. Interface in Reactjs
4. Interaction in Reactjs
5. State management in React
6. Advanced React' , 'img/reactjs.png' ,1 ),
		   (8, 'C','1. Introduction
2. Introduction C
3. Conditional sentences
4. Loop
5. Jaw
6. Array
7. Pointer
8. Strings' , 'img/C.png' ,2 ),
		   (9, 'Javascript', '1. Introducing Javascript
2. Basic Javascript
3. Objects in Javascript
4. Data types in Javascript
5. Advanced knowledge of functions
6. Configure object properties
7. Prototype and prototype inheritance
8. ES6 Class
9. Callback, Promise, async/awai
10. ES6 Modules
11. Test and ensure code quality
12. Regular expressions
13. DOM
14. Network requests
15. Data storage
16. Javascript workers
17. Design patterns in Javascript
18. Algorithm with Javascript' , 'img/JavaScript.png' ,1 ),
		   (10, 'Java', '1. Introducing Java
2. Introduction to Java
3. Object-oriented programming
4. Java collections
5. Exception handling
6. Multi-threaded programming
7. Design Patterns' , 'img/Java.png' ,2),
		   (11, 'AWS', '1. Introducing AWS
2. Elastic Compute Cloud
3. High Availability
4. Virtual Private Cloud
5. Databases
6. Simple Storage Service
7. Route 53
8. Cloudfront, Accelerator
9. Expand storage
10. Decoupling in AWS
11. Serverless
12. Monitoring & Auditing
13. Security & Encryption', 'img/Amazon_Web_Service.png' ,3),
		   (12, 'Blockchain','1. Knowledge About Blockchain
2. Smart Contracts
3. Install Solidity Compiler
4. Solidity Programming
5. Contract Metadata
6. Contract ABI Specification
7. Ethereum Request For Comment (ERC)
8. Build & Operate ICO yourself
9. FrontEnd Programming
10. Deploy ICO' , 'img/Blockchain.png' ,2),
		   (13, 'Ruby', '1. Introducing Ruby
2. Basic ruby ​​knowledge
3. Data types in Ruby
4. Advanced ruby ​​knowledge','img/Ruby.png' ,2),
		   (14, 'Python', '1. Introducing Python
2. Basic Python
3. Control statements in Python
4. Functions & Modules in Python
5. Strings in Python
6. Lists in Python
7. Tuples in Python
8. Sets in Python
9. Dictionaries in Python
10. Arrays in Python
11. File processing in Python
12. Object-oriented programming in Python
13. Handling Exceptions in Python
14. Multithreading in Python
15. Synchronization in Python
16. Networking in Python
17. Libraries in Python','img/Python.png' ,2),
		   (15, 'C#', '1. Introduction to C#
2. Basic concepts
3. Conditions and loops
4. Functions and methods
5. Object-oriented programming (OOP)
6. Error and exception handling
7. Work with data', 'img/Csap.png' ,2)