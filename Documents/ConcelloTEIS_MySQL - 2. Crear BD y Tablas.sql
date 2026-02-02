
DROP DATABASE IF EXISTS EmpresasTEIS;
CREATE DATABASE 		EmpresasTEIS
		CHAR SET		utf32
        collate 		utf32_spanish2_ci;
USE			EmpresasTEIS;

	CREATE TABLE Depto (
    
		Depto				INT,
		Sigla				VARCHAR(4),
		Nome				VARCHAR(20),
		Ciudad				VARCHAR(30),
		Pais				VARCHAR(15),
		Tf					VARCHAR(15),
		SupJer				INT
    
    );

    
    CREATE TABLE Emple (
    
		Emp					INT,
        Nome				VARCHAR(30),
        Apel1				VARCHAR(30),
        Apel2				VARCHAR(30),
        Sal					DECIMAL(6,2),
        Fecinc				DATE
    
    );
    
    
    CREATE TABLE Asign (
    
		CodAsi				INT,
        Emp					INT,
        Dpto				INT,
        FecAsi				DATE,
        FecCan				DATE
    
    
    );
    

------------------------------------------------------------------------------------------   
----     EJERCICIO2: APARTADO A)->(--1)----------CREAR LAS --PRIMARY --KEYS----------------
------------------------------------------------------------------------------------------
	
ALTER TABLE Depto ADD CONSTRAINT PRIMARY KEY ( depto );
ALTER TABLE Emple ADD CONSTRAINT PRIMARY KEY ( emple );
ALTER TABLE Asign ADD CONSTRAINT PRIMARY KEY ( codAsi );


------------------------------------------------------------------------------------------   
----     EJERCICIO2: APARTADO A)->(--2)----------CREAR LAS --FOREIGN --KEYS---------------
------------------------------------------------------------------------------------------

ALTER TABLE Depto ADD CONSTRAINT FK_superJer FOREIGN KEY ( supJer ) REFERENCES Depto ( depto );
ALTER TABLE Asign ADD CONSTRAINT FK_emp_asign FOREIGN KEY ( emp ) REFERENCES Emple ( emp );
ALTER TABLE Asign ADD CONSTRAINT FK_dpto_asign	FOREIGN

------------------------------------------------------------------------------------------   
---- EJERCICIO2: APARTADO A)--3)----------RESTRICCIONES DE VALORES --NO NULOS-------------
------------------------------------------------------------------------------------------

ALTER TABLE Depto MODIFY Sigla 	VARCHAR(10) NOT NULL;
ALTER TABLE Depto MODIFY Nome 	VARCHAR(50) NOT NULL;
ALTER TABLE Depto MODIFY Pais 	VARCHAR(30) NOT NULL;

ALTER TABLE Emple MODIFY Nome 	VARCHAR(50) NOT NULL;
ALTER TABLE Emple MODIFY Apel1 	VARCHAR(50) NOT NULL;
ALTER TABLE Emple MODIFY FecAsi DATE NOT NULL;

ALTER TABLE Asign MODIFY emp	INT NOT NULL;
ALTER TABLE Asign MODIFY dpto 	INT NOT NULL;
ALTER TABLE Asign MODIFY FecAsi DATE NOT NULL;

------------------------------------------------------------------------------------------   
---- EJERCICIO2: APARTADO A)--4)----------MODIFICAR TIPOS DE DATOS EN LAS TABLAS-----------
------------------------------------------------------------------------------------------

ALTER TABLE Depto MODIFY Sal 	UNSIGNED INT NULL;
ALTER TABLE Depto MODIFY Ciudad VARCHAR(50) NOT NULL;

------------------------------------------------------------------------------------------   
---- EJERCICIO2: APARTADO A)--5)----------RESTRICCIONES DE COMPARACIÓN -------------------
------------------------------------------------------------------------------------------


--------------------------------------------------------------------------------------------   
----  EJERCICIO 3: ----------CREAR LAS PRIMARY KEYS----------------------------------------
--------------------------------------------------------------------------------------------