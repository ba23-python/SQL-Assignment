Excluir clientes con siniestro abierto / Exclude clients that have an open claim

SELECT c.CodCliente, c.Nombre, c.Apellido, c.CorreoElectronico, c.Móvil
FROM DE_Clientes c
LEFT JOIN DE_Anulaciones s 
ON c.CodCliente = s.CodCliente AND s.Siniestro = 'SI'
WHERE s.CodCliente IS NULL;


--------------------------------
[EN] Explanation:
Join Condition:
The query performs a LEFT JOIN between the DE_Clientes table (alias c) and the DE_Anulaciones table (alias s) 
using the common column CodCliente.

Filter for Open Claims:
The condition AND s.Siniestro = 'SI' ensures that we only consider customers who have open claims.

Exclusion Condition:
The WHERE s.CodCliente IS NULL condition filters out customers who have an open claim, 
as they will not have a corresponding record in the DE_Anulaciones table due to the LEFT JOIN.

Segmented Data Extension:
The segmented data extension will contain customers with an open claim. 
Therefore, this data extension must be assigned as the exclusion list during the send process. 
In this specific case, it represents the customers in the segmented table from this query who have an open claim. The CodCliente column likely serves as the customer ID, and it might need to be identified as the SubscriberKey. Since this is not specified in the task, it is assumed to be the case.

What is an Exclusion List?
An exclusion list is a list, group, or data extension created within the application 
and selected during the send process to exclude recipients. 
If your Email Studio account has the subscriber key enabled, 
the system will use the value of the subscriber key for exclusion. 
If the subscriber key is not enabled, the system will use the email address for exclusion.

[ES] Comentario sobre este query:
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
