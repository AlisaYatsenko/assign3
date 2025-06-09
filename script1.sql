use assign3;

-- Task 1: Dirty Read (READ UNCOMMITTED)

set transaction isolation level read uncommitted;
start transaction;
update people set age=30 where id = 4;

-- Task 2: Non-Repeatable Read (READ COMMITTED)

set transaction isolation level read committed;
start transaction;
update people set gender = 'male' where id = 1;
commit;

-- Repeatable Read (REPEATABLE READ)

set transaction isolation level REPEATABLE READ;
start transaction;
update people set gender = 'male' where id = 11;
commit;

-- Non-Repeatable Read vs Repeatable Read

update people set gender = 'female' where id = 11;
set transaction isolation level read committed;
start transaction;
update people set gender = 'male' where id = 11;
commit;

-- Deadlock

start transaction;
update people set age = 26 where id = 55;
update people set age = 30 where id = 56;
commit;
