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
	  <h2>S-au afi&#351;at furnizorii: </h2>
	  <?php
	  include ('bibl.php');
	  
	  $connect = connect_to_db();
	  
	  // se emite interogarea
	  $query = "call col_4_b_proc";
	  $result = mysqli_query($connect, $query);
	  
	  // verifică dacă rezultatul este în regulă
	  if (!$result)
	  {
		die('Interogare gresita: ' . mysqli_error());
	  }
	  
	  // se obţine numărul tuplelor returnate
	  $num_results = mysqli_num_rows($result);
	  
	  
	  // se afişează fiecare tuplă returnată doar daca exista tuple
	  if($num_results != 0)
	  {
		echo '<table style="width:70%" align="center" BORDER="1" BORDERCOLOR="#000000" CELLSPACING="0" CELLPADDING="10">
		<tr BGCOLOR="#B8860B" VALIGN="middle" HEIGHT="50">
		<th>Nr.crt.</th>		
		<th>Furnizor 1</th>
		<th>Furnizor 2</th>
		</tr>';
	  
		for ($i = 0; $i < $num_results; $i++)
		{
			$row = mysqli_fetch_assoc($result);
  
			echo '<tr BGCOLOR="#FAFAD2" VALIGN="middle" HEIGHT="30"><td>'.($i+1).'</td>';
			echo '<td>'.stripslashes($row['furnizor_1']).'</td>';
			echo '<td>'.stripslashes($row['furnizor_2']).'</td>';
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
	  <form action="actiuni.html" method=post>
	  <tr>
        <td colspan="2" align="center"><input type=submit value="&#206;napoi"></td>
      </tr>
	  </form>
	  
    </body>
</html>
