<?php 

//Fichero para gestionar y validar el registro del personal no docente

session_start();
require_once('conexion.php');
require_once('valorSeguro.php');
include('funcionesValidacion.php');

$error = "";

$dni = $_POST['dni'];
$dni = valorSeguro($dni);

$valido = validDniCifNie($dni);


$nombre = $_POST['nombre'];
$nombre = valorSeguro($nombre);

$nombreValido = validarNombreOapellido($nombre);

$apellidos = $_POST['apellidos'];
$apellidos = valorSeguro($apellidos);

$apellidoValido = validarNombreApellido($apellidos);


$usuario = $_POST['usuario'];
$password = $_POST['password'];

$usuario = valorSeguro($usuario);
$password = valorSeguro($password);

$validar_usu = validarUsuario_password($usuario);

$validar_pass = validarUsuario_password($password);


$email = $_POST['email'];

$email = valorSeguro($email);

$validarEmail = validar_email($email);


$departamento = $_POST['departamento'];
$perfil = $_POST['perfil'];

$direccion = $_POST['direccion'];
$direccion = valorSeguro($direccion);

$validar_dir = validarDireccion($direccion);

$ciudad = $_POST['ciudad'];
$pais = $_POST['pais'];

$ciudad = valorSeguro($ciudad);
$pais = valorSeguro($pais);

$validar_ciudad = validarCiudadPais($ciudad);
$validar_pais = validarCiudadPais($pais);

$fecha = $_POST['fecha'];
$telefono = $_POST['telefono'];

$telefono = valorSeguro($telefono);

$validar_telefono = validarTelefono($telefono);
$query = "";
$contador = 0;

if (isset($_POST['registrar'])) {
	if ($valido) {
		echo "dni correcto";
		$_SESSION['dni'] = $dni;
		$contador++;
	}else {
		echo "dni Incorrecto";
		$errorDn = "Dni Incorrecto";
		$_SESSION['errorDn'] = $errorDn;
	}
	if ($nombreValido) {
		echo "nombre correcto  ";
		$_SESSION['nombre'] = $nombre;
		$contador++;
	}else {
		echo "nombre  incorrecto";
		$errorN = "Nombre  incorrecto";
		$_SESSION['errorN'] = $errorN;
	}
	if ($apellidoValido) {
		echo "apellidos correcto  ";
		$_SESSION['apellidos'] = $apellidos;
		$contador++;
	}else {
		echo "apellidos incorrecto  ";
		$errorAp = "Apellidos incorrectos  ";
		$_SESSION['errorAp'] = $errorAp;
	}
	if ($validar_usu) {
		echo "usuario valido";
		$_SESSION['usu'] = $usuario;
		$contador++;
	}else {
		echo "usuario no valido";
		$errorU = "Usuario no valido";
		$_SESSION['errorU'] = $errorU;
	}
	if ($validar_pass) {
		echo "pass correcto";
		$contador++;
	}else {
		echo "pass incorrecta";
		$errorP ="Contraseña incorrecta";
	}
	if ($validarEmail) {
		echo "email correcto  ";
		$_SESSION['email'] = $email;
		$contador++;
	}else {
		echo "email incorrecto  ";
		$errorE = "Email incorrecto  ";
		$_SESSION['errorE'] = $errorE;

	}
	if ($validar_dir) {
		echo "direccion correcta";
		$_SESSION['direccion'] = $direccion;
		$contador++;
	} else {
		echo "direccion incorrecta";
		$errorD = "Direccion incorrecta";
		$_SESSION['errorD'] = $errorD;
	}
	if ($validar_ciudad) {
		echo "ciudad correcta";
		$_SESSION['ciudad'] = $ciudad;
		$contador++;
	}else {
		echo "ciudad incorrecta";
		$errorC = "Ciudad incorrecta";
		$_SESSION['errorC'] = $errorC;
	}
	if ($validar_pais) {
		echo "pais correcto";
		$_SESSION['pais'] = $pais;
		$contador++;
	}else {
		echo "pais incorrecto";
		$errorP = "Pais incorrecto";
		$_SESSION['errorP'] = $errorP;
	}
	if ($validar_telefono) {
		echo "Telefono correcto";
		$_SESSION['telefono'] = $telefono;
		$contador++;
	}else {
		echo "Telefono incorrecto";
		$errorT = "Telefono incorrecto";
		$_SESSION['errorT'] = $errorT;
	}

}

if ($contador == 10) {

		$insertar = "INSERT INTO `personal_no_docente` (`dni`, `nombre`, `apellidos`, `usuario`, `clave`, `email`, `departamento`, `direccion` ,  `ciudad` , `pais`, `fecha` , `telefono` , `fecha_registro`, `perfil`) VALUES ('$dni', '$nombre','$apellidos','$usuario','$password','$email', '$departamento', '$direccion', '$ciudad', '$pais' , '$fecha', '$telefono', CURRENT_TIMESTAMP, '$perfil')";


	$query = mysqli_query($connection, $insertar);
} else {
	// code...
}

//echo "el usuario " . $fila['usuario'];


if ($query) {
	echo "guardado correctamente";

	unset($_SESSION['dni']);
	unset($_SESSION['nombre']);
	unset($_SESSION['apellidos']);
	unset($_SESSION['usu']);
	unset($_SESSION['email']);
	unset($_SESSION['direccion']);
	unset($_SESSION['ciudad']);
	unset($_SESSION['pais']);
	unset($_SESSION['telefono']);

	// echo "<script> alert('Registro Guardado correctamente');
	// location.href = 'formularioRegistrarPersonalNoDocente.php';</script>";

	header("Location: formularioRegistrarPersonalNoDocente.php?mensaje=ok&respuesta=Registro Guardado correctamente");

}else{

	echo "no se pudo guardar los datos";
	// echo "<script> alert('No se pudo guardar los datos por que  el DNI introducido ya está registrado en la base de datos');
	// location.href = 'formularioRegistrarPersonalNoDocente.php';</script>";

	header("Location: formularioRegistrarPersonalNoDocente.php?mensaje=ok&respuesta=No se pudo guardar los datos  en la base de datos");
}


?>