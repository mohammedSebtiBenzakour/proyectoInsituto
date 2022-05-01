<?php 
require_once('conexion.php');

session_start();

$usuario = $_SESSION['usuario'] ;
$perfil = $_SESSION['perfil'] ;
if (!isset($usuario) || !isset($perfil)) {
	header("location: loginPorPerfiles.php");
}else{

// 	echo "<h1>Bienvenido : $usuario </h1>";

// echo "<h2></h2>";
}


?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="bootstrap.min.css">
	<link rel="stylesheet" type="text/css"  href="../css/estiloMenuAside.css">
	<link rel="stylesheet" type="text/css"  href="../css/errores.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.0/sweetalert2.css"/>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.0/sweetalert2.js"></script>
	<title>Insertar Noticia</title>
</head>
<body>
	<?php
	if(isset($_GET['mensaje']) == 'ok') {
		?>
		<script type="text/javascript">
			$(document).ready(function() {
				swal({
					title: '<?php echo $_GET['respuesta']; ?>',
					text: '<?php echo $_GET['respuesta']; ?>',
					type: 'success'
				});
			});
		</script>
		<?php
	}
	?>
	<div class="container">
		<div class="row pt-3">
			<nav class="navbar navbar-expand-lg navbar-light bg-light">
				<div class="container-fluid">
					<a class="navbar-brand" href="#">Menu</a>
					<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarScroll" aria-controls="navbarScroll" aria-expanded="false" aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse" id="navbarScroll">
						<ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll" style="--bs-scroll-height: 100px;">
							<li class="nav-item dropdown">
								<a class="nav-link dropdown-toggle" href="#" id="navbarScrollingDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
									Datos de la persona conectada
								</a>
								<ul class="dropdown-menu p-2" aria-labelledby="navbarScrollingDropdown">
									<li>Bienvenido : <?php echo $usuario; ?> </li>
									<li>Tu perfil es : <?php echo $perfil; ?></li>
								</ul>
							</li>
						</ul>
						<form class="d-flex">
							<input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
							<button class="btn btn-outline-success" type="submit">Search</button>
						</form>
						<form class="d-flex ps-3" method="post" action="salir.php">
							<button class="btn btn-outline-success" type="submit">Cerrar session</button>
						</form>
					</div>
				</div>
			</nav>
		</div>
		<div class="row">
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="indexNuevo.php">Home</a></li>
					<li class="breadcrumb-item"><a href="formularioInsertarNoticia.php">Introducir Noticias</a></li>
					<li class="breadcrumb-item active" aria-current="page">Formulario para registrar noticias</li>
				</ol>
			</nav>
		</div>
		<h1>Formulario para insertar Noticias</h1>

		<form id="contact-form" method="post" action="insertarNoticia.php" role="form">
			<div class="messages"></div>
			<div class="controls">
				<div class="row">
					<div class="col-md-6">
						<div class="form-group">
							<label for="form_name">Nombre de la noticia*</label>
							<input id="form_name" type="text" name="nombre_noticia" class="form-control" placeholder="Introduce la referencia de la oferta * (Se admite acentos)" required="required" data-error="Tienes que rellenar la referencia.">
							<div class="help-block with-errors"></div>
						</div>
					</div>
					
				</div>
				
				
				<div class="row">
					<div class="col-md-12">
						<div class="form-group">
							<label for="form_message">Texto de la noticia *</label>
							<textarea id="form_message" name="texto_noticia" class="form-control" placeholder="Descripción de la oferta  * (Se admite acentos)" rows="4"  data-error="Tienes que rellenar la descripcion de la oferta."></textarea>
							<div class="help-block with-errors"></div>
						</div>
					</div>
					<div class="col-md-6">
						<input type="submit" class="btn btn-success btn-send mt-2" value="Registrar noticia" id="registrar" name="registrar" >
					</div>
					<div class="col-md-6">
						<button type="button" class="btn btn-warning btn-send mt-2" value="Volver a los listados"><a href="paginaMenuAside.php">Volver a los listados</a></button>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<p class="text-muted">
							<strong>*</strong> Los campos son requeridos.</p>
						</div>
					</div>
				</div>

			</form>
		</div>
		<script type="text/javascript" src="../js/bootstrap.bundle.min.js"></script>
		<script type="text/javascript" src=""></script>

	</body>
	</html>

	<?php 

	unset($_SESSION['nombre_noticia']);
	unset($_SESSION['texto_noticia']);

	unset($_SESSION['errorNombreNoticia']);
	unset($_SESSION['errorTextoNoticia']);



?>