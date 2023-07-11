--Baza de date Aeroport--

--Ajuta la recrearea tabelelor in caz ca deja exista--
--12.01(a,b,c,d,e,f)
DROP TABLE Cupoane;
DROP TABLE Zboruri;
DROP TABLE Bilete;
DROP TABLE Clienti;
--------------------creare tabele----------------------
CREATE TABLE Clienti(
	id_client NUMBER NOT NULL,
	nume VARCHAR2(20) NOT NULL,
	statut VARCHAR2(5) NOT NULL,
	adresa VARCHAR2(30) NOT NULL);

CREATE TABLE Bilete(
	nr_bilet NUMBER NOT NULL,
	clasa VARCHAR2(10) NOT NULL,
	valoare NUMBER(8,2) NOT NULL,
	sursa VARCHAR2(20) NOT NULL,
	destinatia VARCHAR2(20) NOT NULL,
	id_client NUMBER NOT NULL);
	
CREATE TABLE Zboruri(
	nr_zbor VARCHAR2(10) NOT NULL,
	plecare VARCHAR2(30) NOT NULL,
	sosire VARCHAR2(30) NOT NULL,
	de_la VARCHAR2(20) NOT NULL,
	la VARCHAR2(20) NOT NULL,
	aparat_zbor VARCHAR2(20) NOT NULL,
	nr_locuri NUMBER);

CREATE TABLE Cupoane(
	nr_bilet NUMBER NOT NULL,
	nr_zbor VARCHAR2(10) NOT NULL,
	plecare VARCHAR2(30) NOT NULL,
	clasa_efectiva VARCHAR2(10) NOT NULL,
	loc VARCHAR2(5) NOT NULL);	
--------------------declarare pk si fk----------------------
ALTER TABLE Clienti ADD CONSTRAINT clienti_id_client_pk PRIMARY KEY (id_client);

ALTER TABLE Bilete ADD CONSTRAINT bilete_nr_bilet_pk PRIMARY KEY (nr_bilet);

ALTER TABLE Zboruri ADD CONSTRAINT zboruri_pk PRIMARY KEY (nr_zbor, plecare);

ALTER TABLE Cupoane ADD CONSTRAINT cupoane_pk PRIMARY KEY (nr_bilet, nr_zbor, plecare);

ALTER TABLE Cupoane ADD 
	CONSTRAINT nr_bilet_cupoane_fk FOREIGN KEY (nr_bilet) REFERENCES Bilete (nr_bilet);
	
ALTER TABLE Cupoane ADD 
	CONSTRAINT nr_zbor_cupoane_fk FOREIGN KEY (nr_zbor,plecare) REFERENCES Zboruri (nr_zbor,plecare);
	
ALTER TABLE Bilete ADD 
	CONSTRAINT id_client_bilete_fk FOREIGN KEY (id_client) REFERENCES Clienti (id_client);
--------------adaugare coloana telefon la Clienti----------------------
ALTER TABLE Clienti ADD telefon VARCHAR2(20) NOT NULL;

