USE colocviu_firma;
/*
DROP TABLE furnizori;
DROP TABLE piese;
DROP TABLE catalog;
DROP TABLE comenzi;
*/

CREATE TABLE furnizori (
	idf INT(3),
 	numef VARCHAR(20),
 	adresa VARCHAR(40));

CREATE TABLE piese (
        idp INT(5),
        numep VARCHAR(30),
        culoare VARCHAR(10));

CREATE TABLE catalog (
        idf INT(3),
        idp INT(5),
        pret REAL(6,2));

CREATE TABLE comenzi (
        idc INT(3),
        idf INT(3),
        idp INT(5),
        cantitate INT(4));


ALTER TABLE furnizori
ADD CONSTRAINT furnizori_idf_pk PRIMARY KEY(idf);

ALTER TABLE piese
ADD CONSTRAINT piese_idp_pk PRIMARY KEY (idp);

ALTER TABLE catalog
ADD CONSTRAINT catalog_idf_idp_pk PRIMARY KEY(idf, idp);

ALTER TABLE comenzi
ADD CONSTRAINT comenzi_idc_idf_idp_pk PRIMARY KEY(idc, idf, idp);


ALTER TABLE catalog
ADD CONSTRAINT catalog_idf_fk FOREIGN KEY (idf) REFERENCES furnizori(idf) ON DELETE CASCADE;

ALTER TABLE catalog
ADD CONSTRAINT catalog_idp_fk FOREIGN KEY (idp) REFERENCES piese(idp) ON DELETE CASCADE;

ALTER TABLE comenzi
ADD CONSTRAINT comenzi_idf_fk FOREIGN KEY (idf) REFERENCES furnizori(idf) ON DELETE CASCADE;

ALTER TABLE comenzi
ADD CONSTRAINT comenzi_idp_fk FOREIGN KEY (idp) REFERENCES piese(idp) ON DELETE CASCADE;


ALTER TABLE catalog
ADD (moneda VARCHAR(3));

ALTER TABLE catalog
ADD CONSTRAINT catalog_moneda_ck CHECK (moneda = 'EUR' or moneda = 'USD' or moneda = 'RON');


ALTER TABLE catalog
ADD CONSTRAINT catalog_pret_pozitiv_ck CHECK (pret > 0);

ALTER TABLE piese
ADD CONSTRAINT piese_piulita_alb_ck CHECK (numep != '%piulita%' OR culoare = 'alb');


INSERT INTO furnizori (idf, numef, adresa) VALUES (15, 'Strim Metal', 'Ramnicu Valcea, Baciului, 38');
INSERT INTO furnizori (idf, numef, adresa) VALUES (12, 'Dumivest', 'Arad, Calea Rodnei, 236');
INSERT INTO furnizori (idf, numef, adresa) VALUES (105, 'Sea Romania', 'Bucuresti, Iazului, 108');
INSERT INTO furnizori (idf, numef, adresa) VALUES (100, 'Mafcom', 'Cluj-Napoca, Muncii, 16');
INSERT INTO furnizori (idf, numef, adresa) VALUES (101, 'BendKopp', 'Gilau, Principala, 12');
INSERT INTO furnizori (idf, numef, adresa) VALUES (38, 'Essentra Components', 'Lanford, Oxon, 68');
INSERT INTO furnizori (idf, numef, adresa) VALUES (206, 'Euro Metric', 'Alba Iulia, Republicii, 70');

