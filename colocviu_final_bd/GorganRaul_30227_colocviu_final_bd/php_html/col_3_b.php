<html>
 <head>
  <title>Afi&#351;are comenzi</title>
  <style>
   table, th, td
   {
     border: 1px solid black;
   }
  </style>
 </head>
	<body>
	<BODY BGCOLOR="#F0E68C">
	  <h1>S-au afi&#351;at comenzile: </h1>
	  <?php
	  include ('bibl.php');
	  
	  // creare variabile cu nume scurte
	  $cant=$_POST['cant'];
	  $cant= trim($cant);
	  if (!$cant)
	  {
		echo 'Nu a&#355;i introdus criteriul de c&#259;utare. V&#259; rog s&#259; &#238;ncerca&#355;i din nou.';
		goto no_criteria;
		exit;
	  }
	  
	  $cant_n=$_POST['cant_n'];
	  $cant_n= trim($cant_n);
	  
	  //conectare la db
	  $connect = connect_to_db();
	  
	  // se emite interogarea
	  if($cant_n)
		$query = "SELECT * FROM comenzi WHERE cantitate > ".$cant." AND cantitate NOT IN (".$cant_n.")";
	  else
		$query = "SELECT * FROM comenzi WHERE cantitate > ".$cant;
  
	  $result = mysqli_query($connect, $query);
	  // verifică dacă rezultatul este în regulă
	  if (!$result)
	  {
		echo 'A&#355;i introdus un criteriu incorect. V&#259; rog &#238;ncerca&#355;i din nou.';
		goto no_criteria;
		//die('Interogare gresita: ' . mysqli_error());
	  }
	  
	  // se obţine numărul tuplelor returnate
	  $num_results = mysqli_num_rows($result);
	  
	  
	  // se afişează fiecare tuplă returnată
	  print_comenzi($num_results, $result);
	  
	  // deconectarea de la BD
	  mysqli_close($connect);
	  
	  no_criteria:
	  ?>
	  
	  <br>
	  <form action="web_3_b.html" method=post>
	  <tr>
        <td colspan="2" align="center"><input type=submit value="&#206;napoi"></td>
      </tr>
	  </form>
	  
    </body>
</html>
