-- Combinar todos los criterios en un query y guardar los datos en nueva data extension DE_HISTORIALDECLIENTES---


SELECT c.CodCliente, c.Nombre, c.Apellido, c.CorreoElectronico, c.Móvil
FROM DE_Clientes
WHERE (YEAR(GETDATE()) - YEAR(Año_nacimiento)) BETWEEN 25 AND 40
  AND Ciudad IN ('MADRID', 'BARCELONA')
  AND CodCliente IN (
        SELECT CodCliente
        FROM DE_Clientes
        WHERE Seguro_Anulado = 'AUTOS'
    )
  AND Seguro_Activo != 'AUTOS'
  AND (CorreoElectronico IS NOT NULL AND CorreoElectronico <> '')
  AND (Móvil IS NOT NULL AND Móvil <> '');

