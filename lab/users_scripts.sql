use mysql;

describe user;

select * from user;

create user developer@'%' identified by 'sabado';
create user developer@'localhost' identified by 'sabado';
create user developer@'192.168.31.111' identified by 'sabado';
create user developer@'192.168.31.130' identified by 'sabado';


grant all privileges on *.* to developer@'localhost';

grant select, insert, update, delete, create, drop on etc.* to developer@'%';
grant select on etc.* to developer@'192.168.31.111';
grant select on etc.* to developer@'192.168.31.130';

