select c.constraint_name, c.constraint_type, cc.column_name
from dba_constraints c , dba_cons_columns cc
where c.owner = 'HR'
and c.table_name='EMPLOYEES'
AND c.owner=cc.owner
and c.constraint_name=cc.constraint_name
order by c.constraint_name, cc.position;