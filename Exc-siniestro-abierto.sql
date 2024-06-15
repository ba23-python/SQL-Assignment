Excluir clientes con siniestro abierto

SELECT c.CodCliente, c.Nombre, c.Apellido, c.CorreoElectronico, c.Móvil
FROM DE_Clientes c
LEFT JOIN Siniestros s 
ON c.CodCliente = s.CodCliente 
AND s.Estado = 'ABIERTO'
WHERE s.CodCliente IS NULL;
