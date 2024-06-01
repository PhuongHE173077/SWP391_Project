drop database SWP391_project
create database SWP391_project

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
	images nvarchar(max)
	
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
	achievements nvarchar(max),
	[status] nvarchar(max)
)
create table skill_detail(
	skill_id int references skill(id),
	mentor_id int references mentor(mentor_id),
	primary key (skill_id,mentor_id)
)
create table course(
	id int primary key,
	courseName nvarchar(max),
	description nvarchar(max),
	price money,
	status nvarchar(max)
)
alter table course 
add mentor_id int references mentor(mentor_id)
create table schedul(
	id int primary key,
	startDate nvarchar(max),
	endDate nvarchar(max),
	course_id int references course(id)
)


alter table course
add timeSlot nvarchar(max)
create table request(
	id int IDENTITY (1,1) PRIMARY KEY,
	[subject] nvarchar(max),
	mentee_id int references [User](user_id),
	mentor_id int references mentor(mentor_id),
	DeadlineDay int,
	content nvarchar(max),
	course_id int references course(id),
	[status] nvarchar(max)
	
)
create table feedback(
	id int IDENTITY (1,1) PRIMARY KEY,
	mentee_id int references [User](user_id),
	mentor_id int references mentor(mentor_id),
	comment nvarchar(max),
	rate int,

)
create table payment(
	id int primary key,
	request_id int references request(id),
	amount money,
	date_payment nvarchar (max),
	status nvarchar(max)
	)
	create table class(
		id int primary key,
		request_id int references request(id),
		schedul_id int references schedul(id),
		status nvarchar(max)

	)
	alter table schedul 
	add created int references mentor(mentor_id)
	alter table course
	add skill_id int references skill(id)