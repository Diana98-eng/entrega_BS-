#ejer 02
select nombre, precio from producto;
#ejer 03
select * from producto ;
#ejer 04
select nombre, precio, round(precio*0.92, 2) as precio_eu from producto;
#ejer 05
SELECT nombre , precio,round(precio*1.13,0) AS euros FROM producto;
#ejer 06 
SELECT UPPER(nombre), precio FROM producto; 
#ejer 07
SELECT nombre ,precio FROM producto;
#ejer 08
SELECT nombre,CONCAT(UPPER(LEFT(nombre, 2)), LOWER(SUBSTRING(nombre, 3)))FROM fabricante;
#ejer 09
select nombre, round (precio) from producto;
#ejer 10 
select nombre, truncate (precio,0)  from producto;
#ejer 11
select codigo_fabricante from producto
group by codigo_fabricante;
#ejer 12
select  distinct codigo_fabricante from producto;
#ejer 13
select * from producto
order by nombre asc;
#ejer 14
select * from producto
order by nombre desc;
#ejer 15
select nombre, precio from producto
order by nombre asc, precio desc;
#ejer 16
select * from fabricante
limit 5 ;
#ejer 17
select * from fabricante 
limit 3, 9;
#ejer 18
select nombre, precio from producto 
order by precio 
asc limit 11;
#ejer 19 
select nombre, precio from producto 
order by precio 
desc limit 11;
#ejer 20 
select * from producto where codigo_fabricante =2;
#ejer 21 
select nombre, precio, round(precio*0.92, 2) as precio_eu from producto where precio <=120;
#ejer 22
select nombre, precio, round(precio*0.92, 2) as precio_eu from producto where precio >= 400;
#ejer 23 
select  nombre from producto where precio between 0 and 400;
#ejer 24
select * from producto where precio >=80 and precio <=300;
#ejer 25 
select * from producto where precio between  60 and 200;
#ejer 26
select * from producto where precio > 200 and codigo_fabricante = 6;
#ejer 27 
select * from producto where codigo_fabricante =1 or codigo_fabricante =3 or codigo_fabricante= 5;
#jer 28 
select * from producto where codigo_fabricante  in (1,3,5);
#ejer 29
select nombre, precio * 100 as centimos  from producto; 
#ejer 30 
select nombre from fabricante where nombre like "s%";
#ejer 31 
select nombre from fabricante where nombre like "%e";
#ejer 32 
select nombre from fabricante where nombre like "%w%";
#ejer 33 
select nombre from fabricante where nombre like "____";
#ejer 34 
select nombre from producto where nombre like "%portátil%";
#ejer 35
select nombre from producto where nombre like "%monitor%"  and precio < 215;
#ejer 36 
select nombre, precio from producto where precio <= 180 order by precio desc, nombre asc; 

/* consulta multitabla*/
# ejer 01 
select p.nombre,p.precio,f.nombre   from producto  as p
inner join fabricante as f on p.codigo_fabricante = f.codigo;
# ejer 02 
select p.nombre, p.precio, f.nombre from producto as p 
inner join fabricante as f on p.codigo_fabricante = f.codigo order by f.nombre asc;
# ejer 03 
select p.codigo, p.nombre, f.codigo, f.nombre from producto as p  
inner join fabricante as f on  p.codigo_fabricante = f.codigo;
# ejer 04 
select p.nombre, min(p.precio), f. nombre from producto as p
 inner join fabricante as f on p.codigo_fabricante = f.codigo;
 # Ejer 05 
 select p.nombre, max(p.precio), f. nombre from producto as p
 inner join fabricante as f on p.codigo_fabricante = f.codigo;
 # ejer 06 
select nombre, codigo_fabricante from producto where codigo_fabricante = 2;
# ejer 07 
select p.nombre, f.nombre, p.codigo_fabricante, p.precio from producto as p 
inner join fabricante as f on p.codigo_fabricante = f.codigo
where p.codigo_fabricante = 6 and  p.precio > 200;
# ejer 08 
select nombre, codigo_fabricante from producto 
where codigo_fabricante = 1 or codigo_fabricante = 2 or codigo_fabricante = 5 ;
#ejer 09 
select nombre, codigo_fabricante from producto 
where codigo_fabricante in (1,2,5);
# ejer 10 
select p.nombre, p.precio, f.nombre from producto as p 
inner join fabricante as  f  on p.codigo_fabricante = f.codigo where f.nombre like "%e";
# ejer  11
select p.nombre, p.precio, f.nombre from producto as p 
inner join fabricante as  f  on p.codigo_fabricante = f.codigo  where f.nombre like "%w%";
# ejer 12 
select p.nombre, p.precio, f.nombre from producto as p
inner join fabricante   as f on p.codigo_fabricante = f.codigo
where p.precio > 180 order by p.precio desc, p.nombre asc;
# ejer 13 
select f.codigo,  f.nombre from fabricante as f
inner join producto as p on p.codigo_fabricante = f.codigo group by f.codigo;