INSERT INTO piese (idp, numep, culoare) VALUES (12, 'surub', 'gri');
INSERT INTO piese (idp, numep, culoare) VALUES (15, 'cui', 'argintiu');
INSERT INTO piese (idp, numep, culoare) VALUES (21, 'tija filetata', 'gri');
INSERT INTO piese (idp, numep, culoare) VALUES (99, 'piulita', 'alb');
INSERT INTO piese (idp, numep, culoare) VALUES (120, 'intinzator', 'albastru');
INSERT INTO piese (idp, numep, culoare) VALUES (231, 'diblu', 'alb');
INSERT INTO piese (idp, numep, culoare) VALUES (682, 'coltar metalic', 'argintiu');
INSERT INTO piese (idp, numep, culoare) VALUES (11, 'saiba', 'negru');
INSERT INTO piese (idp, numep, culoare) VALUES (203, 'prezon', 'gri');
INSERT INTO piese (idp, numep, culoare) VALUES (78, 'inel ghidaj', 'rosu');
INSERT INTO piese (idp, numep, culoare) VALUES (708, 'nit', 'negru');
INSERT INTO piese (idp, numep, culoare) VALUES (523, 'distantier', 'alb');
INSERT INTO piese (idp, numep, culoare) VALUES (333, 'suport cablu', 'argintiu');
INSERT INTO piese (idp, numep, culoare) VALUES (106, 'balama', 'auriu');
INSERT INTO piese (idp, numep, culoare) VALUES (293, 'holzsurub', 'auriu');
INSERT INTO piese (idp, numep, culoare) VALUES (999, 'conexpad', 'gri');
INSERT INTO piese (idp, numep, culoare) VALUES (402, 'disc', 'verde');
INSERT INTO piese (idp, numep, culoare) VALUES (564, 'insertie filetata', 'alb');
INSERT INTO piese (idp, numep, culoare) VALUES (882, 'element fixare panou', 'negru');
INSERT INTO piese (idp, numep, culoare) VALUES (883, 'element prindere', 'negru');
INSERT INTO piese (idp, numep, culoare) VALUES (891, 'stift', 'gri');
INSERT INTO piese (idp, numep, culoare) VALUES (372, 'maner', 'alb');
INSERT INTO piese (idp, numep, culoare) VALUES (392, 'glisiera', 'gri');
INSERT INTO piese (idp, numep, culoare) VALUES (104, 'rotita', 'negru');
INSERT INTO piese (idp, numep, culoare) VALUES (723, 'picior nivelare', 'gri');
INSERT INTO piese (idp, numep, culoare) VALUES (724, 'picior suport', 'gri');
INSERT INTO piese (idp, numep, culoare) VALUES (79, 'inel ridicare', 'alb');
INSERT INTO piese (idp, numep, culoare) VALUES (135, 'garnitura', 'negru');
INSERT INTO piese (idp, numep, culoare) VALUES (387, 'cap bara', 'argintiu');
INSERT INTO piese (idp, numep, culoare) VALUES (709, 'pop-nit', 'negru');
INSERT INTO piese (idp, numep, culoare) VALUES (292, 'ancora otel', 'gri');
INSERT INTO piese (idp, numep, culoare) VALUES (334, 'legatura cablu', 'albastru');
INSERT INTO piese (idp, numep, culoare) VALUES (332, 'cablu', 'albastru');

INSERT INTO catalog(idf, idp, pret, moneda) VALUES (15, 12, 9, 'RON');
INSERT INTO catalog(idf, idp, pret, moneda) VALUES (15, 15, 3, 'RON');
INSERT INTO catalog(idf, idp, pret, moneda) VALUES (15, 21, 7.2, 'EUR');
INSERT INTO catalog(idf, idp, pret, moneda) VALUES (15, 99, 2.1, 'RON');
INSERT INTO catalog(idf, idp, pret, moneda) VALUES (15, 120, 21, 'USD');
INSERT INTO catalog(idf, idp, pret, moneda) VALUES (15, 231, 1.7, 'RON');
INSERT INTO catalog(idf, idp, pret, moneda) VALUES (15, 682, 17, 'EUR');
INSERT INTO catalog(idf, idp, pret, moneda) VALUES (15, 11, 2.5, 'RON');
INSERT INTO catalog(idf, idp, pret, moneda) VALUES (12, 203, 10.2, 'EUR');
INSERT INTO catalog(idf, idp, pret, moneda) VALUES (12, 12, 10, 'RON');
INSERT INTO catalog(idf, idp, pret, moneda) VALUES (12, 99, 2.5, 'RON');
INSERT INTO catalog(idf, idp, pret, moneda) VALUES (12, 11, 4, 'RON');
INSERT INTO catalog(idf, idp, pret, moneda) VALUES (12, 78, 28, 'USD');
INSERT INTO catalog(idf, idp, pret, moneda) VALUES (105, 708, 15, 'RON');
INSERT INTO catalog(idf, idp, pret, moneda) VALUES (105, 523, 13, 'EUR');
INSERT INTO catalog(idf, idp, pret, moneda) VALUES (105, 333, 78, 'USD');
INSERT INTO catalog(idf, idp, pret, moneda) VALUES (105, 106, 26, 'RON');
INSERT INTO catalog(idf, idp, pret, moneda) VALUES (100, 293, 3.5, 'USD');
INSERT INTO catalog(idf, idp, pret, moneda) VALUES (100, 999, 42, 'EUR');
INSERT INTO catalog(idf, idp, pret, moneda) VALUES (100, 99, 3, 'RON');
INSERT INTO catalog(idf, idp, pret, moneda) VALUES (101, 402, 15, 'RON');
INSERT INTO catalog(idf, idp, pret, moneda) VALUES (101, 999, 45, 'EUR');
INSERT INTO catalog(idf, idp, pret, moneda) VALUES (101, 99, 3.2, 'RON');
INSERT INTO catalog(idf, idp, pret, moneda) VALUES (101, 293, 3.4, 'USD');
INSERT INTO catalog(idf, idp, pret, moneda) VALUES (100, 12, 11, 'RON');
INSERT INTO catalog(idf, idp, pret, moneda) VALUES (100, 402, 14, 'RON');
INSERT INTO catalog(idf, idp, pret, moneda) VALUES (38, 564, 8, 'EUR');
INSERT INTO catalog(idf, idp, pret, moneda) VALUES (38, 882, 11, 'USD');
INSERT INTO catalog(idf, idp, pret, moneda) VALUES (38, 883, 10, 'USD');
INSERT INTO catalog(idf, idp, pret, moneda) VALUES (38, 891, 6, 'EUR');
INSERT INTO catalog(idf, idp, pret, moneda) VALUES (38, 372, 9, 'EUR');
INSERT INTO catalog(idf, idp, pret, moneda) VALUES (38, 292, 13.5, 'EUR');
INSERT INTO catalog(idf, idp, pret, moneda) VALUES (38, 104, 4.2, 'EUR');
INSERT INTO catalog(idf, idp, pret, moneda) VALUES (38, 723, 34, 'EUR');
INSERT INTO catalog(idf, idp, pret, moneda) VALUES (38, 724, 31, 'EUR');
INSERT INTO catalog(idf, idp, pret, moneda) VALUES (38, 106, 30, 'RON');
INSERT INTO catalog(idf, idp, pret, moneda) VALUES (38, 79, 16, 'EUR');
INSERT INTO catalog(idf, idp, pret, moneda) VALUES (38, 135, 1, 'EUR');
INSERT INTO catalog(idf, idp, pret, moneda) VALUES (206, 11, 2.7, 'RON');
INSERT INTO catalog(idf, idp, pret, moneda) VALUES (206, 99, 3.2, 'RON');
INSERT INTO catalog(idf, idp, pret, moneda) VALUES (206, 709, 17, 'RON');
INSERT INTO catalog(idf, idp, pret, moneda) VALUES (206, 392, 12, 'EUR');
INSERT INTO catalog(idf, idp, pret, moneda) VALUES (206, 12, 10, 'RON');
INSERT INTO catalog(idf, idp, pret, moneda) VALUES (206, 334, 3, 'EUR');
INSERT INTO catalog(idf, idp, pret, moneda) VALUES (206, 332, 25, 'EUR');
INSERT INTO catalog(idf, idp, pret, moneda) VALUES (206, 333, 53, 'USD');
INSERT INTO catalog(idf, idp, pret, moneda) VALUES (206, 293, 3.2, 'USD');

