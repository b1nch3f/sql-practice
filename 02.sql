-- Ch 2 Sorting Query Results

-- 2.1 Returning Query Results in a Specified Order
select ename, sal
  from emp
 where deptno = 10
 order by sal;
 
/*
You need not specify the name of the column on which to sort. You can instead specify a number representing the column. 
*/


-- 2.2 Sorting by Multiple Fields
select *
  from emp
 order by deptno, sal desc;
 
/*
You are generally permitted to
order by a column not in the SELECT list, but to do so you must explicitly name the
column. However, if you are using GROUP BY or DISTINCT in your query, you can‐
not order by columns that are not in the SELECT list.
*/


-- 2.3 Sorting by Substrings
select *
  from emp
 order by substr(job, length(job)-1);
 
 
-- 2.4 Sorting Mixed Alphanumeric Data
create view v
as 
select concat(ename, ' ', deptno) as data
  from emp;

select data
  from v
 order by substr(data, 1, length(data)-3), substr(data, length(data)-1);
 
 
-- 2.5 Dealing with Nulls When Sorting
select ename, sal, comm 
  from (
select ename, sal, comm,
	   case when comm is null then 0 
			else 1
       end
       as is_null	
  from emp
  ) x
 order by is_null desc, comm;
 
 
-- 2.6 Sorting on a Data-Dependent Key
select *
  from emp
 order by case when job = 'SALESMAN' then comm else sal end;
