/*
CREATE TABLE MEDIO_PAGO
(
	Id int identity not null primary key,
	DESCRIPCION char(30) not null
)

INSERT INTO MEDIO_PAGO VALUES('TARJETA'),('TRANSFERENCIA'),('CHEQUE'),('EFECTIVO')

CREATE TABLE TIPO_TARJETAS
(
	Id int identity not null primary key,
	DESCRIPCION char(30) not null
)


CREATE TABLE PAGO_RECETAS
(
	Id int identity not null primary key,
	rec_codigo int not null,
	cli_codigo int not null,
	importe_pagado money not null,
	medio_pago int not null,
	detalle char(50),
	fecha_pago date not null
)


CREATE TABLE GASTOS 
(
	Id int primary key identity,
	Operacion char(30) not null,
	Detalle char(100) not null,
	Importe money not null,
	Fecha Date not null
)

CREATE VIEW dbo.Pagos_Receta
AS 
SELECT dbo.MEDIO_PAGO.DESCRIPCION,
dbo.PAGO_RECETAS.Id,
dbo.PAGO_RECETAS.importe_pagado, 
ISNULL(dbo.PAGO_RECETAS.detalle, '') AS detalle,
dbo.PAGO_RECETAS.fecha_pago,
dbo.PAGO_RECETAS.rec_codigo, 
dbo.PAGO_RECETAS.cli_codigo, 
dbo.PAGO_RECETAS.medio_pago,
dbo.CLIENTES.CLI_NOMBRE 

FROM dbo.MEDIO_PAGO 
INNER JOIN dbo.PAGO_RECETAS ON dbo.MEDIO_PAGO.Id = dbo.PAGO_RECETAS.medio_pago 
INNER JOIN dbo.CLIENTES ON dbo.PAGO_RECETAS.cli_codigo = dbo.CLIENTES.CLI_CODIGO ;


CREATE VIEW dbo.Vista_Pagos_Recibo_Negro 
AS
SELECT dbo.CLIENTES.CLI_NOMBRE,
dbo.COMPROBANTE.COM_IMPORTE,
dbo.TIPO_COMPROBANTE.TCO_MULTIPLO,
dbo.COMPROBANTE.COM_FECHA, 
dbo.COMPROBANTE.COM_DESCUENTO,
dbo.COMPROBANTE.TCO_CODIGO 
FROM dbo.COMPROBANTE INNER JOIN         
dbo.TIPO_COMPROBANTE ON dbo.COMPROBANTE.TCO_CODIGO = dbo.TIPO_COMPROBANTE.TCO_CODIGO INNER JOIN        
dbo.CLIENTES ON dbo.COMPROBANTE.CLI_CODIGO = dbo.CLIENTES.CLI_CODIGO;


CREATE VIEW dbo.Vista_Comisiones_Vend
AS
SELECT dbo.CLIENTES.CLI_NOMBRE,
dbo.TIPO_LENTE.TPL_DESCRIPCION,
dbo.VENDEDORES.VEN_CODIGO,
dbo.PAGO_RECETAS.importe_pagado,
dbo.PAGO_RECETAS.fecha_pago  
FROM dbo.RECETAS INNER JOIN 
dbo.CLIENTES ON dbo.RECETAS.CLI_CODIGO = dbo.CLIENTES.CLI_CODIGO INNER JOIN  
dbo.TIPO_LENTE ON dbo.RECETAS.TPL_CODIGO = dbo.TIPO_LENTE.TPL_CODIGO INNER JOIN        
dbo.VENDEDORES ON dbo.RECETAS.VEN_CODIGO = dbo.VENDEDORES.VEN_CODIGO INNER JOIN              
dbo.PAGO_RECETAS ON dbo.RECETAS.REC_CODIGO = dbo.PAGO_RECETAS.rec_codigo AND dbo.CLIENTES.CLI_CODIGO = dbo.PAGO_RECETAS.cli_codigo 
GROUP BY dbo.CLIENTES.CLI_NOMBRE, dbo.TIPO_LENTE.TPL_DESCRIPCION, dbo.VENDEDORES.VEN_CODIGO, dbo.PAGO_RECETAS.importe_pagado, dbo.PAGO_RECETAS.fecha_pago  
*/

