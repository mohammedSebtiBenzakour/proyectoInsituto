<?php 

//Fichero para procesar la creacion de nivel en el instituto

session_start();
require_once('conexion.php');

$nombre_nivel = $_POST['nombre_nivel'];



$insertar = "INSERT INTO `nivel_instituto` ( `nombre_nivel`, `creado_el`) VALUES ('$nombre_nivel', CURRENT_TIMESTAMP)";


//echo "el perfil " . $fila['perfil'];



	$query = mysqli_query($connection, $insertar);

	if ($query) {
		echo "guardado correctamente";
		echo "<script> alert('Registro Guardado correctamente');
		location.href = 'crearNivelInstituto.php';</script>";
	}else{

		echo "no se pudo guardar los datos";
		echo mysqli_error($connection);
		echo "<script> alert('No se pudo guardar los datos o bien el nivel educativo ya existe en la base de datos');
		location.href = 'crearNivelInstituto.php';</script>";
	}

	










?>