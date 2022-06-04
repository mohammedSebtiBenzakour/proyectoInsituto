<!-- Formulario para un feedback de cualquier usuario que desea contactar con el administrador de la aplicacion -->

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="../css/feedbackForm.css"/>
	<title></title>
</head>
<body>

	<div class="wrap">
		<h2>Feedback form!</h2>
		<p></p>
		<form action="../phpMail040322/enviarMailContacto.php" method="post">
			<input type="text" name="name" placeholder="Vuestro Nombre">
			<input type="email" name="email" placeholder="Vuestro email">
			<textarea name="message" cols="30" rows="10" placeholder="Escribe aqui vuestro Feedback:"></textarea>
			<button class="btn" type="submit" name="enviar"  >Enviar Feedback</button>
		</form>
		<a class="btn btn-outline-warning" href="indexNuevo.php" role="button">Volver</a>
	</div>
	
</body>
</html>