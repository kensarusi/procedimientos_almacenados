USE Ferias;
GO

CREATE OR ALTER PROCEDURE cargarDatosNuevos
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Feria (id, nombre, ciudad, fecha_inicio, fecha_fin, cantidadPab)
    VALUES
        (1, 'ExpoInnovación 2025', 'Medellín', '2025-03-10', '2025-03-12', 2),
        (2, 'AgroFuturo', 'Bogotá', '2025-05-05', '2025-05-07', 3),
        (3, 'Ciencia Viva', 'Cali', '2025-08-01', '2025-08-03', 4),
        (4, 'ExpoTecnología Andina', 'Pereira', '2025-09-20', '2025-09-22', 2),
        (5, 'Feria Internacional del Libro', 'Barranquilla', '2025-10-15', '2025-10-18', 3);

    INSERT INTO Empresa (id, nombre)
    VALUES
        (1, 'TecnoAndes S.A.'),
        (2, 'AgroPlus Ltda.'),
        (3, 'BioFuture Corp.'),
        (4, 'SoftLogic Inc.'),
        (5, 'Lectura Digital S.A.S.'),
        (6, 'NanoHealth Co.'),
        (7, 'AgroVision'),
        (8, 'SmartRobotics S.A.'),
        (9, 'EnerGreen Global'),
        (10, 'DataSolutions Ltda.');

    INSERT INTO Responsable (id, nombre, telefono)
    VALUES
        (1, 'Camilo Herrera', '3111234567'),
        (2, 'Juliana Torres', '3129876543'),
        (3, 'Sofía Ramírez', '3132345678'),
        (4, 'Andrés Vargas', '3143456789'),
        (5, 'Paola Méndez', '3154567890'),
        (6, 'Felipe Castaño', '3165678901'),
        (7, 'Valeria López', '3176789012'),
        (8, 'Esteban Gómez', '3187890123'),
        (9, 'Natalia Cruz', '3198901234'),
        (10,'Mauricio Silva', '3209012345');

    INSERT INTO Pabellon (id, tematica, cantidadStands, id_feria)
    VALUES
        (1, 'Robótica', 6, 1),
        (2, 'Inteligencia Artificial', 8, 1),
        (3, 'Agricultura Inteligente', 5, 2),
        (4, 'Sistemas de Riego', 4, 2),
        (5, 'Producción Sostenible', 7, 2),
        (6, 'Física Aplicada', 6, 3),
        (7, 'Química Verde', 5, 3),
        (8, 'Biotecnología', 7, 3),
        (9, 'Astronomía', 4, 3),
        (10, 'Energías Limpias', 6, 4);

    INSERT INTO Prototipo (id, nombre, id_responsable, id_empresa)
    VALUES
        (1, 'AgroDrone', 1, 2),
        (2, 'NanoCare', 2, 6),
        (3, 'SoftBrain', 3, 4),
        (4, 'EcoPanel', 4, 9),
        (5, 'VirtualBook', 5, 5),
        (6, 'RoboFarm', 6, 7),
        (7, 'DataShield', 7, 10),
        (8, 'HealthTrack', 8, 6),
        (9, 'SmartGrow', 9, 2),
        (10,'GreenCharge', 10, 9);

    INSERT INTO TipoEntrada (id, nombre, beneficios)
    VALUES
        (1, 'Básica', 'Acceso general a pabellones'),
        (2, 'Premium', 'Acceso total + talleres prácticos'),
        (3, 'Estudiante', 'Acceso a pabellones y zona académica');

    INSERT INTO Visitante (id, nombre, telefono, tipoRegistro, id_tipoEntrada)
    VALUES
        (1,'Andrés López', '3211111111','En línea', 1),
        (2,'Mariana Torres', '3222222222','Presencial', 2),
        (3,'Julián Gómez', '3233333333','En línea', 3),
        (4,'Natalia Ruiz','3244444444','Presencial', 1),
        (5,'Camila Soto','3255555555','En línea', 2),
        (6,'Pedro Ramírez','3266666666','Presencial', 3),
        (7,'Santiago Vargas','3277777777','Presencial', 1),
        (8,'Laura Fernández','3288888888','En línea', 3),
        (9,'Felipe Morales','3299999999','Presencial', 2),
        (10,'Daniela Quintero','3300000000','En línea', 1);

    INSERT INTO PonenteCharla (id, nombre, especialidad)
    VALUES
        (1,'Dr. Jorge Pérez', 'Robótica Industrial'),
        (2,'Ing. Diana Torres', 'Agricultura de Precisión'),
        (3,'PhD. Alejandro Ríos', 'Energías Renovables'),
        (4,'MSc. Laura Cárdenas', 'Neurociencia'),
        (5,'Dr. Mateo Suárez', 'Nanomedicina'),
        (6,'Lic. Fernanda Cruz', 'Educación STEM'),
        (7,'Dra. Valentina Correa', 'Ciberseguridad'),
        (8,'Dr. Sebastián López', 'Biotecnología'),
        (9,'Ing. Paula Mendoza', 'Impresión 3D'),
        (10,'Dr. Ricardo Castillo','Big Data y Análisis');

    INSERT INTO Charlas (id, tematica, fecha, id_empresa, id_ponente)
    VALUES
        (1,'Robots en la Industria','2025-03-10 10:00:00', 1, 1),
        (2,'Agricultura Inteligente','2025-03-10 12:00:00', 2, 2),
        (3,'Paneles Solares Avanzados','2025-03-11 09:00:00', 9, 3),
        (4,'Cerebro y Tecnología','2025-03-11 11:00:00', 4, 4),
        (5,'Nanomedicina del Futuro','2025-03-11 14:00:00', 6, 5),
        (6,'STEM en las Escuelas','2025-03-11 16:00:00', 5, 6),
        (7,'Seguridad Digital','2025-03-12 10:00:00', 10, 7),
        (8,'Avances en Biotecnología','2025-03-12 12:00:00', 3, 8),
        (9,'Impresión 3D y Salud','2025-03-12 15:00:00', 8, 9),
        (10,'Big Data para Negocios','2025-03-12 17:00:00', 10, 10);

    INSERT INTO Charla_Visitante (id_charla, id_visitante)
    VALUES
        (1,1),(2,2),(3,3),(4,4),(5,5),
        (6,6),(7,7),(8,8),(9,9),(10,10);

    INSERT INTO Stand (id, id_empresa, id_pabellon)
    VALUES
        (1,1,1),(2,2,1),(3,3,2),
        (4,4,2),(5,5,3),(6,6,4),
        (7,7,5),(8,8,6),(9,9,7),(10,10,8);
END;
GO