INSERT INTO comenzi (idc, idf, idp, cantitate) VALUES (10, 15, 12, 205);
INSERT INTO comenzi (idc, idf, idp, cantitate) VALUES (10, 15, 231, 15);
INSERT INTO comenzi (idc, idf, idp, cantitate) VALUES (15, 100, 402, 10);
INSERT INTO comenzi (idc, idf, idp, cantitate) VALUES (16, 101, 402, 10);
INSERT INTO comenzi (idc, idf, idp, cantitate) VALUES (21, 206, 332, 100);
INSERT INTO comenzi (idc, idf, idp, cantitate) VALUES (21, 206, 333, 3);
INSERT INTO comenzi (idc, idf, idp, cantitate) VALUES (21, 206, 334, 10);
INSERT INTO comenzi (idc, idf, idp, cantitate) VALUES (23, 15, 12, 258);
INSERT INTO comenzi (idc, idf, idp, cantitate) VALUES (30, 12, 12, 258);
INSERT INTO comenzi (idc, idf, idp, cantitate) VALUES (32, 105, 708, 5);
INSERT INTO comenzi (idc, idf, idp, cantitate) VALUES (33, 105, 523, 10);
INSERT INTO comenzi (idc, idf, idp, cantitate) VALUES (34, 100, 293, 20);
INSERT INTO comenzi (idc, idf, idp, cantitate) VALUES (38, 101, 293, 20);
INSERT INTO comenzi (idc, idf, idp, cantitate) VALUES (40, 206, 392, 3);
INSERT INTO comenzi (idc, idf, idp, cantitate) VALUES (41, 15, 682, 300);
INSERT INTO comenzi (idc, idf, idp, cantitate) VALUES (42, 206, 709, 500);
INSERT INTO comenzi (idc, idf, idp, cantitate) VALUES (44, 100, 12, 270);
INSERT INTO comenzi (idc, idf, idp, cantitate) VALUES (44, 105, 523, 100);
INSERT INTO comenzi (idc, idf, idp, cantitate) VALUES (44, 12, 78, 3);
INSERT INTO comenzi (idc, idf, idp, cantitate) VALUES (13, 12, 11, 14);
INSERT INTO comenzi (idc, idf, idp, cantitate) VALUES (13, 15, 11, 16);