create database sec;
use sec;
create table STUDENT(USN varchar(10) primary key,
                     name varchar(15)not null,
                     date_of_birth date not null,
                     branch varchar(10)not null,
                     mark1 float(5,2)not null,
                     mark2 float(5,2)not null,
                     mark3 float(5,2)not null,
                     total float(5,2),
                     GPA float(5,2)
                     );

insert into STUDENT (USN,name,date_of_birth,branch,mark1,mark2,mark3)values('MC01','Mayya','2001-09-08','MCA',60,70,80);
insert into STUDENT (USN,name,date_of_birth,branch,mark1,mark2,mark3)values('MC02','Mayura','2001-07-07','MCA',50,60,40);
insert into STUDENT (USN,name,date_of_birth,branch,mark1,mark2,mark3)values('EC01','Prajwal','2000-06-02','EC',80,90,100);
insert into STUDENT (USN,name,date_of_birth,branch,mark1,mark2,mark3)values('EC02','Manish','1999-09-02','EC',62,74,89);
insert into STUDENT (USN,name,date_of_birth,branch,mark1,mark2,mark3)values('MH01','Ajay','1998-07-08','MECH',40,90,82);
insert into STUDENT (USN,name,date_of_birth,branch,mark1,mark2,mark3)values('CV01','Radha','2002-09-08','Civil',70,10,30);

select *from STUDENT;
+------+---------+---------------+--------+-------+-------+--------+-------+------+
| USN  | name    | date_of_birth | branch | mark1 | mark2 | mark3  | total | GPA  |
+------+---------+---------------+--------+-------+-------+--------+-------+------+
| CV01 | Radha   | 2002-09-08    | Civil  | 70.00 | 10.00 |  30.00 |  NULL | NULL |
| EC01 | Prajwal | 2000-06-02    | EC     | 80.00 | 90.00 | 100.00 |  NULL | NULL |
| EC02 | Manish  | 1999-09-02    | EC     | 62.00 | 74.00 |  89.00 |  NULL | NULL |
| MC01 | Mayya   | 2001-09-08    | MCA    | 60.00 | 70.00 |  80.00 |  NULL | NULL |
| MC02 | Mayura  | 2001-07-07    | MCA    | 50.00 | 60.00 |  40.00 |  NULL | NULL |
| MH01 | Ajay    | 1998-07-08    | MECH   | 40.00 | 90.00 |  82.00 |  NULL | NULL |
+------+---------+---------------+--------+-------+-------+--------+-------+------+


--------------------------------QUERIES----------------------------------------------------------------------


i. Update the column total by adding the columns mark1, mark2, mark3.


update STUDENT set total=mark1+mark2+mark3;

mysql> select *from STUDENT;
+------+---------+---------------+--------+-------+-------+--------+--------+------+
| USN  | name    | date_of_birth | branch | mark1 | mark2 | mark3  | total  | GPA  |
+------+---------+---------------+--------+-------+-------+--------+--------+------+
| CV01 | Radha   | 2002-09-08    | Civil  | 70.00 | 10.00 |  30.00 | 110.00 | NULL |
| EC01 | Prajwal | 2000-06-02    | EC     | 80.00 | 90.00 | 100.00 | 270.00 | NULL |
| EC02 | Manish  | 1999-09-02    | EC     | 62.00 | 74.00 |  89.00 | 225.00 | NULL |
| MC01 | Mayya   | 2001-09-08    | MCA    | 60.00 | 70.00 |  80.00 | 210.00 | NULL |
| MC02 | Mayura  | 2001-07-07    | MCA    | 50.00 | 60.00 |  40.00 | 150.00 | NULL |
| MH01 | Ajay    | 1998-07-08    | MECH   | 40.00 | 90.00 |  82.00 | 212.00 | NULL |
+------+---------+---------------+--------+-------+-------+--------+--------+------+


ii. Find the GPA score of all the students.


update STUDENT set GPA=(total)/3;

mysql> select *from STUDENT;
+------+---------+---------------+--------+-------+-------+--------+--------+-------+
| USN  | name    | date_of_birth | branch | mark1 | mark2 | mark3  | total  | GPA   |
+------+---------+---------------+--------+-------+-------+--------+--------+-------+
| CV01 | Radha   | 2002-09-08    | Civil  | 70.00 | 10.00 |  30.00 | 110.00 | 36.67 |
| EC01 | Prajwal | 2000-06-02    | EC     | 80.00 | 90.00 | 100.00 | 270.00 | 90.00 |
| EC02 | Manish  | 1999-09-02    | EC     | 62.00 | 74.00 |  89.00 | 225.00 | 75.00 |
| MC01 | Mayya   | 2001-09-08    | MCA    | 60.00 | 70.00 |  80.00 | 210.00 | 70.00 |
| MC02 | Mayura  | 2001-07-07    | MCA    | 50.00 | 60.00 |  40.00 | 150.00 | 50.00 |
| MH01 | Ajay    | 1998-07-08    | MECH   | 40.00 | 90.00 |  82.00 | 212.00 | 70.67 |
+------+---------+---------------+--------+-------+-------+--------+--------+-------+



