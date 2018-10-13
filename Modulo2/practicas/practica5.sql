1///
select razon_social_cliente, sum(fac) as facturado, sum(pago) as pagado,
sum(fac)-sum(pago) as saldo
from (select c.id_cliente, c.razon_social_cliente, c.id_division, c.dias_credito_cliente,
	d.descripcion_division,  f.total_factura fac, 0 pago
	from cat_cliente c
	left outer join cat_division d on c.id_division=d.id_division
	left outer join factura f on f.id_cliente=c.id_cliente
	union
	select c.id_cliente, c.razon_social_cliente, c.id_division, c.dias_credito_cliente,
	d.descripcion_division, 0 fac, p.importe_pago pago
	from cat_cliente c
	left outer join cat_division d on c.id_division=d.id_division
	left outer join pago p on p.id_cliente=c.id_cliente
)
group by razon_social_cliente
order by 1;

2//

create table cat_div_aux AS
select * from cat_division;

select * from cat_div_aux;

3//

insert into cat_division values(5,'CENTRO');

select * from cat_division;

UPDATE cat_division
SET DESCRIPCION_DIVISION=
'DIVISION '||DESCRIPCION_DIVISION;


MERGE INTO cat_div_AUX C2
USING cat_division C1
ON (C1.ID_DIVISION=C2.ID_DIVISION)
WHEN MATCHED THEN
UPDATE SET 
	C2.DESCRIPCION_DIVISION= C1.DESCRIPCION_DIVISION
WHEN NOT MATCHED THEN
INSERT (ID_DIVISION,DESCRIPCION_DIVISION)
VALUES(C1.ID_DIVISION,C1.DESCRIPCION_DIVISION);

select * from cat_diV_AUX;


4//
SELECT P.DESC_PAIS, E.DESC_EQUIPO, T.AYO, SUM


SELECT P.DESC_PAIS, E.DESC_EQUIPO, T.AYO, SUM(GOLES) AS GOLES
FROM TORNEO T
left outer join EQUIPO E
ON E.iD_EQUIPO=T.iD_EQUIPO
left outer join PAIS P
ON P.ID_PAIS=E.ID_PAIS
GROUP BY CUBE(P.DESC_PAIS, E.DESC_EQUIPO, T.AYO);


5//

SELECT E.DESC_EQUIPO, T.AYO
FROM TORNEO T, EQUIPO E
WHERE E.ID_EQUIPO=T.ID_EQUIPO AND 
GOLES > (SELECT AVG(GOLES) FROM TORNEO)

6//
SELECT DESC_EQUIPO FROM
(SELECT E.DESC_EQUIPO DESC_EQUIPO, T.AYO AYO
FROM TORNEO T, EQUIPO E
WHERE E.ID_EQUIPO = T.ID_EQUIPO
ORDER BY T.AYO, E.DESC_EQUIPO)
GROUP BY DESC_EQUIPO
ORDER BY MIN(AYO), DESC_EQUIPO;

7//


SELECT E.DESC_EQUIPO 
FROM TORNEO T 
LEFT OUTER JOIN
EQUIPO E
ON T.ID_EQUIPO=E.ID_EQUIPO
WHERE T.ID_LUGAR=1 AND
T.AYO>1960
ORDER BY T.AYO 



SELECT T.AYO 
FROM TORNEO T
LEFT OUTER JOIN
EQUIPO E
ON T.ID_EQUIPO=E.ID_EQUIPO 
WHERE T.ID_LUGAR=1 AND
E.DESC_EQUIPO='Estudiantes'