--12.02(a)
ALTER TABLE Zboruri ADD CONSTRAINT nr_locuri_zboruri_ck CHECK (nr_locuri BETWEEN 50 AND 900);
--12.02(b)
ALTER TABLE Zboruri ADD CONSTRAINT aparat_zbor_zboruri_ck CHECK ((nr_zbor LIKE 'WZ%' AND aparat_zbor LIKE 'BOEING%')OR nr_zbor NOT LIKE ('WZ%'));
---------------Popularea tabelelor----------------------------
INSERT INTO Zboruri (nr_zbor, plecare, sosire, de_la, la, aparat_zbor, nr_locuri) VALUES ('AIF217',TO_CHAR(TO_DATE('06-12-2021 15:40','DD-MM-YYYY hh24:mi'),'DD-MM-YYYY hh24:mi'),TO_CHAR(TO_DATE('06-12-2021 16:55','DD-MM-YYYY hh24:mi'),'DD-MM-YYYY hh24:mi'),'Chisinau', 'Bucuresti','AIRBUS A220',100);
INSERT INTO Zboruri (nr_zbor, plecare, sosire, de_la, la, aparat_zbor, nr_locuri) VALUES ('AIF513',TO_CHAR(TO_DATE('06-12-2021 16:55','DD-MM-YYYY hh24:mi'),'DD-MM-YYYY hh24:mi'),TO_CHAR(TO_DATE('06-12-2021 20:30','DD-MM-YYYY hh24:mi'),'DD-MM-YYYY hh24:mi'),'Bucuresti', 'Londra','AIRBUS A320',70);
INSERT INTO Zboruri (nr_zbor, plecare, sosire, de_la, la, aparat_zbor, nr_locuri) VALUES ('AIR199',TO_CHAR(TO_DATE('07-12-2020 06:05','DD-MM-YYYY hh24:mi'),'DD-MM-YYYY hh24:mi'),TO_CHAR(TO_DATE('07-12-2020 17:55','DD-MM-YYYY hh24:mi'),'DD-MM-YYYY hh24:mi'),'Paris', 'Los Angeles','AIRBUS A350',550);
INSERT INTO Zboruri (nr_zbor, plecare, sosire, de_la, la, aparat_zbor, nr_locuri) VALUES ('WZ210',TO_CHAR(TO_DATE('15-09-2021 14:15','DD-MM-YYYY hh24:mi'),'DD-MM-YYYY hh24:mi'),TO_CHAR(TO_DATE('15-09-2021 17:35','DD-MM-YYYY hh24:mi'),'DD-MM-YYYY hh24:mi'),'Cluj-Napoca', 'Billund','BOEING 767',50);
INSERT INTO Zboruri (nr_zbor, plecare, sosire, de_la, la, aparat_zbor, nr_locuri) VALUES ('AIR545',TO_CHAR(TO_DATE('15-09-2021 15:15','DD-MM-YYYY hh24:mi'),'DD-MM-YYYY hh24:mi'),TO_CHAR(TO_DATE('15-09-2021 17:35','DD-MM-YYYY hh24:mi'),'DD-MM-YYYY hh24:mi'),'Berlin', 'Roma','Comac C919',150);
INSERT INTO Zboruri (nr_zbor, plecare, sosire, de_la, la, aparat_zbor, nr_locuri) VALUES ('JPN210',TO_CHAR(TO_DATE('12-12-2020 21:45','DD-MM-YYYY hh24:mi'),'DD-MM-YYYY hh24:mi'),TO_CHAR(TO_DATE('13-12-2020 08:05','DD-MM-YYYY hh24:mi'),'DD-MM-YYYY hh24:mi'),'Madrid', 'Tokyo','Mitsubishi SpaceJet',350);
INSERT INTO Zboruri (nr_zbor, plecare, sosire, de_la, la, aparat_zbor, nr_locuri) VALUES ('JPN120',TO_CHAR(TO_DATE('14-12-2021 20:45','DD-MM-YYYY hh24:mi'),'DD-MM-YYYY hh24:mi'),TO_CHAR(TO_DATE('15-12-2021 08:15','DD-MM-YYYY hh24:mi'),'DD-MM-YYYY hh24:mi'),'Tokyo', 'Amsterdam','Mitsubishi SpaceJet',134);
INSERT INTO Zboruri (nr_zbor, plecare, sosire, de_la, la, aparat_zbor, nr_locuri) VALUES ('WZ246',TO_CHAR(TO_DATE('15-12-2021 08:15','DD-MM-YYYY hh24:mi'),'DD-MM-YYYY hh24:mi'),TO_CHAR(TO_DATE('15-12-2021 9:35','DD-MM-YYYY hh24:mi'),'DD-MM-YYYY hh24:mi'),'Amsterdam', 'Cluj-Napoca','BOEING 777',64);

INSERT INTO Clienti(id_client, nume, statut, adresa, telefon) VALUES (1, 'Nicoara Cristian', 'VIP' , 'Cluj-Napoca, Observatorului 34', '0563974813');
INSERT INTO Clienti(id_client, nume, statut, adresa, telefon) VALUES (2, 'Maria Ginnolli', 'C' , 'Roma, Via del Corso', '6974513776');
INSERT INTO Clienti(id_client, nume, statut, adresa, telefon) VALUES (3, 'Franklin Clinton', 'VIP' , 'Los Angeles, Hollywood Bd.', '074598713546');
INSERT INTO Clienti(id_client, nume, statut, adresa, telefon) VALUES (4, 'Pierre Lloris', 'C' , 'Paris, Avenue Montaigne', '0234578136');
INSERT INTO Clienti(id_client, nume, statut, adresa, telefon) VALUES (5, 'Akane Tanaka', 'VIP' , 'Tokyo, Godzilla Road', '07889451365');
INSERT INTO Clienti(id_client, nume, statut, adresa, telefon) VALUES (6, 'Camilla Lopez', 'C' , 'Madrid, Alcala street', '0654732159');
INSERT INTO Clienti(id_client, nume, statut, adresa, telefon) VALUES (7, 'John Doe', 'VIP' , 'Los Angeles, Sunset Bd.', '074598723976');

