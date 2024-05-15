
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
	descpition nvarchar(max)
)
create table course(
	id_course int primary key,
	Date_number int,
	price money,
	skill_id int references skill(id)
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
           (0,'mentee')

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


select * from [User]
where email = 'phuongbg0910@gmail.com' and password ='123456p'
