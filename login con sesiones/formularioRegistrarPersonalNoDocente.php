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
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.0/sweetalert2.css"/>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.0/sweetalert2.js"></script>
	<link rel="stylesheet" type="text/css"  href="../css/errores.css">
	<title>Formulario para registrar Personal no Docente</title>
</head>
<body>
	<?php 
		session_start();
	require_once('conexion.php');

	$usuario = $_SESSION['usuario'] ;
$perfil = $_SESSION['perfil'] ;
if (!isset($usuario) || !isset($perfil)) {
	header("location: loginPorPerfiles.php");
}else{

// 	echo "<h1>Bienvenido : $usuario </h1>";

// echo "<h2></h2>";
}

	$consultar = "select * from departamento_instituto";
	$query = mysqli_query($connection, $consultar);
	$array = mysqli_fetch_array($query);

	$consultarP = "select * from perfiles";
	$queryP = mysqli_query($connection, $consultarP);
	$arrayP = mysqli_fetch_array($queryP);


	?>
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
					<li class="breadcrumb-item"><a href="paginaMenuAside.php">Administración</a></li>
					<li class="breadcrumb-item"><a href="formularioRegistrarPersonalNoDocente.php">Personal No Docente</a></li>
					<li class="breadcrumb-item active" aria-current="page">Formulario para registrar Personal NO Docente</li>
				</ol>
			</nav>
		</div>
		<h1>Formulario para registrar Personal No Docente</h1>

		<form id="contact-form" method="post" action="registrarPersonalNoDocente.php" role="form" class="row g-3 needs-validation" novalidate>

			<div class="messages"></div>

			<div class="controls">

				<div class="row">
					<div class="col-md-6">
						<div class="form-group">
							<label for="form_dni">DNI *</label>
							<input id="form_dni" type="text" name="dni" class="form-control" placeholder="Por Favor introduce el dni * (00000000X)" required="required" data-error="dni is required." value="<?php if(isset($_SESSION['dni'])) echo $_SESSION['dni'] ; ?>">
							<div class="help-block with-errors errores"><?php if(isset($_SESSION['errorDn'])) echo $_SESSION['errorDn'] ;  ?></div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<div class="form-group">
							<label for="form_name">Nombre *</label>
							<input id="form_name" type="text" name="nombre" class="form-control" placeholder="Por Favor introduce el Nombre * (Solo letras se admite acentos)" required="required" data-error="Firstname is required." value="<?php if(isset($_SESSION['nombre'])) echo $_SESSION['nombre'] ; ?>">
							<div class="help-block with-errors errores"><?php if(isset($_SESSION['errorN'])) echo $_SESSION['errorN'] ;  ?></div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<div class="form-group">
							<label for="form_lastname">Apellidos *</label>
							<input id="form_lastname" type="text" name="apellidos" class="form-control" placeholder="Por Favor introduce los Apellidos * (Solo letras se admite acentos)" required="required" data-error="Lastname is required." value="<?php if(isset($_SESSION['apellidos'])) echo $_SESSION['apellidos'] ; ?>">
							<div class="help-block with-errors errores"><?php if(isset($_SESSION['errorAp'])) echo $_SESSION['errorAp'] ;  ?></div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<div class="form-group">
							<label for="form_usuario">Nombre de usuario *</label>
							<input id="form_usuario" type="text" name="usuario" class="form-control" placeholder="Por Favor introduce el Nombre usuario * (No se admite acentos)" required="required" data-error="Firstname is required." value="<?php if(isset($_SESSION['usu'])) echo $_SESSION['usu'] ; ?>">
							<div class="help-block with-errors errores"><?php if(isset($_SESSION['errorU'])) echo $_SESSION['errorU'] ;  ?></div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<div class="form-group">
							<label for="form_password">Contraseña *</label>
							<input id="form_password" type="password" name="password" class="form-control" placeholder="Por Favor introduce la Contraseña * (No se admite acentos)" required="required" data-error="Valid email is required.">
							<div class="help-block with-errors errores"><?php if(isset($_SESSION['errorP'])) echo $_SESSION['errorP'] ;  ?></div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<div class="form-group">
							<label for="form_email">Email *</label>
							<input id="form_email" type="email" name="email" class="form-control" placeholder="Por Favor introduce el email * ejemplo: (mmm@mmm.com)" required="required" data-error="Valid email is required." value="<?php if(isset($_SESSION['email'])) echo $_SESSION['email'] ; ?>">
							<div class="help-block with-errors errores"><?php if(isset($_SESSION['errorE'])) echo $_SESSION['errorE'] ;  ?></div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<div class="form-group">
							<label for="form_departamento">Departamento *</label>
							<select name="departamento" id="form_departamento" required="required" data-error="Valid departamento is required." class="form-control" >
									<option selected disabled value="">Por Favor elegir un departamento...</option>
									<?php foreach ($query as $row) { ?>
									<option value="<?php echo $row['nombre_departamento']; ?>"><?php echo $row['nombre_departamento']; ?></option>
									<?php } ?>
								</select>
								<div class="help-block with-errors"></div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<div class="form-group">
							<label for="form_perfil">Perfil *</label>
							<select name="perfil" id="form_perfil" value="" required="required" data-error="Valid perfil is required." class="form-control" >
								<option selected disabled value="">Por Favor elegir un perfil...</option>
								<?php foreach ($queryP as $row) { ?>
									<option value="<?php echo $row['perfil']; ?>"><?php echo $row['perfil']; ?></option>
								<?php } ?>
							</select>
							<div class="help-block with-errors"></div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<div class="form-group">
							<label for="form_fecha">Dirección *</label>
							<textarea id="form_fecha" type="text" name="direccion" class="form-control" placeholder="Por Favor introduce el la direccion * (Se admite acentos)" required="required" data-error="Valid direccion is required."><?php if(isset($_SESSION['direccion'])) echo $_SESSION['direccion'] ; ?></textarea>
							<div class="help-block with-errors errores"><?php if(isset($_SESSION['errorD'])) echo $_SESSION['errorD'] ;  ?></div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<div class="form-group">
							<label for="form_ciudad">Ciudad *</label>
							<input id="form_ciudad" type="text" name="ciudad" class="form-control" placeholder="Por Favor introduce el ciudad * (Solo se admite la ñ)" required="required" data-error="Valid ciudad is required." value="<?php if(isset($_SESSION['ciudad'])) echo $_SESSION['ciudad'] ; ?>">
							<div class="help-block with-errors errores"><?php if(isset($_SESSION['errorC'])) echo $_SESSION['errorC'] ;  ?></div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<div class="form-group">
							<label for="form_pais">Pais *</label>
							<input id="form_pais" type="text" name="pais" class="form-control" placeholder="Por Favor introduce el pais * (Solo se admite la ñ)" required="required" data-error="Valid pais is required." value="<?php if(isset($_SESSION['pais'])) echo $_SESSION['pais'] ; ?>">
							<div class="help-block with-errors errores"><?php if(isset($_SESSION['errorP'])) echo $_SESSION['errorP'] ;  ?></div>
						</div>
					</div>
				</div>
				
				
				<div class="row">
					<div class="col-md-6">
						<div class="form-group">
							<label for="form_fecha">Fecha de nacimiento *</label>
							<input id="form_fecha" type="date" name="fecha" class="form-control" placeholder="Por Favor introduce el fecha *" required="required" data-error="Valid fecha is required.">
							<div class="help-block with-errors"></div>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col-md-6">
						<div class="form-group">
							<label for="form_telefono">Teléfono *</label>
							<input id="form_telefono" type="text" name="telefono" class="form-control" placeholder="Por Favor introduce el la telefono * (+34 o 0034 o 34 xxx xxx xxx)" required="required" data-error="Valid telefono is required." value="<?php if(isset($_SESSION['telefono'])) echo $_SESSION['telefono'] ; ?>">
							<div class="help-block with-errors errores"><?php if(isset($_SESSION['errorT'])) echo $_SESSION['errorT'] ;  ?></div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<div class="form-check">
							<input class="form-check-input is-invalid" type="checkbox" value="" id="invalidCheck3" aria-describedby="invalidCheck3Feedback" required>
							<label class="form-check-label" for="invalidCheck3">
								Agree to terms and conditions
							</label>
							<div id="invalidCheck3Feedback" class="invalid-feedback">
								You must agree before submitting.
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="row pt-3">
				<div class="col-md-2">
					<input type="submit" class="btn btn-success btn-send" value="Registrarse" id="registrar" name="registrar">
				</div>
				<div class="col-md-2">
					<a class="btn btn-primary" href="paginaMenuAside.php" role="button">Volver</a>
				</div>
				<div class="col-md-4">
					<a class="btn btn-primary" href="indexNuevo.php" role="button">Salir</a>
				</div>

			</div>
			<div class="row">
				<div class="col-md-12">
					<p class="text-muted">
						<strong>*</strong> Campos obligatorios. 
					</div>
				</div>
			</div>

		</form>
	</div>
	<script type="text/javascript" src="../js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript" src=""></script>
	<script type="text/javascript" src="../js/validarLoginProfesores.js"></script>
</body>
</html>

<?php 

unset($_SESSION['dni']);
unset($_SESSION['nombre']);
unset($_SESSION['apellidos']);
unset($_SESSION['usu']);
unset($_SESSION['email']);
unset($_SESSION['direccion']);
unset($_SESSION['ciudad']);
unset($_SESSION['pais']);
unset($_SESSION['telefono']);

unset($_SESSION['errorDn']);

unset($_SESSION['errorN']);

unset($_SESSION['errorAp']);

unset($_SESSION['errorU']);

unset($_SESSION['errorP']);

unset($_SESSION['errorE']);

unset($_SESSION['errorD']);

unset($_SESSION['errorC']);

unset($_SESSION['errorT']);





?>