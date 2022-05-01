

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="estilo.css"> 
	<title>El ahorcado</title>
</head>
<body>
	<center>
		<h1>El ahorcado</h1>

		<h2>
			<?php 
			session_start();

			include "valorSeguro.php";


			echo "El nombre : " .  $_SESSION["nombre"] . "  no cumple el pattern <br>";
			echo "3 - 2 -1 ";

			header("refresh:3;url=Elahorcado1.php");   


			?>
		</h2>
	</center>

</body>
</html>



