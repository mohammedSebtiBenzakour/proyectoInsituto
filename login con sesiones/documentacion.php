<?php 

//Fichero para Consultar documentación Solo accesible por 'Profesores' y 'Jefatura'

require_once('conexion.php');
require_once('consultasOfertas.php');

session_start();

$usuario = $_SESSION['usuario'] ;
$perfil = $_SESSION['perfil'] ;
if (!isset($usuario) || !isset($perfil)) {
	header("location: loginProfesores.php");
}else{

// 	echo "<h1>Bienvenido : $usuario </h1>";

// echo "<h2></h2>";
}

$consultarD = "select * from departamento_instituto";
$queryD = mysqli_query($connection, $consultarD);
$arrayD = mysqli_fetch_array($queryD);

$consultarN = "select * from insertar_noticias";
$queryN = mysqli_query($connection, $consultarN);
$arrayN = mysqli_fetch_array($queryN);


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
	<title></title>
	<script type="text/javascript">
		function MostrarDepartamento()
		{
			/* Para obtener el valor */
			var cod = document.getElementById("form_departamento").value;
			//alert(cod);

			/* Para obtener el texto */
			var combo = document.getElementById("form_departamento");
			var selected = combo.options[combo.selectedIndex].text;
			document.getElementById("mostrar_departamento").innerHTML = selected;

			//alert(selected);
			

		}
		function MostrarNoticia()
		{
			
			/* Para obtener el valor */
			var cod = document.getElementById("noticia").value;
			//alert(cod);

			/* Para obtener el texto */
			var combo = document.getElementById("noticia");
			var selected = combo.options[combo.selectedIndex].text;
			document.getElementById("mostrar_noticia").innerHTML = selected;

		}
			function MostrarOferta()
		{
			
			/* Para obtener el valor */
			var cod = document.getElementById("oferta").value;
			//alert(cod);

			/* Para obtener el texto */
			var combo = document.getElementById("oferta");
			var selected = combo.options[combo.selectedIndex].text;
			document.getElementById("mostrar_oferta").innerHTML = selected;

		}
	</script>
</head>
<body>

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
					<li class="breadcrumb-item"><a href="documentacion.php">Ver documentación</a></li>
					<li class="breadcrumb-item active" aria-current="page">Consultar documentación</li>
				</ol>
			</nav>
		</div>
		<h1>Consultar documentación Solo accesible por 'Profesores' y 'Jefatura'</h1>

		<form id="contact-form" method="post" action="" role="form" class="row g-3 needs-validation" novalidate>

			<div class="messages"></div>

			<div class="controls">
				<div class="row">
					<div class="col-md-6">
						<div class="form-group">
							<label for="form_departamento">Consultar Departamentos *</label>
							<select name="departamento" id="form_departamento" required="required" data-error="Valid departamento is required." class="form-control" onchange="MostrarDepartamento();">
								<option selected disabled value="">Por Favor elegir un departamento...</option>
								<?php foreach ($queryD as $row) { ?>
									<option value="<?php echo $row['nombre_departamento']; ?>"><?php echo $row['nombre_departamento']; ?></option>
								<?php } ?>
							</select>
							<div class="help-block with-errors"></div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label for="form_departamento"></label>
							<div id="mostrar_departamento" class="form-control">
								Ver el resultado...
							</div>
							<div class="help-block with-errors"></div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<div class="form-group">
							<label for="noticia">Consultar Noticias *</label>
							<select name="noticia" id="noticia" required="required" data-error="Valid noticia is required." class="form-control" onchange="MostrarNoticia();" >
								<option selected disabled value="">Por Favor elegir un noticias...</option>
								<?php foreach ($queryN as $row) { ?>
									<option value="<?php echo $row['nombre_noticia']; ?>"><?php echo $row['texto_noticia']; ?></option>
								<?php } ?>
							</select>
							<div class="help-block with-errors"></div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label for="form_departamento"></label>
							<div id="mostrar_noticia" class="form-control">
								Ver el resultado...
							</div>
							<div class="help-block with-errors"></div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<div class="form-group">
							<label for="oferta">Consultar Ofertas de Empleo *</label>
							<select name="oferta" id="oferta" required="required" data-error="Valid oferta is required." class="form-control" onchange="MostrarOferta();" >
								<option selected disabled value="">Por Favor elegir un ofertas de empleo...</option>
								<?php foreach ($query as $row) { ?>
									<option value="<?php echo $row['nombre_oferta']; ?>"><?php echo $row['descripcion_oferta']; ?></option>
								<?php } ?>
							</select>
							<div class="help-block with-errors"></div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label for="form_departamento"></label>
							<div id="mostrar_oferta" class="form-control">
								Ver el resultado...
							</div>
							<div class="help-block with-errors"></div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<div class="form-check">
							
						</div>
					</div>
				</div>
			</div>
			<div class="row pt-3">
				
				<div class="col-md-12 ">
					<a class="btn btn-primary d-flex justify-content-center" href="paginaMenuAside.php" role="button">Salir</a>
				</div>

			</div>
			<div class="row">
				
			</div>

		</form>
	</div>
	<script type="text/javascript" src="../js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript" src=""></script>
	<script type="text/javascript" src="../js/validarLoginProfesores.js"></script>
</body>
</html>