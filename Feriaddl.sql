CREATE OR ALTER PROCEDURE generarBaseDatos
AS
BEGIN
    IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'Ferias')
    BEGIN
        CREATE DATABASE Ferias;
    END
END;
GO
    
CREATE OR ALTER PROCEDURE definirTablas
AS
BEGIN
    USE Ferias;

    IF OBJECT_ID('Feria') IS NULL
    BEGIN
        CREATE TABLE Feria(
            id              INT PRIMARY KEY,
            nombre          VARCHAR(100) NOT NULL,
            ciudad          VARCHAR(100),
            fecha_inicio    DATE,
            fecha_fin       DATE,
            cantidadPab     INT
        );
    END;

    IF OBJECT_ID('Pabellon') IS NULL
    BEGIN
        CREATE TABLE Pabellon(
            id              INT PRIMARY KEY,
            tematica        VARCHAR(50),
            id_feria        INT NOT NULL,
            cantidadStands  INT,
            CONSTRAINT fk_pab_feria FOREIGN KEY(id_feria) REFERENCES Feria(id)
        );
    END;

    IF OBJECT_ID('Empresa') IS NULL
    BEGIN
        CREATE TABLE Empresa(
            id              INT PRIMARY KEY,
            nombre          VARCHAR(120) NOT NULL
        );
    END;

    IF OBJECT_ID('Stand') IS NULL
    BEGIN
        CREATE TABLE Stand(
            id              INT PRIMARY KEY,
            id_empresa      INT NOT NULL,
            id_pabellon     INT NOT NULL,
            CONSTRAINT fk_stand_emp FOREIGN KEY(id_empresa) REFERENCES Empresa(id),
            CONSTRAINT fk_stand_pab FOREIGN KEY(id_pabellon) REFERENCES Pabellon(id)
        );
    END;

    IF OBJECT_ID('Responsable') IS NULL
    BEGIN
        CREATE TABLE Responsable(
            id              INT PRIMARY KEY,
            nombre          VARCHAR(120),
            telefono        VARCHAR(20)
        );
    END;

    IF OBJECT_ID('Prototipo') IS NULL
    BEGIN
        CREATE TABLE Prototipo(
            id              INT PRIMARY KEY,
            nombre          VARCHAR(120),
            id_empresa      INT NOT NULL,
            id_responsable  INT NOT NULL,
            CONSTRAINT fk_proto_emp FOREIGN KEY(id_empresa) REFERENCES Empresa(id),
            CONSTRAINT fk_proto_resp FOREIGN KEY(id_responsable) REFERENCES Responsable(id)
        );
    END;

    IF OBJECT_ID('TipoEntrada') IS NULL
    BEGIN
        CREATE TABLE TipoEntrada(
            id              INT PRIMARY KEY,
            nombre          VARCHAR(80),
            beneficios      VARCHAR(150)
        );
    END;

    IF OBJECT_ID('Visitante') IS NULL
    BEGIN
        CREATE TABLE Visitante(
            id              INT PRIMARY KEY,
            nombre          VARCHAR(120),
            telefono        VARCHAR(20),
            tipoRegistro    VARCHAR(60) NOT NULL,
            id_tipoEntrada  INT NOT NULL,
            CONSTRAINT fk_vis_tipo FOREIGN KEY(id_tipoEntrada) REFERENCES TipoEntrada(id)
        );
    END;

    IF OBJECT_ID('PonenteCharla') IS NULL
    BEGIN
        CREATE TABLE PonenteCharla(
            id              INT PRIMARY KEY,
            nombre          VARCHAR(120),
            especialidad    VARCHAR(120)
        );
    END;

    IF OBJECT_ID('Charlas') IS NULL
    BEGIN
        CREATE TABLE Charlas(
            id              INT PRIMARY KEY,
            tematica        VARCHAR(120),
            fecha           DATETIME,
            id_empresa      INT NOT NULL,
            id_ponente      INT NOT NULL,
            CONSTRAINT fk_charla_emp FOREIGN KEY(id_empresa) REFERENCES Empresa(id),
            CONSTRAINT fk_charla_pon FOREIGN KEY(id_ponente) REFERENCES PonenteCharla(id)
        );
    END;

    IF OBJECT_ID('Charla_Visitante') IS NULL
    BEGIN
        CREATE TABLE Charla_Visitante(
            id_charla       INT NOT NULL,
            id_visitante    INT NOT NULL,
            PRIMARY KEY(id_charla, id_visitante),
            FOREIGN KEY(id_charla) REFERENCES Charlas(id),
            FOREIGN KEY(id_visitante) REFERENCES Visitante(id)
        );
    END;
END;
GO
