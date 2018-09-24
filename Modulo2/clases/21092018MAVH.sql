
INSERT INTO branch VALUES('B005','22 Deer Rd', 'London', 'SW1 4EH');
#1 fila creada.

INSERT INTO branch VALUES('B007','16 Argyll St','Aberdeen');
# ORA-00947: no hay suficientes valores

INSERT INTO branch(branchno, street, postcode)
 VALUES('B007','16 Argyll St','AB2 3SU');

 DELETE FROM branch;

 SAVEPOINT A;

 UPDATE branch SET city = 'Aberdeen';

 ROLLBACK TO A;

 COMMIT;

 UPDATE branch SET city='Aberdeen' WHERE branchno='B007';