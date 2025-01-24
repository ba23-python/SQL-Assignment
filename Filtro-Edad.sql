 Clientes con edades entre 25 y 40 años.
 
SELECT 
CodCliente, Nombre, Apellido, DNI, 
Sexo, CorreoElectronico, Móvil, 
Año_nacimiento, Ciudad, Seguro_Activo, Seguro_Anulado, 
Si_Publicidad
FROM DE_Clientes
WHERE (YEAR(GETDATE()) - YEAR(Año_nacimiento)) BETWEEN 25 AND 40;

------------------------

[EN] Note: When using GETDATE(), the date settings of the Marketing Cloud server will be respected. In this exercise, it is assumed that all these settings are correctly configured.

The result of this query would be a new query data extension with the following data:

Customers aged 25 to 40 years, using the current year to calculate the age based on the customer code, which we assume is the SubscriberKey.


[es]** Ojo al utlizar GETDATE() se van respetar los ajustes del servidor de Marketing Cloud respecto a la fecha.
En este ejercicio se supone que todos estos ajustes estan correctamente.

El resultado de este query seria una nueva query data extension con los siguientes datos:

Clientes con edad 25 to 40 años utilizando el año corriente 
para calcular la edad por codigo del cliente que suponemos que es el SubscriberKey:

ABC123 (46 years old)
ABC124 (41 years old)
ABC125 (26 years old)
ABC126 (39 years old)
ABC127 (38 years old)
ABC128 (37 years old)
ABC129 (36 years old)
ABC130 (41 years old)

