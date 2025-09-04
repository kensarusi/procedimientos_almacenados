CREATE TRIGGER trg_AfterInsertFeria
ON Feria
AFTER INSERT
AS
BEGIN
    PRINT 'Se insertó una nueva Feria, ejecutando reporte...';

    EXEC ejecutarConsultas;
END;
GO
