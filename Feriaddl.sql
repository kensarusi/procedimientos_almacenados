DELIMITER

CREATE PROCEDURE generarBaseDatos()
BEGIN
    CREATE DATABASE IF NOT EXISTS Ferias;
END 

DELIMITER 

CREATE PROCEDURE definirTablas()
BEGIN

    CREATE TABLE Feria(
        id              INT PRIMARY KEY,
        nombre          VARCHAR(100) NOT NULL,
        ciudad          VARCHAR(100),
        fecha_inicio    DATE,
        fecha_fin       DATE,
        cantidadPab     INT
    );

    CREATE TABLE Pabellon(
        id              INT PRIMARY KEY,
        tematica        VARCHAR(50),
        id_feria        INT NOT NULL,
        cantidadStands  INT,
        CONSTRAINT fk_pab_feria FOREIGN KEY(id_feria) REFERENCES Feria(id)
    );

    CREATE TABLE Empresa(
        id              INT PRIMARY KEY,
        nombre          VARCHAR(120) NOT NULL
    );

    CREATE TABLE Stand(
        id              INT PRIMARY KEY,
        id_empresa      INT NOT NULL,
        id_pabellon     INT NOT NULL,
        CONSTRAINT fk_stand_emp FOREIGN KEY(id_empresa) REFERENCES Empresa(id),
        CONSTRAINT fk_stand_pab FOREIGN KEY(id_pabellon) REFERENCES Pabellon(id)
    );

    CREATE TABLE Responsable(
        id              INT PRIMARY KEY,
        nombre          VARCHAR(120),
        telefono        VARCHAR(20)
    );

    CREATE TABLE Prototipo(
        id              INT PRIMARY KEY,
        nombre          VARCHAR(120),
        id_empresa      INT NOT NULL,
        id_responsable  INT NOT NULL,
        CONSTRAINT fk_proto_emp FOREIGN KEY(id_empresa) REFERENCES Empresa(id),
        CONSTRAINT fk_proto_resp FOREIGN KEY(id_responsable) REFERENCES Responsable(id)
    );

    CREATE TABLE TipoEntrada(
        id              INT PRIMARY KEY,
        nombre          VARCHAR(80),
        beneficios      VARCHAR(150)
    );

    CREATE TABLE Visitante(
        id              INT PRIMARY KEY,
        nombre          VARCHAR(120),
        telefono        VARCHAR(20),
        tipoRegistro    VARCHAR(60) NOT NULL,
        id_tipoEntrada  INT NOT NULL,
        CONSTRAINT fk_vis_tipo FOREIGN KEY(id_tipoEntrada) REFERENCES TipoEntrada(id)
    );

    CREATE TABLE PonenteCharla(
        id              INT PRIMARY KEY,
        nombre          VARCHAR(120),
        especialidad    VARCHAR(120)
    );

    CREATE TABLE Charlas(
        id              INT PRIMARY KEY,
        tematica        VARCHAR(120),
        fecha           DATETIME,
        id_empresa      INT NOT NULL,
        id_ponente      INT NOT NULL,
        CONSTRAINT fk_charla_emp FOREIGN KEY(id_empresa) REFERENCES Empresa(id),
        CONSTRAINT fk_charla_pon FOREIGN KEY(id_ponente) REFERENCES PonenteCharla(id)
    );

    CREATE TABLE Charla_Visitante(
        id_charla       INT,
        id_visitante    INT,
        PRIMARY KEY(id_charla, id_visitante),
        FOREIGN KEY(id_charla) REFERENCES Charlas(id),
        FOREIGN KEY(id_visitante) REFERENCES Visitante(id)
    );

END 

DELIMITER ;
