create table BRANCH(Branch_id varchar(10)primary key,
                    Branchname varchar(10)not null,
                    HOD varchar(15)not null);

create table STUDENT(USN varchar(10)primary key,
                    Name varchar(15)not null,
                    Address varchar(15)not null,
                    Branch_id varchar(10),
                    Sem int(2));
                    
alter table STUDENT add foreign key(Branch_id) references BRANCH(Branch_id);

create table AUTHOR(Author_id varchar(10)primary key,
                    AName varchar(10)not null,
                    Country varchar(15)not null,
                    Age int(2));

create table BOOK(Book_id varchar(10)primary key,
                    BName varchar(15)not null,
                    Author_id varchar(10),
                    publisher varchar(15),
                    Branch_id varchar(10),
                    foreign key(Author_id) references AUTHOR(Author_id),
                    foreign key(Branch_id) references BRANCH(Branch_id));

create table BORROW(USN varchar(10),
                    Book_id varchar(10),
                    Bdate date,
                    primary key(USN,Book_id),
                    foreign key(USN) references STUDENT(USN),
                    foreign key(Book_id)references BOOK(Book_id));



insert into BRANCH values('B01','MCA','Dr.Vandana');
insert into BRANCH values('B02','MBA','Dr.Shekhar');
insert into BRANCH values('B03','Mech','Dr.Kumar');
insert into BRANCH values('B04','Civil','Rajan');
insert into BRANCH values('B05','CS','Krishna');

 select *from BRANCH;
+-----------+------------+------------+
| Branch_id | Branchname | HOD        |
+-----------+------------+------------+
| B01       | MCA        | Dr.Vandana |
| B02       | MBA        | Dr.Shekhar |
| B03       | Mech       | Dr.Kumar   |
| B04       | Civil      | Rajan      |
| B05       | CS         | Krishna    |
+-----------+------------+------------+

insert into STUDENT values('MC01','Kumar','Perla','B01',2);
insert into STUDENT values('ME01','Kedar','Kokkada','B03',4);
insert into STUDENT values('MC02','Rithesh','Darbe','B01',2);
insert into STUDENT values('CS01','Rathan','Dandeli','B05',4);
insert into STUDENT values('MB01','Mayya','Uppi','B02',2);

select *from STUDENT;
+------+---------+---------+-----------+------+
| USN  | Name    | Address | Branch_id | Sem  |
+------+---------+---------+-----------+------+
| CS01 | Rathan  | Dandeli | B05       |    4 |
| MB01 | Mayya   | Uppi    | B02       |    2 |
| MC01 | Kumar   | Perla   | B01       |    2 |
| MC02 | Rithesh | Darbe   | B01       |    2 |
| ME01 | Kedar   | Kokkada | B03       |    4 |
+------+---------+---------+-----------+------+

insert into AUTHOR values('A01','James','US',45);
insert into AUTHOR values('A02','Adam','UK',24);
insert into AUTHOR values('A03','Gilli','Germany',33);
insert into AUTHOR values('A04','David','India',35);
insert into AUTHOR values('A05','Murthy','India',23);

select *from AUTHOR;
+-----------+--------+---------+------+
| Author_id | AName  | Country | Age  |
+-----------+--------+---------+------+
| A01       | James  | US      |   45 |
| A02       | Adam   | UK      |   24 |
| A03       | Gilli  | Germany |   33 |
| A04       | David  | India   |   35 |
| A05       | Murthy | India   |   23 |
+-----------+--------+---------+------+

insert into BOOK values('BK01','DS','A01','Dreams','B01');
insert into BOOK values('BK02','DSA','A02','DreamIn','B05');
insert into BOOK values('BK03','SE','A05','Leaf','B03');
insert into BOOK values('BK04','HM','A04','DreamsIn','B04');
insert into BOOK values('BK05','FM','A02','Hydros','B03');

select *from BOOK;
+---------+-------+-----------+-----------+-----------+
| Book_id | BName | Author_id | publisher | Branch_id |
+---------+-------+-----------+-----------+-----------+
| BK01    | DS    | A01       | Dreams    | B01       |
| BK02    | DSA   | A02       | DreamIn   | B05       |
| BK03    | SE    | A05       | Leaf      | B03       |
| BK04    | HM    | A04       | DreamsIn  | B04       |
| BK05    | FM    | A02       | Hydros    | B03       |
+---------+-------+-----------+-----------+-----------+


insert into BORROW values('CS01','BKO1','2021-01-02');