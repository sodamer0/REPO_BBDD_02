
DROP DATABASE IF EXISTS EmpresasTEIS;
CREATE DATABASE 		EmpresasTEIS
		CHAR SET		utf32
        collate 		utf32_spanish2_ci;
USE			EmpresasTEIS;

	CREATE TABLE depto (
    
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
