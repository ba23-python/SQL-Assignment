Excluir clientes con siniestro abierto

SELECT c.CodCliente, c.Nombre, c.Apellido, c.CorreoElectronico, c.Móvil
FROM DE_Clientes c
LEFT JOIN DE_Anulaciones s 
ON c.CodCliente = s.CodCliente AND s.Siniestro = 'SI'
WHERE s.CodCliente IS NULL;



Explicación:
Condición de unión: La consulta realiza una UNIÓN IZQUIERDA (LEFT JOIN) 
entre la tabla DE_Clientes (alias c) y la tabla DE_Anulaciones (alias s) 
por la columna comun CodCliente.
Filtro de siniestros abiertos: la condición AND s.Siniestro = 'SI' 
garantiza que solo nos preocuparemos de los clientes que tienen reclamos abiertos.
Condición de exclusión: La condición WHERE s.CodCliente IS NULL filtra a los clientes que tienen un Siniestro abierto, 
ya que no tendrán un registro correspondiente en la tabla DE_Anulaciones debido a LEFT JOIN.
La data extension segmentada va a contener los clientes que tienen un siniestro abierto, por lo tanto se tiene que asignar esta data extension 
como lista de exclusión del envío que se selecciona en el momento de realizar el envío,y en este caso concreto representa los clientes en la tabla segmentada 
de este query que tienen un siniestro abierto. El CodCliente seguramente servira de ID del cliente, 
y quizas sea necesario identificarlo como SubscriberKey. Ya que no viene especificado en la tarea supongo que es asi.

Una lista de exclusión es una lista, grupo o extensión de datos que se crea en la aplicación 
que se selecciona en el momento de realizar el envío para excluir del envío. Si su cuenta de Email Studio tiene habilitada una clave del suscriptor, el sistema realizará la exclusión utilizando el valor de la clave del suscriptor. En caso de que su cuenta no tenga habilitada la clave del suscriptor, 
el sistema realizará la exclusión utilizando la dirección de correo electrónico.