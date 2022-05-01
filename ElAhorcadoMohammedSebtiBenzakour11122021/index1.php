<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="estilo.css">
	<title>El ahorcado Nuevo</title>
</head>
<body>
	<?php

	session_start();




	 // incluir el fichero valorseguro para limpiar las palabras tanto introducidas como recogidas del fichero de palabras de errores como el espacio o letras de incoherentes.
	
	include "valorSeguro.php";

// si se ha pulsado el boton para jugar directamente 

	if (isset($_POST["jugar"])) {

	// se reenvia al usuario a la pagina Elahorcado1.php para directamente empezar a jugar
		
		header("location: Elahorcado1.php ");
	}

// si se ha pulsado el boton para enviar fichero para jugar

	if (isset($_POST["enviar"])) {

// se reenvia al usuario a la pagina enviarFichero.php  para que cargue el fichero que desea para jugar

	 // header("location: ej5Otro.php");

		header("location: enviarFichero.php");

	// header("location: ElahorcadoFichero1.php");
	}
	?>
	<center>

		<h1>El ahorcado </h1>

		<h2>Elije una de las dos opciones para jugar </h2>

		<form action="" method="POST" enctype="multipart/form-data">
			<div class="jugar">
				<input type="submit" name="jugar" value="Jugar Directamente" class="losInput">
				<div class="enviarF">
					<!-- <input type="file" name="fichero"> -->
					<input type="hidden" name="palabra" value="">
					<input type="hidden" name="palabraConBarras" value="">
					<input type="hidden" name="intentos" value="">
					<input type="submit" name="enviar" value="Enviar fichero para jugar" class="losInput">
				</div>
			</div>
		</form>
		<br>
		
		<br><br><a href='cerrarSesion.php' class="sesion">Cerrar sesíon</a>
	</center>
	<?php 

	include("footer.php");


	?>
	<div class="mapa">Mapa del sitio<a href="mapaSitio.html"><img src="mapaSitio.jpg"></a></div>
</body>
</html>