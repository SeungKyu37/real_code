create table student(
name varchar2(20) not null,
gender varchar2(1) not null,
school_name varchar2(20) not null,
grade_num varchar2(1) not null,
mobile varchar2(8),
math_score number(3),
english_score number(3),
korean_score number(3)
);
desc student;

--C(�����ͻ���/�߰�)insert
--insert into ���̺�� values (��1, ��2, ... ,��n);
--insert into ���̺��(Į����1, Į����2, ... ,Į����n); values (��1, ��2, ... ,��n);
insert into student values ('John','M','WestLake',6,null,null,null,null);
insert into student values ('Jane','F','RiverWest',5,null,null,null,null);
insert into student(name,gender,school_name,grade_num) values ('Jacob','M','RiverEast',6);
insert into student values ('��±�','M','������',3,null,null,null,null);
insert into student values ('Greg','M','RiverNorth',2,null,null,null,null);
insert into student values ('James','M','SouthLake',3,null,null,null,null);
insert into student values ('Suzi','F','RiverWest',1,null,null,null,null);
insert into student values ('Kane','M','RiverNorth',6,null,null,null,null);
insert into student values ('Harry','M','WestLake',2,null,null,null,null);
insert into student values ('Emma','F','RiverEast',4,null,null,null,null);
-- ''==null
--insert into ���̺�� set �÷���1=��1, �÷���2=��2, ... , �÷���n=��n(mySQL, mariaDB���� ����)
--R(��������ȸ) select
select * from student;
--U(�����ͼ���) update
update student set gender='M' where name = 'Harry';
update student set mobile='-' where mobile is null;
update student set math_score=-1,english_score=-1,korean_score=-1 where grade_num=6;
--update ���̺�� set �÷���1=��1, �÷���2=��2, ... , �÷���n=��n where �÷���=��
--D(�����ͻ���) delete
commit;
rollback;
delete from student where grade_num < 4;
--delete from ���̺�� where �÷��� = ��;
--Ư�� �÷��� ���� Ư������ ���ڵ�(row,line)�� �����.
--delete from student where mobile is null;



create table worker as select * from employees;
select * from worker;
commit;
--worker ���̺��� manager_id�� null�� ����� ����(salary)�� 30000���� ����(update)
update worker set salary='30000' where manager_id is null;
--manager_id�� 124�� ����� Ŀ�̼��ۼ�Ƽ���� 0.25�� ����
update worker set commission_pct=0.25 where manager_id =124;