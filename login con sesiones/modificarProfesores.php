<!-- Fichero con formulario para modificar los profesores regitrados  -->
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="../css/ocultarTd.css">
	<link rel="stylesheet" type="text/css" href="../css/index.css">
	<title>Modificar datos</title>
</head>
<?php 
session_start();
require_once('conexion.php');

$id = $_GET['id'];

// echo $id;

$consultar = "SELECT * FROM registrar_usuarios  WHERE dni = '$id'";
$query = mysqli_query($connection, $consultar);

?>
<?php 

$consultarDep = "select * from departamento_instituto";
$queryDep = mysqli_query($connection, $consultarDep);
$array = mysqli_fetch_array($queryDep);


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
					<li class="breadcrumb-item"><a href="indexNuevo.php">Administración</a></li>
					<li class="breadcrumb-item"><a href="paginaMenuAside.php">Pagina Principal</a></li>
					<li class="breadcrumb-item active" aria-current="page">Consultar listado de Personal No Docente</li>
				</ol>
			</nav>
		</div>
		<h1 class="container d-flex justify-content-center mb-3" >MODIFICAR PROFESORES</h1>
		
		
		<?php 
		while ($row = mysqli_fetch_assoc($query)) {

			?>

			<div class="container d-flex justify-content-center mb-3">

				<form action="procesar_modificarProfesores.php" method="POST" class="form-control w-50" enctype="multipart/form-data">


					<div class="mb-3 mt-3">
						<label for="dni" class="form-label">DNI:</label>
						<input type="text" value="<?php echo $row['dni']; ?>" readonly class="form-control" id="dni" placeholder="DNI" name="dni" >
					</div>
					<div class="mb-3">
						<label for="nombre" class="form-label">Nombre:</label>
						<input type="text" value="<?php echo $row['nombre']; ?>" class="form-control" id="nombre" placeholder="Nombre" name="nombre">
					</div>
					<div class="mb-3">
						<label for="apellidos" class="form-label">Apellidos:</label>
						<input type="text" value="<?php echo $row['apellidos']; ?>" class="form-control" id="apellidos" placeholder="Apellidos" name="apellidos">
					</div>
					<div class="mb-3">
						<label for="usuario" class="form-label">Usuario:</label>
						<input type="text" value="<?php echo $row['usuario']; ?>" class="form-control" id="usuario" placeholder="Usuario" name="usuario">
					</div>
					<div class="mb-3">
						<label for="clave" class="form-label">Clave:</label>
						<input type="password" value="<?php echo $row['clave']; ?>" class="form-control" id="clave" placeholder="Clave" name="clave">
					</div>
					<div class="mb-3">
						<label for="email" class="form-label">Email:</label>
						<input type="email" value="<?php echo $row['email']; ?>" class="form-control" id="email" placeholder="Email" name="email">
					</div>
					<div class="mb-3">
						<label for="departamento" class="form-label">Departamento:</label>
						<select class="form-select" name="departamento" id="departamento">
							<?php foreach ($queryDep as $rowDep) { ?>
								<option value="<?php echo $rowDep['nombre_departamento']; ?>" <?php echo $row['departamento'] == $rowDep['nombre_departamento'] ? 'selected' : ''; ?> ><?php echo $rowDep['nombre_departamento']; ?></option>
							<?php } ?>
						</select>
					</div>
					<div class="mb-3">
						<label for="ciudad" class="form-label">Ciudad:</label>
						<input type="text" value="<?php echo $row['ciudad']; ?>" class="form-control" id="ciudad" placeholder="Ciudad" name="ciudad">
					</div>
					<div class="mb-3">
						<label for="pais" class="form-label">Pais:</label>
						<input type="text" value="<?php echo $row['pais']; ?>" class="form-control" id="pais" placeholder="Pais" name="pais">
					</div>
					<div class="mb-3">
						<label for="direccion" class="form-label">Dirección:</label>
						<input type="text" value="<?php echo $row['direccion']; ?>" class="form-control" id="direccion" placeholder="Dirección" name="direccion">
					</div>
					<div class="mb-3">
						<label for="fecha" class="form-label">Fecha de nacimiento:</label>
						<input type="date" value="<?php echo $row['fecha']; ?>" class="form-control" id="fecha" placeholder="Fecha de nacimiento" name="fecha">
					</div>
					<div class="mb-3">
						<label for="telefono" class="form-label">Teléfono:</label>
						<input type="text" value="<?php echo $row['telefono']; ?>" class="form-control" id="telefono" placeholder="Teléfono" name="telefono">
					</div>
					
					<div class="container d-flex justify-content-center">
						<button type="submit" name="modificar"  class="btn btn-warning">Modificar</button>
					</div>

				</form>

			</div>
			<?php
		}

		?>
		<div class="container d-flex justify-content-center mb-3">
			<div class="row">
				<div class="col-10">
					<a class="btn btn-primary" href="paginaMenuAside.php" role="button">Volver a la pagina principal</a>
				</div>
				
				<div class="col-2">
					<a class="btn btn-primary" href="indexNuevo.php" role="button">Salir</a>
				</div>
				
			</div>
		</div>	
	</div>
	<script type="text/javascript" src="bootstrap.min.js"></script>
</body>
</html>