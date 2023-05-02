/* Creando la base de datos Ventas2015 */ 
DROP DATABASE IF EXISTS VENTAS2015;
CREATE DATABASE VENTAS2015;

/* Activando la base de datos Ventas2015 */
USE VENTAS2015;

/* IMPLEMENTANDO LA TABLA PRODUCTO */
/* Validando la existencia de la tabla producto */
DROP TABLE IF EXISTS producto;

/* Creando la tabla producto */
CREATE TABLE producto(
	ID_PRODUCTO		CHAR(5) 	NOT NULL,
	DESCRIPCION 		VARCHAR (50) 	NOT NULL,
	PRECIO			DECIMAL(8,2) 	NOT NULL,
	STOCK 			INT 		NOT NULL,
	FECHA_VENC		DATE
);

/* Agregando la llave primaria */
ALTER TABLE producto ADD PRIMARY KEY (ID_PRODUCTO);

/* IMPLEMENTANDO LA TABLA DISTRITO */
/* Validando la existencia de la tabla distrito */
DROP TABLE IF EXISTS distrito;

/* Creando la tabla distrito */
CREATE TABLE distrito(
	ID_DISTRITO 	CHAR (3) 		NOT NULL,
	DESCRIPCION	VARCHAR(50)		NOT NULL
);
DROP PROCEDURE IF EXISTS sp_distritos;
CREATE PROCEDURE sp_distritos()
	SELECT * 
		FROM DISTRITO;

DROP PROCEDURE IF EXISTS sp_listadoclientes;
CREATE PROCEDURE sp_listadoclientes()
	SELECT C.ID_CLIENTE,
		CONCAT(C.NOMBRES,' ',C.PATERNO,' ',C.MATERNO) AS CLIENTE,
		C.DIRECCION,C.FONO,D.DESCRIPCION,C.EMAIL
		FROM CLIENTE C 
		INNER JOIN DISTRITO D 
		ON C.ID_DISTRITO=D.ID_DISTRITO
		ORDER BY 1 ASC;
DROP PROCEDURE IF EXISTS sp_listadoclientes;
CREATE PROCEDURE sp_listadoclientes()
	SELECT C.ID_CLIENTE,
		CONCAT(C.NOMBRES,' ',C.PATERNO,' ',C.MATERNO) AS CLIENTE,
		C.DIRECCION,C.FONO,D.DESCRIPCION,C.EMAIL
		FROM CLIENTE C 
		INNER JOIN DISTRITO D 
		ON C.ID_DISTRITO=D.ID_DISTRITO
		ORDER BY 1 ASC;
DROP PROCEDURE IF EXISTS sp_nuevocliente;
CREATE PROCEDURE sp_nuevocliente(	COD CHAR(5),NOM VARCHAR(30),
						PAT VARCHAR(30),MAT VARCHAR(30),
						DIR VARCHAR(40),TEL CHAR(15),
						DIS CHAR(3),COR VARCHAR(50))
	INSERT INTO cliente VALUES(cod,nom,pat,mat,dir,tel,dis,cor);

/* Agregando la llave primaria */
ALTER TABLE distrito ADD PRIMARY KEY (ID_DISTRITO);

/* IMPLEMENTANDO LA TABLA CLIENTE */
/* Validando la existencia de la tabla cliente*/
DROP TABLE IF EXISTS cliente;

/* Creando la tabla cliente */
CREATE TABLE cliente(
	ID_CLIENTE 	CHAR (5) 	NOT NULL,
	NOMBRES  	VARCHAR (30) 	NOT NULL,
	PATERNO 	VARCHAR (30) 	NOT NULL,
	MATERNO 	VARCHAR (30) 	NOT NULL,
	DIRECCION 	VARCHAR (40)  NULL,
	FONO 		CHAR (15) 	NULL,
	ID_DISTRITO 	CHAR (3) 	NOT NULL,
	EMAIL 		VARCHAR (50)  NULL
);

/* Agregando la llave primaria */
ALTER TABLE cliente ADD PRIMARY KEY (ID_CLIENTE);

/* Agregando la llave foránea a la tabla cliente */
ALTER TABLE cliente  
     ADD FOREIGN KEY (ID_DISTRITO) 
     REFERENCES distrito (ID_DISTRITO);

/* IMPLEMENTANDO LA TABLA BOLETA */
/* Validando la existencia de la tabla boleta*/
DROP TABLE IF EXISTS boleta;

/* Creando la tabla boleta */
CREATE TABLE boleta(
	NUM_BOLETA 		INT 		AUTO_INCREMENT,
	FECHA	 		DATE 		NOT NULL,
	ID_CLIENTE 		CHAR (5) 	NOT NULL,
	PRIMARY KEY (NUM_BOLETA)
);

