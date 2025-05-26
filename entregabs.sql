create database entregaBS;
use  entregaBS;
create table fabricantes(
codigo int  primary key auto_increment,
nombre varchar (100)
);
create table productos(
codigo  int primary key,
nombre varchar (100),
precio double,
codigo_fabricante int  
); 
ALTER TABLE productos
add foreign key (codigo_fabricante) references fabricantes(codigo);


