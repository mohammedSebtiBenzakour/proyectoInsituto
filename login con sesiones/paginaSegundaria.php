<?php 

//Fichero no utilizado por el momento

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
	<link rel="stylesheet" type="text/css" href="../css/index.css">
	<title>Pagina Principal</title>
</head>
<body>
	<center>
		<div class="container">
			<div class="row pt-3">
				<nav class="navbar navbar-expand-lg navbar-light  bg-light ">
					<div class="container-fluid">
						<a class="navbar-brand" href="#">Menu</a>
						<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDarkDropdown" aria-controls="navbarNavDarkDropdown" aria-expanded="false" aria-label="Toggle navigation">
							<span class="navbar-toggler-icon"></span>
						</button>
						<div class="collapse navbar-collapse" id="navbarNavDarkDropdown">
							<ul class="navbar-nav">
								<li class="nav-item dropdown">
									<a class="nav-link dropdown-toggle" href="#" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
										Juegos Educativos
									</a>
									<ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="navbarDarkDropdownMenuLink">
										<li><a class="dropdown-item" href="../Encuesta/encuesta.php">Encuesta</a></li>
										<li><a class="dropdown-item" href="http://localhost:8080/ElAhorcadoJavaServlet/index.jsp">El ahorcado</a></li>
										<li><a class="dropdown-item" href="http://localhost:8080/p2/index.jsp">Juego de las parejas</a></li>
										<li><a class="dropdown-item" href="http://localhost:8080/EvaluacionExamen2/">Multiplicación de matrices</a></li>
										<li><a class="dropdown-item" href="http://localhost:8080/SopaDeLetras/index.jsp">La sopa de letras</a></li>
										<li><a class="dropdown-item" href="http://localhost:8080/EvaluacionExamen1/">Mostrar temperatura</a></li>
										<li><a class="dropdown-item" href="../calculadora/calculadora.html">Calculadora</a></li>
										<li><a class="dropdown-item" href="../MohammedSebtiBenzakour_sopaLetrasDireccion/sopaLetrasDireccion/sopaLetrasDireccion.html">Sopa de letra aleatoria Entorno cliente</a></li>
										<li><a class="dropdown-item" href="../MohammedSebtiBenzakour_sopaLetrasDireccionIntroducidaManual/sopaLetrasDireccionIntroducidaManual/sopaLetrasDireccionIntroducidaManual.html">Sopa de letra manual Entorno cliente</a></li>
									</ul>
								</li>
								<li class="nav-item dropdown">
									<a class="nav-link dropdown-toggle" href="#" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
										Varios
									</a>
									<ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="navbarDarkDropdownMenuLink">
										<li><a class="dropdown-item" href="../Encuesta/encuesta.php">Encuesta</a></li>
										<li><a class="dropdown-item" href="../examenDiseño261221_ConSASS/mohammedSass.html">Examen Diseño con SASS/SCSS</a></li>
										<li><a class="dropdown-item" href="#">Juego de las parejas</a></li>
										<li><a class="dropdown-item" href="#">Multiplicación de matrices</a></li>
										<li><a class="dropdown-item" href="#">La sopa de letras</a></li>
										<li><a class="dropdown-item" href="#">Mostrar temperatura</a></li>
										<li><a class="dropdown-item" href="#">Calculadora</a></li>
										<li><a class="dropdown-item" href="#">TrabajoTema7EntotnoCliente</a></li>
										<li><a class="dropdown-item" href="#">TrabajoPractica2PHP</a></li>
										<li><a class="dropdown-item" href="#">TrabajoBootstrapDiseño</a></li>
										<li><a class="dropdown-item" href="#">TrabajoEntornoServidorPlantaEnergetica</a></li>
										<li><a class="dropdown-item" href="#">TrabajoTema6FormularioEntotnoCliente</a></li>
									</ul>
								</li>
								<li class="nav-item">
									<a class="nav-link" href="calendario.html">Calendario</a>
								</li>
							</ul>
						</div>
						<div class="col pt-2">
							<form class="d-flex ps-3 justify-content-end" method="post" action="salir.php">
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
			</div>
			<div class="row pb-3">
				<div class="col-md-12 mt-3 pb-3">
					<h2>Visitar otros apartados</h2>
					<!-- <a class="btn btn-primary" href="consultar.php" role="button">Consultar Listado Profesores</a> -->
				</div>
				<div class="col-md-12 mt-3 pb-3">
					<!-- <a class="btn btn-primary" href="consultarListadoAlumnos.php" role="button">Consultar Listado Alumnos</a> -->
				</div>
				<div class="col-md-12 mt-3 pb-3">
					<!-- <a class="btn btn-primary" href="consultarListadoPersonalNoDocente.php" role="button">Consultar Listado Personal no Docente</a> -->
				</div>
				<div class="col-md-12 mt-3">
					<a class="btn btn-primary" href="indexNuevo.php" role="button">Volver</a>
				</div>
			</div>

		</div>
		<script type="text/javascript" src="bootstrap.min.js"></script>
	</center>

</body>
</html>