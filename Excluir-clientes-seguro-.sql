excluir clientes que tienen actualmente seguro de coche

SELECT CodCliente, Nombre, Apellido, CorreoElectronico, Móvil
FROM DE_Clientes
WHERE Seguro_Activo != 'AUTOS';
