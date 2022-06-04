<?php 

//Fichero para el procesamiento de registro de usuarios profesores en la base de datos

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
		echo "telefono correcto";
		$_SESSION['telefono'] = $telefono;
		$contador++;
	}else {
		echo "Telefono incorrecto";
		$errorT = "telefono incorrecto";
		$_SESSION['errorT'] = $errorT;
	}

}

if ($contador == 10) {
	$insertar = "INSERT INTO `registrar_usuarios` (`dni`, `nombre`, `apellidos`, `usuario`, `clave`, `email`, `departamento`, `direccion` ,  `ciudad` , `pais`, `fecha` , `telefono` , `fecha_registro`, `perfil`) VALUES ('$dni', '$nombre','$apellidos','$usuario','$password','$email', '$departamento', '$direccion', '$ciudad', '$pais' , '$fecha', '$telefono', CURRENT_TIMESTAMP, '$perfil')";


	$query = mysqli_query($connection, $insertar);
} else {
	// code...
}

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
	// location.href = 'formularioRegistrar.php';</script>";

	header("Location: formularioRegistrar.php?mensaje=ok&respuesta=Registro Guardado correctamente");

}else{

	echo "no se pudo guardar los datos";
  			// echo "<script> alert('No se pudo guardar los datos  en la base de datos');
  			// location.href = 'formularioRegistrar.php';</script>";

	header("Location: formularioRegistrar.php?mensaje=ok&respuesta=No se pudo guardar los datos  en la base de datos");
}


// function validDniCifNie($dni){
// 	$cif = strtoupper($dni);
// 	for ($i = 0; $i < 9; $i ++){
// 		$num[$i] = substr($cif, $i, 1);
// 	}
//   // Si no tiene un formato valido devuelve error
// 	if (!preg_match('/((^[A-Z]{1}[0-9]{7}[A-Z0-9]{1}$|^[T]{1}[A-Z0-9]{8}$)|^[0-9]{8}[A-Z]{1}$)/', $cif)){
// 		return false;
// 	}
//   // Comprobacion de NIFs estandar
// 	if (preg_match('/(^[0-9]{8}[A-Z]{1}$)/', $cif)){
// 		if ($num[8] == substr('TRWAGMYFPDXBNJZSQVHLCKE', substr($cif, 0, 8) % 23, 1)){
// 			return true;
// 		}else{
// 			return false;
// 		}
// 	}
//   // Algoritmo para comprobacion de codigos tipo CIF
// 	$suma = $num[2] + $num[4] + $num[6];
// 	for ($i = 1; $i < 8; $i += 2){
// 		$suma += (int)substr((2 * $num[$i]),0,1) + (int)substr((2 * $num[$i]), 1, 1);
// 	}
// 	$n = 10 - substr($suma, strlen($suma) - 1, 1);
//   // Comprobacion de NIFs especiales (se calculan como CIFs o como NIFs)
// 	if (preg_match('/^[KLM]{1}/', $cif)){
// 		if ($num[8] == chr(64 + $n) || $num[8] == substr('TRWAGMYFPDXBNJZSQVHLCKE', substr($cif, 1, 8) % 23, 1)){
// 			return true;
// 		}else{
// 			return false;
// 		}
// 	}
//   // Comprobacion de CIFs
// 	if (preg_match('/^[ABCDEFGHJNPQRSUVW]{1}/', $cif)){
// 		if ($num[8] == chr(64 + $n) || $num[8] == substr($n, strlen($n) - 1, 1)){
// 			return true;
// 		}else{
// 			return false;
// 		}
// 	}
//   // Comprobacion de NIEs
//   // T
// 	if (preg_match('/^[T]{1}/', $cif)){
// 		if ($num[8] == preg_match('/^[T]{1}[A-Z0-9]{8}$/', $cif)){
// 			return true;
// 		}else{
// 			return false;
// 		}
// 	}
//   // XYZ
// 	if (preg_match('/^[XYZ]{1}/', $cif)){
// 		if ($num[8] == substr('TRWAGMYFPDXBNJZSQVHLCKE', substr(str_replace(array('X','Y','Z'), array('0','1','2'), $cif), 0, 8) % 23, 1)){
// 			return true;
// 		}else{
// 			return false;
// 		}
// 	}
//   // Si todavía no se ha verificado devuelve error
// 	return false;
// }

// function validarNombreApellido($nombre){

// 	if(!preg_match("/^([A-Za-zÑñ]+[áéíóú]?[A-Za-z]*){3,18}\s+([A-Za-zÑñ]+[áéíóú]?[A-Za-z]*){3,36}$/iu", $nombre)) {
// 		echo "malo";
// 		return false;
// 	} else {
// 		echo "Okey";
// 		return true;
// 	}
// 	return false;
// }

// function validarNombreOapellido($nombre){

// 	if(preg_match ( "/^([A-Za-zÑñ]+[áéíóú]?[A-Za-z]*){3,18}$/" , $nombre )) {
// 		echo "ok";
// 		return true;
// 	} else {
// 		echo "no vale";
// 		return false;
// 	}
// 	return false;
// }

// function validarUsuario_password($nombre){

