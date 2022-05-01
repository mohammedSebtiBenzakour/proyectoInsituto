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

echo $id;

$consultar = "SELECT * FROM registrar_alumnos  WHERE dni_alumno = '$id'";
$query = mysqli_query($connection, $consultar);

$consultarNiv = "select * from nivel_instituto";
$queryNiv = mysqli_query($connection, $consultarNiv);
$arrayNiv = mysqli_fetch_array($queryNiv);

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
					<li class="breadcrumb-item active" aria-current="page">Modificar Alumno</li>
				</ol>
			</nav>
		</div>
		<h1 class="d-flex justify-content-center">MODIFICAR ALUMNO</h1>
		
		
		<?php 
		while ($row = mysqli_fetch_assoc($query)) {

			?>

			<div class="container d-flex justify-content-center mb-3">

				<form action="procesar_modificarAlumnos.php" method="POST" class="form-control w-50" enctype="multipart/form-data">

					

					<div class="d-flex justify-content-around mb-3 mt-3">
						<label for="dni_alumno" class="form-label mt-3">Foto alumno: </label>
						<img style="width: 100px;" src="../imagenesAlumnos/<?php echo $row['imagen_alumno']; ?>"  alt="...">
					</div>

					<div class="mb-3 mt-3 d-flex justify-content-center">
							<div class="row w-75">
								<input class="file-input form-control"  name="imagen_alumno" type="file"   id="" >
							</div>
					</div>
						

					<div class="mb-3 mt-3">
						<label for="dni_alumno" class="form-label">DNI:</label>
						<input type="text" value="<?php echo $row['dni_alumno']; ?>" readonly class="form-control" id="dni_alumno" placeholder="DNI" name="dni_alumno" >
					</div>
					<div class="mb-3">
						<label for="nombre_alumno" class="form-label">Nombre:</label>
						<input type="text" value="<?php echo $row['nombre_alumno']; ?>" class="form-control" id="nombre_alumno" placeholder="Nombre" name="nombre_alumno">
					</div>
					<div class="mb-3">
						<label for="primer_apellido_alumno" class="form-label">Primer Apellido:</label>
						<input type="text" value="<?php echo $row['primer_apellido_alumno']; ?>" class="form-control" id="primer_apellido_alumno" placeholder="Apellidos" name="primer_apellido_alumno">
					</div>
					<div class="mb-3">
						<label for="segundo_apellido_alumno" class="form-label">Segundo Apellido:</label>
						<input type="text" value="<?php echo $row['segundo_apellido_alumno']; ?>" class="form-control" id="segundo_apellido_alumno" placeholder="Apellidos" name="segundo_apellido_alumno">
					</div>
					<div class="mb-3">
						<label for="email_alumno" class="form-label">Email:</label>
						<input type="email" value="<?php echo $row['email_alumno']; ?>" class="form-control" id="email_alumno" placeholder="Email" name="email_alumno">
					</div>
					<div class="mb-3">
						<label for="nivel_alumno" class="form-label">Nivel:</label>
						<select class="form-select" name="nivel_alumno" id="nivel_alumno">
							<?php foreach ($queryNiv as $rowNiv) { ?>
								<option value="<?php echo $rowNiv['nombre_nivel']; ?>" <?php echo $row['nivel_alumno'] == $rowNiv['nombre_nivel'] ? 'selected' : ''; ?> ><?php echo $rowNiv['nombre_nivel']; ?></option>
							<?php } ?>
						</select>
					</div>
					<div class="mb-3">
						<label for="telefono_alumno" class="form-label">Teléfono:</label>
						<input type="text" value="<?php echo $row['telefono_alumno']; ?>" class="form-control" id="telefono_alumno" placeholder="Teléfono" name="telefono_alumno">
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