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