<?php 


session_start();
require_once('conexion.php');

$perfil = $_POST['perfil'];



$insertar = "INSERT INTO `perfiles` ( `perfil`, `creado_el`) VALUES ('$perfil', CURRENT_TIMESTAMP)";


//echo "el perfil " . $fila['perfil'];



	$query = mysqli_query($connection, $insertar);

	if ($query) {
		echo "guardado correctamente";
		echo "<script> alert('Registro Guardado correctamente');
		location.href = 'crearPerfiles.php';</script>";
	}else{

		echo "no se pudo guardar los datos";
		echo "<script> alert('No se pudo guardar los datos o bien el perfil ya existe en la base de datos');
		location.href = 'crearPerfiles.php';</script>";
	}

	










?>