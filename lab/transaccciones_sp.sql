use ets;


start transaction;
	insert into rol(nombre) values('ROL_SUPE_1');
    insert into rol(nombre) values('ROL_EXEC_2');
-- rollback;
commit;

select * from rol;

