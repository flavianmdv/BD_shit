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
	  <h1>S-au afi&#351;at: </h1>
	  <?php
	  include ('bibl.php');
	  
	  // creare variabile cu nume scurte
	  $min=$_POST['min'];
	  $min= trim($min);
	  $max=$_POST['max'];
	  $max= trim($max);
	  if (!$min || !$max)
	  {
		echo 'Nu ati introdus criteriul de cautare. Va rog sa incercati din nou.';
		goto no_criteria;
		exit;
	  }
	  if($min > $max)
	  {
		  echo 'A&#355;i introdus un criteriu incorect. V&#259; rog &#238;ncerca&#355;i din nou.';
		  goto no_criteria;
	  }
	  
	  $connect = connect_to_db();
	  
	  // se emite interogarea	
      $query = "call col_4_a_proc(".$min.", ".$max.")";
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
	  
	  
	  // se afişează fiecare tuplă returnată doar daca exista tuple
	  if($num_results != 0)
	  {
		echo '<table style="width:80%" align="center" BORDER="1" BORDERCOLOR="#000000" CELLSPACING="0" CELLPADDING="10">
		<tr BGCOLOR="#B8860B" VALIGN="middle" HEIGHT="50">
		<th>Nr.crt.</th>
		<th>Idc</th>
		<th>Idf</th>
		<th>Idp</th>
		<th>Cantitate</th>
		<th>Pre&#355;</th>
		</tr>';
	  
		for ($i = 0; $i < $num_results; $i++)
		{
			$row = mysqli_fetch_assoc($result);
  
			echo '<tr BGCOLOR="#FAFAD2" VALIGN="middle" HEIGHT="30"><td>'.($i+1).'</td>';
			echo '<td>'.stripslashes($row['idc']).'</td>';
			echo '<td>'.stripslashes($row['idf']).'</td>';
			echo '<td>'.stripslashes($row['idp']).'</td>';
			echo '<td>'.stripslashes($row['cantitate']).'</td>';
			echo '<td>'.stripslashes($row['pret']).'</td>';
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
	  <form action="web_4_a.html" method=post>
	  <tr>
        <td colspan="2" align="center"><input type=submit value="&#206;napoi"></td>
      </tr>
	  </form>
	  
    </body>
</html>
