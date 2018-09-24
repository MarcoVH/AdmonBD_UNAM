# Viene de práctica 1

CREATE TABLE cat_division(
id_division number(2,0) CONSTRAINT cat_division_pk PRIMARY KEY,
descripcion_division varchar2(20)
);

CREATE TABLE cat_cliente(
id_cliente number(2,0) CONSTRAINT cat_cliente_pk PRIMARY KEY,
razon_social_cliente varchar2(50),
id_division number(2,0) CONSTRAINT cl_div_fk REFERENCES cat_division(id_division),
dias_credito_cliente number(2,0)
);

CREATE TABLE factura (
id_factura NUMBER(3,0) CONSTRAINT factura_pk PRIMARY KEY,
fecha_factura DATE,
id_cliente NUMBER (2,0) CONSTRAINT fac_cli_fk REFERENCES cat_cliente(id_cliente),
monto_factura NUMBER(10,2),
iva_factura NUMBER (10,2),
total_factura NUMBER (10,2)
);

CREATE TABLE pago(
id_pago NUMBER(3,0) CONSTRAINT pago_pk PRIMARY KEY,
fecha_pago DATE,
id_cliente NUMBER(2,0) CONSTRAINT pag_cli_fk REFERENCES cat_cliente(id_cliente),
importe_pago NUMBER(10,2)
);

CREATE TABLE empleado(
id_emp NUMBER(4,0)CONSTRAINT empleado_pk PRIMARY KEY,
pat_emp VARCHAR2(30),
mat_emp VARCHAR2(30),
nom_emp VARCHAR2(30),
fecha_nac_emp DATE,
edad_emp NUMBER(2,0),
rfc_emp VARCHAR2(10)
);