/*  Para reinicializar el numero autoincrementado
    ALTER TABLE BOLETA AUTO_INCREMENT 1;
*/

/* Agregando la llave foránea a la tabla cliente */
ALTER TABLE boleta 
   ADD FOREIGN KEY (ID_CLIENTE) 
   REFERENCES cliente (ID_CLIENTE);

/* IMPLEMENTANDO LA TABLA DETALLEBOLETA */
/* Validando la existencia de la tabla DetalleBoleta */
DROP TABLE IF EXISTS detalleBoleta;

/* Creando la tabla DetalleBoleta */
CREATE TABLE detalleBoleta(
	NUM_BOLETA 	INT 		NOT NULL,
	ID_PRODUCTO 	CHAR(5) 	NOT NULL,
	CANTIDAD 	INT 		NOT NULL
);

/* Agregando las llaves primarias */
ALTER TABLE detalleBoleta 
   ADD PRIMARY KEY (NUM_BOLETA,ID_PRODUCTO);

/* Agregando las llaves foraneas de la tabla DetalleBoleta */
ALTER TABLE detalleBoleta 
   ADD FOREIGN KEY (ID_PRODUCTO) REFERENCES producto (ID_PRODUCTO);
ALTER TABLE detalleBoleta 
   ADD FOREIGN KEY (NUM_BOLETA) REFERENCES boleta (NUM_BOLETA);

/* INSERTANDO REGISTROS EN LAS TABLAS */
/* Insertando registros a la tabla Distrito */ 
INSERT INTO DISTRITO VALUES('L01','Peten');
INSERT INTO DISTRITO VALUES('L02','Izabal');
INSERT INTO DISTRITO VALUES('L03','Alta Verapaz');
INSERT INTO DISTRITO VALUES('L04','Quiche');
INSERT INTO DISTRITO VALUES('L05','Huehuetenango');
INSERT INTO DISTRITO VALUES('L06','Escuintla');
INSERT INTO DISTRITO VALUES('L07','San Marcos');
INSERT INTO DISTRITO VALUES('L08','Jutiapa');
INSERT INTO DISTRITO VALUES('L09','Baja Verapaz');
INSERT INTO DISTRITO VALUES('L10','Santa Rosa');
INSERT INTO DISTRITO VALUES('L11','Zacapa');
INSERT INTO DISTRITO VALUES('L12','Suchitepéquez');
INSERT INTO DISTRITO VALUES('L13','Chiquimula');
INSERT INTO DISTRITO VALUES('L14','Guatemala');
INSERT INTO DISTRITO VALUES('L15','Jalapa');
INSERT INTO DISTRITO VALUES('L16','Chimaltenango');
INSERT INTO DISTRITO VALUES('L17','Quetzaltenango');
INSERT INTO DISTRITO VALUES('L18','El Progreso');
INSERT INTO DISTRITO VALUES('L19','Retalhuleu');
INSERT INTO DISTRITO VALUES('L20','Sololá');

/* Insertando registros a la tabla Productos */
INSERT INTO PRODUCTO VALUES ('P0001','yogurt',20,500,'2015/05/14');
INSERT INTO PRODUCTO VALUES ('P0002','pastel',45,100,'2015/07/04');
INSERT INTO PRODUCTO VALUES ('P0003','Jabon',30,40,'2015/06/24');
INSERT INTO PRODUCTO VALUES ('P0004','Jamón',35,70,'2015/09/06');
INSERT INTO PRODUCTO VALUES ('P0005','Cereal',13.00,40,'2015/11/04');
INSERT INTO PRODUCTO VALUES ('P0006','Leche',1.50,70,'2015/12/04');
INSERT INTO PRODUCTO VALUES ('P0007','horchata',3,100,'2015/05/04');
INSERT INTO PRODUCTO VALUES ('P0008','chocolate',2.00,500,'2015/06/05');

/* Insertando registros a la tabla Cliente */
INSERT INTO CLIENTE VALUES ('C0001','Andres','lopez', 'Garcia',
                                       'Calle El Pino 346','4677352','L01','clopez@hotmail.com');
INSERT INTO CLIENTE VALUES ('C0002','Sofia','Morales','Guiñones',
                                       'Jr. Los Reyes 475 ','6734732','L06','fquiroz@peru.com');
INSERT INTO CLIENTE VALUES ('C0003','Andre','Perez', 'Gomez',
                                       'Jr.Huascar 956','4676732','L04','atruco@gmail.com');
INSERT INTO CLIENTE VALUES ('C0004','Karla','Garcia', 'Morales',
                                       'Av. Arequipa 451','4867438','L03','cblanco@hotmail.com');
INSERT INTO CLIENTE VALUES ('C0005','Alejandro','Perez','Mendoza',
                                 'Av. Ingenierios 111','2548965','L09','cmendoza@hotmail.com');
