create table person(
name varchar2(20),
gender varchar2(6),
mobile varchar2(8) primary key,
address varchar2(30),
city varchar2(20)
);
desc person;

--�⺻Ű(Primaey key)
--1. ���̺� �ϳ��� ���� �ϳ��� �����Ѵ�. �ΰ��̻� �Ұ�. �⺻Ű ���� ���̺��� ����
--2. Ű���� ��ü �÷��� ��Ʋ� �����ؾ�(Uniqueness)
--3. Ű���� null�� ���� �� ����.(Not Null)

create table roomtype(
typenum number(3) primary key,
typename varchar(20) not null,
comments varchar2(32)
);
desc roomtype;
create table roominfo(
num varchar2(10) primary key,
name varchar2(20) not null,
type number(3), constraint fk_typenum foreign key(type) references roomtype(typenum),
howmany number(3) default 1,
howmuch number(4) default 0
);
desc roominfo;
insert into roomtype values(1,'Suite Room', null);
insert into roomtype values(2,'Deluxe Room', null);
insert into roomtype values(3,'Family Room', null);
select * from roomtype;
insert into roominfo values(100,'��λ�',1,6,1200);
select * from roominfo;
insert into roominfo values(100,'�Ѷ��',4,6,1200);

-- ��������
-- delete from - data only �ϱ�����(rollback)
-- truncate table - data only �����Ұ���
-- drop table - data+schema �����Ұ���

create view under_five as select * from worker where salary < 5000;
select * from under_five;
create index ndx_emp_name on worker(emp_name);
create synonym human_resource for employees;
select * from human_resource;

create sequence seq_id;
select seq_id.currval from dual;

desc roomtype;
select * from roomtype;
insert into roomtype values(seq_id.nextval,'Standard Room',null);
select emp_name||','||salary from worker;
-- �̸� : �Ŵ������, ����
select emp_name||':'||manager_id||','||salary from worker;

--��������� : +,-,*,/,||
--�񱳿����� : =,!=,<>,>,<,>=,<=, is null, us not null
--�������� : and, or, not
--���տ����� : ������(intersect), ������(union, union all) ������(minus)

select 1+5 from dual;

select emp_name,employee_id, salary,
    case when salary<=5000 then 'C'
        when salary>5000 and salary <= 15000 then 'B'
        else 'A'
    end as salary_level
from worker;
--salary>=10000: �������, 6000<=salary<10000: �����, 6000<salary: ������
select emp_name,employee_id, salary,
    case when salary<6000 then '������'
        when salary>=6000 and salary < 10000 then '�����'
        else '�������'
    end as salary_level
from worker;
select emp_name, salary from worker where salary between 4000 and 6000;
select emp_name, salary from worker where salary in (3000,4000,5000,6000,7000);
select emp_name from worker where emp_name like 'E%';

select ceil(3.14) from dual;
select floor(3.14) from dual;
select power(4,4) from dual;
select sqrt(16) from dual;
select initcap('good mornig vietnam') from dual;
select lower(emp_name) from worker;
select upper(emp_name) from worker;
select concat(emp_name,',') from worker;

--substr(���ڿ�,�����ε���[,����])
--�����ε����� 1���� ����
select substr('good morning',6,4) from dual;
select substr('good morning',-3) from dual;
select emp_name from worker where substr(emp_name,-3)='son';
select emp_name from worker where emp_name like '%son';
select substrb('ABCDEFG',1,4), substrb('�����ٶ󸶹ٻ�',1,4) from dual;
select emp_name from worker where emp_name like 'John%';
select replace (emp_name,' ','') from worker where emp_name like '%%';

-- instr(���ڿ�,ã�����ڿ�,�����ε���,����Ƚ��)
-- ���ڿ����� 'ã�����ڿ�'�� ��Ÿ���� ��ġ�� �ε��� ��ȣ(��ã���� 0)
select instr('���� ���� �ܷο� ����, ���� ���� ���ο� ����, ���� ���� ��ſ� ����','����',5,2)from dual;
select instr('John Wick','Joe') from dual;
select length('good morning vietnam') from dual;
select emp_name,length(emp_name) from worker;

select instr(emp_name,' ') from worker;
select substr(emp_name,1,instr(emp_name,' ')-1) from worker;
select replace(emp_name,' ','-') from worker where emp_name like '%%';

select to_char(salary,'99,999') from worker;
select sysdate,systimestamp from dual;
select to_char(sysdate,'yyyy-mm-dd HH24:MI:SS') from dual;

select to_char(sysdate,'PM HH')||'�� '||to_char(sysdate,'MI')||'�� '||to_char(sysdate,'SS')||'��' �ð� from dual;

--nvl(�÷�/������, ����): �÷�/�����Ͱ� null�̸� ���ڷ� ǥ��, �ƴϸ� �״�� ��ü ǥ��
select * from student;
select name,gender,school_name,grade_num,mobile,nvl(math_score,0),nvl(english_score,0),nvl(korean_score,0) from student;

--nullif(ǥ����1, ǥ����2):ǥ����1==ǥ����2�̸�, null���, �ٸ��� ǥ����1�� ���
select employee_id,
        to_char(start_date,'yyyy'),
        to_char(end_date,'yyyy'),
        nullif( to_char(start_date,'yyyy'), to_char(end_date,'yyyy')) nullif_year
    from job_history;
    
select emp_name, salary, decode(salary,3000,'3k',4000,'4k',5000,'5k',6000,'6k',7000,'7k',8000,'8k','etc') decode from worker;
select emp_name, salary, case   when salary between 3000 and 3999 then '3k'
                                else 'etc' end salary from worker;
