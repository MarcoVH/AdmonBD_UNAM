INSERT INTO branch VALUES('B005','22 Deer Rd','London','SW1 4EH');
INSERT INTO branch VALUES('B007','16 Argyll St','Aberdeen','AB2 3SU');
INSERT INTO branch VALUES('B003','163 Main St','Glasgow','G11 9QX');
INSERT INTO branch VALUES('B004','32 Manse Rd','Bristol','BS99 1NZ');
INSERT INTO branch VALUES('B002','56 Clover Dr','London','NW10 6EU');

INSERT INTO staff VALUES('SL21','John','White','Manager','M','01/10/1945','30000','B005');
INSERT INTO staff VALUES('SG37','Ann','Beech','Assistant','F','10/11/1960','12000','B003');
INSERT INTO staff VALUES('SG14','David','Ford','Supervisor','M','24/03/1958','18000','B003');
INSERT INTO staff VALUES('SA9','Mary','Howe','Assistant','F','19/02/1970','9000','B007');
INSERT INTO staff VALUES('SG5','Susan','Brand','Manager','F','03/06/1940','24000','B003');
INSERT INTO staff VALUES('SL41','Julie','Lee','Assistant','F','13/06/1965','9000','B005');

INSERT INTO privateowner VALUES('CO46','Joe','Keogh','2 Fergus Dr, Aberdeen AB2 7SX','01224-861212');
INSERT INTO privateowner VALUES('CO87','Carol','Farrel','6 Achray St, Glasgow G32 9DX','0141-357-7419');
INSERT INTO privateowner VALUES('CO40','Tina','Murphy','63 Well St, Glasgow G42','0141-943-1728');
INSERT INTO privateowner VALUES('CO93','Tony','Shaw','12 Park Pl, Glasgow G4 0QR','0141-225-7025');

INSERT INTO propertyforrent VALUES('PA14','16 Holhead','Aberdeen','AB7 5SU','House','6','650','CO46','SA9','B007');
INSERT INTO propertyforrent VALUES('PL94','6Argyll St','London','NW2','Flat','4','400','CO87','SL41','B005');
INSERT INTO propertyforrent VALUES('PG4','6 Lawrence St','Glasgow','G11 9QX','Flat','3','350','CO40','','B003');
INSERT INTO propertyforrent VALUES('PG36','2 Manor Rd','Glasgow','G32 4QX','Flat','3','375','CO93','SG37','B003');
INSERT INTO propertyforrent VALUES('PG21','18 Dale Rd','Glasgow','G12','House','5','600','CO87','SG37','B003');
INSERT INTO propertyforrent VALUES('PG16','5 Nova Dr','Glasgow','G12 9AX','Flat','4','450','CO93','SG14','B003');

INSERT INTO client VALUES('CR76','John','Kay','0207-774-5632','Flat','425');
INSERT INTO client VALUES('CR56','Aline','Stewart','0141-848-1825','Flat','350');
INSERT INTO client VALUES('CR74','Mike','Ritchie','01475-392178','House','750');
INSERT INTO client VALUES('CR62','Mary','Tregear','01224-196720','Flat','600');

INSERT INTO registration VALUES('CR76','B005','SL41','02/01/2004');
INSERT INTO registration VALUES('CR56','B003','SG37','11/04/2003');
INSERT INTO registration VALUES('CR74','B003','SG37','16/11/2002');
INSERT INTO registration VALUES('CR62','B007','SA9','07/03/2003');

INSERT INTO viewing VALUES('CR56','PA14','24/05/2004','too small');
INSERT INTO viewing VALUES('CR76','PG4','20/04/2004','too remote');
INSERT INTO viewing VALUES('CR56','PG4','26/05/2004','');
INSERT INTO viewing VALUES('CR62','PA14','14/05/2004','no dining room');
INSERT INTO viewing VALUES('CR56','PG36','28/04/2004','');
