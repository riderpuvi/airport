create table customer(
C_id int auto_increment primary key,
c_name varchar(255) not null,
phone int not null,
email varchar(255) not null,
city varchar(255) not null);

create table flight(
F_id int primary key,
SP varchar(255),
EP varchar(255),
depart date not null,
charges int not  null,
no_of_seats int not null);

create table booking(
T_id int auto_increment primary key,
cid int not null,
fid int not null,
foreign key (cid) references customer(C_id),
foreign key (fid) references flight(F_id)
);


insert into customer values( NULL, 'Abhay' , 100, 'abhay@','Bangalore');
insert into customer values( NULL, 'sachin' , 101, 'sachin@','Mangalore');
insert into customer values( NULL, 'Puneeth' , 102, 'puni@','Bangalore');
insert into customer values( NULL, 'Rajat' , 103, 'rajat@','Delhi');
insert into customer values( NULL, 'Arjun' , 104, 'arjun@','Mumbai');
insert into customer values( NULL, 'Puni' , 120, 'puni@','Bangalore');

insert into flight values( 10, 'Bangalore' ,'Pune', '2022-09-10',10000, 200);
insert into flight values( 11, 'Bangalore' ,'Delhi', '2022-09-11',20000, 150);
insert into flight values( 12, 'Mangalore' ,'Pune', '2022-09-12',15000, 200);
insert into flight values( 13, 'Mumbai' ,'Pune', '2022-09-10',10000, 100);
insert into flight values( 14, 'Delhi' ,'Pune', '2022-09-10',25000, 200);

insert into booking values(NULL,1,10);
insert into booking values(NULL,2,11);
insert into booking values(NULL,3,12);
insert into booking values(NULL,4,13);
insert into booking values(NULL,5,14);
insert into booking values(NULL,6,10);

create view customerdetails as
select c.C_id, c.c_name, f.F_id, f.SP, f.EP, f.charges
from customer as c, flight as f, booking as b
where c.C_id = b.cid AND f.F_id=b.fid;

create view flightcount as 
select F_id,count(fid) from flight, booking where flight.F_id=booking.fid group by booking.fid;

create view flightrevenue as
select f.F_id, f.charges * count(b.fid) as revenue
from flight as f, booking as b
where f.F_id = b.fid
GROUP BY b.fid;



select * from flightrevenue;