// 	if (preg_match('/^[A-Za-z][A-Za-z0-9]{5,31}$/', $nombre)){
// 		echo "ok nombre o pass";
// 		return true;
// 	} else {
// 		echo "no vale nombre o pass";
// 		return false;
// 	}
// 	return false;
// }


// function validar_email($str)
// {
// 	return (false !== filter_var($str, FILTER_VALIDATE_EMAIL));
// }

// function validarDireccion($nombre){

// 	if(preg_match ( "/^[a-zA-Z1-9À-ÖØ-öø-ÿ]+\.?(( |\-)[a-zA-Z1-9À-ÖØ-öø-ÿ]+\.?)* (((#|[nN][oO]\.?) ?)?\d{1,4}(( ?[a-zA-Z0-9\-]+)+)?)$/" , $nombre )) {
// 		echo "ok";
// 		return true;
// 	} else {
// 		echo "no vale";
// 		return false;
// 	}
// 	return false;
// }

// function validarCiudadPais($nombre){

// 	if(preg_match ( "/^[A-Za-zÑñ',.\s-]{1,25}$/" , $nombre )) {
// 		echo "ok";
// 		return true;
// 	} else {
// 		echo "no vale";
// 		return false;
// 	}
// 	return false;
// }

// function validarTelefono($nombre){

// 	if (preg_match('/^(\+34|0034|34)?[ -]*(6|7|8|9)[ -]*([0-9][ -]*){8}$/', $nombre)){
// 		echo "ok telefono ";
// 		return true;
// 	} else {
// 		echo "no vale telefono";
// 		return false;
// 	}
// 	return false;
// }

// if ($valido) {
// 	echo "dni correcto";
// 	$_SESSION['dni'] = $dni;

// 	if ($nombreValido) {
// 		echo "nombre correcto  ";
// 		$_SESSION['nombre'] = $nombre;

// 		if ($apellidoValido) {
// 			echo "apellidos correcto  ";
// 			$_SESSION['apellidos'] = $apellidos;

// 			if ($validar_usu) {
// 				echo "usuario valido";
// 				$_SESSION['usu'] = $usu;

// 				if ($validar_pass) {
// 					echo "pass correcto";

// 					if ($validarEmail) {
// 						echo "email correcto  ";
// 						$_SESSION['emial'] = $email;

// 						if ($validar_dir) {
// 							echo "direccion correcta";
// 							$_SESSION['direccion'] = $direccion;

// 							if ($validar_ciudad) {
// 								echo "ciudad correcta";
// 								$_SESSION['ciudad'] = $ciudad;

// 								if ($validar_pais) {
// 									echo "pais correcto";
// 									$_SESSION['pais'] = $pais;

// 									if ($validar_telefono) {
// 										echo "telefono correcto";
// 										$_SESSION['telefono'] = $telefono;

// 										$insertar = "INSERT INTO `registrar_usuarios` (`dni`, `nombre`, `apellidos`, `usuario`, `clave`, `email`, `departamento`, `direccion` ,  `ciudad` , `pais`, `fecha` , `telefono` , `fecha_registro`, `perfil`) VALUES ('$dni', '$nombre','$apellidos','$usuario','$password','$email', '$departamento', '$direccion', '$ciudad', '$pais' , '$fecha', '$telefono', CURRENT_TIMESTAMP, '$perfil')";


// 										$query = mysqli_query($connection, $insertar);
// 									} else {
// 										echo "telefono incorrecto";
// 										$errorT = "telefono incorrecto";
// 										$_SESSION['errorT'] = $errorT;
// 									}

// 								} else {
// 									echo "pais incorrecto";
// 									$errorP = "pais incorrecto";
// 									$_SESSION['errorP'] = $errorP;
// 								}
// 							} else {
// 								echo "ciudad incorrecta";
// 								$errorC = "ciudad incorrecta";
// 								$_SESSION['errorC'] = $errorC;
// 							}

// 						} else {
// 							echo "direccion incorrecta";
// 							$errorD = "direccion incorrecta";
// 							$_SESSION['errorD'] = $errorD;
// 						}
// 					} else {
// 						echo "email incorrecto  ";
// 						$errorE = "email incorrecto  ";
// 						$_SESSION['errorE'] = $errorE;

// 					}

// 				} else {
// 					echo "pass incorrecto";
// 					$errorP ="pass incorrecto";
// 					$_SESSION['errorP'] = $errorP;
// 				}

// 			} else {
// 				echo "usuario no valido";
// 				$errorU = "usuario no valido";
// 				$_SESSION['errorU'] = $errorU;
// 			}


// 		} else {
// 			echo "apellidos incorrecto  ";
// 			$errorAp = "apellidos incorrecto  ";
// 			$_SESSION['errorAp'] = $errorAp;
// 		}

// 	} else {
// 		echo "nombre  incorrecto";
// 		$errorN = "nombre  incorrecto";
// 		$_SESSION['errorN'] = $errorN;
// 	}

// } else {
// 	echo "dni Incorrecto";
// 	$errorDn = "dni Incorrecto";
// 	$_SESSION['errorDn'] = $errorDn;
// }

?>