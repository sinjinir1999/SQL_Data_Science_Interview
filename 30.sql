Select ename from employee where
salary in( select dept ,max(salary) from emp group by 1)

