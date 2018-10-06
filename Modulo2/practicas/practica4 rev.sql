#
INSERT INTO cat_cliente VALUES
(4,'CLIENTE4', 4, 30);

#1 v1
SELECT c.id_cliente,c.razon_social_cliente,c.id_division,c.dias_credito_cliente,
       d.descripcion_division,f.id_factura
FROM cat_division d
right outer JOIN cat_cliente c 
ON d.id_division = c.id_division
left outer JOIN factura f
ON c.id_cliente = f.id_cliente;

#1 v2
select c.id_cliente, c.razon_social_cliente, c.id_division, c.dias_credito_cliente,
d.descripcion_division, f.id_factura, f.total_factura
from cat_cliente c
left outer join cat_division d on c.id_division=d.id_division
left outer join factura f on f.id_cliente=c.id_cliente;

#2 v1
SELECT c.id_cliente,c.razon_social_cliente,c.id_division,c.dias_credito_cliente,
       d.descripcion_division,p.id_pago
FROM cat_division d JOIN cat_cliente c 
ON d.id_division = c.id_division
left outer JOIN pago p
ON c.id_cliente = p.id_cliente;

#2 v2
select c.id_cliente, c.razon_social_cliente, c.id_division, c.dias_credito_cliente,
d.descripcion_division, p.id_pago, p.importe_pago
from cat_cliente c
left outer join cat_division d on c.id_division=d.id_division
left outer join pago p on p.id_cliente=c.id_cliente;

#3

create or replace view vw_ingresos
	as  
	select c.id_cliente, c.razon_social_cliente, c.id_division, c.dias_credito_cliente,
	d.descripcion_division,  nvl(f.total_factura,0) fac, 0 pago
	from cat_cliente c
	left outer join cat_division d on c.id_division=d.id_division
	left outer join factura f on f.id_cliente=c.id_cliente
	union
	select c.id_cliente, c.razon_social_cliente, c.id_division, c.dias_credito_cliente,
	d.descripcion_division, 0 fac, nvl(p.importe_pago,0) pago
	from cat_cliente c
	left outer join cat_division d on c.id_division=d.id_division
	left outer join pago p on p.id_cliente=c.id_cliente
WITH read only;

select * from vw_ingresos;

#4
select razon_social_cliente, sum(fac) as facturado, sum(pago) as pagado,
sum(fac)-sum(pago) as saldo
from vw_ingresos
group by razon_social_cliente
order by 1;

#5 v1
SELECT p.desc_pais, NVL(COUNT(t.id_equipo),0) AS FINALES,
NVL(SUM(CASE t.id_lugar
when 1 then 1
END ),0) GANADOS,
NVL(SUM(CASE t.id_lugar
when 2 then 1
END ),0) PERDIDOS
FROM equipo e JOIN pais P
ON e.id_pais = p.id_pais
LEFT OUTER JOIN torneo t 
ON e.id_equipo = t.id_equipo
group by p.desc_pais
ORDER BY 2 desc;

#5 v2
select A.desc_pais, A.finales as finales, nvl(B.primeros,0) as primeros,
nvl(C.segundos, 0) as segundos
from
(select v.desc_pais, count(id_lugar) as finales
from (select p.desc_pais, t.id_equipo, t.id_lugar, p.id_pais
	from torneo t
	full outer join equipo e 
	on e.id_equipo=t.id_equipo
	full outer join pais p
	on e.id_pais=p.id_pais) v
group by v.desc_pais) A
left outer join 
(select v.desc_pais, count(id_lugar) as primeros
from (select p.desc_pais, t.id_equipo, t.id_lugar, p.id_pais
	from torneo t
	full outer join equipo e 
	on e.id_equipo=t.id_equipo
	full outer join pais p
	on e.id_pais=p.id_pais) v 
where id_lugar = 1
group by v.desc_pais) B
on A.desc_pais=B.desc_pais
left outer join 
(select v.desc_pais, count(id_lugar) as segundos
from (select p.desc_pais, t.id_equipo, t.id_lugar, p.id_pais
	from torneo t
	full outer join equipo e 
	on e.id_equipo=t.id_equipo
	full outer join pais p
	on e.id_pais=p.id_pais) v 
where id_lugar = 2
group by v.desc_pais) C
on B.desc_pais=C.desc_pais
order by 2 desc;

#6 v1
SELECT e.desc_equipo, NVL(COUNT(t.id_equipo),0) AS FINALES,
NVL(SUM(CASE t.id_lugar
when 1 then 1
END ),0) GANADOS,
NVL(SUM(CASE t.id_lugar
when 2 then 1
END ),0) PERDIDOS
FROM equipo e
LEFT OUTER JOIN torneo t 
ON e.id_equipo = t.id_equipo
group by e.desc_equipo
ORDER BY 3 desc;

#6 v2
select e.desc_equipo, A.finales as finales, nvl(B.primeros,0) as primeros,
 nvl(C.segundos,0) as segundos from 
(select id_equipo, count(id_equipo) as finales 
from torneo
group by id_equipo) A
left outer join 
(select id_equipo, count(id_equipo) as primeros
from torneo
where id_lugar = 1
group by id_equipo) B
on A.id_equipo=B.id_equipo
left outer join 
(select id_equipo, count(id_equipo) as segundos
from torneo
where id_lugar = 2
group by id_equipo) C
on A.id_equipo=C.id_equipo
left outer join 
equipo e
on A.id_equipo=e.id_equipo
order by 3 desc, 2 desc;

#7 v1
SELECT ayo, 
MAX(CASE t.id_lugar
WHEN 1 THEN desc_equipo
END) Campeon,
MAX(CASE t.id_lugar
WHEN 2 THEN desc_equipo
END) Subcampeon
FROM torneo t JOIN equipo e
ON t.id_equipo = e.id_equipo
GROUP BY ayo
order by 1;

#7 v2
select A.ayo, A.primero, B.segundo
from
(select t.ayo, e.desc_equipo as primero 
from torneo t
left outer join equipo e
on e.id_equipo=t.id_equipo
where t.id_lugar=1) A
full outer join 
(select t.ayo, e.desc_equipo as segundo 
from torneo t
left outer join equipo e
on e.id_equipo=t.id_equipo
where t.id_lugar=2) B
on A.ayo=B.ayo;

#8 v1
SELECT e.desc_equipo
from equipo e JOIN torneo t
on e.id_equipo = t.id_equipo
group by e.desc_equipo
having COUNT(t.id_equipo) >= 3 
order by 1 asc;

#8 v2
select e.desc_equipo
FROM (select id_equipo, count(id_equipo) as finales 
from torneo
group by id_equipo) A
LEFT OUTER JOIN equipo e
ON A.id_equipo=e.id_equipo
WHERE A.finales>=3
ORDER by 1;

#9
select e.desc_equipo
FROM (select id_equipo, count(id_equipo) as primeros
from torneo
where id_lugar = 1
group by id_equipo) B
LEFT OUTER JOIN equipo e
ON B.id_equipo=e.id_equipo
WHERE B.primeros>=3
ORDER by B.Primeros desc;

#9v2
SELECT DISTINCT e.desc_equipo
from equipo e JOIN torneo t
on e.id_equipo = t.id_equipo
WHERE id_lugar = 1
group by e.desc_equipo
having count(*) >= 3
order by count(*) desc;
