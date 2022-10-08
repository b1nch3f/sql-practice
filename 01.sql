-- 1.1 Retrieving All Rows and Columns from a Table
select *
  from emp;
    
/*
Problems with SELECT * can also arise if your query is within code, and
the program gets a different set of columns from the query than was expected. At
least, if you specify all columns and one or more is missing, any error thrown is more
likely to be traceable to the specific missing column(s).
*/


-- 1.2 Retrieving a Subset of Rows from a Table
select *
  from emp
 where deptno = 10;
 
 
 -- 1.3 Finding Rows That Satisfy Multiple Conditions
 select *
  from emp
 where deptno = 10 
     or comm is not null
     or deptno = 20 and sal <= 20000;
     
     
-- 1.4 Retrieving a Subset of Columns from a Table
select empno, ename
  from emp;
  
/*
Important when retrieving data across a network,
as it avoids the waste of time inherent in retrieving data that you do not need.
*/


-- 1.5 Providing Meaningful Names for Columns
select sal as salary, comm as commision
  from emp;
  
  
-- 1.6 Referencing an Aliased Column in the WHERE Clause
select *
  from (
select sal as salary, comm as commision
  from emp
  ) x
 where salary < 5000;
 
 
 -- 1.7 Concatenating Column Values
 select concat(ename, ' WORKS AS A', job) as msg
   from emp
 where deptno = 10;
 
 
 -- 1.8 Using Conditional Logic in a SELECT Statement
 select ename, sal, 
    case when sal <= 2000 then 'UNDERPAID'
		 when sal >= 4000 then 'OVERPAID'
         else 'OK'
	end as status
  from emp;
  
/*
Omit the ELSE, and the CASE expression
will return NULL for any row that does not satisfy the test condition.
*/


-- 1.9 Limiting the Number of Rows Returned
select *
  from emp
 limit 5;
 
 
-- 1.10 Returning n Random Records from a Table
select ename, job
  from emp
 order by rand() limit 5;
 
 
-- 1.11 Finding Null Values
select *
  from emp
 where comm is null;
 
/*
NULL is never equal/not equal to anything, not even itself; therefore, you cannot use
= or != for testing whether a column is NULL. To determine whether a row has
NULL values, you must use IS NULL. You can also use IS NOT NULL to find rows
without a null in a given column
*/


-- 1.12 Transforming Nulls into Real Values
select coalesce(comm, 0)
  from emp;
  
  
-- 1.13 Searching for Patterns
select ename, job
  from emp
 where ename like '%I%' or job like '%ER';
 
/*
When used in a LIKE pattern-match operation, the percent (%) operator matches any
sequence of characters. Most SQL implementations also provide the underscore (“_”)
operator to match a single character. By enclosing the search pattern “I” with % oper‐
ators, any string that contains an “I” (at any position) will be returned. If you do not
enclose the search pattern with %, then where you place the operator will affect the
results of the query. For example, to find job titles that end in “ER,” prefix the %
operator to “ER”; if the requirement is to search for all job titles beginning with “ER,”
then append the % operator to “ER.”
*/
