##############################################
#Rehuso de excepciÃ³n declarada por el usuario 
##############################################


create or replace procedure valida_cupo 
is
  v_estudiantes NUMBER(3) := 0;
begin
  SELECT COUNT(*) INTO v_estudiantes
    FROM enrollment e, section s
   WHERE e.section_id = s.section_id
     AND s.course_no = 25
     AND s.section_id = 89;
    If v_estudiantes > 10 then
        RAISE_APPLICATION_ERROR (-20001, 'El curso tiene mas de 10 estudiantes', true);
    else
        DBMS_OUTPUT.PUT_LINE ('El Curso 25, secciÃ³n 89 tiene '||v_estudiantes|| ' estudiantes');
    End if;    
End;





SET SERVEROUTPUT ON
DECLARE
    v_estudiantes NUMBER(3) := 0;
   e_curso_lleno EXCEPTION;
   PRAGMA EXCEPTION_INIT(e_curso_lleno, -20001);
BEGIN
     valida_cupo;  
EXCEPTION
    WHEN e_curso_lleno THEN
       DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
/