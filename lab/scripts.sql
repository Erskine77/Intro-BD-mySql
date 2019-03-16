
create database ets;

use ets;

create table rol(
	id int not null primary key auto_increment,
    nombre varchar(64) not null unique
    ) engine = InnoDB;
    
create table usuario(
	id int not null primary key auto_increment,
    username varchar(128) not null unique,
    password varchar(128) not null,
    enabled bit default 1,
    nombre varchar(128) not null,
    apellido varchar(128) not null,
    email varchar(128) not null unique
	) engine = InnoDB;
 
create table usuario_rol(
	usuario_id int not null,
    rol_id int not null,
    foreign key (usuario_id) references usuario(id),
    foreign key (rol_id) references rol(id),
    primary key(usuario_id, rol_id)
	) engine = InnoDB;

insert into rol(id, nombre) values(0,'ROLE_ADMIN');
insert into rol(nombre) values('ROLE_USER');

select * from rol;

insert into usuario(username, password, enabled, nombre, apellido, email)
	values('eespaderos','123',1,'Erskine','Espaderos','eespaderos@gmail.com');
insert into usuario(username, password, enabled, nombre, apellido, email)
	values('etumax','231',1,'Edwin','Tumax','etumax@gmail.com');
insert into usuario(username, password, nombre, apellido, email)
	values('creyes','321','Carlos','Reyes','creyes@gmail.com');

select * from usuario;

select md5(password) from usuario;

update usuario 
set password = md5(password);

insert into usuario_rol(usuario_id,rol_id) values (1,2);

insert into usuario_rol(usuario_id,rol_id) values (3,2);

grant select, insert, update, delete, create, drop on etc.* to developer@'%';

use ets;

select u.username 'Login', u.email 'Correo Electronico'
from usuario u
where u.email like '%m%'
order by 'Login';

select * from rol;

update rol
set nombre = 'ROLE_TEST'
where id = 3;

-- JOINS

select *
from usuario u 
inner join usuario_rol ur on u.id = ur.usuario_id
inner join rol r on r.id = ur.rol_id
;

-- LEFT

select *
from usuario u 
inner join usuario_rol ur on u.id = ur.usuario_id
left join rol r on r.id = ur.rol_id
;

-- RIGTH

select *
from usuario u 
inner join usuario_rol ur on u.id = ur.usuario_id
right join rol r on r.id = ur.rol_id
;

select *
from rol r
inner join usuario_rol ur on r.id = ur.rol_id
right join usuario u on u.id = ur.usuario_id;

insert into usuario(username, password, nombre, apellido, email)
	values('vlopez','987','Vicente','Lopez','vlopez@gmail.com');

select *
from usuario u
inner join usuario_rol ur on u.id = ur.usuario_id
right join rol r on r.id = ur.rol_id
where ur.rol_id is null;

-- FULL OUTER

select *
from usuario u
inner join usuario_rol ur on u.id = ur.usuario_id
left join rol r on r.id = ur.rol_id
union
select *
from usuario u
inner join usuario_rol ur on u.id = ur.usuario_id
right join rol r on r.id = ur.rol_id
;

-- **************************************

select u.username, r.nombre
from usuario u
inner join usuario_rol ur on u.id = ur.usuario_id
inner join rol r on r.id = ur.rol_id;



