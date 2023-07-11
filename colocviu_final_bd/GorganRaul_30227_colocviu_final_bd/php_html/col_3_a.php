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
	  <h1>S-au afi&#351;at furnizorii: </h1>
	  <?php
	  include ('bibl.php');
	  
	  // creare variabile cu nume scurte
	  $criteriu=$_POST['criteriu'];
	  $criteriu= trim($criteriu);
	  if (!$criteriu)
	  {
		echo 'Nu a&#355;i introdus criteriul de c&#259;utare. V&#259; rog s&#259; &#238;ncerca&#355;i din nou.';
		goto no_criteria;
		exit;
	  }
	  
	  $connect = connect_to_db();
	  
	  // se emite interogarea
	  $query = "SELECT * FROM furnizori WHERE adresa LIKE '%".$criteriu."' ORDER BY adresa";
	  $result = mysqli_query($connect, $query);
	  // verifică dacă rezultatul este în regulă
	  if (!$result)
	  {
		die('Interogare gresita: ' . mysqli_error());
	  }
	  
	  // se obţine numărul tuplelor returnate
	  $num_results = mysqli_num_rows($result);
	  
	  print_furnizori($num_results, $result);
	  
	  // deconectarea de la BD
	  mysqli_close($connect);
	  
	  no_criteria:
	  ?>
	  
	  <br>
	  <?php
	  back_button();
	  ?>
	  
    </body>
</html>
