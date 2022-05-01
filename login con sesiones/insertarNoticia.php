<?php 


session_start();
require_once('conexion.php');
include('funcionesValidacion.php');
require_once('valorSeguro.php');

$query = "";
$contador = 0;
$error = "";

$nombre_noticia = $_POST['nombre_noticia'];
$nombre_noticia = valorSeguro($nombre_noticia);

$validar_nombre_noticia = validarNombreNoticia($nombre_noticia);

$texto_noticia = $_POST['texto_noticia'];
$texto_noticia = valorSeguro($texto_noticia);
$validar_texto_noticia = validarTextoNoticia($texto_noticia);

if (isset($_POST['registrar'])) {
	if ($validar_nombre_noticia) {
		echo "nombre noticia correcto";
		$_SESSION['nombre_noticia'] = $nombre_noticia;
		$contador++;
	}else {
		echo "Nombre noticia Incorrecto";
		$errorNombreNoticia = "Nombre noticia Incorrecto";
		$_SESSION['errorNombreNoticia'] = $errorNombreNoticia;
	}
	if ($validar_texto_noticia) {
		echo "texto noticia correcto";
		$_SESSION['texto_noticia'] = $texto_noticia;
		$contador++;
	}else {
		echo "Texto noticia Incorrecto";
		$errorTextoNoticia = "Texto noticia Incorrecto";
		$_SESSION['errorTextoNoticia'] = $errorTextoNoticia;
	}
	
}

if ($contador == 2) {
	$insertar = "INSERT INTO `insertar_noticias` (`id`, `nombre_noticia`,  `texto_noticia`, `creado_el`) VALUES (NULL, '$nombre_noticia', '$texto_noticia',  CURRENT_TIMESTAMP)";

	$query = mysqli_query($connection, $insertar);
} else {
	// code...
}

// $insertar = "insert into insertar_oferta ('id', 'referencia_oferta', 'nombre_oferta' , 'empresa_oferta' , 'ciudad_oferta' , 'tipo_oferta' , 'fecha_oferta' , 'fecha_actual' 'descripcion_oferta') values(NULL,'$referencia','$nombre','$empresa','$ciudad','$tipo','$fecha', CURRENT_TIMESTAMP ,'$descripcion')";



if ($query) {

	echo "Noticia guardada correctamente";

	unset($_SESSION['nombre_noticia']);
	unset($_SESSION['texto_noticia']);
	

	// echo "<script> alert('guardado correctamente');
	// location.href = 'formularioInsertarNoticia.php';</script>";

	header("Location: formularioInsertarNoticia.php?mensaje=ok&respuesta=Noticia guardada correctamente");

}else{

	echo "no se pudo guardar los datos";
	echo mysqli_error($connection);
	// echo "<script> alert('no se pudo guardar los datos');
	// location.href = 'formularioInsertarNoticia.php';</script>";

	header("Location: formularioInsertarNoticia.php?mensaje=ok&respuesta=La Noticia no ha sido guardada");

}


?>