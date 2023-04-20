# Desarrollo-de-Sistemas
Problema 1: Artículos y encargos Una base de datos para una pequeña empresa debe
contener información acerca de clientes, artículos y pedidos. Hasta el momento se registran
los siguientes datos en documentos varios:
• Para cada cliente: Número de cliente (único), Direcciones de envío (varias por cliente), Saldo,
Límite de crédito (depende del cliente, pero en ningún caso debe superar los 3.000.000 pts),
Descuento.
• Para cada artículo: Número de artículo (único), Fábricas que lo distribuyen, Existencias de ese
artículo en cada fábrica, Descripción del artículo.
• Para cada pedido: Cada pedido tiene una cabecera y el cuerpo del pedido. La cabecera está
formada por el número de cliente, dirección de envío y fecha del pedido. El cuerpo del pedido
son varias líneas, en cada línea se especifican el número del artículo pedido y la cantidad.
Además, se ha determinado que se debe almacenar la información de las fábricas. Sin
embargo, dado el uso de distribuidores, se usará: Número de la fábrica (único) y Teléfono de
contacto. Y se desean ver cuántos artículos (en total) provee la fábrica. También, por
información estratégica, se podría incluir información de fábricas alternativas respecto de las
que ya fabrican artículos para esta empresa. Nota: Una dirección se entenderá como No, Calle,
Comuna y Ciudad. Una fecha incluye hora.
Se pide hacer el diagrama ER para la base de datos que represente esta información.

Problema 2: Sistema de ventas Le contratan para hacer una BD que permita apoyar la gestión
de un sistema de ventas. La empresa necesita llevar un control de proveedores, clientes,
productos y ventas. Un proveedor tiene un RUT, nombre, dirección, teléfono y página web. Un
cliente también tiene RUT, nombre, dirección, pero puede tener varios teléfonos de contacto.
La dirección se entiende por calle, número, comuna y ciudad.
Un producto tiene un id único, nombre, precio actual, stock y nombre del proveedor. Además
se organizan en categorías, y cada producto va sólo en una categoría. Una categoría tiene id,
nombre y descripción.
Por razones de contabilidad, se debe registrar la información de cada venta con un id, fecha,
cliente, descuento y monto final. Además se debe guardar el precio al momento de la venta, la
cantidad vendida y el monto total por el producto.

Problema 3: Carreteras Diseñar un esquema E/R que recoja la organización de una base de
datos para contener la información sobre todas las carreteras del país, sabiendo que se deben
cumplir las siguientes especificaciones:
- Las carreteras están divididas en varias categorías (locales, comerciales, regionales,
nacionales, autovías, etc).
- Las carreteras se dividen en tramos. Un tramo siempre pertenece a una única carretera y no
puede cambiar de carretera.

EJERCICIOS DE D.E.R.

PROFESOR EMILIANO DORSI
- Un tramo puede pasar por varias comunas, interesando conocer el Km de la carretera y la
comuna donde empieza el tramo y en donde termina.
- Para los tramos que suponen principio o final de carretera, interesa saber si es que la
carretera concluye físicamente o es que confluye en otra carretera. En este caso, interesa
conocer con qué carretera confluye y en qué kilómetro, tramo y comuna.

