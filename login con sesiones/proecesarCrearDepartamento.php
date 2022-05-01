<?php 


session_start();
require_once('conexion.php');

$departamento = $_POST['departamento'];



$insertar = "INSERT INTO `departamento_instituto` ( `nombre_departamento`, `creado_el`) VALUES ('$departamento', CURRENT_TIMESTAMP)";


//echo "el perfil " . $fila['perfil'];



	$query = mysqli_query($connection, $insertar);

	if ($query) {
		echo "Guardado correctamente";
		echo "<script> alert('Registro Guardado correctamente');
		location.href = 'crearDepartamento.php';</script>";
	}else{

		echo "no se pudo guardar los datos";
		echo "<script> alert('No se pudo guardar los datos o bien el Departamento ya existe en la base de datos');
		location.href = 'crearDepartamento.php';</script>";
	}

	










?>