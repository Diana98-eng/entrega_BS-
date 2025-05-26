USE `entregabs`;
DROP procedure IF EXISTS `insert_fabricantes`;

DELIMITER $$
USE `entregabs`$$
CREATE PROCEDURE `insert_fabricantes` (
in nom varchar (100)
)
BEGIN
insert into fabricantes(nombre) values (nom);
END$$

DELIMITER ;

USE `entregabs`;
DROP procedure IF EXISTS `insert_producto`;

DELIMITER $$
USE `entregabs`$$
CREATE PROCEDURE `insert_producto` (
in nom varchar(100),
in pre double,
in codfab int
)
BEGIN
insert into productos(nombre,precio,codigo_fabricante) values (nom,pre,codfab);
END$$

DELIMITER ;

