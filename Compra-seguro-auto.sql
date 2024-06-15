Clientes que han comprado Seguro Auto previamente

SELECT CodCliente, Nombre, Apellido, CorreoElectronico, Móvil
FROM DE_Clientes
WHERE Seguro_Anulado = 'AUTOS';

Debe de filtrar como resultado el cliente:

ABC125 