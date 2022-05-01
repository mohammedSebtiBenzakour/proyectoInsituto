	<?php 

	session_start();

	$error = "" ;

	if (!isset($_SESSION['error'])) {
		$error = "";
	}else{

		$error = $_SESSION['error'] ;

	}

	
	?>
	<?php 

	require_once('conexion.php');

	$consultar = "select * from perfiles";
	$query = mysqli_query($connection, $consultar);
	$array = mysqli_fetch_array($query);


	?>
	<!DOCTYPE html>
	<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" type="text/css" href="bootstrap.min.css">
		<link rel="stylesheet" type="text/css"  href="../css/estiloMenuAside.css">
		<title>LOGIN POR PERFILES</title>
	</head>
	<body>

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
									<li class="nav-item  ">
										<a class="nav-link active" aria-current="page" href="#">Administración</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" href="#"></a>
									</li>
									<li class="nav-item dropdown">
										<a class="nav-link dropdown-toggle" href="#" id="navbarScrollingDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
											
										</a>
										<ul class="dropdown-menu" aria-labelledby="navbarScrollingDropdown" hidden>
											<li><a class="dropdown-item" href="#"></a></li>
											<li><a class="dropdown-item" href="#"> </a></li>
											<li><hr class="dropdown-divider"></li>
											<li><a class="dropdown-item" href="#"> </a></li>
										</ul>
									</li>
									<li class="nav-item">
										<a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true"></a>
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
							<li class="breadcrumb-item active" aria-current="page">Login General</li>
						</ol>
					</nav>
				</div>
				<div class="row w-50">
					<h1>LOGIN GENERAL</h1>
					<h2 >
						
						<?php 
						if (!empty($error)) {
							echo $error;
							unset($_SESSION['error']);
						} else {
							unset($_SESSION['error']);
							echo isset($_SESSION['error']);
						}

						?>

					</h2>
					<form action="logear.php" method="POST" class="row g-3 needs-validation" novalidate>
						<div class="col-md-12">
							<label for="validationServer04" class="form-label">Perfil</label>
							<select class="form-select is-invalid" id="validationServer04" aria-describedby="validationServer04Feedback" required name="perfil">
								<option selected disabled value="">Eligir vuestro perfil...</option>
								<?php foreach ($query as $row) { ?>
									<option value="<?php echo $row['perfil']; ?>"><?php echo $row['perfil']; ?></option>
								<?php } ?>
							</select>
							<div id="validationServer04Feedback" class="invalid-feedback">
								Please select a valid perfil.
							</div>
						</div>
						<div class="col-md-12">
							<label for="validationCustom01" class="form-label">Nombre de usuario</label>
							<input type="text" class="form-control estudiantes" id="validationCustom01"  name="usuario" required value="a">
							<div class="valid-feedback">
								Looks good!
							</div>
						</div>
						<div class="col-md-12">
							<label for="validationCustom02" class="form-label">Contraseña</label>
							<input type="password" name="clave" value="a" class="form-control estudiantes" id="validationCustom02" required>
							<div class="valid-feedback">
								Looks good!
							</div>
						</div>
						<div class="col-4">
							<div class="form-check">
								<input class="form-check-input" type="checkbox" value="" id="invalidCheck" required checked>
								<label class="form-check-label" for="invalidCheck">
									Agree to terms and conditions
								</label>
								<div class="invalid-feedback">
									You must agree before submitting.
								</div>
							</div>
						</div>
						<div class="col-12">
							<button class="btn btn-primary" type="submit">Acceder</button>
						</div>
					</form>
				</div>
				<div class="row">
				</div>
				<div class="row p-4">
					<div class="col">
						<a class="btn btn-outline-info" href="loginPorPerfiles.php" role="button">Reiniciar</a>
					</div>
					<div class="col">
						<a class="btn btn-outline-success" href="formularioRegistrar.php" role="button">Si no estas registrado Pulsa aquí</a>
					</div>
					<div class="col">
						<a class="btn btn-outline-warning" href="indexNuevo.php" role="button">Volver</a>
					</div>
				</div>
			</div>
			
			<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
			<script type="text/javascript" src="../js/bootstrap-select.min.js"></script>
			<script type="text/javascript" src="../js/bootstrap.bundle.min.js"></script>
			<script type="text/javascript" src="../js/validarLoginProfesores.js"></script>
			<script type="text/javascript" src="../js/seleccionarEstudiante.js"></script>
		</center>

	</body>
	</html>