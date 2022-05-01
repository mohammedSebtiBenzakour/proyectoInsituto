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
	<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet" type="text/css"/>
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css"  href="../css/estiloMenuAside.css">
	<link rel="stylesheet" type="text/css"  href="../css/errores.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.0/sweetalert2.css"/>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.0/sweetalert2.js"></script>
	<title>Insertar Oferta Trabajo</title>
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
					<li class="breadcrumb-item"><a href="paginaMenuAside.php">Inserción de datos</a></li>
					<li class="breadcrumb-item"><a href="formularioInsertarOferta.php">Introducir Ofertas de trabajo</a></li>
					<li class="breadcrumb-item active" aria-current="page">Formulario para registrar Ofertas</li>
				</ol>
			</nav>
		</div>
		<h1>Formulario para insertar Ofertas de trabajo</h1>

		<form id="contact-form" method="post" action="insertarOferta.php" role="form">
			<div class="messages"></div>
			<div class="controls">
				<div class="row">
					<div class="col-md-6">
						<div class="form-group">
							<label for="form_name">Referencia de la oferta *</label>
							<input id="form_name" type="text" name="referencia" class="form-control" placeholder="Introduce la referencia de la oferta * (No se admite acentos)" required="required" data-error="Tienes que rellenar la referencia." value="<?php if(isset($_SESSION['referencia'])) echo $_SESSION['referencia'] ; ?>">
							<div class="help-block with-errors errores"><?php if(isset($_SESSION['errorRef'])) echo $_SESSION['errorRef'] ;  ?></div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label for="form_lastname">Nombre de la oferta *</label>
							<input id="form_lastname" type="text" name="nombre" class="form-control" placeholder="Introduce el nombre de la oferta * (Solo letras se admite acentos)" required="required" data-error="Tienes que rellenar el nombre de la oferta." value="<?php if(isset($_SESSION['nombre'])) echo $_SESSION['nombre'] ; ?>">
							<div class="help-block with-errors errores"><?php if(isset($_SESSION['errorN'])) echo $_SESSION['errorN'] ;  ?></div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<div class="form-group">
							<label for="form_email">Empresa de la oferta *</label>
							<input id="form_email" type="text" name="empresa" class="form-control" placeholder="Introduce la empresa de la oferta * (No se admite acentos)" required="required" data-error="Tienes que rellenar la empresa de la oferta." value="<?php if(isset($_SESSION['empresa'])) echo $_SESSION['empresa'] ; ?>">
							<div class="help-block with-errors errores"><?php if(isset($_SESSION['errorEmp'])) echo $_SESSION['errorEmp'] ;  ?></div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label for="form_email">Ciudad de la oferta *</label>
							<input id="form_email" type="text" name="ciudad" class="form-control" placeholder="Introduce la ciudad de la oferta * (Solo se admite la ñ)" required="required" data-error="Tienes que rellenar la ciudad de la oferta." value="<?php if(isset($_SESSION['ciudad'])) echo $_SESSION['ciudad'] ; ?>">
							<div class="help-block with-errors errores"><?php if(isset($_SESSION['errorC'])) echo $_SESSION['errorC'] ;  ?></div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<div class="form-group">
							<label for="form_email">Tipo de la oferta *</label>
							<input id="form_email" type="text" name="tipo" class="form-control" placeholder="Introduce el tipo de la oferta * (Solo letras se admite acentos)" required="required" data-error="Tienes que rellenar el tipo de la oferta." value="<?php if(isset($_SESSION['tipo'])) echo $_SESSION['tipo'] ; ?>">
							<div class="help-block with-errors errores"><?php if(isset($_SESSION['errorTipo'])) echo $_SESSION['errorTipo'] ;  ?></div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label for="form_email">Fecha de la oferta *</label>
							<input id="fecha" type="date" name="fecha" class="form-control" placeholder="Porfavor introduce la fecha de la oferta *" required="required" data-error="Tienes que rellenar la fecha de la oferta.">
							<div class="help-block with-errors"></div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="form-group">
							<label for="form_message">Descripción de la oferta *</label>
							<textarea id="form_message" name="descripcion" class="form-control" placeholder="Descripción de la oferta  * (Se admite acentos)" rows="4"  data-error="Tienes que rellenar la descripcion de la oferta."><?php if(isset($_SESSION['descripcion'])) echo $_SESSION['descripcion'] ; ?></textarea>
							<div class="help-block with-errors errores"><?php if(isset($_SESSION['errorDescripcion'])) echo $_SESSION['errorDescripcion'] ;  ?></div>
						</div>
					</div>
					<div class="col-md-5 mt-3">
						<input type="submit" class="btn btn-success btn-send" value="Registrar oferta" id="registrar" name="registrar" >
					</div>
					<div class="col-md-5 mt-3">
						<button type="button" class="btn btn-warning btn-send" value="Consultar Datos"><a href="consultarOfertas.php">Consultar Todas las Ofertas</a></button>
					</div>
					<div class="col md-5 mt-3">
						<button type="button" class="btn btn-warning btn-send " value="Consultar Datos"><a href="paginaMenuAside.php">Volver</a></button>
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

	unset($_SESSION['descripcion']);
	unset($_SESSION['tipo']);
	unset($_SESSION['ciudad']);
	unset($_SESSION['empresa']);
	unset($_SESSION['referencia']);
	unset($_SESSION['nombre']);

	unset($_SESSION['errorDescripcion']);
	unset($_SESSION['errorTipo']);
	unset($_SESSION['errorC']);
	unset($_SESSION['errorEmp']);
	unset($_SESSION['errorN']);
	unset($_SESSION['errorRef']);



?>