--12.02(a) verificare
INSERT INTO Zboruri (nr_zbor, plecare, sosire, de_la, la, aparat_zbor, nr_locuri) VALUES ('AIF154',TO_CHAR(TO_DATE('06-12-2022 15:40','DD-MM-YYYY hh24:mi'),'DD-MM-YYYY hh24:mi'),TO_CHAR(TO_DATE('06-12-2022 16:55','DD-MM-YYYY hh24:mi'),'DD-MM-YYYY hh24:mi'),'Chisinau', 'Bucuresti','AIRBUS A220',49);
--12.02(b) verificare
INSERT INTO Zboruri (nr_zbor, plecare, sosire, de_la, la, aparat_zbor, nr_locuri) VALUES ('WZ247',TO_CHAR(TO_DATE('15-12-2021 08:15','DD-MM-YYYY hh24:mi'),'DD-MM-YYYY hh24:mi'),TO_CHAR(TO_DATE('15-12-2021 9:35','DD-MM-YYYY hh24:mi'),'DD-MM-YYYY hh24:mi'),'Amsterdam', 'Cluj-Napoca', 'AIRBUS 777',64);
--2.03(a)
SELECT clasa, sursa, destinatia
FROM Bilete
WHERE valoare > 1000
ORDER BY valoare ASC, sursa DESC;
--12.03(b)
SELECT aparat_zbor, nr_locuri
FROM Zboruri
WHERE nr_locuri < 300 
ORDER BY nr_locuri ASC;

--12.04(a)
SELECT cl.nume, cl.statut, bl.nr_bilet, bl.clasa, bl.valoare, bl.sursa, bl.destinatia, zb.plecare AS "Plecare Zbor 1", zb2.plecare AS "Plecare Zbor 2", zb2.sosire AS "Sosirea finala"
FROM Clienti cl JOIN Bilete bl ON(cl.id_client = bl.id_client) JOIN Cupoane cp ON (bl.nr_bilet = cp.nr_bilet) JOIN Zboruri zb ON (cp.plecare = zb.plecare) JOIN Zboruri zb2 ON (bl.destinatia = zb2.la AND zb.la = zb2.de_la)
WHERE zb.la = 'Amsterdam' AND cl.nume = 'John Doe';
JPN120 14-12-2021 20:45
WZ246 15-12-2021 08:15
Tokyo Cluj-Napoca
21
--12.04(b)
SELECT bl.nr_bilet AS "Nr. Bilet1", bl2.nr_bilet AS "Nr. Bilet2"
FROM Bilete bl INNER JOIN Bilete bl2 ON (bl.sursa = bl2.sursa)
WHERE bl.sursa = bl2.sursa AND bl.destinatia = bl2.destinatia AND bl.id_client != bl2.id_client AND bl.nr_bilet < bl2.nr_bilet
ORDER BY bl.,nr_bilet;

--12.05(a)
SELECT nume
FROM Clienti cl JOIN Bilete bl ON (cl.id_client = bl.id_client)
WHERE bl.valoare >= ALL(SELECT bl2.valoare
						FROM Bilete bl2
						WHERE bl2.clasa = 'Economic') AND bl.clasa = 'Economic';
--12.05(b)
SELECT*
FROM Zboruri 
WHERE sosire IN (SELECT zb.sosire
				 FROM Zboruri zb
				 WHERE zb.plecare = '15-09-2021 14:15' AND zb.de_la = 'Cluj-Napoca');
				 
--12.06(a)
SELECT nr_zbor, COUNT(nr_bilet) "Numar de Bilete"
FROM Cupoane
--WHERE SUBSTR(plecare,7,4) = '2020'
GROUP BY nr_zbor;
--12.06(b)
SELECT id_client AS "Clientul", MIN(valoare) "Valoarea Minima", ROUND(AVG(valoare),2) "Valoarea Medie", MAX(valoare) "Valoarea Maxima"
FROM Bilete 
GROUP BY id_client;

