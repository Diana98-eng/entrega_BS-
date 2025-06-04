create database entregaBS;
use  entregaBS;

create table fabricante(
codigo int  primary key auto_increment,
nombre varchar (100)
);
create table producto(
codigo  int primary key auto_increment,
nombre varchar (100),
precio double,
codigo_fabricante int  
); 

ALTER TABLE producto
add foreign key (codigo_fabricante) references fabricante(codigo);


