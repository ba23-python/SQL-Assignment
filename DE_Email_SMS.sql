SELECT CorreoElectronico, Móvil
FROM DE_Clientes
WHERE 
  (DATEPART(year, GETDATE()) - DATEPART(year, Año_nacimiento)) BETWEEN 25 AND 40
  AND Ciudad IN ('MADRID', 'BARCELONA')
  AND CodCliente IN (
        SELECT CodCliente
        FROM DE_Clientes
        WHERE Seguro_Anulado = 'AUTOS'
    )
  AND Seguro_Activo != 'AUTOS'
  AND CorreoElectronico IS NOT NULL
  AND CorreoElectronico <> ''
  AND Móvil IS NOT NULL
  AND Móvil <> '';

Explicación:
Función DATEPART: aplico la función DATEPART, que extrae partes de una fecha. 
Aquí, se utiliza para obtener el año de la fecha actual y el año de nacimiento para calcular la edad.
Filtro de Ciudad: Asegura que los clientes sean de Madrid o Barcelona.
Seguro de automóvil anterior: la subconsulta verifica si el cliente tuvo un seguro de automóvil en el pasado.
Excluir seguro de automóvil actual: Garantiza que el cliente no tenga actualmente un seguro de automóvil.
Correo electrónico y móvil no vacíos: garantiza que los campos de correo electrónico y móvil no sean nulos ni estén vacíos.


El resultado de esta segmentacion seria
CodCliente ABC129 (JUAN MORALES) como el unico suscriptor cumple la condicion de disponer de email y movil en el mismo tiempo
Edad: 36 (born in 1988)
Cuidad: Barcelona
Past car insurance (Seguro_Anulado = 'AUTOS')
No current car insurance (Seguro_Activo != 'AUTOS')
Non-empty email and mobile

Los demas suscriptores 
ABC123 (sin movil)
ABC124 (sin email)
ABC128 (sin email)