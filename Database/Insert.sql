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
           ,[rid]
		   ,[status])
     VALUES
           ('Do Dang Phuong','phuongbg0910@gmail.com','123456p','09-10-2003','122455151',1,0,'abc',0,'active')

INSERT INTO [dbo].[categorySkill]
           ([id]
           ,[categoryName])
     VALUES
	 (1,'Font-End'),
	 (2,'Back-End'),
	 (3,'DevOps'),
	 (4,'Others')

INSERT INTO [dbo].[skill]
           (
           [skill]
           ,[descpition]
           ,[images]
           ,[cid])
     VALUES
           ( 'Angular','1. Get acquainted with Angular
2. Introduction to Angular
3. Learn about RxJS
4. Angular Router
5. Angular Forms
6. Expand more about Angular', 'img/Angular.png',1 ),
		   ( 'Docker','1. Introduce and install Docker
2. Knowledge of docker
3. Practice with Docker', 'img/Docker.png' ,3 ),
		   ( 'React Native','1. Introducing react native
2. React Native Basics
3. Core Components in React Native
4. Android Components and APIs
5. iOS Components and APIs
6. Other themes in React Native' , 'img/React_Native.png' ,1 ),
		   ( 'Go Lang','1. Introducing Go Lang
2. Basic Go Lang
3. Control statements in Go Lang
4. Maps, Arrays and Slices in Go Lang
5. How to organize source code in Go Lang
6. Other topics in Go Lang' , 'img/Go_Lang.png' ,2),
		   ( 'Java Spring boot', '1. Overview of Spring
2. Basic concepts about Spring
3. Basic Spring Boot
4. Thymeleaf
5. Spring JPA and Hibernate
6. Testing
7. RESTful API Document
8. Spring security' , 'img/Java_spring_boot.png' ,2),
		   ( 'C++', '1. Overview of the C++ course
2. Get familiar with C++ language
3. Structures in C++' , 'img/C++.png' ,2 ),
		   ( 'Reactjs', '1. Introduction
2. Installation
3. Interface in Reactjs
4. Interaction in Reactjs
5. State management in React
6. Advanced React' , 'img/reactjs.png' ,1 ),
		   ('C','1. Introduction
2. Introduction C
3. Conditional sentences
4. Loop
5. Jaw
6. Array
7. Pointer
8. Strings' , 'img/C.png' ,2 ),
		   ( 'Javascript', '1. Introducing Javascript
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
		   ( 'Java', '1. Introducing Java
2. Introduction to Java
3. Object-oriented programming
4. Java collections
5. Exception handling
6. Multi-threaded programming
7. Design Patterns' , 'img/Java.png' ,2),
		   ( 'AWS', '1. Introducing AWS
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
		   ( 'Blockchain','1. Knowledge About Blockchain
2. Smart Contracts
3. Install Solidity Compiler
4. Solidity Programming
5. Contract Metadata
6. Contract ABI Specification
7. Ethereum Request For Comment (ERC)
8. Build & Operate ICO yourself
9. FrontEnd Programming
10. Deploy ICO' , 'img/Blockchain.png' ,2),
		   ( 'Ruby', '1. Introducing Ruby
2. Basic ruby ​​knowledge
3. Data types in Ruby
4. Advanced ruby ​​knowledge','img/Ruby.png' ,2),
		   ( 'Python', '1. Introducing Python
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
		   ( 'C#', '1. Introduction to C#
2. Basic concepts
3. Conditions and loops
4. Functions and methods
5. Object-oriented programming (OOP)
6. Error and exception handling
7. Work with data', 'img/Csap.png' ,2)

INSERT INTO [dbo].[User]
           ([name]
           ,[email]
           ,[password]
           ,[dob]
           ,[phone]           
           ,[gender]
           ,[balance]
           ,[address]
           ,[rid]
		   ,[status])
     VALUES
           ('Nguyen Van Nam', 'namnn@gmail.com', '123', '18-08-1988', '0139472817', '1', '0', 'Ha Noi', 1,'active'),
		  ('Ngueyn Dang Khoa', 'khoand23@gmail.com', '123', '23-03-2000', '0683928174', '1', '0', 'Ha Noi', 1,'active'),
		   ('Nguyen Minh Anh', 'anhnm08@gmail.com', '123', '08-08-1997', '0134398075', '2', '0', 'Thai Binh', 1,'active'),
		   ('Nguyen Thanh Chi', 'chint01@gmail.com', '123', '01-04-1991', '0133472837', '2', '0', 'Hai Phong', 1,'active'),
		   ('Nguyen Quynh Trang', 'trangnq@gmail.com', '123', '01-02-2000', '0139472892', '2', '0', 'Nghe An', 1,'active'),
		    ('Bui Diem Quynh', 'quynhbd22@gmail.com', '123', '22-05-1995', '0827519065', '2', '0', 'Hue', 1,'active'),
		   ('Phan Thuy Linh', 'linhphan03@gmail.com', '123', '03-01-1994', '0875189064', '2', '0', 'Ho Chi Minh', 1,'active'),
		   ('Bui Van Quy', 'quybv26@gmail.com', '123', '26-09-1991', '0856297462', '1', '0', 'Da Lat', 1,'active'),
		   ('Nguyen Xuan Duc', 'ducnx14@gmail.com', '123', '14-07-1993', '098746724', '1', '0', 'Thanh Hoa', 1,'active'),
		  ('Tran Thi Dung', 'dungtt@gmail.com', '123', '01-01-1993', '0984373678', '2', '0', 'Ha Noi', 1,'active');
INSERT INTO [dbo].[mentor]
           ([userId])
     VALUES	
            (2),
			(3),
			(4),
			(5),
			(6),
			(7),
	 (8),
	 (9),
	 (10),
	 (11)

			 INSERT INTO [dbo].[timeSlot]
           (
           [timeSlot])
     VALUES
          ( '7:30 - 9:30'),
		  ('9:50 - 10:50'),
		  ( '11:00 - 13:00'),
		  ( '13:15 - 15:15'),
		  ('15:20 - 17:20'),
		  ('17:30 - 19:30'),
		  ('19:45-21:45'),
		  ('21:50-23:50')

/*Cv  mentor co 3 trang thai do la processing, reject, approve*/
INSERT INTO [dbo].[Cv_Mentor]
           (
           [metor_id]
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
		   ( 1 , 'Nguyen Van Nam', 'namnn@gmail.com', '18-08-1988', 1, '0139472817', 'Ha Noi', 'img/namnv.png', 'FPT University', '15', 'Tu tru FPT','approve'),
           ( 2 , 'Ngueyn Dang Khoa', 'khoand23@gmail.com', '23-03-2003', 1, '0683928174', 'Ha Noi', 'img/khoand.png', 'FPT University', '8', 'Best mentor 2018','approve'),
           ( 3, 'Nguyen Minh Anh', 'anhnm08@gmail.com', '08-08-2003', 2, '0134398075', 'Thai Binh', 'img/anhhnm.png', 'FPT University', '12', 'Outstanding educator 2020','approve'),
           ( 4 , 'Nguyen Thanh Chi', 'chint01@gmail.com', '01-04-1991', 2, '0133472837', 'Hai Phong', 'img/chint.png', 'FPT University', '7', 'Top performer 2019','approve'),
           ( 5 , 'Nguyen Quynh Trang', 'trangnq@gmail.com', '01-02-2000', 0, '0139472892', 'Nghe An', 'img/trangnq.png', 'FPT University', '10', 'Excellence in leadership 2021','approve')

INSERT INTO skill_detail (skill_id, mentor_id)
VALUES
	(4,6),
	(4,5),
	(5,4),
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

	

		   
UPDATE [dbo].[User]
   SET 
      [img] = 'img/namnv.png'
      
 WHERE user_id = 2


UPDATE [dbo].[User]
   SET 
      [img] = 'img/khoand.png'
      
 WHERE user_id = 3


 UPDATE [dbo].[User]
   SET 
      [img] = 'img/anhhnm.png'
      
 WHERE user_id = 4

 UPDATE [dbo].[User]
   SET 
      [img] = 'img/chint.png'
      
 WHERE user_id =5 

 UPDATE [dbo].[User]
   SET 
      [img] = 'img/trangnq.png'
      
 WHERE user_id = 6
 UPDATE [dbo].[User]
   SET 
      [img] = 'img/quynhbd.png'
      
 WHERE user_id = 7 
 UPDATE [dbo].[User]
   SET 
      [img] = 'img/linhpt.png'
      
 WHERE user_id = 8
 UPDATE [dbo].[User]
   SET 
      [img] = 'img/quybv.png'
      
 WHERE user_id = 9
 UPDATE [dbo].[User]
   SET 
      [img] = 'img/ducnx.png'
      
 WHERE user_id = 10
 UPDATE [dbo].[User]
   SET 
      [img] = 'img/dungtt.png'
      
 WHERE user_id = 11

 UPDATE [dbo].[mentor]
   SET [price] = 400
 WHERE  mentor_id = 1

UPDATE [dbo].[mentor]
   SET [price] = 350
 WHERE mentor_id = 2

 UPDATE [dbo].[mentor]
   SET [price] = 450
 WHERE  mentor_id = 3

 UPDATE [dbo].[mentor]
   SET [price] = 500
 WHERE  mentor_id =4 

 UPDATE [dbo].[mentor]
   SET [price] = 400
 WHERE  mentor_id = 5

 UPDATE [dbo].[mentor]
   SET [price] = 350
 WHERE  mentor_id = 6

 UPDATE [dbo].[mentor]
   SET [price] = 450
 WHERE  mentor_id = 7

 UPDATE [dbo].[mentor]
   SET [price] = 400
 WHERE  mentor_id = 8

 UPDATE [dbo].[mentor]
   SET [price] = 450
 WHERE  mentor_id = 9

 UPDATE [dbo].[mentor]
   SET [price] = 400
 WHERE  mentor_id = 10

 INSERT INTO [dbo].[weeksday]
           ([startDay]
           ,[endDay])
     VALUES
           ('2024-06-17', '2024-06-23'),
           ('2024-06-24', '2024-06-30'),
           ('2024-07-01', '2024-07-07'),
           ('2024-07-08', '2024-07-14'),
           ('2024-07-15', '2024-07-21'),
           ('2024-07-22', '2024-07-28'),
           ('2024-07-29', '2024-08-04'),
           ('2024-08-05', '2024-08-11'),
           ('2024-08-12', '2024-08-18'),
           ('2024-08-19', '2024-08-25'),
           ('2024-08-26', '2024-09-01'),
           ('2024-09-02', '2024-09-08'),
           ('2024-09-09', '2024-09-15'),
           ('2024-09-16', '2024-09-22'),
           ('2024-09-23', '2024-09-29'),
           ('2024-09-30', '2024-10-06'),
           ('2024-10-07', '2024-10-13'),
           ('2024-10-14', '2024-10-20'),
           ('2024-10-21', '2024-10-27'),
           ('2024-10-28', '2024-11-03'),
           ('2024-11-04', '2024-11-10'),
           ('2024-11-11', '2024-11-17'),
           ('2024-11-18', '2024-11-24'),
           ('2024-11-25', '2024-12-01'),
           ('2024-12-02', '2024-12-08'),
           ('2024-12-09', '2024-12-15'),
           ('2024-12-16', '2024-12-22'),
           ('2024-12-23', '2024-12-29'),
           ('2024-12-30', '2025-01-05')



