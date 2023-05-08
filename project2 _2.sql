create table permission(
permission_id int not null,
is_operator int not null,
is_admin int not null,
primary key (permission_id, is_operator, is_admin)
);

create table airline(
name varchar(30) not null,
primary key (name)
);

create table airline_staff(
username varchar(30) not null,
password varchar(30),
first_name varchar(30),
last_name varchar(30),
date_of_birth varchar(30),
permission_id int not null,
name_airline varchar(30) not null,
primary key (username),
foreign key (permission_id) references permission(permission_id),
foreign key (name_airline) references airline(name)
);

create table airplane(
id varchar(30) not null,
name_airline varchar(30) not null,
primary key (id, name_airline),
foreign key (name_airline) references airline(name)
);

create table airport(
name varchar(50) not null,
city varchar(30),
primary key (name)
);

create table agent(
email varchar(30) not null,
password varchar(30),
booking_agent_id varchar(30) NULL,
primary key (email)
);

create table customer(
email varchar(30) not null,
name varchar(30),
password varchar(30),
building_number varchar(30),
street varchar(50),
city varchar(30),
state varchar(30),
phone_number varchar(30),
passport_number varchar(30),
passport_expiration varchar(30),
passport_country varchar(30),
date_of_birth varchar(30),
primary key (email)
);
create table flight(
flight_num varchar(30) not null,
depart_time datetime(6),
arrive_time datetime(6),
price float,
status varchar(30),
name_airline varchar(30) not null,
plane_id varchar(30) not null,
depart_airport varchar(30) not null,
arrive_airport varchar(30) not null,
primary key (flight_num, name_airline),
foreign key (name_airline) references airline(name),
foreign key (plane_id) references airplane(id),
foreign key (depart_airport) references airport(name),
foreign key (arrive_airport) references airport(name)
);

create table works_for(
name varchar(30) not null,
email varchar(30) not null,
primary key (name, email),
foreign key (name) references airline(name),
foreign key (email) references agent(email)
);

create table ticket(
ticket_id int(30) not null AUTO_INCREMENT,
flight_num varchar(30) not null,
customer_email varchar(30) not null,
agent_email varchar(30) default null,
primary key (ticket_id),
foreign key (flight_num) references flight(flight_num),
foreign key (customer_email) references customer(email),
foreign key (agent_email) references agent(email)
);