
CREATE TABLE pais (
id_pais number(3,0),
desc_pais varchar2(10),
CONSTRAINT pais_pk PRIMARY KEY (id_pais)
);

CREATE TABLE equipo(
id_equipo number(3,0),
desc_equipo varchar2(15),
id_pais number(3,0),
CONSTRAINT equipo_pk PRIMARY KEY (id_equipo),
CONSTRAINT eq_pa_fk FOREIGN KEY (id_pais) REFERENCES pais(id_pais)
);

CREATE TABLE lugar(
id_lugar number(3,0),
desc_lugar varchar2(15),
CONSTRAINT lugar_pk PRIMARY KEY (id_lugar)
);


CREATE TABLE torneo(
ayo number(4,0),
id_equipo number(3,0),
id_lugar number(3,0),
goles number(2,0),
CONSTRAINT torneo_pk PRIMARY KEY (ayo, id_lugar),
CONSTRAINT to_eq_fk FOREIGN KEY (id_equipo) REFERENCES equipo(id_equipo),
CONSTRAINT to_lu_fk FOREIGN KEY (id_lugar) REFERENCES lugar(id_lugar)
);