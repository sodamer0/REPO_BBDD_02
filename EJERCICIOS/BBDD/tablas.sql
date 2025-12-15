--------------------------------------------------------------
-- 1. Creación de la base de datos y uso
--------------------------------------------------------------
-- Crear la base de datos si no existe
CREATE DATABASE IF NOT EXISTS empresaTeisConsultas;

-- Usar la base de datos
USE empresaTeisConsultas;


--------------------------------------------------------------

--------------------------------------------------------------
-- Eliminar la tabla de detalles, que referencia a Venta y Producto
DROP TABLE IF EXISTS Detalles;

-- Eliminar la tabla de venta, que referencia a Usuario, Administrador y Envio
DROP TABLE IF EXISTS Venta;

-- Eliminar la tabla de producto, que referencia a Administrador
DROP TABLE IF EXISTS Producto;

-- Eliminar el resto de tablas
DROP TABLE IF EXISTS Envio;
DROP TABLE IF EXISTS Usuario;
DROP TABLE IF EXISTS Administrador;


--------------------------------------------------------------
-- 3. Creacion de las tablas
--------------------------------------------------------------

--------------------------------------------------------------
-- 3.1. Tabla Administrador
--
-- Información sobre los Administradores
--------------------------------------------------------------
CREATE TABLE Administrador (
	ID_Admin		INT,
	Nombre			VARCHAR( 50 ),
	Mail			VARCHAR( 50 ),
	DNI			    VARCHAR(  9 )  UNIQUE,
	Contraseña		VARCHAR( 50 ),
	Telefono		VARCHAR( 8 ),

	CONSTRAINT Administrador_PK	PRIMARY KEY ( ID_Admin )
);

--------------------------------------------------------------
-- 3.2. Tabla Usuario
--
-- Información de los Usuarios
--------------------------------------------------------------
CREATE TABLE Usuario (
	ID_Usuario		INT,
	Nombre			VARCHAR( 50 ),
	DNI			    VARCHAR(  9 )  UNIQUE,
	Telefono		VARCHAR( 8 ),
	Contraseña		VARCHAR( 50 ),

	CONSTRAINT Usuario_PK		PRIMARY KEY ( ID_Usuario )
);


--------------------------------------------------------------
-- 3.3. Tabla Producto
--
-- Información de los Productos de la empresa
--------------------------------------------------------------
CREATE TABLE Producto(
	ID_Producto		INT,
	ID_Admin		INT,
	Nombre			VARCHAR( 50 ),
	Precio			DECIMAL( 8, 2 ), -- DECIMAL en lugar de NUMBER(8, 2) de Oracle

	CONSTRAINT Producto_PK		PRIMARY KEY ( ID_Producto )
);


--------------------------------------------------------------
-- 3.4. Tabla Envio
--
-- Información del estado de los Envíos
--------------------------------------------------------------
CREATE TABLE Envio (
	ID_Envio		INT,
	ID_Camion		INT,
	Estado			VARCHAR( 50 ),

	CONSTRAINT Envio_PK		PRIMARY KEY ( ID_Envio )
);


--------------------------------------------------------------
-- 3.5. Tabla Venta
--
-- Información de las Ventas de los Productos
--------------------------------------------------------------
CREATE TABLE Venta (
	ID_Venta		INT,
	ID_Usuario		INT,
	ID_Admin		INT,
	ID_Envio		INT,
	CantidadTotal	INT,
	Fecha			DATE, -- DATE en lugar de TO_DATE de Oracle

	CONSTRAINT Venta_PK		PRIMARY KEY ( ID_Venta )
);


--------------------------------------------------------------
-- 3.6. Tabla Detalles
--
-- Información los detalles de las Ventas de los Productos
--------------------------------------------------------------
CREATE TABLE Detalles (
	ID_Producto		INT,
	CantComprada	INT,
	ID_Venta		INT,

	CONSTRAINT Detalles_PK		PRIMARY KEY ( ID_Venta, ID_Producto )
);


--------------------------------------------------------------
--------------------------------------------------------------
-- 4. Crear llaves foráneas
--------------------------------------------------------------
--------------------------------------------------------------
-- ALTER TABLE Producto (ID_Admin) REFERENCIA Administrador (ID_Admin)
ALTER TABLE Producto    ADD CONSTRAINT FK_Producto_Administrador    FOREIGN KEY ( ID_Admin )    REFERENCES  Administrador ( ID_Admin )  ON DELETE CASCADE;

-- ALTER TABLE Detalles (ID_Producto) REFERENCIA Producto (ID_Producto)
ALTER TABLE Detalles    ADD CONSTRAINT FK_Detalles_Producto         FOREIGN KEY ( ID_Producto ) REFERENCES  Producto ( ID_Producto )    ON DELETE CASCADE;
-- ALTER TABLE Detalles (ID_Venta) REFERENCIA Venta (ID_Venta)
ALTER TABLE Detalles    ADD CONSTRAINT FK_Detalles_Venta            FOREIGN KEY ( ID_Venta )    REFERENCES  Venta ( ID_Venta )          ON DELETE CASCADE;

-- ALTER TABLE Venta (ID_Admin) REFERENCIA Administrador (ID_Admin)
ALTER TABLE Venta       ADD CONSTRAINT FK_Venta_Administrador       FOREIGN KEY ( ID_Admin )    REFERENCES  Administrador ( ID_Admin )  ON DELETE CASCADE;
-- ALTER TABLE Venta (ID_Usuario) REFERENCIA Usuario (ID_Usuario)
ALTER TABLE Venta       ADD CONSTRAINT FK_Venta_Usuario             FOREIGN KEY ( ID_Usuario )  REFERENCES  Usuario ( ID_Usuario )      ON DELETE CASCADE;
-- ALTER TABLE Venta (ID_Envio) REFERENCIA Envio (ID_Envio)
ALTER TABLE Venta       ADD CONSTRAINT FK_Venta_Envio               FOREIGN KEY ( ID_Envio )    REFERENCES  Envio ( ID_Envio )          ON DELETE CASCADE;