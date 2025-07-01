use company;
show tables;

select * from emp;

select max(sal) from emp;
-- 2nd max salary --
select max(sal) from emp 
where sal<(select max(sal) from emp);

select avg(sal) from emp;
-- List employees who earn more than the average salary of all employees--
select ename,sal from emp where sal>(select avg(sal) from emp);

select * from dept;
-- Display each employee's name and their department location using a subquery in--
SELECT 
    ENAME,
    (SELECT LOC FROM dept WHERE dept.DEPTNO = emp.DEPTNO) AS LOCATION
FROM emp;

select * from emp;
-- employees who work in departments located in 'CHICAGO'--
select ename,deptno from emp where deptno in(
select deptno from dept where loc='chicago');

-- List employees whose salary is more than the average salary of their department (correlated subquery):
SELECT ENAME, SAL, DEPTNO
FROM emp e1
WHERE SAL > (
    SELECT AVG(SAL)
    FROM emp e2
    WHERE e1.DEPTNO = e2.DEPTNO
);



