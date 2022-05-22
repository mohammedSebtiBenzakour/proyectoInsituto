<?php 

session_start();
require("encryptJava.php");

$usuario = $_SESSION['usuario'] ;
$perfil = $_SESSION['perfil'] ;
$clave = $_SESSION['clave'];

$encrypted_usuario = JavaPHPCompatibleEncryption::encrypt($key, $iv, $usuario);
$encrypted_clave = JavaPHPCompatibleEncryption::encrypt($key, $iv, $clave);

// $_SESSION['usuario'] = "kjgf_fkghy97f4-".$_SESSION['usuario'] ;
// $_SESSION['clave'] = $_SESSION['clave'] . "-kjgf_fkghy97f4" ;

$_SESSION['usuario'] = $encrypted_usuario ;
$_SESSION['clave'] = $encrypted_clave ;

//echo $clave . "<br>";
//echo $usuario . "<br>";

 // $clave = md5($_SESSION['clave']);
 // $usuario = md5($_SESSION['usuario']);

// $_SESSION['clave'] = md5($_SESSION['clave']);
// $_SESSION['usuario'] = md5($_SESSION['usuario']);

// echo $_SESSION['usuario']. "<br>";
// echo $_SESSION['clave'] ;

if (!isset($usuario) || !isset($perfil)) {
	header("location: loginProfesores.php");
}else{

// 	echo "<h1>Bienvenido : $usuario </h1>";

// echo "<h2></h2>";
}
?>
<?php 
require_once('consultas.php');

$consultarA = "select * from registrar_alumnos";
$queryA = mysqli_query($connection, $consultarA);
$arrayA = mysqli_fetch_array($queryA);

$consultarP = "select * from personal_no_docente";
$queryP = mysqli_query($connection, $consultarP);
$arrayP = mysqli_fetch_array($queryP);

?>


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

	
	<title>Pagina Principal</title>
