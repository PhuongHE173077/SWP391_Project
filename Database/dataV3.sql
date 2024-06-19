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
		id int primary key,
		name nvarchar(max),
		
	)
create table schedul_mentor(
	id int IDENTITY (1,1) primary key,
	WeeksDayId int references weeksday(id),
	timeId int references timeSlot(id),
	mid int references mentor(mentor_id),
	status nvarchar(max), 
)



create table request(
	id int IDENTITY (1,1) PRIMARY KEY,
	[subject] nvarchar(max),
	mentee_id int references [User](user_id),
	mentor_id int references mentor(mentor_id),
	DeadlineDay nvarchar(max),
	content nvarchar(max),
	skill_id int references skill(id),
	[status] nvarchar(max)
	
)
alter table request
add number_stady int 
create table schedul_request(
	id int IDENTITY (1,1) primary key,
	WeeksDayId int references weeksday(id),
	timeId int references timeSlot(id),
	rid int references request(id),	
)
create table feedback(
	id int IDENTITY (1,1) PRIMARY KEY,
	mentee_id int references [User](user_id),
	mentor_id int references mentor(mentor_id),
	comment nvarchar(max),
	rate int,

)
create table payment(
	id int IDENTITY (1,1) primary key,
	request_id int null references request(id),
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
	
	create table fromDayToDay(
		id int IDENTITY (1,1) primary key,
		startday nvarchar(max),
		endday nvarchar(max)

	)
	 alter table schedul_request
	 add fid int references fromDayToDay(id)

	 alter table schedul_mentor
	 add fid int references fromDayToDay(id)

	alter table request
	add dateSent nvarchar(max)

