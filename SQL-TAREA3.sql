

--------------------------------------------------------------

    SELECT 
    m.CorreoElectronico,
    m.Móvil,
    m.CO_CLIENT,
    m.Nombre,
    m.Apellido
FROM 
    DE_MASTER_CLIENTES m
LEFT JOIN 
    DE_HOME h ON m.SubscriberKey = h.SubscriberKey
LEFT JOIN 
    DE_HEALTH he ON m.SubscriberKey = he.SubscriberKey
LEFT JOIN 
    DE_AUTO a ON m.SubscriberKey = a.SubscriberKey
LEFT JOIN 
    DE_Exclusions_Today e ON m.SubscriberKey = e.SubscriberKey AND e.SendDate = CONVERT(DATE, GETDATE())
WHERE 
    h.SubscriberKey IS NULL
    AND he.SubscriberKey IS NULL
    AND a.SubscriberKey IS NULL
    AND e.SubscriberKey IS NULL
    AND m.CorreoElectronico IS NOT NULL 
    AND m.Móvil IS NOT NULL 

Esta consulta sirve para seleccionar los clientes de la tabla DE_MASTER_CLIENTES que no están presentes
 en ninguna de las tablas DE_HOME, DE_HEALTH, DE_AUTO y DE_Exclusions_Today con la fecha actual. 
Esto asegura que los clientes no reciban más de un correo electrónico por día 
y solo selecciona aquellos con direcciones de correo electrónico y números de móvil válidos.
La tabla la tengo que crear adicionalmente DE_Exclusions_Today.
Contiene clientes que ya recibieron un correo electrónico hoy CON 2 filas de atributos:
 CO_CLIENT text(255),
    SendDate DATE. 
Si el cliente está en esta tabla con la fecha actual, no será incluido en el resultado.