INSERT INTO Bilete(nr_bilet, clasa, valoare, sursa, destinatia, id_client) VALUES (10, 'Business', 1587.15, 'Chisinau', 'Londra', 1);
INSERT INTO Bilete(nr_bilet, clasa, valoare, sursa, destinatia, id_client) VALUES (34, 'Economic', 162.50, 'Paris', 'Los Angeles', 1);
INSERT INTO Bilete(nr_bilet, clasa, valoare, sursa, destinatia, id_client) VALUES (35, 'Economic', 162.50, 'Paris', 'Los Angeles', 4);
INSERT INTO Bilete(nr_bilet, clasa, valoare, sursa, destinatia, id_client) VALUES (12, 'Economic', 35.00, 'Cluj-Napoca', 'Billund', 4);
INSERT INTO Bilete(nr_bilet, clasa, valoare, sursa, destinatia, id_client) VALUES (100, 'Economic', 35.00, 'Cluj-Napoca', 'Billund', 6);
INSERT INTO Bilete(nr_bilet, clasa, valoare, sursa, destinatia, id_client) VALUES (2, 'Economic', 75.50, 'Berlin', 'Roma', 6);
INSERT INTO Bilete(nr_bilet, clasa, valoare, sursa, destinatia, id_client) VALUES (1, 'Economic', 75.50, 'Berlin', 'Roma', 2);
INSERT INTO Bilete(nr_bilet, clasa, valoare, sursa, destinatia, id_client) VALUES (9, 'Business', 350.75, 'Madrid', 'Tokyo', 2);
INSERT INTO Bilete(nr_bilet, clasa, valoare, sursa, destinatia, id_client) VALUES (5, 'Business', 350.75, 'Madrid', 'Tokyo', 5);
INSERT INTO Bilete(nr_bilet, clasa, valoare, sursa, destinatia, id_client) VALUES (37, 'Economic', 162.50, 'Paris', 'Los Angeles', 5);
INSERT INTO Bilete(nr_bilet, clasa, valoare, sursa, destinatia, id_client) VALUES (20, 'Business', 2250.75, 'Tokyo', 'Cluj-Napoca', 3);
INSERT INTO Bilete(nr_bilet, clasa, valoare, sursa, destinatia, id_client) VALUES (7, 'Business', 350.75, 'Madrid', 'Tokyo', 3);
INSERT INTO Bilete(nr_bilet, clasa, valoare, sursa, destinatia, id_client) VALUES (3, 'Economic', 75.50, 'Berlin', 'Roma', 7);
INSERT INTO Bilete(nr_bilet, clasa, valoare, sursa, destinatia, id_client) VALUES (21, 'Business', 2250.75, 'Tokyo', 'Cluj-Napoca', 7);

