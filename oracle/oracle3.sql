select employee_id eid,emp_name,salary,commission_pct pct,
        to_char(salary*(1+commission_pct/100),'99999.99') final_salary
        from worker
        where commission_pct is not null;
        
        
--count() ����
--sum() �հ�
--avg() ���
--min()/max()   �ּҰ�/�ִ밪
--variance()/stddev()   �л굵/ǥ������
select count(*), count(manager_id) from worker;
-- null���� ī��Ʈ ���Ѵ�.
select sum(salary) from worker;
select to_char(avg(salary),'99,999.99') avg from worker;
select max(salary) from worker;

-- select �÷���1, ... , �÷���n, �����Լ�1, ... , �����Լ�n
-- from ���̺��
-- group by �÷���1, ... , �÷���n
select manager_id,count(*) cnt,sum(salary) total,to_char(avg(salary),'99,999.99') avg_sal
from worker
group by manager_id;
select department_id �μ�ID,count(*) cnt
    from worker
    group by department_id
    having count(*)>1
    order by cnt desc;
    
select commission_pct pct, count(*) cnt, to_char(avg(salary),'99,999.99') avg_salary
from worker
where commission_pct is not null
group by commission_pct
order by avg(salary);

select * from worker order by salary desc;

select cust_gender gender, count(*) cnt
from customers
group by cust_gender;

select cust_marital_status, count(*) from customers
group by cust_marital_status
order by upper(cust_marital_status);
update customers set cust_marital_status='divorced' where cust_marital_status='Divorc.';

select cust_year_of_birth birth, cust_gender gender, count(*) cnt
from customers
group by cust_year_of_birth, cust_gender
order by cust_year_of_birth, cust_gender;

select substr(emp_name,1,1) one, count(*)
from worker
group by substr(emp_name,1,1)
order by one;

select floor(salary/1000)*1000 salary_level, count(*) cnt
from worker
group by floor(salary/1000)*1000
order by salary_level;

create table exp_goods_asia (
country varchar2(10),seq number,goods varchar2(80));
desc exp_goods_asia;
insert into exp_goods_asia values('�ѱ�',1,'�������� ������');
insert into exp_goods_asia values('�ѱ�',2,'�ڵ���');
insert into exp_goods_asia values('�ѱ�',3,'��������ȸ��');
insert into exp_goods_asia values('�ѱ�',4,'����');
insert into exp_goods_asia values('�ѱ�',5,'LCD');
insert into exp_goods_asia values('�ѱ�',6,'�ڵ�����ǰ');
insert into exp_goods_asia values('�ѱ�',7,'�޴���ȭ');
insert into exp_goods_asia values('�ѱ�',8,'ȯ��źȭ����');
insert into exp_goods_asia values('�ѱ�',9,'�����۽ű� ���÷��� �μ�ǰ');
insert into exp_goods_asia values('�ѱ�',10,'ö �Ǵ� ���ձݰ�');
insert into exp_goods_asia values('�Ϻ�',1,'�ڵ���');
insert into exp_goods_asia values('�Ϻ�',2,'�ڵ�����ǰ');
insert into exp_goods_asia values('�Ϻ�',3,'��������ȸ��');
insert into exp_goods_asia values('�Ϻ�',4,'����');
insert into exp_goods_asia values('�Ϻ�',5,'�ݵ�ü������');
insert into exp_goods_asia values('�Ϻ�',6,'ȭ����');
insert into exp_goods_asia values('�Ϻ�',7,'�������� ������');
insert into exp_goods_asia values('�Ϻ�',8,'�Ǽ����');
insert into exp_goods_asia values('�Ϻ�',9,'���̿���,Ʈ��������');
insert into exp_goods_asia values('�Ϻ�',10,'����');
select * from exp_goods_asia order by goods;
select goods from exp_goods_asia where country='�ѱ�'
intersect
select goods from exp_goods_asia where country='�Ϻ�';
select goods from exp_goods_asia where country='�ѱ�'
union
select goods from exp_goods_asia where country='�Ϻ�';
select goods from exp_goods_asia where country='�ѱ�'
union all
select goods from exp_goods_asia where country='�Ϻ�' order by goods;
select goods from exp_goods_asia where country='�ѱ�'
minus
select goods from exp_goods_asia where country='�Ϻ�';
select goods from exp_goods_asia where country='�Ϻ�'
minus
select goods from exp_goods_asia where country='�ѱ�';
(select goods from exp_goods_asia where country='�ѱ�'
union
select goods from exp_goods_asia where country='�Ϻ�')
minus
(select goods from exp_goods_asia where country='�ѱ�'
intersect
select goods from exp_goods_asia where country='�Ϻ�');


-- select A.���� ���� Į����,A.���� ���� Į����,B.���� ���� Į����
-- from A,B 
-- where A.���� Į���� = B.���� Į����
select worker.emp_name, departments.department_name
from worker, departments
where worker.department_id=departments.department_id;

select a.emp_name, b.job_title
from worker a, jobs b   -- alias name
where a.job_id=b.job_id
order by b.job_title;

select distinct prod_id from sales order by prod_id;

select * from roomtype;
select * from roominfo;
insert into roominfo values(101,'������',2,7,1500);
insert into roominfo values(102,'���ǻ�',4,8,1800);
insert into roominfo values(103,'�Ѷ��',3,5,1600);

select a.num, a.name, b.typename, a.howmany, a.howmuch
from roominfo a, roomtype b
where a.type = b.typenum
order by a.num;

select b.prod_name, c.cust_name, d.channel_desc, e.emp_name, f.department_name
from sales a, products b, customers c, channels d, employees e, departments f
where a.prod_id=b.prod_id
  and a.cust_id=c.cust_id
  and a.channel_id=d.channel_id
  and a.employee_id=e.employee_id
  and e.department_id=f.department_id;
  
select * from products;
select * from sales;

select b.prod_name,to_char(sum(a.amount_sold),'9,999,999,999.99'), a.sales_date
from sales a, products b
where a.prod_id=b.prod_id
group by b.prod_name,a.sales_date
order by b.prod_name, a.sales_date;

select b.emp_name, to_char(sum(a.amount_sold),'9,999,999,999.99') sold
from sales a, employees b
where a.employee_id=b.employee_id
group by b.emp_name
order by  b.emp_name;