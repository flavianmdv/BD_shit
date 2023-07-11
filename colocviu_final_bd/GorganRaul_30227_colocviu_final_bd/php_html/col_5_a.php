<html>
 <head>
  <title>Afi&#351;are furnizori</title>
  <style>
   table, th, td
   {
     border: 1px solid black;
   }
  </style>
 </head>
	<body>
	<BODY BGCOLOR="#F0E68C">
	  <br>
	  <h2>S-au afi&#351;at: </h2>
	  <?php
	  include ('bibl.php');
	  
	  // creare variabile cu nume scurte
	  $furnizor=$_POST['furnizor'];
	  $furnizor= trim($furnizor);
	  
	  if (!$furnizor)
	  {
		echo 'Nu a&#355;i introdus criteriul de c&#259;utare. V&#259; rog s&#259; &#238;ncerca&#355;i din nou.';
		goto no_criteria;
	  }
	  
	  $connect = connect_to_db();
	  
	  //verific daca exista furnizorul cerut
	  $verificare = "SELECT COUNT(idf) numar FROM furnizori WHERE idf = ".$furnizor;
	  $rezultat = mysqli_query($connect, $verificare);
	  if(!$rezultat)
	  {
		echo 'A&#355;i introdus un criteriu incorect. V&#259; rog s&#259; &#238;ncerca&#355;i din nou.';
		goto no_criteria;
	  }
	  $linie = mysqli_fetch_assoc($rezultat);
	  if(stripslashes($linie['numar']) == 0)
	  {
		echo 'Nu exist&#259; furnizorul &#238;n baza de date. V&#259; rog s&#259; &#238;ncerca&#355;i din nou.';
		goto no_criteria;
	  }
	  
	  // se emite interogarea
	  $query = "call col_5_a_proc(".$furnizor.")";
	  $result = mysqli_query($connect, $query);
	  
	  // verifică dacă rezultatul este în regulă
	  if (!$result)
	  {
		echo 'A&#355;i introdus un criteriu incorect. V&#259; rog s&#259; &#238;ncerca&#355;i din nou.';
		goto no_criteria;
		//die('Interogare gresita: ' . mysqli_error());
	  }
	  
	  // se obţine numărul tuplelor returnate
	  $num_results = mysqli_num_rows($result);
	  
	  
	  // se afişează fiecare tuplă returnată doar daca exista tuple
	  if($num_results != 0)
	  {
		echo '<table style="width:50%" align="center" BORDER="1" BORDERCOLOR="#000000" CELLSPACING="0" CELLPADDING="10">
		<tr BGCOLOR="#B8860B" VALIGN="middle" HEIGHT="50">
		<th>Nr.crt.</th>
		<th>Nume furnizor</th>
		</tr>';
	  
		for ($i = 0; $i < $num_results; $i++)
		{
			$row = mysqli_fetch_assoc($result);
  
			echo '<tr BGCOLOR="#FAFAD2" VALIGN="middle" HEIGHT="30"><td>'.($i+1).'</td>';
			echo '<td>'.stripslashes($row['numef']).'</td>';
		}
		echo '</table>';
	  }
	  else
	  {
		  echo('Niciun rezultat');
	  }
	  
	  // deconectarea de la BD
	  mysqli_close($connect);
	  
	  no_criteria:
	  ?>
	  
	  <br>
	  <form action="web_5_a.html" method=post>
	  <tr>
        <td colspan="2" align="center"><input type=submit value="&#206;napoi"></td>
      </tr>
	  </form>
	  
    </body>
</html>
