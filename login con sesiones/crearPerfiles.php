<?php 

//Fichero para crear perfiles en el sistema solo por el administrador

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
	<title>CREAR PERFILES</title>
</head>
<body>

	<?php 

	

	$error = "" ;

	if (!isset($_SESSION['error'])) {
		$error = "";
	}else{

		$error = $_SESSION['error'] ;

	}
	?>
	<center>
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
								<li class="nav-item">
									<a class="nav-link active" aria-current="page" href="#"></a>
								</li>
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
						<li class="breadcrumb-item"><a href="loginPorPerfiles.php">Login</a></li>
						<li class="breadcrumb-item active" aria-current="page">Crear o añadir perfiles</li>
					</ol>
				</nav>
			</div>
			<div class="row">
				<h1>CREAR PERFILES</h1>
				<h2><?php echo $error ?></h2>
				<form action="registrarPerfil.php" method="POST" class="row g-3 needs-validation" novalidate>
					<div class="row d-flex justify-content-center">
						<div class="col-md-6 ">
							<label for="validationCustom01" class="form-label">Añadir perfil</label>
							<input type="text" class="form-control" id="validationCustom01" value="" name="perfil" required>
							<div class="valid-feedback">
								Looks good!
							</div>
						</div>
					</div>
					<div class="row d-flex justify-content-center pt-3">
						<div class="col-4 d-flex justify-content-center">
							<div class="form-check">
								<input class="form-check-input" type="checkbox" value="" id="invalidCheck" required>
								<label class="form-check-label" for="invalidCheck">
									Agree to terms and conditions
								</label>
								<div class="invalid-feedback">
									You must agree before submitting.
								</div>
							</div>
						</div>
					</div>
					<div class="col-12">
						<button class="btn btn-primary" type="submit">Registrar perfil</button>
					</div>
				</form>
			</div>
			<div class="row">
			</div>
			<div class="row p-4">
				<div class="col">
					<a class="btn btn-outline-info" href="crearPerfiles.php" role="button">Ir a</a>
				</div>
				<div class="col">
					<a class="btn btn-outline-success" href="formularioRegistrar.php" role="button">Si no estas registrado Pulsa aquí</a>
				</div>
				<div class="col">
					<a class="btn btn-outline-warning" href="indexNuevo.php" role="button">Volver</a>
				</div>
			</div>
		</div>
		<script type="text/javascript" src="../js/bootstrap.bundle.min.js"></script>
		<script type="text/javascript" src=""></script>
		<script type="text/javascript" src="../js/validarLoginProfesores.js"></script>
	</center>

</body>
</html>