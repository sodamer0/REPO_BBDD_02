--------------------------------------------------------------
-- 1. Creación del usuario y conexión con la base de datos PlantasTeis
--------------------------------------------------------------
-- Conexión como Administradores abc123.
--CONN sys as sysdba;

-- Creación  del usuario
--DROP USER   c##EmpresasTEIS;
--CREATE USER c##EmpresasTEIS  IDENTIFIED BY abc   DEFAULT TABLESPACE USERS;

-- Concesión de los privilegios necesarios
--GRANT CONNECT, RESOURCE, DBA TO c##EmpresasTEIS;

-- Conectarse al esquema GBD04_Campeonato
ALTER SESSION SET CURRENT_SCHEMA = c##EmpresasTEIS;


--------------------------------------------------------------
-- 2. Creacion de las tablas
--------------------------------------------------------------

--------------------------------------------------------------
-- 2.1. Tabla Producto
--
-- Información de los Productos de la empresa (Concello de Vigo)
--------------------------------------------------------------
DROP 	TABLE Producto CASCADE CONSTRAINTS PURGE;
CREATE 	TABLE Producto(
	ID_Producto		INT,
	ID_Admin		INT,
	Nombre			VARCHAR2( 50 ),
	Precio			NUMBER( 8, 2 ),

	CONSTRAINT Producto_PK		PRIMARY KEY ( ID_Producto )
);

--------------------------------------------------------------
-- 2.2. Tabla Administrador
--
-- Información sobre los Administradores
--------------------------------------------------------------
DROP    TABLE   Administrador CASCADE CONSTRAINTS PURGE;
CREATE  TABLE   Administrador (
	ID_Admin		INT,
	Nombre			VARCHAR2( 50 ),
	Mail			VARCHAR2( 50 ),
	DNI			    VARCHAR2(  9 )  UNIQUE,
	Contraseña		VARCHAR2( 50 ),
	Telefono		VARCHAR2(  8 ),

	CONSTRAINT Administrador_PK	PRIMARY KEY ( ID_Admin )
);


--------------------------------------------------------------
-- 2.3. Tabla Detalles
--
-- Información los detalles de las Ventas de los Productos
--------------------------------------------------------------
DROP    TABLE   Detalles CASCADE CONSTRAINTS PURGE;
CREATE  TABLE   Detalles (
	ID_Producto		INT,
	CantComprada	INT,
	ID_Venta		INT,

	CONSTRAINT Detalles_PK		PRIMARY KEY ( ID_Venta, ID_Producto )
);

--------------------------------------------------------------
-- 2.4. Tabla Venta
--
-- Información de las Ventas de los Productos
--------------------------------------------------------------
DROP    TABLE   Venta CASCADE CONSTRAINTS PURGE;
CREATE  TABLE   Venta (
	ID_Venta		INT,
	ID_Usuario		INT,
	ID_Admin		INT,
	ID_Envio		INT,
	CantidadTotal	INT,
	Fecha			DATE,

	CONSTRAINT Venta_PK		PRIMARY KEY ( ID_Venta )
);

--------------------------------------------------------------
-- 2.5. Tabla Envio
--
-- Información de las Ventas de los Productos
--------------------------------------------------------------
DROP    TABLE   Envio CASCADE CONSTRAINTS PURGE;
CREATE  TABLE   Envio (
	ID_Envio		INT,
	ID_Camion		INT,
	Estado			VARCHAR2( 50 ),

	CONSTRAINT Envio_PK		PRIMARY KEY ( ID_Envio )
);

--------------------------------------------------------------
-- 2.6. Tabla Usuario
--
-- Información de las Ventas de los Productos
--------------------------------------------------------------
DROP    TABLE   Usuario CASCADE CONSTRAINTS PURGE;
CREATE  TABLE   Usuario (
	ID_Usuario		INT,
	Nombre			VARCHAR2( 50 ),
	DNI			    VARCHAR2(  9 )  UNIQUE,
	Telefono		VARCHAR2(  8 ),
	Contraseña		VARCHAR2( 50 ),

	CONSTRAINT Usuario_PK		PRIMARY KEY ( ID_Usuario )
);




--------------------------------------------------------------
--------------------------------------------------------------
-- 3. Crear llaves foráneas
--------------------------------------------------------------
--------------------------------------------------------------
ALTER TABLE Producto    ADD CONSTRAINT FK_Producto_Administrador    FOREIGN KEY ( ID_Admin )    REFERENCES  Administrador ( ID_Admin )  ON DELETE CASCADE;

ALTER TABLE Detalles    ADD CONSTRAINT FK_Detalles_Producto         FOREIGN KEY ( ID_Producto ) REFERENCES  Producto ( ID_Producto )    ON DELETE CASCADE;
ALTER TABLE Detalles    ADD CONSTRAINT FK_Detalles_Venta            FOREIGN KEY ( ID_Venta )    REFERENCES  Venta ( ID_Venta )          ON DELETE CASCADE;

ALTER TABLE Venta       ADD CONSTRAINT FK_Venta_Administrador       FOREIGN KEY ( ID_Admin )    REFERENCES  Administrador ( ID_Admin )  ON DELETE CASCADE;
ALTER TABLE Venta       ADD CONSTRAINT FK_Venta_Usuario             FOREIGN KEY ( ID_Usuario )  REFERENCES  Usuario ( ID_Usuario )      ON DELETE CASCADE;
ALTER TABLE Venta       ADD CONSTRAINT FK_Venta_Envio               FOREIGN KEY ( ID_Envio )    REFERENCES  Envio ( ID_Envio )          ON DELETE CASCADE;