INSERT INTO CLIENTE VALUES ('C0006','Joaquin','Fuentes', 'Rodriguez',
                                 'Jr. Las Liras 456','4789658','L03','jrodas@gmail.com');
INSERT INTO CLIENTE VALUES ('C0007','Diego','De Leon', 'García',
                                 'Calle La Encantada 425','5698532','L11','ocuevas@peru.com');
INSERT INTO CLIENTE VALUES ('C0008','Antonio','Polanco','Alarcon',
                                 'Av. Dorado 347','4589732','L05','arodriguez@hotmail.com');
INSERT INTO CLIENTE VALUES ('C0009','Emmanuel','Erick', 'García',
                                 'Jr. Los Robles 854','4576738','L19','msuarez@gmail.com');
INSERT INTO CLIENTE VALUES ('C0010','David','Alejandro', 'Diaz',
                                 'Calle Girasoles 456','4897421','L14','jgutierrez@hotmail.com');
INSERT INTO CLIENTE VALUES ('C0011','Carlos','Alfredo','Diaz',
                                 'Av. Los Héroes 895','3698574','L19','ccolan@peru.com');
INSERT INTO CLIENTE VALUES ('C0012','Martin','Jose', 'Rodriguez',
                                 'Calle Los Huertos 844','8965952','L08','mcarrillo@gmail.com');
INSERT INTO CLIENTE VALUES ('C0013','Jose','Ricardo', 'De Leon',
                                 'Jr. Agapito 452','1258965','L17','jlazarte@gmail.com');
INSERT INTO CLIENTE VALUES ('C0014','Jorge','Godinez','Morales',
                          'Av. Héroes del cenepa 635','1547894','L20','vzorrilla@hotmail.com');
INSERT INTO CLIENTE VALUES ('C0015','Guillermo','Antonio', 'Reyes',
                                 'Jr. Las Almendras 211','4587964','L03','gramos@gmail.com');

/* Insertando registros a la tabla Boleta */
INSERT INTO BOLETA(fecha,id_cliente) VALUES ('2015/01/10','C0011');
INSERT INTO BOLETA(fecha,id_cliente) VALUES ('2015/01/20','C0002');
INSERT INTO BOLETA(fecha,id_cliente) VALUES ('2015/01/20','C0001');
INSERT INTO BOLETA(fecha,id_cliente) VALUES ('2015/01/23','C0005');
INSERT INTO BOLETA(fecha,id_cliente) VALUES ('2015/02/10','C0001');
INSERT INTO BOLETA(fecha,id_cliente) VALUES ('2015/02/20','C0002');
INSERT INTO BOLETA(fecha,id_cliente) VALUES ('2015/03/05','C0006');
INSERT INTO BOLETA(fecha,id_cliente) VALUES ('2015/03/24','C0006');
INSERT INTO BOLETA(fecha,id_cliente) VALUES ('2015/04/20','C0005');
INSERT INTO BOLETA(fecha,id_cliente) VALUES ('2015/04/20','C0011');
INSERT INTO BOLETA(fecha,id_cliente) VALUES ('2015/05/10','C0006');
INSERT INTO BOLETA(fecha,id_cliente) VALUES ('2015/06/20','C0006');
INSERT INTO BOLETA(fecha,id_cliente) VALUES ('2015/07/20','C0001');
INSERT INTO BOLETA(fecha,id_cliente) VALUES ('2015/07/26','C0006');
INSERT INTO BOLETA(fecha,id_cliente) VALUES ('2015/07/20','C0006');
INSERT INTO BOLETA(fecha,id_cliente) VALUES ('2015/07/20','C0005');
INSERT INTO BOLETA(fecha,id_cliente) VALUES ('2015/08/10','C0002');
INSERT INTO BOLETA(fecha,id_cliente) VALUES ('2015/09/05','C0012');
INSERT INTO BOLETA(fecha,id_cliente) VALUES ('2015/10/20','C0006');
INSERT INTO BOLETA(fecha,id_cliente) VALUES ('2015/11/27','C0014');
INSERT INTO BOLETA(fecha,id_cliente) VALUES ('2015/11/05','C0002');
INSERT INTO BOLETA(fecha,id_cliente) VALUES ('2015/11/20','C0001');

