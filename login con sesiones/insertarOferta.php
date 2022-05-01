<?php 


session_start();
require_once('conexion.php');
include('funcionesValidacion.php');
require_once('valorSeguro.php');

$error = "";

$referencia = $_POST['referencia'];
$referencia = valorSeguro($referencia);
$validar_referencia = validarUsuario_password($referencia);

$nombre = $_POST['nombre'];
$nombre = valorSeguro($nombre);
$nombreValido = validarNombreOapellido($nombre);

$empresa = $_POST['empresa'];
$empresa = valorSeguro($empresa);
$validar_empresa = validarUsuario_password($empresa);

$ciudad = $_POST['ciudad'];
$ciudad = valorSeguro($ciudad);
$validar_ciudad = validarCiudadPais($ciudad);

$tipo = $_POST['tipo'];
$tipo = valorSeguro($tipo);
$validar_tipo = validarNombreOapellido($tipo);

$fecha = $_POST['fecha'];

$descripcion = $_POST['descripcion'];
$descripcion = valorSeguro($descripcion);
$validar_descripcion = validarDescripcion($descripcion);

$query = "";
$contador = 0;

if (isset($_POST['registrar'])) {
	if ($validar_referencia) {
		echo "referecnia correcta";
		$_SESSION['referencia'] = $referencia;
		$contador++;
	}else {
		echo "Referencia Incorrecta";
		$errorRef = "Referencia Incorrecta";
		$_SESSION['errorRef'] = $errorRef;
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
	if ($validar_empresa) {
		echo "Empresa correcta ";
		$_SESSION['empresa'] = $empresa;
		$contador++;
	}else {
		echo "Empresa incorrecta  ";
		$errorEmp = "Empresa incorrecta   ";
		$_SESSION['errorEmp'] = $errorEmp;
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

	if ($validar_tipo) {
		echo "tipo correcto  ";
		$_SESSION['tipo'] = $tipo;
		$contador++;
	}else {
		echo "tipo  incorrecto";
		$errorTipo = "Tipo  incorrecto";
		$_SESSION['errorTipo'] = $errorTipo;
	}

		if ($validar_descripcion) {
		echo "Descripcion correcta  ";
		$_SESSION['descripcion'] = $descripcion;
		$contador++;
	}else {
		echo "Descripcion  incorrecta";
		$errorDescripcion = "Descripcion  incorrecta";
		$_SESSION['errorDescripcion'] = $errorDescripcion;
	}

}

if ($contador == 6) {
	$insertar = "INSERT INTO `insertar_oferta` ( `ciudad_oferta`, `descripcion_oferta`, `empresa_oferta`, `fecha_actual`, `fecha_oferta`, `nombre_oferta`, `referencia_oferta`, `tipo_oferta`) VALUES ('$ciudad', '$descripcion', '$empresa', CURRENT_TIMESTAMP ,'$fecha', '$nombre', '$referencia','$tipo')";

$query = mysqli_query($connection, $insertar);
} else {
	// code...
}

// $insertar = "insert into insertar_oferta ('id', 'referencia_oferta', 'nombre_oferta' , 'empresa_oferta' , 'ciudad_oferta' , 'tipo_oferta' , 'fecha_oferta' , 'fecha_actual' 'descripcion_oferta') values(NULL,'$referencia','$nombre','$empresa','$ciudad','$tipo','$fecha', CURRENT_TIMESTAMP ,'$descripcion')";



if ($query) {
	echo "guardado correctamente";

	unset($_SESSION['descripcion']);
	unset($_SESSION['tipo']);
	unset($_SESSION['ciudad']);
	unset($_SESSION['empresa']);
	unset($_SESSION['referencia']);
	unset($_SESSION['nombre']);
	

	// echo "<script> alert('guardado correctamente');
	// location.href = 'formularioInsertarOferta.php';</script>";
	// 
	
		header("Location: formularioInsertarOferta.php?mensaje=ok&respuesta=Oferta Guardada correctamente");

}else{

	echo "no se pudo guardar los datos";
	echo "<br>" . $nombre;
	echo "<br>" . mysqli_error($connection);

	// echo "<script> alert('no se pudo guardar los datos');
	// location.href = 'formularioInsertarOferta.php';</script>";

	header("Location: formularioInsertarOferta.php?mensaje=ok&respuesta=La Oferta no ha sido Guardada");
}


 ?>