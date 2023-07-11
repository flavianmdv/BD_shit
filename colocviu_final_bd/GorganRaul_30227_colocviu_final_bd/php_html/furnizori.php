<html>
 <head>
  <title>Furnizori</title>
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
	  <h2>Furnizorii: </h2>
	  <?php
	  include ('bibl.php');
	  
	  $connect = connect_to_db();
	  
	  // se emite interogarea
	  $query = "SELECT * FROM furnizori";
	  $result = mysqli_query($connect, $query);
	  // verifică dacă rezultatul este în regulă
	  if (!$result)
	  {
		die('Interogare gresita: ' . mysqli_error());
	  }
	  
	  // se obţine numărul tuplelor returnate
	  $num_results = mysqli_num_rows($result);
	  	  
	  // se afişează fiecare tuplă 
	  print_furnizori($num_results, $result);
	  
	  // deconectarea de la BD
	  mysqli_close($connect);
	  
	  ?>
	  
	  <br>
	  <form action="main.html" method=post>
	  <tr>
        <td colspan="2" align="center"><input type=submit value="&#206;napoi"></td>
      </tr>
	  </form>
	  
    </body>
</html>
