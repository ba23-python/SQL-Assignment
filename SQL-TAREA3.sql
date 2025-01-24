

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


[EN] 
This query is used to select customers from the DE_MASTER_CLIENTES table who are not present in any of the tables: 
DE_HOME, DE_HEALTH, DE_AUTO, and DE_Exclusions_Today for the current date. 
This ensures that customers do not receive more than one email per day and only selects 
those with valid email addresses and mobile numbers.
The additional table, DE_Exclusions_Today, needs to be created. It contains customers who have already received an email today with 2 columns:
CO_CLIENT (text, length 255)
SendDate (DATE).
If a customer is in this table with the current date, they will not be included in the result.


[ES]
Esta consulta sirve para seleccionar los clientes de la tabla DE_MASTER_CLIENTES que no están presentes
 en ninguna de las tablas DE_HOME, DE_HEALTH, DE_AUTO y DE_Exclusions_Today con la fecha actual. 
Esto asegura que los clientes no reciban más de un correo electrónico por día 
y solo selecciona aquellos con direcciones de correo electrónico y números de móvil válidos.
La tabla la tengo que crear adicionalmente DE_Exclusions_Today.
Contiene clientes que ya recibieron un correo electrónico hoy CON 2 filas de atributos:
 CO_CLIENT text(255),
    SendDate DATE. 
Si el cliente está en esta tabla con la fecha actual, no será incluido en el resultado.
