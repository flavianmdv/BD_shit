DROP TABLE Zboruri;
DROP TABLE Certificare;
DROP TABLE Aeronave;
DROP TABLE Angajati;

CREATE TABLE Zboruri
 (
    nrz number NOT NULL,
    de_la varchar2(255),
    la varchar2(255),
    distanta number,
    plecare timestamp,
    sosire timestamp
);

CREATE TABLE Aeronave (
    idav number NOT NULL,
    numeav varchar2(25),
    gama_croaziera varchar2(25)
);

CREATE TABLE Certificare (
    idav number NOT NULL,
    idan number NOT NULL,
    CONSTRAINT "CERTIFICARE_PK" PRIMARY KEY (idav, idan)
USING INDEX ENABLE

);

CREATE TABLE Angajati (
    idan number NOT NULL,
    numean varchar2(25),
    functie varchar2(25),
    salariu number
);
ALTER TABLE Zboruri
ADD PRIMARY KEY (nrz);

ALTER TABLE Angajati
ADD PRIMARY KEY (idan);

ALTER TABLE Aeronave
ADD PRIMARY KEY (idav);

ALTER TABLE Certificare
ADD FOREIGN KEY (idan) REFERENCES Angajati(idan);

ALTER TABLE Certificare
ADD FOREIGN KEY (idav) REFERENCES Aeronave(idav);

ALTER TABLE Zboruri
ADD zi varchar2(3);


ALTER TABLE Zboruri
ADD CONSTRAINT zboruri_constraint CHECK (plecare != sosire);

ALTER TABLE Angajati
ADD CONSTRAINT CHK_Angajati CHECK ((salariu>5000 AND functie='director') OR functie != 'director');

INSERT INTO Zboruri (nrz, de_la, la, distanta, plecare, sosire, zi) VALUES (1, 'Cluj', 'Brasov', 250, TO_DATE('04:30', 'HH24:MI'), TO_DATE('05:30', 'HH24:MI'), 'Sa');

INSERT INTO Zboruri(nrz, de_la, la, distanta, plecare, sosire, zi) VALUES(9, 'Copenhaga', 'Cluj-Napoca', 1250, TO_DATE('12:10','HH24:MI'), TO_DATE('15:35','HH24:MI'), 'Lu');

INSERT INTO Zboruri(nrz, de_la, la, distanta, plecare, sosire, zi) VALUES(2, 'Copenhaga', 'Cluj-Napoca', 1250, TO_DATE('18:20','HH24:MI'), TO_DATE('23:55','HH24:MI'), 'Vi');

INSERT INTO Zboruri(nrz, de_la, la, distanta, plecare, sosire, zi) VALUES(4, 'Bucuresti', 'New-York', 4560, TO_DATE('10:30','HH24:MI'), TO_DATE('19:45','HH24:MI'), 'Ma');

INSERT INTO Zboruri(nrz, de_la, la, distanta, plecare, sosire, zi) VALUES(3, 'Bucuresti', 'Cluj-Napoca', 400, TO_DATE('17:20','HH24:MI'), TO_DATE('19:35','HH24:MI'), 'Du');

INSERT INTO Zboruri(nrz, de_la, la, distanta, plecare, sosire, zi) VALUES(5, 'Suceava', 'Cluj-Napoca', 400,TO_DATE('17:20','HH24:MI') , TO_DATE('18:35','HH24:MI'), 'Du');

INSERT INTO Zboruri(nrz, de_la, la, distanta, plecare, sosire, zi) VALUES(6, 'Suceava', 'Brasov', 300,TO_DATE('17:20','HH24:MI'),TO_DATE('19:20','HH24:MI') , 'Du');

INSERT INTO Zboruri(nrz, de_la, la, distanta, plecare, sosire, zi) VALUES(7, 'Suceava', 'Brasov', 300, TO_DATE('17:20','HH24:MI'), TO_DATE('18:20','HH24:MI'), 'Du');

INSERT INTO Zboruri(nrz, de_la, la, distanta, plecare, sosire, zi) VALUES(8, 'Suceava', 'Iasi', 300, TO_DATE('17:00','HH24:MI'),TO_DATE('18:20','HH24:MI'), 'Du');

INSERT INTO Aeronave(idav, numeav,gama_croaziera) VALUES(101, 'BOEING 737-300', 850);

INSERT INTO Aeronave(idav, numeav, gama_croaziera) VALUES(102, 'AIRBUS 318-111', 5000);

INSERT INTO Aeronave(idav, numeav, gama_croaziera) VALUES(103, 'ATR 42-500', 2500);

INSERT INTO Aeronave(idav, numeav, gama_croaziera) VALUES(104, 'Antonov An-124', 4500);

INSERT INTO Aeronave(idav, numeav,gama_croaziera) VALUES(105, 'BOEING 737-300', 4600);

INSERT INTO Aeronave(idav, numeav,gama_croaziera) VALUES(106, 'BOEING 737-800', 5420);

INSERT INTO Angajati (idan, numean, functie, salariu) VALUES(1, 'John Doe', 'pilot', 5500);

INSERT INTO Angajati (idan, numean, functie, salariu) VALUES(2, 'Gigi Becali', 'patron', 1500);

INSERT INTO Angajati (idan, numean, functie, salariu) VALUES(3, 'Ion Tiriac', 'pilot', 6500);

INSERT INTO Angajati (idan, numean, functie, salariu) VALUES(4, 'Gica Hagi', 'director', 9500);

INSERT INTO Angajati (idan, numean, functie, salariu) VALUES(5, 'Istrate Andrei', 'pilot', 9500);

INSERT INTO Certificare (idan, idav) VALUES(1, 103);

INSERT INTO Certificare (idan, idav) VALUES(3, 103);

INSERT INTO Certificare (idan, idav) VALUES(3, 101);

INSERT INTO Certificare (idan, idav) VALUES(5, 101);



