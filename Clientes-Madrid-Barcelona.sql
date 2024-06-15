Clientes que viven en Madrid y Barcelona

SELECT CodCliente, Nombre, Apellido, CorreoElectronico, Móvil
FROM DE_Clientes
WHERE Ciudad IN ('MADRID', 'BARCELONA');


la segmentacion mostrara los siguientes suscriptores:

ABC123 (Madrid)
ABC124 (Barcelona)
ABC128 (Madrid)
ABC129 (Barcelona)