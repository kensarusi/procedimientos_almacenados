CREATE PROCEDURE ejecutarConsultas
AS
BEGIN

    SELECT 
        pab.tematica        AS tema_pabellon,
        emp.nombre          AS empresa,
        fer.nombre          AS feria
    FROM Stand st
    JOIN Pabellon pab      ON st.id_pabellon = pab.id
    JOIN Empresa emp       ON st.id_empresa  = emp.id
    JOIN Feria fer         ON pab.id_feria   = fer.id;

    SELECT 
        vis.nombre          AS visitante,
        tip.nombre          AS entrada,
        cha.tematica        AS charla_tema,
        pon.nombre          AS ponente
    FROM Charla_Visitante chv
    JOIN Visitante vis     ON chv.id_visitante = vis.id
    JOIN TipoEntrada tip   ON vis.id_tipoEntrada = tip.id
    JOIN Charlas cha       ON chv.id_charla = cha.id
    JOIN PonenteCharla pon ON cha.id_ponente = pon.id;

    SELECT 
        prot.nombre         AS prototipo,
        resp.nombre         AS responsable,
        emp.nombre          AS empresa_asociada
    FROM Prototipo prot
    JOIN Responsable resp  ON prot.id_responsable = resp.id
    JOIN Empresa emp       ON prot.id_empresa     = emp.id;
END;
GO
