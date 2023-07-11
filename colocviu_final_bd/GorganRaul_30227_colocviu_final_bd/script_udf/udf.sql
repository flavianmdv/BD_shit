CREATE DEFINER=`student`@`localhost` PROCEDURE `col_4_a_proc`(min real, max real)
BEGIN
	SELECT idc, c.idf, c.idp, cantitate, pret
	FROM catalog p JOIN comenzi c ON (p.idf = c.idf AND p.idp = c.idp)
	WHERE moneda = 'EUR' AND pret BETWEEN min AND max;
END;

CREATE DEFINER=`student`@`localhost` PROCEDURE `col_4_b_proc`()
BEGIN
	SELECT DISTINCT least(a.idf, b.idf) furnizor_1, greatest(a.idf, b.idf) furnizor_2
	FROM comenzi a JOIN comenzi b ON (a.idp = b.idp AND a.cantitate = b.cantitate AND a.idf <> b.idf);
END;

CREATE DEFINER=`student`@`localhost` PROCEDURE `col_5_a_proc`(idf int)
BEGIN
	SELECT DISTINCT numef
	FROM furnizori f, catalog c
	WHERE f.idf <> idf AND f.idf = c.idf AND c.idp >= ALL (SELECT idp FROM catalog WHERE idf = idf);
END;

CREATE DEFINER=`student`@`localhost` PROCEDURE `col_5_b_proc`()
BEGIN
	SELECT p.idp, numep, culoare, pret
	FROM piese p JOIN catalog c ON (p.idp = c.idp)
	WHERE pret >= ALL (SELECT pret FROM catalog);
END;

CREATE DEFINER=`student`@`localhost` PROCEDURE `col_6_a_proc`()
BEGIN
	SELECT idf, moneda, MIN(pret) minim, MAX(pret) maxim
	FROM catalog 
	GROUP BY idf, moneda
	ORDER BY idf, moneda;
END;

CREATE DEFINER=`student`@`localhost` PROCEDURE `col_6_b_proc`()
BEGIN
	SELECT idc, COUNT(DISTINCT idp) nr_piese
	FROM comenzi
	GROUP BY idc
	ORDER BY idc;
END;