/* Insertando registros a la tabla detalleBoleta*/
INSERT INTO DETALLEBOLETA VALUES (1,'P0005',10);
INSERT INTO DETALLEBOLETA VALUES (1,'P0001',20);
INSERT INTO DETALLEBOLETA VALUES (2,'P0002',20);
INSERT INTO DETALLEBOLETA VALUES (2,'P0005',10);
INSERT INTO DETALLEBOLETA VALUES (2,'P0003',15);
INSERT INTO DETALLEBOLETA VALUES (3,'P0005',19);
INSERT INTO DETALLEBOLETA VALUES (4,'P0001',19);
INSERT INTO DETALLEBOLETA VALUES (4,'P0005',15);
INSERT INTO DETALLEBOLETA VALUES (4,'P0003',11);
INSERT INTO DETALLEBOLETA VALUES (5,'P0002',15);
INSERT INTO DETALLEBOLETA VALUES (5,'P0005',10);
INSERT INTO DETALLEBOLETA VALUES (6,'P0003',19);
INSERT INTO DETALLEBOLETA VALUES (7,'P0002',11);
INSERT INTO DETALLEBOLETA VALUES (8,'P0001',10);
INSERT INTO DETALLEBOLETA VALUES (9,'P0005',11);

/* Listando todos los registros */
SELECT * FROM CLIENTE;
SELECT * FROM DISTRITO;
SELECT * FROM PRODUCTO;
SELECT * FROM DETALLEBOLETA;
SELECT * FROM BOLETA;

Select * from cliente C inner join distrito D on C.id_Distrito=D.id_Distrito;
Select * from boleta B inner join cliente C on B.id_Cliente=C.id_Cliente;

Drop procedure if exists sp_listadoproducto;
create procedure sp_listadoproducto()
select * from producto order by 1 asc;

Drop procedure if exists sp_buscaproducto;
create procedure sp_buscaproducto(cod char(5))
	Select * from producto where id_Producto=cod;
    
Drop procedure if exists sp_actualizaproducto;
create procedure sp_actualizaproducto(cod char(5), des varchar(30), pre varchar(30), sto varchar(30), fech varchar(40)) update producto set descripcion=des, Precio=pre, 
                                      Stock=sto, Fecha_Venc=fech where id_Producto=cod;    

Drop procedure if exists sp_insertaproducto;
create procedure sp_insertaproducto(cod char(5), des varchar(50), pre decimal(8,2), sto int, fec date)
insert into producto values(cod,des,pre,sto,fec);

Drop procedure if exists sp_eliminaproducto;
create procedure sp_eliminaproducto(cod char(5))
    Delete from producto
                    where id_Producto=cod;

Drop procedure if exists sp_distritos;
create procedure sp_distritos()
select * from distrito;

Drop procedure if exists sp_listadoclientes;
create procedure sp_listadoclientes()
select C.id_Cliente, concat(C.nombres," ",C.paterno," ",C.materno) as cliente, C.direccion, C.fono, D.descripcion, C.email
						    from Cliente C inner join Distrito D on C.id_Distrito=D.id_Distrito order by 1 asc;

Drop procedure if exists sp_buscacliente;
create procedure sp_buscacliente(cod char(5))
	Select * from cliente where id_Cliente=cod;
    
Drop procedure if exists sp_actualizacliente;
create procedure sp_actualizacliente(cod char(5), nom varchar(30), pat varchar(30), mat varchar(30), dir varchar(40), tel char(15),
								     dis char(3), cor varchar(50)) update cliente set nombres=nom, paterno=pat, materno=mat, direccion=dir,
                                     fono=tel, id_Distrito=dis, Email=cor where id_Cliente=cod;
                            
Drop procedure if exists sp_nuevocliente;
create procedure sp_nuevocliente(cod char(5), nom varchar(30), pat varchar(30), mat varchar(30), 
                                dir varchar(40), tel char(15), dis char(3), cor varchar(50))
insert into cliente values(cod,nom,pat,mat,dir,tel,dis,cor);

Drop procedure if exists sp_eliminacliente;
create procedure sp_eliminacliente(cod char(5))
    Delete from cliente
                    where id_Cliente=cod;
DROP PROCEDURE IF EXISTS sp_distritos;
CREATE PROCEDURE sp_distritos()
	SELECT * 
		FROM DISTRITO;

DROP PROCEDURE IF EXISTS sp_listadoclientes;
CREATE PROCEDURE sp_listadoclientes()
	SELECT C.ID_CLIENTE,
		CONCAT(C.NOMBRES,' ',C.PATERNO,' ',C.MATERNO) AS CLIENTE,
		C.DIRECCION,C.FONO,D.DESCRIPCION,C.EMAIL
		FROM CLIENTE C 
		INNER JOIN DISTRITO D 
		ON C.ID_DISTRITO=D.ID_DISTRITO
		ORDER BY 1 ASC;

DROP PROCEDURE IF EXISTS sp_nuevocliente;
CREATE PROCEDURE sp_nuevocliente(	COD CHAR(5),NOM VARCHAR(30),
						PAT VARCHAR(30),MAT VARCHAR(30),
						DIR VARCHAR(40),TEL CHAR(15),
						DIS CHAR(3),COR VARCHAR(50))
	INSERT INTO cliente VALUES(cod,nom,pat,mat,dir,tel,dis,cor);
