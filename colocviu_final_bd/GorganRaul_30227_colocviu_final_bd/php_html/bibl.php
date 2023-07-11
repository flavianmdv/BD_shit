<html>
<body>
<?php

function back_button()
{
	?>
	<form action="web_3_a.html" method=post> 
	  <tr>
        <td colspan="2" align="center"><input type=submit value="&#206;napoi"></td>
      </tr>
	  </form>
	
	  <?php
}

function connect_to_db() 
{
	  require_once('DB.php');
	  $user = 'student';
	  $pass = 'student123';
	  $host = 'localhost';
	  $db_name = 'colocviu_firma';
	  
	  // se conectează la BD
	  $connect = mysqli_connect($host, $user, $pass, $db_name);
	  
	  // se verifică dacă a funcţionat conectarea
	  if ($connect->connect_error)
	  {
		die('Eroare la conectare: ' . $connect->connect_error);
	  }	
	  return $connect;
}

function print_furnizori($num_results, $result)
{
	if($num_results != 0)
	{
		echo '<table style="width:80%" align="center" BORDER="1" BORDERCOLOR="#000000" CELLSPACING="0" CELLPADDING="10">
		<tr BGCOLOR="#B8860B" VALIGN="middle" HEIGHT="50">
		<th>Nr.crt.</th>
		<th>Idf</th>
		<th>Nume furnizor</th>
		<th>Adres&#259;</th>
		</tr>';
	  
		for ($i = 0; $i < $num_results; $i++)
		{
			$row = mysqli_fetch_assoc($result);
  
			echo '<tr BGCOLOR="#FAFAD2" VALIGN="middle" HEIGHT="30"><td>'.($i+1).'</td>';
			echo '<td>'.stripslashes($row['idf']).'</td>';
			echo '<td>'.stripslashes($row['numef']).'</td>';
			echo '<td>'.stripslashes($row['adresa']).'</td>';
		}
		echo '</table>';
	}
	else
	{
		echo('Niciun rezultat');
	}  
}

function print_piese($num_results, $result)
{
	if($num_results != 0)
	{
		echo '<table style="width:80%" align="center" BORDER="1" BORDERCOLOR="#000000" CELLSPACING="0" CELLPADDING="10">
		<tr BGCOLOR="#B8860B" VALIGN="middle" HEIGHT="50">
		<th>Nr.crt.</th>
		<th>Idp</th>
		<th>Nume pies&#259;</th>
		<th>Culoare</th>
		</tr>';
	  
		for ($i = 0; $i < $num_results; $i++)
		{
			$row = mysqli_fetch_assoc($result);
			echo '<tr BGCOLOR="#FAFAD2" VALIGN="middle" HEIGHT="30"><td>'.($i+1).'</td>';
			echo '<td>'.stripslashes($row['idp']).'</td>';
			echo '<td>'.stripslashes($row['numep']).'</td>';
			echo '<td>'.stripslashes($row['culoare']).'</td>';
		}
		echo '</table>';
	}
	else
	{
		echo('Niciun rezultat');
	}  
}

function print_catalog($num_results, $result)
{
	if($num_results != 0)
	{
		echo '<table style="width:80%" align="center" BORDER="1" BORDERCOLOR="#000000" CELLSPACING="0" CELLPADDING="10">
		<tr BGCOLOR="#B8860B" VALIGN="middle" HEIGHT="50">
		<th>Nr.crt.</th>
		<th>Idf</th>
		<th>Nume furnizor</th>
		<th>Idp</th>
		<th>Nume pies&#259;</th>
		<th>Pre&#355;</th>
		<th>Moned&#259;</th>
		</tr>';
	  
		for ($i = 0; $i < $num_results; $i++)
		{
			$row = mysqli_fetch_assoc($result);
  
			echo '<tr BGCOLOR="#FAFAD2" VALIGN="middle" HEIGHT="30"><td>'.($i+1).'</td>';
			echo '<td>'.stripslashes($row['idf']).'</td>';
			echo '<td>'.stripslashes($row['numef']).'</td>';
			echo '<td>'.stripslashes($row['idp']).'</td>';
			echo '<td>'.stripslashes($row['numep']).'</td>';
			echo '<td>'.stripslashes($row['pret']).'</td>';
			echo '<td>'.stripslashes($row['moneda']).'</td>';
		}
		echo '</table>';
	}
	else
	{
		echo('Niciun rezultat');
	}  
}

function print_comenzi($num_results, $result)
{	
	 if($num_results != 0)
	  {
		echo '<table style="width:80%" align="center" BORDER="1" BORDERCOLOR="#000000" CELLSPACING="0" CELLPADDING="10">
		<tr BGCOLOR="#B8860B" VALIGN="middle" HEIGHT="50">
		<th>Nr.crt.</th>
		<th>Idc</th>
		<th>Idf</th>
		<th>Idp</th>
		<th>Cantitate</th>
		</tr>';
	  
		for ($i = 0; $i < $num_results; $i++)
		{
			$row = mysqli_fetch_assoc($result);
  
			echo '<tr BGCOLOR="#FAFAD2" VALIGN="middle" HEIGHT="30"><td>'.($i+1).'</td>';
			echo '<td>'.stripslashes($row['idc']).'</td>';
			echo '<td>'.stripslashes($row['idf']).'</td>';
			echo '<td>'.stripslashes($row['idp']).'</td>';
			echo '<td>'.stripslashes($row['cantitate']).'</td>';
		}
		echo '</table>';
	  }
	  else
	  {
		  echo('Niciun rezultat');
	  }
}

?>
</body>
</html>