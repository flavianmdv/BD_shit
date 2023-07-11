DROP TABLE IF EXISTS Certificare;
DROP TABLE IF EXISTS Zboruri;
DROP TABLE IF EXISTS Aeronave;
DROP TABLE IF EXISTS Angajati;


CREATE TABLE Zboruri
 (
    nrz int ,
    de_la varchar(255),
    la varchar(255),
    distanta int,
    plecare time,
    sosire time
);

CREATE TABLE Aeronave (
    idav int,
    numeav varchar(25),
    gama_croaziera varchar(25)
);

CREATE TABLE Certificare (
    idav int,
    idan int,
    CONSTRAINT CERTIFICARE_PK PRIMARY KEY (idav, idan)


);

CREATE TABLE Angajati (
    idan int,
    numean varchar(25),
    functie varchar(25),
    salariu int
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
ADD zi varchar(3);


ALTER TABLE Zboruri
ADD CONSTRAINT zboruri_constraint CHECK (plecare != sosire);

ALTER TABLE Angajati
ADD CONSTRAINT CHK_Angajati CHECK ((salariu>5000 AND functie='director') OR functie != 'director');

INSERT INTO Zboruri (nrz, de_la, la, distanta, plecare, sosire, zi) VALUES (1, 'Cluj', 'Brasov', 250, '04:30','05:30', 'Sa');

INSERT INTO Zboruri(nrz, de_la, la, distanta, plecare, sosire, zi) VALUES(9, 'Copenhaga', 'Cluj-Napoca', 1250,'12:10', '15:35', 'Lu');

INSERT INTO Zboruri(nrz, de_la, la, distanta, plecare, sosire, zi) VALUES(2, 'Copenhaga', 'Cluj-Napoca', 1250, '18:20', '23:55', 'Vi');

INSERT INTO Zboruri(nrz, de_la, la, distanta, plecare, sosire, zi) VALUES(4, 'Bucuresti', 'New-York', 4560, '10:30', '19:45', 'Ma');

INSERT INTO Zboruri(nrz, de_la, la, distanta, plecare, sosire, zi) VALUES(3, 'Bucuresti', 'Cluj-Napoca', 400, '17:20','19:35', 'Du');

INSERT INTO Zboruri(nrz, de_la, la, distanta, plecare, sosire, zi) VALUES(5, 'Suceava', 'Cluj-Napoca', 400,'17:20', '18:35', 'Du');

INSERT INTO Zboruri(nrz, de_la, la, distanta, plecare, sosire, zi) VALUES(6, 'Suceava', 'Brasov', 300,'17:20','19:20', 'Du');

INSERT INTO Zboruri(nrz, de_la, la, distanta, plecare, sosire, zi) VALUES(7, 'Suceava', 'Brasov', 300, '17:20', '18:20', 'Du');

INSERT INTO Zboruri(nrz, de_la, la, distanta, plecare, sosire, zi) VALUES(8, 'Suceava', 'Iasi', 300, '17:00','18:20', 'Du');

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