iii. Find the students who born on a particular year of birth from the date_of_birth column.


select *from STUDENT where date_of_birth between '2001-01-01' and '2001-12-31';

+------+--------+---------------+--------+-------+-------+-------+--------+-------+
| USN  | name   | date_of_birth | branch | mark1 | mark2 | mark3 | total  | GPA   |
+------+--------+---------------+--------+-------+-------+-------+--------+-------+
| MC01 | Mayya  | 2001-09-08    | MCA    | 60.00 | 70.00 | 80.00 | 210.00 | 70.00 |
| MC02 | Mayura | 2001-07-07    | MCA    | 50.00 | 60.00 | 40.00 | 150.00 | 50.00 |
+------+--------+---------------+--------+-------+-------+-------+--------+-------+



iv. List the students who are studying in a particular branch of study.


select *from STUDENT where branch='EC';

+------+---------+---------------+--------+-------+-------+--------+--------+-------+
| USN  | name    | date_of_birth | branch | mark1 | mark2 | mark3  | total  | GPA   |
+------+---------+---------------+--------+-------+-------+--------+--------+-------+
| EC01 | Prajwal | 2000-06-02    | EC     | 80.00 | 90.00 | 100.00 | 270.00 | 90.00 |
| EC02 | Manish  | 1999-09-02    | EC     | 62.00 | 74.00 |  89.00 | 225.00 | 75.00 |
+------+---------+---------------+--------+-------+-------+--------+--------+-------+


v. Find the maximum GPA score of the student branch-wise.


select branch,max(GPA) from STUDENT group by branch;

+--------+----------+
| branch | max(GPA) |
+--------+----------+
| Civil  |    36.67 |
| EC     |    90.00 |
| MCA    |    70.00 |
| MECH   |    70.67 |
+--------+----------+


vi. Find the students whose name starts with the alphabet “S”.



insert into STUDENT values('MB01','Sadhvi','2001-08-07','MBA',80,90,100,270,90);

select *from STUDENT where name like 'S%';

+------+--------+---------------+--------+-------+-------+--------+--------+-------+
| USN  | name   | date_of_birth | branch | mark1 | mark2 | mark3  | total  | GPA   |
+------+--------+---------------+--------+-------+-------+--------+--------+-------+
| MB01 | Sadhvi | 2001-08-07    | MBA    | 80.00 | 90.00 | 100.00 | 270.00 | 90.00 |
+------+--------+---------------+--------+-------+-------+--------+--------+-------+




vii. Find the students whose name ends with the alphabets “AR”.


insert into STUDENT values('MC03','Kumar','2001-08-07','MCA',80,90,100,270,90);

mysql> select *from STUDENT where name like '%ar';
+------+-------+---------------+--------+-------+-------+--------+--------+-------+
| USN  | name  | date_of_birth | branch | mark1 | mark2 | mark3  | total  | GPA   |
+------+-------+---------------+--------+-------+-------+--------+--------+-------+
| MC03 | Kumar | 2001-08-07    | MCA    | 80.00 | 90.00 | 100.00 | 270.00 | 90.00 |
+------+-------+---------------+--------+-------+-------+--------+--------+-------+


viii. Delete the student details whose USN is given as 1001.



delete from STUDENT where USN='MC01';

select *from STUDENT;
+------+---------+---------------+--------+-------+-------+--------+--------+-------+
| USN  | name    | date_of_birth | branch | mark1 | mark2 | mark3  | total  | GPA   |
+------+---------+---------------+--------+-------+-------+--------+--------+-------+
| CV01 | Radha   | 2002-09-08    | Civil  | 70.00 | 10.00 |  30.00 | 110.00 | 36.67 |
| EC01 | Prajwal | 2000-06-02    | EC     | 80.00 | 90.00 | 100.00 | 270.00 | 90.00 |
| EC02 | Manish  | 1999-09-02    | EC     | 62.00 | 74.00 |  89.00 | 225.00 | 75.00 |
| MB01 | Sadhvi  | 2001-08-07    | MBA    | 80.00 | 90.00 | 100.00 | 270.00 | 90.00 |
| MC02 | Mayura  | 2001-07-07    | MCA    | 50.00 | 60.00 |  40.00 | 150.00 | 50.00 |
| MC03 | Kumar   | 2001-08-07    | MCA    | 80.00 | 90.00 | 100.00 | 270.00 | 90.00 |
| MH01 | Ajay    | 1998-07-08    | MECH   | 40.00 | 90.00 |  82.00 | 212.00 | 70.67 |
+------+---------+---------------+--------+-------+-------+--------+--------+-------+
