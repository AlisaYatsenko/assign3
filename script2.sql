use assign3;

-- Task 1: Dirty Read (READ UNCOMMITTED)

set transaction isolation level read uncommitted;
start transaction;
select * from people where id = 4;

-- Task 2: Non-Repeatable Read (READ COMMITTED)

set transaction isolation level read committed;
start transaction;
select * from people where id = 1;
select * from people where id = 1;

-- Repeatable Read (REPEATABLE READ)

set transaction isolation level REPEATABLE READ;
start transaction;
select * from people where id = 11;
select * from people where id = 11;

-- Non-Repeatable Read vs Repeatable Read

set transaction isolation level read committed;
start transaction;
select * from people where id = 11;
select * from people where id = 11;

-- Deadlock

start transaction;
update people set country = 'ukraine' where id = 56;
update people set country = 'australia' where id = 55;
commit;
