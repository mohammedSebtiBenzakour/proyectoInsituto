<!-- Formulario de contacto para cualquier usuario de la aplicacion -->
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="../css/formularioContacto.css">
	<title>Formulario de contacto</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="indexNuevo.php">Home</a></li>
						<li class="breadcrumb-item"><a href="#">Formulario de contacto</a></li>
					</ol>
				</nav>
			</div>
		</div>
	</div>
	<div class="contact-container">
		<div class="row ps-3">
			<div class="left-col">
				<img class="logo" src="https://www.indonesia.travel/content/dam/indtravelrevamp/en/logo.png"/>
			</div>
			<div class="right-col">
				<div class="theme-switch-wrapper">
					<label class="theme-switch" for="checkbox">
						<input type="checkbox" id="checkbox" />
						<div class="slider round"></div>
					</label>
					<div class="description">Modo Oscuro</div>
				</div>

				<h1>Formulario de contacto</h1>
				<p>La gratitud también debe ser empleada hacia nosotros mismos, ya que nos esforzamos diariamente..</p>

				<form id="contact-form" method="post" action="../phpMail040322/enviarMailContacto.php">
					<label for="name">Nombre Completo</label>
					<input type="text" id="name" name="name" placeholder="Vuestro Nombre Completo" required>
					<label for="email">Email</label>
					<input type="email" id="email" name="email" placeholder="Vuestro Email" required>
					<label for="message">Mensage</label>
					<textarea rows="6" placeholder="Vuestro Mensage" id="message" name="message" required></textarea>
					<!--<a href="javascript:void(0)">-->
					<input type="submit" id="submit" name="enviar" value="Enviar" class="btn btn-primary btn-lg  "><!--</a>-->
					<a href="indexNuevo.php" class="btn btn-success btn-lg" tabindex="-1" role="button" aria-disabled="true">Volver</a>

				</form>
				<div id="error"></div>
				<div id="success-msg"></div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="../js/formularioContacto.js"></script>
</body>
</html>