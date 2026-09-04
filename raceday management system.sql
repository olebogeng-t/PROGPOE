--CREATE DATABASE RACEDAY_MANAGEMENT_SYSTEM;

--CREATE TABLE EVENT_ORGANISER
--(ORGANISER_ID INT NOT NULL PRIMARY KEY,
--ORGANISER_NAME VARCHAR(50) NOT NULL,
--EMAIL VARCHAR(50) NOT NULL,
--ORGANISATION VARCHAR(50) NOT NULL );

--INSERT INTO EVENT_ORGANISER 
--VALUES (111, 'Tshetlo Olebogeng', 'oktshetlo@gmail.com', 'HERArchive' ),
--       (112, 'Boipelo Molefe', 'boipelomolefe@gmail.com', 'ABSA'),
--       (113, 'Tshimologo Letlhabi', 'tshimoletlhabi@gmail.com', 'TLABS'),
--      (114, 'Stephinah Ntsoko', 'mmabosigos@gmail.com', 'SAPS');

--CREATE TABLE CATEGORY
--(CATEGORY_ID INT PRIMARY KEY NOT NULL,
--CATEGORY_NAME VARCHAR(50) NOT NULL,
--ENTRY_REQUIREMENTS VARCHAR(100) NOT NULL,
--CATEGORY_DESCRIPTION VARCHAR(100) NOT NULL);

--INSERT INTO CATEGORY
--VALUES(441, 'Community walks', ' sports wear, water bottle', 'meet up at the randezvous and then the walk begins.'),
--      (442, 'Park runs','water bottle, proper attire', 'routes will be communicated by organisers and then the run begins.'),
      --(443, 'Charity cycling', 'water bottle, proper attire, bicycle', 'participants will gather and start cycling at the same time.');

--CREATE TABLE RACEDAY_EVENT
--(EVENT_ID INT PRIMARY KEY NOT NULL,
--EVENT_NAME VARCHAR(50) NOT NULL,
--EVENT_DATE VARCHAR(50) NOT NULL, 
--DURATION VARCHAR(50) NOT NULL,
--VENUE VARCHAR(40) NOT NULL,
--ORGANISER_ID INT,
--CATEGORY_ID INT,
--FOREIGN KEY (ORGANISER_ID) REFERENCES EVENT_ORGANISER(ORGANISER_ID),
--FOREIGN KEY(CATEGORY_ID) REFERENCES CATEGORY(CATEGORY_ID)
--);

--INSERT INTO RACEDAY_EVENT(EVENT_ID,EVENT_NAME,EVENT_DATE, DURATION,VENUE,ORGANISER_ID, CATEGORY_ID)
--VALUES (331, 'Cape town cycle tour',05-06-2026,'5hours','Cape town' ,113, 442),
--      (332, 'Soweto marathon', 06-07-2026, '8hours', 'Soweto', 112, 441),
--      (333, 'Two Oceans', 07-08-2026, '3hours', 'Durban', 114, 441);


--CREATE TABLE ENTRY_REGISTRATION
--(ENTRY_ID INT PRIMARY KEY NOT NULL,
--PARTICIPANT_ID VARCHAR(40) NOT NULL,
--ENTRY_STATUS VARCHAR(40) NOT NULL,
--EVENT_ID INT,
--FOREIGN KEY (EVENT_ID) REFERENCES RACEDAY_EVENT(EVENT_ID)
--);
--INSERT INTO ENTRY_REGISTRATION(ENTRY_ID, PARTICIPANT_ID, EVENT_ID, ENTRY_STATUS)
--VALUES(551, 222, 332, 'PENDING'),
--      (552, 221, 333, 'REGISTERED'),
--      (553, 223, 331, 'REGISTERED');

--CREATE TABLE PARTICIPANT 
--(PARTICIPANTID INT PRIMARY KEY NOT NULL,
--PARTICIPANT_NAME VARCHAR(50) NOT NULL,
--PARTICIPANT_SURNAME VARCHAR(50) NOT NULL,
--EMAIL VARCHAR(40) NOT NULL);

--INSERT INTO PARTICIPANT
--VALUES(221, 'Lesedi', 'Malatji','lesedi@gmail.com'),
--      (222, 'Lesego', 'Ranoko', 'leseg@gmai.com'),
--      (223, 'Momane', 'Masela', 'moman@gmail.com');

--CREATE TABLE PARTICIPANT_RESULT
--(RESULTS_ID INT PRIMARY KEY NOT NULL,
--ENTRY_ID INT 
--FOREIGN KEY (ENTRY_ID) REFERENCES ENTRY_REGISTRATION(ENTRY_ID));

--INSERT INTO PARTICIPANT_RESULT(RESULTS_ID, ENTRY_ID)
--VALUES(661, 552),
--      (662, 553),
--      (663,552);






