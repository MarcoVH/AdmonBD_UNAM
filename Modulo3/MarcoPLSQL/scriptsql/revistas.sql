

CREATE TABLE CUSTOMER(
            CUST_ID VARCHAR2(5) PRIMARY KEY,
            CUST_NAME VARCHAR2(20) NOT NULL,
            CUST_ADDR VARCHAR2(50),
            CUST_CITY VARCHAR2(15) DEFAULT 'RAJKOT',
            EMAILID VARCHAR2(30),
            CONTACT_NO VARCHAR2(15)
            )
/

Insert into CUSTOMER
   (CUST_ID, CUST_NAME, CUST_ADDR, CUST_CITY, EMAILID, CONTACT_NO)
 Values
   ('C0001', 'PARAG', 'RAM KRUPA', 'GANDHINAGAR', 'pcshukla@aits.edu.in', '9228192281');
Insert into CUSTOMER
   (CUST_ID, CUST_NAME, CUST_ADDR, CUST_CITY, EMAILID, CONTACT_NO)
 Values
   ('C0002', 'DEVEN', 'AALAP GREEN CITY', 'GANDHINAGAR', 'djpatel@gmail.com', '9429217922');
Insert into CUSTOMER
   (CUST_ID, CUST_NAME, CUST_ADDR, CUST_CITY, EMAILID, CONTACT_NO)
 Values
   ('C0003', 'KAPIL SHUKLA', 'AYODHYANAGAR', 'SIDHPUR', 'kkshukla@yahoo.com', '9879023987');
Insert into CUSTOMER
   (CUST_ID, CUST_NAME, CUST_ADDR, CUST_CITY, EMAILID, CONTACT_NO)
 Values
   ('C0004', 'SHAILESH', 'KAILASH PARK', 'GANDHINAGAR', 'skpatel@aits.edu.in', '9429132650');
Insert into CUSTOMER
   (CUST_ID, CUST_NAME, CUST_ADDR, CUST_CITY, EMAILID, CONTACT_NO)
 Values
   ('C0005', 'BANKIM RADADIYA', 'PATIDAR RESIDENCY', 'GANDHINAGAR', 'bankim.radadiya@gmail.com', '9998445544');
Insert into CUSTOMER
   (CUST_ID, CUST_NAME, CUST_CITY)
 Values
   ('C0006', 'RAM', 'RAJKOT');
Insert into CUSTOMER
   (CUST_ID, CUST_NAME, CUST_CITY)
 Values
   ('C0007', 'LAXMAN', 'RAJKOT');
Insert into CUSTOMER
   (CUST_ID, CUST_NAME, CUST_CITY)
 Values
   ('C0008', 'BHARAT', 'RAJKOT');
COMMIT;


CREATE TABLE MAGAZINE(
MAG_ID VARCHAR2(5) PRIMARY KEY,
MAG_NAME VARCHAR2(20) NOT NULL,
UNIT_RATE NUMBER(4) CHECK (UNIT_RATE>0),
TYPE_OF_SUBSCRIPTION VARCHAR2(10) CHECK (TYPE_OF_SUBSCRIPTION IN ('WEEKLY','MONTHLY','YEARLY'))
)
/

Insert into MAGAZINE
   (MAG_ID, MAG_NAME, UNIT_RATE, TYPE_OF_SUBSCRIPTION)
 Values
   ('M0001', 'OUTLOOK', 10, 'MONTHLY');
Insert into MAGAZINE
   (MAG_ID, MAG_NAME, UNIT_RATE, TYPE_OF_SUBSCRIPTION)
 Values
   ('M0002', 'PCQUEST', 900, 'MONTHLY');
Insert into MAGAZINE
   (MAG_ID, MAG_NAME, UNIT_RATE, TYPE_OF_SUBSCRIPTION)
 Values
   ('M0003', 'CHIP INDIA', 786, 'WEEKLY');
Insert into MAGAZINE
   (MAG_ID, MAG_NAME, UNIT_RATE, TYPE_OF_SUBSCRIPTION)
 Values
   ('M0004', 'DATAQUEST', 1080, 'YEARLY');
Insert into MAGAZINE
   (MAG_ID, MAG_NAME, UNIT_RATE, TYPE_OF_SUBSCRIPTION)
 Values
   ('M0005', 'OPENSOURCE DATABASES', 980, 'MONTHLY');
Insert into MAGAZINE
   (MAG_ID, MAG_NAME, UNIT_RATE, TYPE_OF_SUBSCRIPTION)
 Values
   ('M0006', 'CRICKET TODAY', 425, 'WEEKLY');
