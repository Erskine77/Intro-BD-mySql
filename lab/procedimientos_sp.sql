
drop procedure if exists sp_roles_usuarios;

DELIMITER $$

create procedure sp_roles_usuarios(in _username varchar(64))

begin

	select u.username, r.nombre
	from usuario u
	inner join usuario_rol ur on u.id = ur.usuario_id
	inner join rol r on r.id = ur.rol_id
    where u.username = _username;

end$$

call sp_roles_usuarios('etumax');

-- *****************************************************************************

drop procedure if exists sp_numero_roles;

DELIMITER $$

create procedure sp_numero_roles(
	in _username varchar(64), 
    out _cantidad int)

begin

	select count(r.id) into _cantidad
	from usuario u
	inner join usuario_rol ur on u.id = ur.usuario_id
	inner join rol r on r.id = ur.rol_id
    where u.username = _username;

end$$

call sp_numero_roles('eespaderos',@out_value);

select @out_value;

-- ***************************************************
-- Procedimiento para autenticar

drop procedure if exists sp_autenticar_usuario;

DELIMITER $$

create procedure sp_autenticar_usuario(
	in _username varchar(64),
	in _password varchar(128))

begin

	select *
    from usuario u
    where u.username = _username
		and u.password = md5(_password);

end$$

call sp_autenticar_usuario('eespaderos','123');
