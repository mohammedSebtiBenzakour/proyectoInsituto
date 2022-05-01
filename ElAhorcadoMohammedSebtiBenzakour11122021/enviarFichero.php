<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="estilo.css"> 
	<title>Enviar el Fichero</title>
</head>
<body>

	<center>

		<h1>El ahorcado</h1>

		<h2>Puedes subir el fichero que desas para jugar</h2>
		<br>
		<p>
			<form action="ElahorcadoFichero1.php" method="post" enctype="multipart/form-data">
				<input type="file" name="fichero" class="fichero">
				<input type="hidden" name="palabra" value="">
				<input type="hidden" name="palabraConBarras" value="">
				<input type="hidden" name="intentos" value="">
				<input type="submit" name="enviar" value="Subir el Fichero">
				
			</form>

		</p>

		<br>
		<a href='index1.php' class="volver">volver</a>
	</center>
	<?php 

	include("footer.php");


	?>
</body>
</html>