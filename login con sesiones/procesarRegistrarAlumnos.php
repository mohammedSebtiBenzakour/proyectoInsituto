<?php 

//Fichero para el procesamiento del registro de alumnos en la base de datos

session_start();
require_once('conexion.php');
include('funcionesValidacion.php');
require_once('valorSeguro.php');

// if (!isset(>$_SESSION['administrador'])) {
// 	$administrador = "";
// } else {
// 	$administrador = $_SESSION['administrador'];
// }

$imagen_alumno = $_FILES['imagen_alumno']['name'];
$tipo = $_FILES['imagen_alumno']['type'];
$tamano = $_FILES['imagen_alumno']['size'];

echo "la imagen" . $imagen_alumno . "<br>";

//Si la imgaen existe y tiene un tamaño correcto

if (!empty($imagen_alumno) && ($_FILES['imagen_alumno']['size'] <= 5000000)) {
	//Indico los formatos permitidos para subir al servidor
	if (($_FILES['imagen_alumno']['type'] == "image/gif")
		|| ($_FILES['imagen_alumno']['type'] == "image/jpeg")
		|| ($_FILES['imagen_alumno']['type'] == "image/jpg")
		|| ($_FILES['imagen_alumno']['type'] == "image/png")) {
		// la ruta donde se va a guardar las imagenes que se suban
		$directorio = "../imagenesAlumnos/";
		//Muevo la imagen desde el directorio temporal a nuestra ruta indicada antes
	move_uploaded_file($_FILES['imagen_alumno']['tmp_name'], $directorio.$imagen_alumno);
}else{
		// si el formato no es el adecuado
	echo "No se puede subir una imagen con ese formato.";
}
} else {
	// si existe la variable pero se pasa del tamaño permitido
	if($imagen_alumno == !NULL) echo "La imagen es demasiado grande "; 
}

$error = "";
$query = "";
$contador = 0;
$genero = "";

$dni_alumno = $_POST['dni_alumno'];
$dni_alumno = valorSeguro($dni_alumno);

$dniValido = validDniCifNie($dni_alumno);

$nombre_alumno = $_POST['nombre_alumno'];
$nombre_alumno = valorSeguro($nombre_alumno);

$nombreValido = validarNombreOapellido($nombre_alumno);

$primer_apellido_alumno = $_POST['primer_apellido_alumno'];
$primer_apellido_alumno = valorSeguro($primer_apellido_alumno);

$ap1Valido = validarNombreOapellido($primer_apellido_alumno);

$segundo_apellido_alumno = $_POST['segundo_apellido_alumno'];
$segundo_apellido_alumno = valorSeguro($segundo_apellido_alumno);

$ap2Valido = validarNombreOapellido($segundo_apellido_alumno);

if (isset($_POST['genero'])) {
	$genero = $_POST['genero'];
	$genero = valorSeguro($genero);
} else {
	$genero = "";
}


$fecha_nacimiento_alumno = $_POST['fecha_nacimiento_alumno'];

$email_alumno = $_POST['email_alumno'];
$email_alumno = valorSeguro($email_alumno);

$validarEmail = validar_email($email_alumno);

$telefono_alumno = $_POST['telefono_alumno'];
$telefono_alumno = valorSeguro($telefono_alumno);

$validar_telefono = validarTelefono($telefono_alumno);

$nivel_alumno = $_POST['nivel_alumno'];

$calle_alumno = $_POST['calle_alumno'];
$calle_alumno = valorSeguro($calle_alumno);

$validar_calle = validarDireccion($calle_alumno);

$ciudad_alumno = $_POST['ciudad_alumno'];
$ciudad_alumno = valorSeguro($ciudad_alumno);

$validar_ciudad = validarCiudadPais($ciudad_alumno);


$cp_alumno = $_POST['cp_alumno'];
$cp_alumno = valorSeguro($cp_alumno);

$validar_cp = validarCodigoPostal($cp_alumno);

$pais_alumno = $_POST['pais_alumno'];
$pais_alumno = valorSeguro($pais_alumno);

$validar_pais = validarCiudadPais($pais_alumno);

echo $genero . "<br>";

