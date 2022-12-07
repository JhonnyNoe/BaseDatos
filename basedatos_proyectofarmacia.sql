# Host: localhost  (Version 5.5.5-10.4.18-MariaDB)
# Date: 2022-12-07 16:02:45
# Generator: MySQL-Front 6.1  (Build 1.21)


#
# Structure for table "categoria"
#

DROP TABLE IF EXISTS `categoria`;
CREATE TABLE `categoria` (
  `codigo_categoria` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_categoria` varchar(50) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`codigo_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

#
# Data for table "categoria"
#

INSERT INTO `categoria` VALUES (1,'PASTILLAS','Para pastillas'),(2,'JARABES','xdddddd'),(4,'OTROS','Para otros'),(5,'Pomadas','Pomadas');

#
# Structure for table "cliente"
#

DROP TABLE IF EXISTS `cliente`;
CREATE TABLE `cliente` (
  `codigo_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`codigo_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

#
# Data for table "cliente"
#

INSERT INTO `cliente` VALUES (1,'ANA FLORES','Z. Tahuantisuyo','212122'),(2,'LUIS CONDORI','Z. Villa Tunari','777777'),(5,'ELIAS ALARCON','SUCRE','741258'),(6,'MERY MISME','SUCRE','645465');

#
# Structure for table "comprobante"
#

DROP TABLE IF EXISTS `comprobante`;
CREATE TABLE `comprobante` (
  `codigo_comprobante` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`codigo_comprobante`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

#
# Data for table "comprobante"
#

INSERT INTO `comprobante` VALUES (1,'FACTURA'),(2,'RECIBO'),(4,'Pago al instante');

#
# Structure for table "empleado"
#

DROP TABLE IF EXISTS `empleado`;
CREATE TABLE `empleado` (
  `codigo_empleado` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `cargo` varchar(50) DEFAULT NULL,
  `edad` int(11) DEFAULT NULL,
  `telefono` int(11) DEFAULT NULL,
  `sueldo` float DEFAULT NULL,
  PRIMARY KEY (`codigo_empleado`),
  KEY `empleado-distrito` (`sueldo`)
) ENGINE=InnoDB AUTO_INCREMENT=9101359 DEFAULT CHARSET=utf8mb4;

#
# Data for table "empleado"
#

INSERT INTO `empleado` VALUES (1,'Jhonny Asistiri','Z. Villa ingenio','ADMINIATRADOR',24,67140009,10000),(2,'LAURA GIMENES CHURA','El alto','EMPLEADO',18,41253698,2500),(9101357,'Juan Mendes','SANTA CRUZ','EMPLEADO',25,5847896,500),(9101358,'Miguel','Z. Cotacota','EMPLEADO',25,25212,250.5);

#
# Structure for table "proveedor"
#

DROP TABLE IF EXISTS `proveedor`;
CREATE TABLE `proveedor` (
  `codigo_proveedor` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_proveedor` varchar(50) DEFAULT NULL,
  `direccion_proveedor` varchar(100) DEFAULT NULL,
  `telefono` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

#
# Data for table "proveedor"
#

INSERT INTO `proveedor` VALUES (1,'FARMACOP','La paz Z. Villa mejillones',741258),(2,'VITA','El Alto. Villa tunari',117896);

#
# Structure for table "producto"
#

DROP TABLE IF EXISTS `producto`;
CREATE TABLE `producto` (
  `cod_producto` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_producto` varchar(50) DEFAULT NULL,
  `precio_venta` float DEFAULT NULL,
  `precio_compra` float DEFAULT NULL,
  `fecha_vencimiento` date DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `codigo_categoria` int(11) DEFAULT NULL,
  `codigo_proveedor` int(11) DEFAULT NULL,
  PRIMARY KEY (`cod_producto`),
  KEY `producto-categoria` (`codigo_categoria`),
  KEY `producto-proveedor` (`codigo_proveedor`),
  CONSTRAINT `producto-categoria` FOREIGN KEY (`codigo_categoria`) REFERENCES `categoria` (`codigo_categoria`),
  CONSTRAINT `producto-proveedor` FOREIGN KEY (`codigo_proveedor`) REFERENCES `proveedor` (`codigo_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

#
# Data for table "producto"
#

INSERT INTO `producto` VALUES (1,'AMOXILINA',8,9,'2020-11-20',25,1,1),(3,'Nuevo producto',25,20,'2022-10-10',12,2,2),(5,'otro',25,25,'2022-10-10',12,2,1),(8,'Premasol',10,12,'2022-10-15',12,4,1),(9,'NEW',10,8,'2022-10-10',12,1,1),(10,'Pomada 1',5,2,'2022-12-12',6,5,1);

#
# Structure for table "usuario"
#

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `codigo_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `nivel_usuario` varchar(50) DEFAULT NULL,
  `codigo_empleado` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo_usuario`),
  KEY `codigo_empleado` (`codigo_empleado`),
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`codigo_empleado`) REFERENCES `empleado` (`codigo_empleado`)
) ENGINE=InnoDB AUTO_INCREMENT=9101353 DEFAULT CHARSET=utf8mb4;

#
# Data for table "usuario"
#

INSERT INTO `usuario` VALUES (1,'jhonny','8cb2237d0679ca88db6464eac60da96345513964','ADMINISTRADOR',1);

#
# Structure for table "venta"
#

DROP TABLE IF EXISTS `venta`;
CREATE TABLE `venta` (
  `codigo_venta` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `codigo_producto` int(11) DEFAULT NULL,
  `codigo_cliente` int(11) DEFAULT NULL,
  `codigo_empleado` int(11) DEFAULT NULL,
  `codigo_comprobante` int(11) DEFAULT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  `costo` float DEFAULT NULL,
  PRIMARY KEY (`codigo_venta`),
  KEY `venta-producto` (`codigo_producto`),
  KEY `venta-empleado` (`codigo_empleado`),
  KEY `venta-compro` (`codigo_comprobante`),
  KEY `venta-cliente` (`codigo_cliente`),
  CONSTRAINT `venta-cliente` FOREIGN KEY (`codigo_cliente`) REFERENCES `cliente` (`codigo_cliente`),
  CONSTRAINT `venta-compro` FOREIGN KEY (`codigo_comprobante`) REFERENCES `comprobante` (`codigo_comprobante`),
  CONSTRAINT `venta-empleado` FOREIGN KEY (`codigo_empleado`) REFERENCES `empleado` (`codigo_empleado`),
  CONSTRAINT `venta-producto` FOREIGN KEY (`codigo_producto`) REFERENCES `producto` (`cod_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;

#
# Data for table "venta"
#

INSERT INTO `venta` VALUES (13,'2022-10-10',1,1,2,1,'se vendio x12',5),(16,'2022-12-07',5,6,2,2,'xd',24),(17,'2022-12-07',1,6,1,2,'se vendio una AMOXILINA',6);