Problema 4: Educando S.A. En la Empresa "Educando S.A." se lleva control de sus Bienes y
Servicios. El interés primario es poder hacer que los Bienes se manejen de forma rápida y con
el menor grado de error. Para esto quien maneja la sección de "Bienes y Suministros" plantea
las siguientes condiciones del negocio para la construcción de una base de datos:
• La Sección está dividida en tres (3) áreas: COMPRAS, ALMACEN, INVENTARIO.
• El área de Compras funciona de la siguiente forma:
o Recibe las solicitudes de compras de las diferentes áreas de la empresa.
o Cada solicitud tiene un responsable. o Cada solicitud es autorizada por el jefe del
área y posteriormente por el Director Financiero.
o Quien realiza una solicitud puede ser responsable de uno o varios centros de costos,
con la salvedad de que él como empleado solo está adscrito a uno. De la solicitud se debe
diligenciar la siguiente información: Número de la solicitud (consecutivo), Fecha, Responsable
(nombre y cédula), Centro de Costos, Rubro presupuestal del cual se descargará la compra. En
cada solicitud se pueden discriminar uno o muchos ítems con la siguiente información: ítem,
nombre del bien, cantidad solicitada, unidad de medida del bien, valor unitario y valor total.
Cada solicitud debe ser totalizada
o Cada bien es identificado por un código universal que es único y es de carácter
devolutivo (suministro) o un bien inmueble.
o Una vez diligenciada la solicitud es remitida al área de compras para realizar su
correspondiente cotización.
o Las cotizaciones son realizadas con uno o varios proveedores de los bienes
solicitados.
o Una vez la cotización definitiva está lista, se crea una orden contractual que maneja
la siguiente información: Número de la orden contractual, nit y nombre del proveedor al cual
se le va a realizar la compra, fecha de la orden, monto total de la orden, fecha de entrega.
Cada orden puede tener asociado uno o varios ítems de la solicitud o solicitudes que van a ser
despachadas. Cada ítem tiene la siguiente información: nombre del bien, cantidad solicitada,
cantidad despachada, unidad de medida del bien, valor unitario y valor total.
o La orden de compra es aprobada por el Director Financiero para que sea enviada al
proveedor elegido.
• El área de Almacén funciona de la siguiente forma:
o Su función principal es recepcionar los bienes que llegan de los proveedores y
distribuirlos a las correspondientes áreas que realizaron las solicitudes de compras.

EJERCICIOS DE D.E.R.

PROFESOR EMILIANO DORSI
o Cuando llega un proveedor mercancía, este hace una entrega física de los bienes, los
cuales son comparados con la factura que este entrega y con la orden de compra
correspondiente. Si esta acción es correcta se registra una entrada de almacén por cada
factura relacionada, con la siguiente información: Número de Entrada, Fecha, Número de
factura, Proveedor, Total Bienes, Valor Total (los totales deben coincidir con los de la factura).
Adjunto a esta se discriminan los ítems recibidos con la siguiente información: nombre del
bien, cantidad entregada.
o Cuando el almacén decide despachar los bienes a las diferentes áreas solicitantes,
registra cada una de las entregas en Salidas de Almacén con la siguiente información: Número
de Salida, Empleado responsable del bien a entregar, fecha de salida, fecha de entrega. Por
cada entrega se detalla cada uno de los ítems con la siguiente información: nombre del bien,
cantidad entregada.
o Una entrada de almacén puede generar muchas salidas de almacén, por ejemplo:
Pueden ingresar 500 pacas de papel higiénico, pero como se debe repartir entre varias áreas,
cada una requiere de una salida de almacén.
• El área de inventarios funciona de la siguiente forma:
o Es la encargada de administrar y controlar la ubicación de los bienes dentro de la
empresa, por esto antes de que el bien salga del almacén debe ser codificado a través de un
código único que lo haga identificable dentro de la empresa.
o La ubicación del bien se identifica por la siguiente información: responsable del bien,
fecha de entrega, dirección del bien (ubicación).
Diseñar modelo ER para la base de datos.

Problema 5: Olimpíadas Las sedes olímpicas se dividen en complejos deportivos. Los complejos
deportivos se subdividen en aquellos en los que se desarrolla un único deporte y en los
polideportivos. Los complejos polideportivos tienen áreas designadas para cada deporte con
un indicador de localización (ejemplo: centro, esquinaNE, etc.). Un complejo tiene una
localización, un jefe de organización individual y un área total ocupada. Los dos tipos de
complejos (deporte único y polideportivo) tendrán diferentes tipos de información. Para cada
tipo de sede, se conservará el número de complejos junto con su presupuesto aproximado.
Cada complejo celebra una serie de eventos (ejemplo: la pista del estadio puede celebrar
muchas carreras distintas.). Para cada evento está prevista una fecha, duración, número de
participantes, número de comisarios. Una lista de todos los comisarios se conservará junto con
la lista de los eventos en los que esté involucrado cada comisario ya sea cumpliendo la tarea
de juez u observador. Tanto para cada evento como para el mantenimiento se necesitará
cierto equipamiento (ejemplo: arcos, pértigas, barras paralelas, etc).