<?php 

//Fichero que no se utiliza por el momento

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
	 <meta http-equiv="refresh" content="0;URL='paginaMenuAside.php'" />  
	<link rel="stylesheet" type="text/css" href="bootstrap.min.css">
	
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet" type="text/css"/>
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	
	<title>Pagina Principal</title>
</head>
<body>
	<center>
		<div class="container">
			<div class="row pt-3">
				<nav class="navbar navbar-expand-lg navbar-light bg-light">
					<div class="container-fluid">
						<a class="navbar-brand" href="#">Navbar scroll</a>
						<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarScroll" aria-controls="navbarScroll" aria-expanded="false" aria-label="Toggle navigation">
							<span class="navbar-toggler-icon"></span>
						</button>
						<div class="collapse navbar-collapse" id="navbarScroll">
							<ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll" style="--bs-scroll-height: 100px;">
								<li class="nav-item">
									<a class="nav-link active" aria-current="page" href="#">Home</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" href="#">Link</a>
								</li>
								<li class="nav-item dropdown">
									<a class="nav-link dropdown-toggle" href="#" id="navbarScrollingDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
										Link
									</a>
									<ul class="dropdown-menu" aria-labelledby="navbarScrollingDropdown">
										<li><a class="dropdown-item" href="#">Action</a></li>
										<li><a class="dropdown-item" href="#">Another action</a></li>
										<li><hr class="dropdown-divider"></li>
										<li><a class="dropdown-item" href="#">Something else here</a></li>
									</ul>
								</li>
								<li class="nav-item">
									<a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Link</a>
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
						<li class="breadcrumb-item"><a href="loginPorPerfiles.php">Login General</a></li>
						<li class="breadcrumb-item active" aria-current="page">Pagina Principal</li>
					</ol>
				</nav>
			</div>
			<div class="row">
				<h1>Bienvenido : <?php echo $usuario; ?> </h1>
				<h3>Tu perfil es : <?php echo $perfil; ?></h3>
				<h3>Poner Documentación</h3>
			</div>
			<div class="row pb-3">
				<div class="col-md-12 mt-3 pb-3">
					<a class="btn btn-primary" href="consultar.php" role="button">Consultar Listado Profesores</a>
				</div>
				<div class="col-md-12 mt-3 pb-3">
					<a class="btn btn-primary" href="consultarListadoAlumnos.php" role="button">Consultar Listado Alumnos</a>
				</div>
				<div class="col-md-12 mt-3 pb-3">
					<a class="btn btn-primary" href="consultarListadoPersonalNoDocente.php" role="button">Consultar Listado Personal no Docente</a>
				</div>
				<div class="col-md-12 mt-3">
					<a class="btn btn-primary" href="indexNuevo.php" role="button">Volver</a>
				</div>
			</div>

		</div>
		<div class="container">
			<div class="row">
				<div class="col">
					
					</div>
				</div>
		</div>
				<script type="text/javascript" src="bootstrap.min.js"></script>
				<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
				
				
			</center>

		</body>
		</html>