if (isset($_POST['registrar'])) {
	if ($dniValido) {
		echo "dni correcto";
		$_SESSION['dni_alumno'] = $dni_alumno;
		$contador++;
	}else {
		echo "dni Incorrecto";
		$errorDni = "Dni Incorrecto";
		$_SESSION['errorDni'] = $errorDni;
	}
	if ($nombreValido) {
		echo "nombre_alumno correcto  ";
		$_SESSION['nombre_alumno'] = $nombre_alumno;
		$contador++;
	}else {
		echo "nombre_alumno  incorrecto";
		$errorNombre = "Nombre_alumno  incorrecto";
		$_SESSION['errorNombre'] = $errorNombre;
	}
	if ($ap1Valido) {
		echo "primer_apellido_alumno correcto  ";
		$_SESSION['primer_apellido_alumno'] = $primer_apellido_alumno;
		$contador++;
	}else {
		echo "primer_apellido_alumno  incorrecto";
		$errorAp1 = "Primer_apellido_alumno  incorrecto";
		$_SESSION['errorAp1'] = $errorAp1;
	}
	if ($ap2Valido) {
		echo "segundo_apellido_alumno correcto  ";
		$_SESSION['segundo_apellido_alumno'] = $segundo_apellido_alumno;
		$contador++;
	}else {
		echo "segundo_apellido_alumno  incorrecto";
		$errorAp2 = "Segundo_apellido_alumno  incorrecto";
		$_SESSION['errorAp2'] = $errorAp2;
	}
	if ($validarEmail) {
		echo "email_alumno correcto  ";
		$_SESSION['email_alumno'] = $email_alumno;
		$contador++;
	}else {
		echo "email_alumno  incorrecto";
		$errorEmail = "Email_alumno  incorrecto";
		$_SESSION['errorEmail'] = $errorEmail;
	}
	if ($validar_telefono) {
		echo "telefono_alumno correcto";
		$_SESSION['telefono_alumno'] = $telefono_alumno;
		$contador++;
	}else {
		echo "telefono_alumno incorrecto";
		$errorTelefono = "Telefono_alumno incorrecto";
		$_SESSION['errorTelefono'] = $errorTelefono;
	}
	if ($validar_calle) {
		echo "calle_alumno correcta";
		$_SESSION['calle_alumno'] = $calle_alumno;
		$contador++;
	} else {
		echo "calle_alumno incorrecta";
		$errorCalle = "Calle_alumno incorrecta";
		$_SESSION['errorCalle'] = $errorCalle;
	}
	if ($validar_ciudad) {
		echo "ciudad_alumno correcta";
		$_SESSION['ciudad_alumno'] = $ciudad_alumno;
		$contador++;
	}else {
		echo "ciudad_alumno incorrecta";
		$errorCiudad = "Ciudad_alumno incorrecta";
		$_SESSION['errorCiudad'] = $errorCiudad;
	}
	if ($validar_cp) {
		echo "cp_alumno correcto";
		$_SESSION['cp_alumno'] = $cp_alumno;
		$contador++;
	}else {
		echo "cp_alumno incorrecto";
		$errorCp = "Cp_alumno incorrecto";
		$_SESSION['errorCp'] = $errorCp;
	}
	if ($validar_pais) {
		echo "pais_alumno correcto";
		$_SESSION['pais_alumno'] = $pais_alumno;
		$contador++;
	}else {
		echo "pais_alumno incorrecto";
		$errorPais = "Pais_alumno incorrecto";
		$_SESSION['errorPais'] = $errorPais;
	}
		if ($genero == "hombre" || $genero == "mujer" || $genero == "otros") {
		echo "genero  correcto";
		$_SESSION['genero'] = $genero;
		$contador++;
	}else {
		echo "genero incorrecto";
		$errorGenero = "Debes seleccionar un genero";
		$_SESSION['errorGenero'] = $errorGenero;
	}




}

if ($contador == 11) {

	$insertar = "INSERT INTO `registrar_alumnos` (`imagen_alumno`, `dni_alumno`, `nombre_alumno`, `primer_apellido_alumno`, `segundo_apellido_alumno`, `genero`, `fecha_nacimiento_alumno`, `email_alumno`,  `telefono_alumno`, `nivel_alumno` , `calle_alumno` ,   `ciudad_alumno`, `cp_alumno`, `pais_alumno` , `creado_el`) VALUES ('$imagen_alumno','$dni_alumno','$nombre_alumno','$primer_apellido_alumno','$segundo_apellido_alumno', '$genero', '$fecha_nacimiento_alumno', '$email_alumno' , '$telefono_alumno', '$nivel_alumno' , '$calle_alumno',  '$ciudad_alumno', '$cp_alumno', '$pais_alumno' ,  CURRENT_TIMESTAMP)";


//echo "el usuario " . $fila['usuario'];


	$query = mysqli_query($connection, $insertar);
	
} else {
	// code...
}




if ($query) {

	echo "guardado correctamente";

	$_SESSION['dni_alumno'] = $_POST['dni_alumno'] ;

	unset($_SESSION['dni_alumno']);
	unset($_SESSION['nombre_alumno']);
	unset($_SESSION['primer_apellido_alumno']);
	unset($_SESSION['segundo_apellido_alumno']);
	unset($_SESSION['email_alumno']);
	unset($_SESSION['telefono_alumno']);
	unset($_SESSION['calle_alumno']);
	unset($_SESSION['ciudad_alumno']);
	unset($_SESSION['cp_alumno']);
	unset($_SESSION['pais_alumno']);
	unset($_SESSION['genero']);

	
		// echo "<script> alert('Registro Guardado correctamente');
		// location.href = 'registrarAlumnos.php';</script>";

	header("Location: registrarAlumnos.php?mensaje=ok&respuesta=Registro Guardado correctamente");
}else{

	echo "no se pudo guardar los datos";
		// echo "<script> alert('No se pudo guardar los datos');
		// location.href = 'registrarAlumnos.php';</script>";

	header("Location: registrarAlumnos.php?mensaje=ok&respuesta=No se pudo guardar los datos  en la base de datos");
}














?>