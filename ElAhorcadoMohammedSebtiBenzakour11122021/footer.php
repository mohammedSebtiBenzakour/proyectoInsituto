<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title></title>
</head>
<body>

	<?php 

	$dia = date('l, F j, Y');
	$hora = date ('g:i A');


	$ultimaVisita = $dia . " a las " . $hora;


	echo ' <h5>Creado por Mohammed Sebti Benzakour <br><br> ' . $ultimaVisita . ' </h5>';


	?>

</body>
</html>