</head>
<body>
	<header class="container">
		<div class="row">
			<div class="col">
			</div>
			<div class="col">
				<div id='rssBlock'>
					<p class="cnnContents">
						<span class="marqueeStyle">&nbsp;Bienvenido al instituto</span>
						<!-- duplicate above, change style to allow continous scroll -->
					</p>
				</div>
			</div>
			<div class="col pt-2 mb-2 d-flex flex-row-reverse colores col-lg-2">
				<div class="dropdown">
					<button class="btn btn-light dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
						Idiomas
					</button>
					<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
						<li><a class="dropdown-item" href="#" ><img class="lang-flag" src="https://cdn2.iconfinder.com/data/icons/world-flag-icons/128/Flag_of_Spain.png" width="20%" /> Español</a></li>
						<li><a class="dropdown-item" href="#"><img class="lang-flag" src="https://cdn2.iconfinder.com/data/icons/world-flag-icons/128/Flag_of_United_Kingdom.png" width="20%" /> English</a></li>
						<li><a class="dropdown-item" href="#"><img class="lang-flag" src="https://cdn2.iconfinder.com/data/icons/world-flag-icons/128/Flag_of_France.png" width="20%"/> Français</a></li>
						<li><a class="dropdown-item" href="#"><img class="lang-flag" src="https://cdn2.iconfinder.com/data/icons/world-flag-icons/128/Flag_of_Italy.png" width="20%" /> Italiano</a></li>
						<li><a class="dropdown-item" href="#"><img class="lang-flag" src="https://cdn2.iconfinder.com/data/icons/world-flag-icons/128/Flag_of_Germany.png" width="20%" /> Deutsch</a></li>
					</ul>
				</div>

			</div>
		</div>
	</header>
	<nav class="container">
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
										Administración
									</a>
									<ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="navbarDarkDropdownMenuLink">
										<li><a class="dropdown-item" href="loginProfesores.php" target="_blank" >Acceso Solo Profesores</a></li>
										<li><a class="dropdown-item" href="documentacion.php" >Ver documentación</a></li>
										<li><a class="dropdown-item" href="consultarListadosEmpleados.php">Ver todos los Empleados</a></li>
										<li><a class="dropdown-item" target="_blank" href="http://localhost:8080/GestionInstitutoJavaFinal/login.jsp">Gestionar Notas Alumnos</a></li>
										<li><a class="dropdown-item" target="_blank" href="http://localhost:8080/LoginUsuario/index.jsp">Biblioteca</a></li>
										<li><a class="dropdown-item" target="_blank" href="../phpMail040322/enviarEmailListados.php">Enviar Listados por email</a></li>
									</ul>
								</li>
								<li class="nav-item dropdown">
									<a class="nav-link dropdown-toggle" href="#" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
										Inserción de datos
									</a>
									<ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="navbarDarkDropdownMenuLink">
										<li><a class="dropdown-item" href="formularioRegistrar.php" >Registrar Profesores</a></li>
										<li><a class="dropdown-item" href="registrarAlumnos.php">Registrar Alumnos</a></li>
										<li><a class="dropdown-item" href="formularioRegistrarPersonalNoDocente.php">Registrar Personal No Docente</a></li>
										<li><a class="dropdown-item" href="crearPerfiles.php" >Crear perfiles</a></li>
										<li><a class="dropdown-item" href="crearDepartamento.php">Crear Departamento</a></li>
										<li><a class="dropdown-item" href="crearNivelInstituto.php">Crear Nivel Educativo En el Instituto</a></li>
										<li><a class="dropdown-item" href="formularioInsertarNoticia.php">Insertar Noticias</a></li>
										<li><a class="dropdown-item" href="formularioInsertarOferta.php">Insertar Ofertas</a></li>
									</ul>
								</li>
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
				<form class="d-flex ps-3" method="post" action="salir.php">
					<button class="btn btn-outline-success" type="submit">Cerrar session</button>
				</form>
			</div>

		</div>
	</nav>
	
	<div class="container">
		<div class="row pt-3">

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
			<div class="col-2 d-flex justify-content-start ">
				<img class="shadow p-3 mb-5 bg-body rounded rounded-circle" src="../img/logoInstituto.jpg" alt="Logo del Instituto" width="100px">
			</div>
			<div class="col-8 ">
				<h1>Bienvenido : <?php echo $usuario; ?> </h1>
				<h3>Tu perfil es : <?php echo $perfil; ?></h3>
				<h3></h3>
			</div>
		</div>
		<div class="row pb-3">
			<div class="col-md-3 mt-3">
				<a class="btn btn-primary" href="indexNuevo.php" role="button">Volver</a>
			</div>
			<div class="col-md-5 mt-3 ">
				<a class="btn btn-success" href="../phpMail040322/enviarEmail.php" role="button">Enviar cualquier documento por email</a>
			</div>
			<div class="col-md-4 mt-3 ">
				<a class="btn btn-primary" href="subidaDocumentosServido.php" role="button">Subir cualquier documento al servidor</a>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col ">
				<div class="d-flex align-items-start ">
					<div class="shadow p-3 mb-5 bg-body rounded" style="height: 550px;">
						<div class="nav flex-column nav-pills me-3 menuAside" id="v-pills-tab" role="tablist" aria-orientation="vertical">
							<button class="nav-link active border-bottom border-top" id="v-pills-home-tab" data-bs-toggle="pill" data-bs-target="#v-pills-profesores" type="button" role="tab" aria-controls="v-pills-home" aria-selected="true">Profesores</button>
							<button class="nav-link border-bottom" id="v-pills-profile-tab" data-bs-toggle="pill" data-bs-target="#v-pills-alumnos" type="button" role="tab" aria-controls="v-pills-profile" aria-selected="false">Alumnos</button>
							<button class="nav-link border-bottom" id="v-pills-messages-tab" data-bs-toggle="pill" data-bs-target="#v-pills-noDocente" type="button" role="tab" aria-controls="v-pills-messages" aria-selected="false">Personal no Docente</button>
							<button class="nav-link border-bottom" id="v-pills-settings-tab" data-bs-toggle="pill" data-bs-target="#v-pills-biblioteca" type="button" role="tab" aria-controls="v-pills-settings" aria-selected="false">Bibilioteca</button>
							<button class="nav-link border-bottom" id="v-pills-settings-tab" data-bs-toggle="pill" data-bs-target="#v-pills-jefatura" type="button" role="tab" aria-controls="v-pills-settings" aria-selected="false">Gestionar Notas Alumnos</button>
							<button class="nav-link border-bottom" id="v-pills-settings-tab" data-bs-toggle="pill" data-bs-target="#v-pills-otros" type="button" role="tab" aria-controls="v-pills-settings" aria-selected="false">Generar PDF'S / Excel</button>
						</div>
					</div>
					<div class="tab-content w-100" id="v-pills-tabContent">
						<div class="tab-pane fade show active" id="v-pills-profesores" role="tabpanel" aria-labelledby="v-pills-home-tab">
							<div class="container">
								<div class="row">
									<div class="col">
										<h1>LISTADO DE PROFESORES REGISTRADOS</h1>
										<table class="table table-hover" id="tablaProfesores">
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
												<a class="btn btn-primary" href="indexNuevo.php" role="button">Salir</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="tab-pane fade" id="v-pills-alumnos" role="tabpanel" aria-labelledby="v-pills-profile-tab">
							<div class="container">
								<div class="row">
									<div class="col">
										<h1>Listado de Alumnos</h1>
										<table class="table table-hover" id="tablaAlumnos">
											<thead>
												<tr>
													<th scope="col">FOTO</th>
													<th scope="col">DNI</th>
													<th scope="col">Nombre</th>
													<th scope="col">Primer Apellido</th>
													<th scope="col">Segundo Apellido</th>
													<th scope="col">Email</th>
													<th scope="col">Nivel</th>
													<th scope="col">Teléfono</th>
													<th scope="col">Modificar</th>
													<th scope="col">Eliminar</th>
												</tr>
											</thead>
											<tbody>
												<?php 
												foreach ($queryA as $row) {
													?>
													<tr>
														<td><img style="width: 100px;" src="../imagenesAlumnos/<?php echo  $row['imagen_alumno']; ?>"  alt="..."></td>
														<td class="align-middle"><?php echo $row['dni_alumno']; ?></td>
														<td class="align-middle"><?php echo $row['nombre_alumno']; ?></td>
														<td class="align-middle"><?php echo $row['primer_apellido_alumno']; ?></td>
														<td class="align-middle"><?php echo $row['segundo_apellido_alumno']; ?></td>
														<td class="align-middle"><?php echo $row['email_alumno']; ?></td>
														<td class="align-middle"><?php echo $row['nivel_alumno']; ?></td>
														<td class="align-middle"><?php echo $row['telefono_alumno']; ?></td>
														<td class="align-middle"><a class="btn btn-warning" href="modificarAlumnos.php?id=<?php echo $row['dni_alumno']; ?>">modificar</a> </td>
														<td class="align-middle"><a class="btn btn-danger" href="eliminarAlumnos.php?id=<?php echo $row['dni_alumno']; ?>">eliminar</a></td>
													</tr>
												<?php }
												?>
											</tbody>
										</table>
										<div class="row">
											<div class="col-4">
												<a class="btn btn-primary mb-3" href="registrarAlumnos.php" role="button">Volver a formulario de registro</a>
											</div>

											<div class="col-4">
												<a class="btn btn-primary" href="indexNuevo.php" role="button">Salir</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="tab-pane fade" id="v-pills-noDocente" role="tabpanel" aria-labelledby="v-pills-messages-tab">
							<div class="container">
								<div class="row">
									<div class="col">
										<h1>LISTADO DE PERSONAL NO DECENTE</h1>
										<table class="table table-hover" id="tablaPersonalNoDocencte">
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
												foreach ($queryP as $row) {
													?>
													<tr>
														<td ><?php echo $row['dni']; ?></td>
														<td><?php echo $row['nombre']; ?></td>
														<td><?php echo $row['apellidos']; ?></td>
														<td><?php echo $row['email']; ?></td>
														<td><?php echo $row['telefono']; ?></td>
														<td><?php echo $row['departamento']; ?></td>
														<td><a class="btn btn-warning" href="modificarPersonalNoDocente.php?id=<?php echo $row['dni']; ?>">modificar</a> </td>
														<td><a class="btn btn-danger" href="eliminarPersonalNoDocente.php?id=<?php echo $row['dni']; ?>">eliminar</a></td>
													</tr>

													<?php
												}

												?>

											</tbody>
										</table>
										<div class="row">
											<div class="col-4">
												<a class="btn btn-primary" href="formularioRegistrarPersonalNoDocente.php" role="button">Volver a formulario de registro</a>
											</div>

											<div class="col-4">
												<a class="btn btn-primary" href="indexNuevo.php" role="button">Salir</a>
											</div>
										</div>
									</div>
								</div>
							</div>

						</div>
						<?php 


						?>
						<div class="tab-pane fade btn btn-warning w-50 m-4" id="v-pills-biblioteca" role="tabpanel" aria-labelledby="v-pills-settings-tab"><a class="dropdown-item " target="_blank" href="http://localhost:8080/LoginUsuario/index.jsp?usu=<?php echo $_SESSION['usuario']; ?>&pas=<?php echo $_SESSION['clave']; ?>">Ir a la Biblioteca</a></div>
						<div class="tab-pane fade btn btn-warning w-50 m-4" id="v-pills-jefatura" role="tabpanel" aria-labelledby="v-pills-settings-tab"><a class="dropdown-item" target="_blank" href="http://localhost:8080/GestionInstitutoJavaFinal/login.jsp?usu=<?php echo $_SESSION['usuario']; ?>&pas=<?php echo $_SESSION['clave']; ?>">Ir a Gestionar Notas Alumnos</a></div>
						<div class="tab-pane fade" id="v-pills-otros" role="tabpanel" aria-labelledby="v-pills-settings-tab">

							<header class="hero">
								<section class="hero__main container">
									<div class="hero__texts">
										<h4 class="hero__title">Generación de PDF'S De Profesores, Alumnos y personal no docente</h4>
										
										<a href="#" class="hero__cta">Profesores</a>
										<a href="#" class="hero__cta1">Alumnos</a>
										<a href="#" class="hero__cta2">Personal no Docente</a>
									</div>
								</section>
							</header>

							<section class="modal">
								<div class="modal__container">

									<h2 class="modal__title">¡Listado de Profesores!</h2>
									<p class="modal__paragraph">Listado de Profesores.</p>
									<a href="generarPDFProfesores.php" target="_blank" class="btn btn-warning m-1 float-end "><i class="fas fa-table fa-lg"></i>&nbsp;&nbsp;Exportar a PDF</a>
									<a href="generarExcelProfesores.php" class="btn btn-success m-1 float-end "><i class="fas fa-table fa-lg"></i>&nbsp;&nbsp;Exportar a excel</a>
									<a href="generarXMLProfesores.php" class="btn btn-warning m-1 float-end " target="_blank"><i class="fas fa-table fa-lg"></i>&nbsp;&nbsp;Imprimir XML</a>
									<a href="#" class="modal__close">Cerrar Modal</a>
								</div>
							</section>
							<section class="modal1">
								<div class="modal__container">

									<h2 class="modal__title">¡Listado de alumnos!</h2>
									<p class="modal__paragraph">Listado de alumnos.</p>
									<a href="generarPDFAlumnos.php" target="_blank" class="btn btn-warning m-1 float-end "><i class="fas fa-table fa-lg"></i>&nbsp;&nbsp;Exportar a PDF</a>
									<a href="generarExcelAlumnos.php" class="btn btn-success m-1 float-end "><i class="fas fa-table fa-lg"></i>&nbsp;&nbsp;Exportar a excel</a>
									<a href="generarXMLAlumnos.php" class="btn btn-warning m-1 float-end " target="_blank"><i class="fas fa-table fa-lg"></i>&nbsp;&nbsp;Imprimir XML</a>
									<a href="#" class="modal__close1">Cerrar Modal</a>
								</div>
							</section>
							<section class="modal2">
								<div class="modal__container">

									<h2 class="modal__title">¡Listado de personal No Docente!</h2>
									<p class="modal__paragraph">Listado de personal No Docente.</p>
									<a href="generarPDFPersonalNoDocente.php" target="_blank" class="btn btn-warning m-1 float-end "><i class="fas fa-table fa-lg"></i>&nbsp;&nbsp;Exportar a PDF</a>
									<a href="generarExcelPersonalNODocente.php" class="btn btn-success m-1 float-end "><i class="fas fa-table fa-lg"></i>&nbsp;&nbsp;Exportar a excel</a>
									<a href="generarXMLPersonalNoDocente.php" class="btn btn-warning m-1 float-end " target="_blank"><i class="fas fa-table fa-lg"></i>&nbsp;&nbsp;Imprimir XML</a>
									<a href="#" class="modal__close2">Cerrar Modal</a>
								</div>
							</section>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="../js/bootstrap-select.min.js"></script>
<script type="text/javascript" src="../js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="../js/horaSimple.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.5.4/bootstrap-select.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/v/bs5/dt-1.11.5/datatables.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script type="text/javascript" src="../js/modalPdf.js"></script>
<script type="text/javascript">
	$(document).ready( function () {
		$('#tablaProfesores').DataTable();
		$('#tablaAlumnos').DataTable();
		$('#tablaPersonalNoDocencte').DataTable();
	} );
</script>

</body>
</html>