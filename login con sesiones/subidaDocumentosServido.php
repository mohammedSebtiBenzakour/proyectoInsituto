<!-- Fichero con formulario para subir cualquier documento al servidor -->
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css"  href="../css/estiloMenuAside.css">
	<link rel="stylesheet" type="text/css" href="../css/horaSimple.css">
	<link rel="stylesheet" type="text/css"  href="../css/textoDinamico.css">
	<link rel="stylesheet" type="text/css"  href="../css/estilosPdf.css">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet" type="text/css"/>
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs5/dt-1.11.5/datatables.min.css"/>
	<link href="../css/cam.css" rel="stylesheet" type="text/css"/>
	 <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<title>Subida de documentos</title>
</head>
<body>
	<nav class="container mt-3">
		<div class="row">
			<div class="col ">
				<div class='time' id='time'></div>
			</div>
		</div>
		<div class="row">
			<div class="col ">
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
					</div>
				</nav>
			</div>
			<div class="col pt-2">
				<form class="d-flex">
					<input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
					<button class="btn btn-outline-success" type="submit">Search</button>
				</form>
			</div>
		</div>
	</nav>
	<section class="container mb-3 mt-3 d-flex justify-content-center align-items-center">
		<h1 class="text-center">Subida y Inserción de imagenes y de cualquier otro documento </h1>
	</section>
	<section class="container pb-5 mt-5 d-flex justify-content-center align-items-center">
		<form action="subirDocumentos.php" method="post" enctype="multipart/form-data">
			<div class="form-group">
				<input type="file" name="imagen" class="form-control p-1" required="">
			</div>
			<div class="form-group d-flex justify-content-center align-items-center">
				<input type="submit" name="subir" class="btn btn-success mt-3 d-block" value="Subir Imagen">
			</div>
			<div class="form-group">
			</div>
		</form>
	</section>
	<section class="container mb-3">
		<label class="container mb-3 w-50 d-flex justify-content-center align-items-center btn btn-warning shadow rounded text-uppercase botonInicio"><a href="camera.html" id="hacerFoto" class="">Hacer foto de perfil</a></label>
	</section>

	<footer class="container mb-3 d-flex justify-content-center align-items-center btn btn-warning shadow rounded text-uppercase botonInicio">
		<h2><a href="subidaDocumentosServido.php" class="botonInicio">Refrescar la pagina</a></h2>
	</footer>
	<footer class="container mb-3 d-flex justify-content-center align-items-center btn btn-primary shadow rounded text-uppercase">
		<h2><a href="paginaMenuAside.php" class="btn btn-primary fs-1">Volver </a></h2>
	</footer>
	<script src="../js/photo.js" type="text/javascript"></script>
	<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript" src="../js/bootstrap-select.min.js"></script>
	<script type="text/javascript" src="../js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript" src="../js/horaSimple.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.5.4/bootstrap-select.js"></script>
	<script type="text/javascript" src="https://cdn.datatables.net/v/bs5/dt-1.11.5/datatables.min.js"></script>
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</body>
</html>