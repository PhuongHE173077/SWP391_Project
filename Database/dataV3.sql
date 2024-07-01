--drop database SWP391_project
--create database SWP391_project

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
	id int IDENTITY (1,1) primary key,
	skill nvarchar(50),
	descpition nvarchar(max),
	images nvarchar(max)
	
)

create table mentor(
	mentor_id int IDENTITY (1,1) PRIMARY KEY,
	userId int references [User](user_id),
	price money
)
create table Cv_Mentor(
	cv_id int IDENTITY (1,1) primary key,
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
	status nvarchar(max)	
)
 
create table skill_detail(
	skill_id int references skill(id),
	mentor_id int references mentor(mentor_id),
	primary key (skill_id,mentor_id)
)

create table timeSlot(
		id int IDENTITY (1,1) primary key,
		timeSlot nvarchar(max)
)
create table weeksday(
		id int IDENTITY (1,1) primary key,
		startDay nvarchar(max),
		endDay nvarchar(max)		
	)
create table schedule(
	id int IDENTITY (1,1) primary key,
	mentor_id int references mentor(mentor_id),
	startDay nvarchar(max),
	endDay nvarchar(max),
	status nvarchar(max)
)
create table schedule_datail(
	id int IDENTITY (1,1) primary key,
	date nvarchar(max),
	sid int references schedule(id),
	wid int references weeksday(id),
	status nvarchar(max), 
)

create table request(
	id int IDENTITY (1,1) PRIMARY KEY,
	[subject] nvarchar(max),
	mentee_id int references [User](user_id),
	mentor_id int references mentor(mentor_id),
	content nvarchar(max),
	startDay nvarchar(max),
	endDay nvarchar(max),
	slot_number int,
	skill_id int references skill(id),
	dateSent nvarchar(max),
	[status] nvarchar(max)
)

create table schedule_request(
	id int IDENTITY (1,1) primary key,
	scheduledd_id int references schedule_datail(id),
	rid int references request(id),	
)

create table payment(
	id int IDENTITY (1,1) primary key,
	request_id int null ,
	user_id int null references [User](user_id),
	amount money null,
	datail nvarchar(max) null,
	paymentDate nvarchar(max) null,
	note nvarchar(max) null,
	transactionType nvarchar(max) null,
	bankCode nvarchar(max) null,
	bankTranNo nvarchar(max) null,
	cardType nvarchar(max) null,
	transactionNo nvarchar(max) null,
	transactionStatus nvarchar(max) null,
	txnRef nvarchar(max) null,
	secureHash nvarchar(max) null,
	status int,
	)
	
	
	create table categorySkill(
		id int primary key,
		categoryName nvarchar(max)
	)
	alter table skill
	add cid int references categorySkill(id)


	/*Status of user : Active, Block, Processing*/
	alter table [User]
	add status nvarchar(max)
	alter table schedule_datail
	add tid int references  timeSlot(id)

	
	
	create table note_Schedule(
		id int IDENTITY (1,1)	primary key,
		description nvarchar(max),
		sid int references schedule(id)
	)
	create table feedBack(
		id int IDENTITY (1,1)	primary key,
		rate int,
		comment nvarchar(max),
		mentee_id int references [User](user_id),
		mentor_id int references mentor(mentor_id),
		request_id int references request(id)


	)