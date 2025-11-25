DROP TABLE IF EXISTS PRODUCTO;
DROP TABLE IF EXISTS ADMINISTRADOR;
DROP TABLE IF EXISTS DETALLES;
DROP TABLE IF EXISTS VENTA;
DROP TABLE IF EXISTS ENVIO;
DROP TABLE IF EXISTS USUARIO;

CREATE TABLE USUARIO (

  id_usuario            NT,
  nombre                VARCHAR(30),
  dni                   VARCHAR(20),
  telefono              VARCHAR(20),
  contrasenha           VARCHAR(30)
);

CREATE TABLE ENVIO (

  id_envio              INT,
  id_camion             INT,
  estado                VARCHAR(30)

);

CREATE TABLE VENTA (

  id_venta              INT,
  id_usuario           INT,
  id_admin              INT,
  id_envio              INT,
  cantidadTotal         DECIMAL(5,2),
  fecha                 DATE

);

CREATE TABLE DETALLES (

  id_producto           INT,
  cantComprada          INT,
  id_venta              INT

);

CREATE TABLE ADMINISTRADOR (

  id_admin              INT,
  nombre                VARCHAR(30),
  mail                  VARCHAR(50),
  dni                   VARCHAR(20),
  contrasenha           VARCHAR(30),
  telefono              VARCHAR(20)

);

CREATE TABLE PRODUCTO (

  id_producto           INT,
  id_admin              INT,
  nombre                VARCHAR(30),
  precio                DECIMAL(5,2),
  stock                 INT

);

/*
--------------------------------------------------------------------------------------------
-- 1. Creación de las claves primarias
--------------------------------------------------------------------------------------------
*/

ALTER TABLE USUARIO
  ADD CONSTRAINT PK_Usuario_idUsuario   PRIMARY KEY ( id_usuario );

ALTER TABLE ENVIO
  ADD CONSTRAINT PK_Envio_idEnvio   PRIMARY KEY ( id_envio );

ALTER TABLE VENTA
  ADD CONSTRAINT PK_Venta_idVenta   PRIMARY KEY ( id_venta );

ALTER TABLE DETALLES
  ADD CONSTRAINT PK_Detalles_idDetalle    PRIMARY KEY ( id_producto, id_venta );

ALTER TABLE ADMINISTRADOR
  ADD CONSTRAINT PK_Administrador_idAdmin   PRIMARY KEY ( id_admin );

ALTER TABLE PRODUCTO
  ADD CONSTRAINT PK_Producto_idProducto   PRIMARY KEY ( id_producto );


/*
--------------------------------------------------------------------------------------------
-- 2. Creación de las claves foráneas
--------------------------------------------------------------------------------------------
*/

-- FKs que relacionan USUARIO

ALTER TABLE VENTA
  ADD CONSTRAINT FK_Venta_Usuario FOREIGN KEY ( id_usuario ) REFERENCES USUARIO ( id_usuario );

-- FKs que relacionan ENVIO:

ALTER TABLE VENTA
  ADD CONSTRAINT FK_Venta_Envio   FOREIGN KEY ( id_envio ) REFERENCES VENTA ( id_envio );

-- FKs que relacionan VENTA:

ALTER TABLE DETALLES
  ADD CONSTRAINT FK_Detalles_Venta  FOREIGN KEY ( id_venta ) REFERENCES VENTA ( id_venta );

-- FKs que relacionan ADMINISTRADOR:

ALTER TABLE VENTA
  ADD CONSTRAINT FK_Venta_Administrador   FOREIGN KEY ( id_admin ) REFERENCES ADMINISTRADOR ( id_admin );

ALTER TABLE PRODUCTO
  ADD CONSTRAINT FK_Producto_Administrador  FOREIGN KEY ( id_admin ) REFERENCES ADMINISTRADOR ( id_admin );

-- FKs que relacionan PRODUCTO:

ALTER TABLE DETALLES
  ADD CONSTRAINT FK_Detalles_Producto   FOREIGN KEY ( id_producto ) REFERENCES PRODUCTO ( id_producto );