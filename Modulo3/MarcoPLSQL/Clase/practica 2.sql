SET SERVEROUTPUT ON
SET ECHO ON
DECLARE
CURSOR c_sz (p_city IN zipcode.city%TYPE)
IS
SELECT city, state, zip
FROM zipcode
WHERE city = p_city;
BEGIN
FOR i IN c_sz('Brooklyn') LOOP
DBMS_OUTPUT.PUT_LINE(i.state||' '||i.zip);
END LOOP;
END;
/

#Cree un cursor anidado en el cual el cursor padre obtenga la información acerca de
#cada sección de un curso. El cursor hijo debe contar la matricula. La salida debe
#ser una sola línea para cada curso, con el nombre del curso, el número de sección
#y el total de matriculados.

SET SERVEROUTPUT ON
DECLARE
v_matsum NUMBER;
CURSOR c_section IS
SELECT C.DESCRIPTION, S.SECTION_NO, S.SECTION_ID
FROM COURSE C, SECTION S
WHERE C.COURSE_NO=S.COURSE_NO;
CURSOR c_mat (v_secid IN section.section_id%TYPE) 
IS
SELECT count(e.student_id) S
FROM enrollment e
WHERE e.section_id=v_secid;
BEGIN
FOR i IN c_section
LOOP
	FOR j in c_mat(i.section_id)
	LOOP
	v_matsum:=j.s;
	END LOOP;
DBMS_OUTPUT.PUT_LINE('Curso:' || i.DESCRIPTION || ' Sección:' || i.SECTION_NO || ' Matriculados:' || v_matsum);
END LOOP;
END;
/

#Cree un cursor anidado, que de como salida el nombre del estudiante seguido del
#curso o cursos que esta tomando, el promedio de calificación que obtuvo en cada
#uno de las evaluaciones que se llevaron a cabo. Ejemplo:
#Alumno: Jonathan Jaele
#Calificaciones del Curso: Intro to the Internet
#84.00 Final
#77.00 Midterm

#version 1
DECLARE
CURSOR c_student IS
SELECT S.FIRST_NAME, S.LAST_NAME, S.student_id, SE.SECTION_ID, C.DESCRIPTION, SE.SECTION_NO
FROM STUDENT S, SECTION SE, ENROLLMENT E, COURSE C
WHERE S.STUDENT_ID=E.STUDENT_ID
AND E.SECTION_ID=SE.SECTION_ID
AND C.COURSE_NO=SE.COURSE_NO
AND S.STUDENT_ID=102;
CURSOR c_calif(v_student in grade.student_id%TYPE, v_section in grade.section_id%TYPE) 
IS
SELECT AVG(G.NUMERIC_GRADE) ave, G.GRADE_TYPE_CODE, G2.DESCRIPTION gd, G.SECTION_ID, C.DESCRIPTION cd
FROM GRADE G, SECTION S, COURSE C, GRADE_TYPE G2
WHERE STUDENT_ID=v_student
AND G.SECTION_ID=v_section
AND G.SECTION_ID=S.SECTION_ID
AND S.COURSE_NO=C.COURSE_NO
AND G.GRADE_TYPE_CODE=G2.GRADE_TYPE_CODE
GROUP BY  G.GRADE_TYPE_CODE, G2.DESCRIPTION, G.SECTION_ID, C.DESCRIPTION;
BEGIN
FOR i in c_student
LOOP
	DBMS_OUTPUT.PUT_LINE('Alumno: ' || i.FIRST_NAME || ' ' || i.LAST_NAME);
	DBMS_OUTPUT.PUT_LINE('Calificaciones del Curso: ' || i.DESCRIPTION);
	DBMS_OUTPUT.PUT_LINE('Sección: ' || i.SECTION_NO);
	FOR j in c_calif(i.STUDENT_ID, i.SECTION_ID)
		LOOP
			DBMS_OUTPUT.PUT_LINE(chr(9)||j.ave || ' ' || j.gd);
		END LOOP;
END LOOP;
END;
/

#version 2
DECLARE
CURSOR c_student IS
SELECT STUDENT_ID, FIRST_NAME, LAST_NAME
FROM STUDENT;
CURSOR c_course(v_student in student.STUDENT_ID%TYPE) IS
SELECT C.DESCRIPTION, S.SECTION_ID, S.SECTION_NO
FROM COURSE C, SECTION S, ENROLLMENT E
WHERE E.STUDENT_ID=v_student
AND E.SECTION_ID=S.SECTION_ID
AND S.COURSE_NO=C.COURSE_NO;
CURSOR c_calif(v_section in section.section_id%TYPE,
			   v_student in student.STUDENT_ID%TYPE) IS
SELECT AVG(G.NUMERIC_GRADE) ave, G2.DESCRIPTION
FROM GRADE G, GRADE_TYPE G2
WHERE G.STUDENT_ID=v_student
AND G.SECTION_ID=v_section
AND G.GRADE_TYPE_CODE=G2.GRADE_TYPE_CODE
GROUP BY G2.DESCRIPTION; 
BEGIN
FOR i IN c_student
	LOOP
		DBMS_OUTPUT.PUT_LINE('Alumno: '||i.FIRST_NAME||' '||i.LAST_NAME);
		FOR j IN c_course(i.STUDENT_ID)
			LOOP
				DBMS_OUTPUT.PUT_LINE(chr(9)||'Curso: '|| j.DESCRIPTION||', '|| 'Sección: '|| j.SECTION_NO);
				FOR l IN c_calif(j.SECTION_ID, i.STUDENT_ID)
					LOOP
						DBMS_OUTPUT.PUT_LINE(chr(9)||chr(9)||to_char(l.ave, '999.9')||chr(9)||l.DESCRIPTION);
					END LOOP;
			END LOOP;
	END LOOP;
END;
/
