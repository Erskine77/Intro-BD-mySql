create database almacen;

use almacen;

drop table emailclientes;
create table emailclientes(
	codigoEmail int(11) not null primary key auto_increment,
	email varchar(128) not null unique,
	nit varchar(64) not null unique
) engine = InnoDB;

insert into emailclientes
select 1, 'erskine.espaderos@gmail.com', '123456-7';

select * from emailclientes;

drop table clientes;
create table clientes(
	nit varchar(64) not null primary key references emailclientes(nit),
	dpi varchar(64) not null unique,
	nombre varchar(128) not null,
	direccion varchar(128) not null
) engine = InnoDB;

insert into clientes
select '123456-7', '2222777770101', 'Erskine Espaderos', 'Ciudad';

select * from clientes;

drop table telefonoclientes;
create table telefonoclientes(
	codigoTelefono int(11) not null primary key auto_increment, /*auto_increment*/
	numero varchar(32) not null,
	descripcion varchar(128) not null,
	nit varchar(64) not null unique references clientes(nit)
) engine = InnoDB;

insert into telefonoclientes
select 1, '22225555', 'Numero Casa', '123456-7';

select * from telefonoclientes;

create table facturas(
	numeroFactura int(11) not null primary key, /*auto_increment*/
	nit varchar(64) not null unique references clientes(nit),
	fecha date not null,
	total decimal(10,2) not null
) engine = InnoDB;

drop table categoria;
create table categoria(
	codigoCategoria int(11) not null primary key auto_increment, /*auto_increment*/
	descripcion varchar(128) not null
) engine = InnoDB;

insert into categoria select 1, 'CATEGORIA_1';
insert into categoria(descripcion) value('CATEGORIA_2');

select * from categoria;

create table tipoempaques(
	codigoEmpaque int(11) not null primary key, /*auto_increment*/
	descripcion varchar(128) not null
) engine = InnoDB;

create table productos(
	codigoProducto int(11) not null primary key, /*auto_increment*/
	codigoCategoria int(11) not null references categorias(codigoCategoria),
	codigoEmpaque int(11) not null references tipoempaques(codigoEmpaque),
	descripcion varchar(128) not null,
	precioUnitario decimal(10,2) not null,
	precioPorDocena decimal(10,2) not null,
	precioPorMayor decimal(10,2) not null,
	existencia int(11) not null,
	imagen varchar(128)
) engine = InnoDB;

create table detallefacturas(
	codigoDetalle int(10) not null primary key, /*auto_increment*/
	numeroFactura int(10) not null references facturas(numeroFactura),
	codigoProducto int(10) not null references productos(codigoProducto),
	cantidad int(10) not null,
	precio decimal(10,2) not null,
	descuento decimal(10,2) not null
) engine = InnoDB;

create table inventarios(
	codigoInventario int(11) not null primary key, /*auto_increment*/
	codigoProducto int(11) not null references productos(codigoProducto),
	fecha date not null,
	tipoRegistro varchar(1)not null,
	precio decimal(10,2) not null,
	entradas int(11) not null,
	salidas int(11) not null
) engine = InnoDB;

create table proveedores(
	codigoProveedor int(11) not null primary key, /*auto_increment*/
    nit varchar(64) not null unique,
    razonSocial varchar(128) not null unique,
    direccion varchar(128) not null,
    paginaWeb varchar(64) not null,
    contactoPrincipal varchar(64) not null
) engine = InnoDB;

create table emailproveedores(
	codigoEmail int(11) not null primary key, /*auto_increment*/
	email varchar(128) not null unique,
	codigoProveedor int(11) not null references proveedores(codigoProveedor)
) engine = InnoDB;

create table telefonoproveedores(
	codigoTelefono int(11) not null primary key, /*auto_increment*/
	numero varchar(32) not null,
    descripcion varchar(64) not null,
	codigoProveedor int(11) not null references proveedores(codigoProveedor)
) engine = InnoDB;

create table compras(
	numeroDocumento int(11) not null primary key,
	codigoProveedor int(11) not null references proveedores(codigoProveedor),
    fecha date not null,
	total decimal(10,2) default 0.00
) engine = InnoDB;

create table detallecompras(
	idDetalle int(10) not null primary key, /*auto_increment*/
	numeroDocumento int(10) not null references compras(numeroDocumento),
	codigoProducto int(10) not null references productos(codigoProducto),
	cantidad int(10) not null,
	precio decimal(10,2) not null
) engine = InnoDB;

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