Insert into MAGAZINE
   (MAG_ID, MAG_NAME, UNIT_RATE, TYPE_OF_SUBSCRIPTION)
 Values
   ('M0007', 'SHOW TIME', 765, 'WEEKLY');
Insert into MAGAZINE
   (MAG_ID, MAG_NAME, UNIT_RATE, TYPE_OF_SUBSCRIPTION)
 Values
   ('M0008', 'STARDUST', 800, 'YEARLY');
COMMIT;


CREATE TABLE SUBSCRIPTION (
      CUST_ID VARCHAR2(5) REFERENCES CUSTOMER,
      MAG_ID VARCHAR2(5) REFERENCES MAGAZINE,
      START_DATE DATE,
      END_DATE DATE,
      CONSTRAINT NotValid_Enddate CHECK (END_DATE > START_DATE),
      PRIMARY KEY(CUST_ID,MAG_ID)
)
/


Insert into SUBSCRIPTION
   (CUST_ID, MAG_ID, START_DATE, END_DATE)
 Values
   ('C0001', 'M0001', TO_DATE('01/10/2009 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('02/12/2010 00:00:00', 'MM/DD/YYYY HH24:MI:SS'));
Insert into SUBSCRIPTION
   (CUST_ID, MAG_ID, START_DATE, END_DATE)
 Values
   ('C0001', 'M0002', TO_DATE('07/11/2011 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('02/12/2012 00:00:00', 'MM/DD/YYYY HH24:MI:SS'));
Insert into SUBSCRIPTION
   (CUST_ID, MAG_ID, START_DATE, END_DATE)
 Values
   ('C0001', 'M0005', TO_DATE('03/08/2010 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('08/21/2012 00:00:00', 'MM/DD/YYYY HH24:MI:SS'));
Insert into SUBSCRIPTION
   (CUST_ID, MAG_ID, START_DATE, END_DATE)
 Values
   ('C0002', 'M0001', TO_DATE('09/11/2011 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('08/31/2012 00:00:00', 'MM/DD/YYYY HH24:MI:SS'));
Insert into SUBSCRIPTION
   (CUST_ID, MAG_ID, START_DATE, END_DATE)
 Values
   ('C0003', 'M0003', TO_DATE('01/12/2010 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('12/31/2011 00:00:00', 'MM/DD/YYYY HH24:MI:SS'));
Insert into SUBSCRIPTION
   (CUST_ID, MAG_ID, START_DATE, END_DATE)
 Values
   ('C0004', 'M0003', TO_DATE('01/01/2012 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('03/31/2012 00:00:00', 'MM/DD/YYYY HH24:MI:SS'));
Insert into SUBSCRIPTION
   (CUST_ID, MAG_ID, START_DATE, END_DATE)
 Values
   ('C0005', 'M0001', TO_DATE('01/01/2011 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('12/31/2011 00:00:00', 'MM/DD/YYYY HH24:MI:SS'));
Insert into SUBSCRIPTION
   (CUST_ID, MAG_ID, START_DATE, END_DATE)
 Values
   ('C0006', 'M0001', TO_DATE('02/01/2011 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('03/31/2012 00:00:00', 'MM/DD/YYYY HH24:MI:SS'));
Insert into SUBSCRIPTION
   (CUST_ID, MAG_ID, START_DATE, END_DATE)
 Values
   ('C0006', 'M0002', TO_DATE('03/13/2012 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('08/31/2012 00:00:00', 'MM/DD/YYYY HH24:MI:SS'));
Insert into SUBSCRIPTION
   (CUST_ID, MAG_ID, START_DATE, END_DATE)
 Values
   ('C0007', 'M0004', TO_DATE('03/08/2012 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('12/31/2012 00:00:00', 'MM/DD/YYYY HH24:MI:SS'));
Insert into SUBSCRIPTION
   (CUST_ID, MAG_ID, START_DATE, END_DATE)
 Values
   ('C0003', 'M0002', TO_DATE('03/15/2012 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('12/31/2012 00:00:00', 'MM/DD/YYYY HH24:MI:SS'));
Insert into SUBSCRIPTION
   (CUST_ID, MAG_ID, START_DATE, END_DATE)
 Values
   ('C0008', 'M0001', TO_DATE('03/21/2012 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('12/31/2012 00:00:00', 'MM/DD/YYYY HH24:MI:SS'));
Insert into SUBSCRIPTION
   (CUST_ID, MAG_ID, START_DATE, END_DATE)
 Values
   ('C0005', 'M0006', TO_DATE('03/31/2012 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('12/31/2012 00:00:00', 'MM/DD/YYYY HH24:MI:SS'));
COMMIT;