INSERT INTO Cupoane(nr_bilet, nr_zbor, plecare, clasa_efectiva, loc) VALUES (10,'AIF217',TO_CHAR(TO_DATE('06-12-2021 15:40','DD-MM-YYYY hh24:mi'),'DD-MM-YYYY hh24:mi'),'Business','A15');
INSERT INTO Cupoane(nr_bilet, nr_zbor, plecare, clasa_efectiva, loc) VALUES (10,'AIF513',TO_CHAR(TO_DATE('06-12-2021 16:55','DD-MM-YYYY hh24:mi'),'DD-MM-YYYY hh24:mi'),'Business','A20');
INSERT INTO Cupoane(nr_bilet, nr_zbor, plecare, clasa_efectiva, loc) VALUES (35,'AIR199',TO_CHAR(TO_DATE('07-12-2020 06:05','DD-MM-YYYY hh24:mi'),'DD-MM-YYYY hh24:mi'),'Economic','E3');
INSERT INTO Cupoane(nr_bilet, nr_zbor, plecare, clasa_efectiva, loc) VALUES (34,'AIR199',TO_CHAR(TO_DATE('07-12-2020 06:05','DD-MM-YYYY hh24:mi'),'DD-MM-YYYY hh24:mi'),'Economic','F3');
INSERT INTO Cupoane(nr_bilet, nr_zbor, plecare, clasa_efectiva, loc) VALUES (37,'AIR199',TO_CHAR(TO_DATE('07-12-2020 06:05','DD-MM-YYYY hh24:mi'),'DD-MM-YYYY hh24:mi'),'Economic','F12');
INSERT INTO Cupoane(nr_bilet, nr_zbor, plecare, clasa_efectiva, loc) VALUES (100,'WZ210',TO_CHAR(TO_DATE('15-09-2021 14:15','DD-MM-YYYY hh24:mi'),'DD-MM-YYYY hh24:mi'),'Economic','B7');
INSERT INTO Cupoane(nr_bilet, nr_zbor, plecare, clasa_efectiva, loc) VALUES (12,'WZ210',TO_CHAR(TO_DATE('15-09-2021 14:15','DD-MM-YYYY hh24:mi'),'DD-MM-YYYY hh24:mi'),'Economic','A7');
INSERT INTO Cupoane(nr_bilet, nr_zbor, plecare, clasa_efectiva, loc) VALUES (1,'AIR545',TO_CHAR(TO_DATE('15-09-2021 15:15','DD-MM-YYYY hh24:mi'),'DD-MM-YYYY hh24:mi'),'Economic','D19');
INSERT INTO Cupoane(nr_bilet, nr_zbor, plecare, clasa_efectiva, loc) VALUES (2,'AIR545',TO_CHAR(TO_DATE('15-09-2021 15:15','DD-MM-YYYY hh24:mi'),'DD-MM-YYYY hh24:mi'),'Economic','F19');
INSERT INTO Cupoane(nr_bilet, nr_zbor, plecare, clasa_efectiva, loc) VALUES (3,'AIR545',TO_CHAR(TO_DATE('15-09-2021 15:15','DD-MM-YYYY hh24:mi'),'DD-MM-YYYY hh24:mi'),'Economic','F9');
INSERT INTO Cupoane(nr_bilet, nr_zbor, plecare, clasa_efectiva, loc) VALUES (5,'JPN210',TO_CHAR(TO_DATE('12-12-2020 21:45','DD-MM-YYYY hh24:mi'),'DD-MM-YYYY hh24:mi'),'Business','E21');
INSERT INTO Cupoane(nr_bilet, nr_zbor, plecare, clasa_efectiva, loc) VALUES (9,'JPN210',TO_CHAR(TO_DATE('12-12-2020 21:45','DD-MM-YYYY hh24:mi'),'DD-MM-YYYY hh24:mi'),'Business','D21');
INSERT INTO Cupoane(nr_bilet, nr_zbor, plecare, clasa_efectiva, loc) VALUES (7,'JPN210',TO_CHAR(TO_DATE('12-12-2020 21:45','DD-MM-YYYY hh24:mi'),'DD-MM-YYYY hh24:mi'),'Business','A1');
INSERT INTO Cupoane(nr_bilet, nr_zbor, plecare, clasa_efectiva, loc) VALUES (20,'JPN120',TO_CHAR(TO_DATE('14-12-2021 20:45','DD-MM-YYYY hh24:mi'),'DD-MM-YYYY hh24:mi'),'Business','C2');
INSERT INTO Cupoane(nr_bilet, nr_zbor, plecare, clasa_efectiva, loc) VALUES (20,'WZ246',TO_CHAR(TO_DATE('15-12-2021 08:15','DD-MM-YYYY hh24:mi'),'DD-MM-YYYY hh24:mi'),'Business','E21');
INSERT INTO Cupoane(nr_bilet, nr_zbor, plecare, clasa_efectiva, loc) VALUES (21,'JPN120',TO_CHAR(TO_DATE('14-12-2021 20:45','DD-MM-YYYY hh24:mi'),'DD-MM-YYYY hh24:mi'),'Business','A2');
INSERT INTO Cupoane(nr_bilet, nr_zbor, plecare, clasa_efectiva, loc) VALUES (21,'WZ246',TO_CHAR(TO_DATE('15-12-2021 08:15','DD-MM-YYYY hh24:mi'),'DD-MM-YYYY hh24:mi'),'Business','D13');
