<!-- Fichero para consultar el listado de todos los profesores registrados -->
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="../css/index.css">
	<title>Consultar datos</title>
</head>
<?php 
require_once('consultas.php');

?>
<body>
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
					<li class="breadcrumb-item"><a href="paginaMenuAside.php">Pagina Principal</a></li>
					<li class="breadcrumb-item active" aria-current="page">Consultar listado de Profesores Registrados</li>
				</ol>
			</nav>
		</div>
		<h1>LISTADO DE PROFESORES REGISTRADOS</h1>
		<table class="table table-hover">
			<thead>
				<tr>
					<th scope="col">DNI</th>
					<th scope="col">Nombre</th>
					<th scope="col">Apellidos</th>
					<th scope="col">Email</th>
					<th scope="col">Teléfono</th>
					<th scope="col">Departamento</th>
					<th scope="col">Modificar</th>
					<th scope="col">Eliminar</th>
				</tr>
			</thead>
			<tbody>
				<?php 
				foreach ($query as $row) {
					?>
					<tr>
						<th scope="row"><?php echo $row['dni']; ?></th>
						<td><?php echo $row['nombre']; ?></td>
						<td><?php echo $row['apellidos']; ?></td>
						<td><?php echo $row['email']; ?></td>
						<td><?php echo $row['telefono']; ?></td>
						<td><?php echo $row['departamento']; ?></td>
						<td class="align-middle"><a class="btn btn-warning" href="modificarProfesores.php?id=<?php echo $row['dni']; ?>">modificar</a> </td>
						<td class="align-middle"><a class="btn btn-danger" href="eliminarProfesores.php?id=<?php echo $row['dni']; ?>">eliminar</a></td>
					</tr>

					<?php
				}

				?>

			</tbody>
		</table>
		<div class="row">
			<div class="col-4">
				<a class="btn btn-primary" href="formularioRegistrar.php" role="button">Volver a formulario de registro</a>
			</div>
			<div class="col-4">
				<a class="btn btn-primary" href="paginaMenuAside.php" role="button">Volver a pagina principal</a>
			</div>
			<div class="col-4">
				<a class="btn btn-primary" href="indexNuevo.php" role="button">Salir</a>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="bootstrap.min.js"></script>
</body>
</html>