--12.07(a)
INSERT INTO Zboruri (nr_zbor, plecare, sosire, de_la, la, aparat_zbor, nr_locuri) VALUES ('AIF213',TO_CHAR(TO_DATE('15-08-2019 10:45','DD-MM-YYYY hh24:mi'),'DD-MM-YYYY hh24:mi'),TO_CHAR(TO_DATE('15-08-2019 13:05','DD-MM-YYYY hh24:mi'),'DD-MM-YYYY hh24:mi'),'A', 'B','AIRBUS 310-325',100);
INSERT INTO Bilete(nr_bilet, clasa, valoare, sursa, destinatia, id_client) VALUES (123, 'Economic', 365.12, 'A', 'B', 3);
INSERT INTO Cupoane(nr_bilet, nr_zbor, plecare, clasa_efectiva, loc) VALUES (123,'AIF213',TO_CHAR(TO_DATE('15-08-2019 10:45','DD-MM-YYYY hh24:mi'),'DD-MM-YYYY hh24:mi'),'Economic','89');
--12.07(b)
(Adaugam un zbor ce nu este asociat cu un cupon)
INSERT INTO Zboruri (nr_zbor, plecare, sosire, de_la, la, aparat_zbor, nr_locuri) VALUES ('AIF219',TO_CHAR(TO_DATE('06-10-2022 15:40','DD-MM-YYYY hh24:mi'),'DD-MM-YYYY hh24:mi'),TO_CHAR(TO_DATE('06-10-2022 16:55','DD-MM-YYYY hh24:mi'),'DD-MM-YYYY hh24:mi'),'Iasi', 'Bucuresti','AIRBUS A520',55);
(Stergem)
DELETE FROM Zboruri
WHERE nr_zbor NOT IN (SELECT nr_zbor FROM Cupoane);
--12.07(c)
(inseram date necesare rezolvarii exercitiului)
INSERT INTO Zboruri (nr_zbor, plecare, sosire, de_la, la, aparat_zbor, nr_locuri) VALUES ('AIF313',TO_CHAR(TO_DATE('03-08-2021 16:55','DD-MM-YYYY hh24:mi'),'DD-MM-YYYY hh24:mi'),TO_CHAR(TO_DATE('03-08-2021 23:30','DD-MM-YYYY hh24:mi'),'DD-MM-YYYY hh24:mi'),'Bucuresti', 'Lisabona','AIRBUS A20',120);
INSERT INTO Bilete(nr_bilet, clasa, valoare, sursa, destinatia, id_client) VALUES (15, 'Business', 248.36, 'Bucuresti', 'Lisabona', 5);
INSERT INTO Cupoane(nr_bilet, nr_zbor, plecare, clasa_efectiva, loc) VALUES (15,'AIF313',TO_CHAR(TO_DATE('03-08-2021 16:55','DD-MM-YYYY hh24:mi'),'DD-MM-YYYY hh24:mi'),'Business','B15');
UPDATE Bilete
SET valoare = valoare*0.95
WHERE id_client IN (SELECT cl.id_client
					FROM Clienti cl 
					WHERE cl.statut = 'VIP') AND nr_bilet IN (SELECT cp.nr_bilet
															  FROM Cupoane cp
															  WHERE SUBSTR(cp.plecare,1,10) = '03-08-2021' AND nr_zbor IN (SELECT zb.nr_zbor 
																														   FROM Zboruri zb WHERE zb.de_la = 'Bucuresti'))
--12.08(a)
create or replace TRIGGER nr_locuri_trigg
	AFTER INSERT OR DELETE ON Cupoane FOR EACH ROW
BEGIN
	IF INSERTING THEN
		UPDATE Zboruri 
		SET nr_locuri = nr_locuri + 1
		WHERE nr_zbor = :NEW.nr_zbor; 
	ELSIF DELETING THEN
		UPDATE Zboruri
		SET nr_locuri = nr_locuri - 1
		WHERE nr_zbor = :OLD.nr_zbor; 
	END IF;
END nr_locuri_trigg;
(Verificare)
INSERT INTO Bilete(nr_bilet, clasa, valoare, sursa, destinatia, id_client) VALUES (39, 'Economic', 162.50, 'Paris', 'Los Angeles', 1);
INSERT INTO Cupoane(nr_bilet, nr_zbor, plecare, clasa_efectiva, loc) VALUES (39,'AIR199',TO_CHAR(TO_DATE('07-12-2020 06:05','DD-MM-YYYY hh24:mi'),'DD-MM-YYYY hh24:mi'),'Economic','F3');
DELETE FROM Cupoane WHERE nr_bilet = 39;
--12.08(b)
--12.08(c)
CREATE OR REPLACE TRIGGER bilte_vip_insert_trigg
INSTEAD OF INSERT ON BileteVip
BEGIN
INSERT INTO Clienti
VALUES (:NEW.id_client, :NEW.numeclient, 'VIP', :NEW.adresa, :New.telefon);
INSERT INTO Bilete
VALUES (:NEW.nr_bilet, :NEW.clasa, :NEW.valoare, :NEW.sursa, :NEW.destinatia, :NEW.id_client);
END;
(Verificare)
INSERT INTO BileteVIP
VALUES(8,'Mark Jackson', 'Los Angeles, Hollywood Bd.', '074512397468', 101, 'C', 'D', 'Business', 1245.50);