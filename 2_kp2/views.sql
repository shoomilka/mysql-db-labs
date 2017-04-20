-- 1. �������������, ��� ������� �� ��� �������.
CREATE VIEW view_all_users AS SELECT * FROM users;

-- 2. �������������, ��� ������� �����, �� ������������� ������� ������ ����.
CREATE VIEW view_really_bd AS SELECT * FROM users WHERE created_at = updated_at;

-- 3. �������������, ��� ������� �����, �� ������������� ������� ������� ������.
CREATE VIEW view_emp_3 AS SELECT * FROM emp WHERE deptno = 10 or (sal <= 2000 and deptno = 20);

-- 4. �������������, ��� ������� �������� �������.
CREATE VIEW view_emp_4 AS SELECT ename, deptno, sal FROM emp;

-- 5. �������������, ��� ������� �������� �������, �� ����� ������� �� ����� ��� ������� ����� (���������).
CREATE VIEW view_emp_5 AS SELECT ename as employee_name, sal as salary FROM emp;

-- 6. �������������, ��� ����������� ������������ ��������.
CREATE VIEW view_full_names AS SELECT concat(first_name, ' ', last_name) as full_name FROM users;

-- 7. �������������, ��� ����������� ����� CASE.
CREATE VIEW view_emp_7 AS SELECT ename, sal, case when sal <= 1000 then �UNDERPAID� when sal >= 4000 then �OVERPAID� else �OK� end as status FROM emp;

-- 8. �������������, ��� ������� �������� ������� �����.
CREATE VIEW view_emp_8 AS SELECT * FROM emp LIMIT 5;

-- 9. �������������, ��� ������� n ���������� ����� �������.
CREATE VIEW view_emp_9 AS SELECT ename, job FROM emp ORDER BY rand() LIMIT 5;

-- 10. ������������� � ������� ������� NULL
CREATE VIEW view_null_users AS SELECT * FROM users WHERE username is null;

-- 11. ������������� � ������� �� ��������.
CREATE VIEW view_emp_11 AS SELECT ename, job FROM emp WHERE deptno in (10, 20) and (ename like �%I%� or job like �%ER�);

-- 12. �������������, � ����� ����� ����������� �� ������ �����.
CREATE VIEW view_emp_12 AS SELECT ename, job, sal FROM emp WHERE deptno = 10 ORDER BY sal asc;

-- 13. �������������, � ����� ����� ����������� �� ���� �� ����� �����.
CREATE VIEW view_emp_13 AS SELECT empno, deptno, sal, ename, job FROM emp ORDER BY deptno, sal desc;

-- 14. �������������, � ����� ����� ����������� �� �� ������ (������� substring / substr).
CREATE VIEW view_emp_14 AS SELECT ename, job FROM emp ORDER BY substr(job, length(job)-2);

-- 15. �������������, � ����� ������������ NULL �������� ��� ���������.
CREATE VIEW view_emp_15 AS SELECT ename, sal, comm FROM (SELECT ename, sal, com, case when comm is null then 0 else 1
end as is_null FROM emp) ORDER BY is_null desc, comm;

-- 16. �������������, � ����� ����� ����������� �� ��������� ����� �� �����.
CREATE VIEW view_emp_16 AS SELECT ename, sal, job, comm, case when job = �SALESMAN� then comm else sal end as ordered FROM emp ORDER BY 5;