<?php 
require_once('../login con sesiones/conexion.php');

$consultarA = "select * from registrar_alumnos";
$queryA = mysqli_query($connection, $consultarA);
$arrayA = mysqli_fetch_array($queryA);

header("Content-Type: application/xls");
	header("Content-Disposition: attachment; filename=alumnos.xls");
	header("Pragma: no-cache");
	header("Expires: 0");

	
	echo '<table border="1">';
	echo '<tr><th>Nombre</th><th>Primer Apellido</th><th>Segundo Apellido</th><th>Telefono</th><th>Email</th></tr>';

	foreach ($queryA as $fila) {
		echo '<tr><td>' . $fila['nombre_alumno'] . '</td>
			  <td>' . $fila['primer_apellido_alumno'] . '</td><td>
			  '. $fila['segundo_apellido_alumno'] . '</td><td>
			  ' . $fila['telefono_alumno'] . '</td><td>
			  ' . $fila['email_alumno'] . '</td></tr>';
	}
	echo '</table>';







 ?>