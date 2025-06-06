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
/*ejercicio composicion externa*/
# ejer 01 
select f.nombre, p.nombre  from fabricante as f 
left join producto as p on p.codigo_fabricante = f.codigo order by f.nombre;
# ejer 02 
select f.codigo, f.nombre from fabricante as f 
left join producto as p on p.codigo_fabricante = f.codigo 
where f.codigo is null order by f.nombre;
/*ejercicio consulta resumen*/
# ejer 01 
select count(*)  as total_producto from producto;
# ejer 02 
select count(*)  as total_fabricante from fabricante;
# ejer 03 
select  count(distinct p.codigo_fabricante)from producto as p;
#ejer 04 
select avg (precio)  as media_precio from producto;
# ejer 05 
select * from producto where precio =(select min(precio) from producto);
# ejer 06 
select * from producto where precio =(select max(precio) from producto);
# ejer 07 
select nombre, min(precio) from producto;
# ejer 08
select nombre, max(precio) from producto;
# ejer 09 
select sum(precio) from producto;
# ejer 10 
select  nombre, count(codigo_fabricante) from producto
 where codigo_Fabricante =1 ;
# Ejer 11 
select avg(precio) from producto where codigo_fabricante = 1;
# ejer 12 
select min(precio) from producto where codigo_fabricante = 1;
# ejer 13 
select max(precio) from producto where codigo_fabricante = 1;
# ejer 14 
select sum(precio) from producto where codigo_fabricante = 1;
# ejer 15 
select max(precio) as maximo, min(precio) as minimo, avg(precio) as media, count(*) as total
from producto where codigo_fabricante = 6;
# Ejer 16 
select f.nombre, count(p.codigo) as total_producto from fabricante as f 
left join producto as p on p.codigo_fabricante = f.codigo
group by f.nombre,  p.codigo order by total_producto;
# ejer 17 
select f.nombre, max(p.precio) as precio_maximo, min(p.precio) as precio_minimo, avg(p.precio) as media_precio
from fabricante as f 
join producto as p on p.codigo_fabricante = f.codigo
group by f.codigo, f.nombre;
# ejer 18 
select  p.codigo_fabricante, max(p.precio) as precio_maximo,
 min(p.precio) as precio_minimo, 
 avg(p.precio) as media_precio, count(*) from producto as p group by p.codigo_fabricante having avg(p.precio) >200;
  # ejer 19 
select f.nombre, p.codigo_fabricante, max(p.precio) as precio_maximo,
 min(p.precio) as precio_minimo, 
 avg(p.precio) as media_precio, count(*) from producto as p  join fabricante as f on p.codigo_fabricante = f.codigo
 group by p.codigo_fabricante having avg(p.precio) >200;
# ejer 20
SELECT count(*) AS precio_fabricante_mayor_a_180
    FROM producto WHERE precio >180;
# ejer 21 
select count(p.codigo_fabricante), f.nombre from  producto  as  p
left join fabricante as f on p.codigo_fabricante = f.codigo 
where p.precio > 180 group by p.codigo_fabricante, f.nombre ; 
# ejer 22 
select avg(p.codigo_fabricante), f.codigo from  producto  as  p
left join fabricante as f on p.codigo_fabricante = f.codigo 
group by p.codigo_fabricante ;
# ejer 23 
select avg(p.codigo_fabricante), f.nombre from  producto  as  p
left join fabricante as f on p.codigo_fabricante = f.codigo 
group by p.codigo_fabricante ;
# ejer 24
select f.nombre, p.codigo_fabricante, avg(p.precio) as media_precio from producto as p  join fabricante as f on p.codigo_fabricante = f.codigo
 group by p.codigo_fabricante having avg(p.precio) >150;
 # ejer 25 
 select f.nombre, p.codigo_fabricante  from producto as p  join fabricante as f on p.codigo_fabricante = f.codigo
 group by p.codigo_fabricante,f.nombre having count(p.codigo)>=2;
 # ejer 26
 select f.nombre, count(p.codigo) from fabricante as f  join producto as p on p.codigo_fabricante = f.codigo
 where p.precio >= 200 group by f.nombre ;
 # ejer 27 
 select  f.nombre ,COUNT(p.codigo) from fabricante as f
left join producto  as p  on f.codigo = p.codigo_fabricante and  p.precio >= 220
group by f.codigo, f.nombre;
# ejer 28 
select f.nombre, sum(p.precio / 1.15) as precio_dolares from fabricante as f 
join producto as p on p.codigo_fabricante = f.codigo 
group by f.codigo, f.nombre  having sum(p.precio/1.15)> 1000;
# ejer 29  
select p.nombre, p.precio,f.nombre from producto as p
join fabricante  as f on p.codigo_fabricante = f.codigo
where p.precio = (select max(p2.precio) from producto as  p2 where p2.codigo_fabricante = p.codigo_fabricante)
ORDER BY f.nombre ASC;
/* subconsultas*/
# ejer 01 
select   * from  producto where Codigo_fabricante = (select Codigo from fabricante where Nombre = 'Lenovo');
# ejer 02
select * from producto where precio = ( select max(precio) from producto where codigo_fabricante = 2);
# ejer 03 
select * from producto where precio = ( select max(precio) from producto where codigo_fabricante = 2);
# ejer 04 
select * from producto where precio = ( select max(precio) from producto where codigo_fabricante = 3);
# ejer 05 
select * from producto where codigo_fabricante = 2 and precio <>
 (select max(precio) from producto where codigo_fabricante = 2 );
 # ejer 06 
 select * from producto where precio = ( select avg(precio) from producto where codigo_fabricante = 1);
 # ejer 07
 select * from producto where precio >= all (select precio from producto );
 # ejer 08 
  select * from producto where precio <= all (select precio from producto );
  # ejer 09 
  select nombre from fabricante  where codigo = any  (select codigo_fabricante from producto );
# ejer 10 
select nombre from fabricante where codigo <> all (select codigo_fabricante  from producto );
# ejer 11
select nombre from fabricante  where codigo in (select distinct codigo_fabricante from producto );
# ejer 12
select * from fabricante as f where not exists
( select p.nombre from producto as p where p.codigo_fabricante = f.codigo);
#  ejer 13 
select  f.nombre from fabricante  as f where exists( select * from producto as p where p.codigo_fabricante = f.codigo);
# ejer 14 
select  f.nombre from fabricante  as f where not exists( select * from producto as p where p.codigo_fabricante = f.codigo);
# ejer 15 
select f.nombre, p.nombre,p.precio from fabricante as f 
join producto as p on  p.codigo_fabricante = f.codigo
where p.precio = (select MAX(p2.precio) from producto as  p2 where p2.codigo_fabricante = f.codigo);
# ejer 16
select p.Nombre, p.Precio, p.Codigo_fabricante from producto as p 
where p.Precio >= (select avg(p2.Precio)from producto p2 where p2.Codigo_fabricante = p.Codigo_fabricante);
# ejer 17 
select p.Nombre from producto as p join fabricante as f on p.Codigo_fabricante = f.Codigo 
where f.Nombre = 'Lenovo' order by p.Precio desc ;
# ejer 18
select f.Nombre from fabricante as f where (select COUNT(*)from producto as p 
where p.Codigo_fabricante = f.Codigo) = (select  COUNT(*) from producto 
where Codigo_fabricante = (select Codigo from fabricante where Nombre = 'Lenovo'));

