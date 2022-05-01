<?php 
require_once('../login con sesiones/conexion.php');

$consultarA = "select * from registrar_usuarios";
$queryA = mysqli_query($connection, $consultarA);
$arrayA = mysqli_fetch_array($queryA);

header("Content-Type: application/xls");
	header("Content-Disposition: attachment; filename=profesores.xls");
	header("Pragma: no-cache");
	header("Expires: 0");

	
	echo '<table border="1">';
	echo '<tr><th>Nombre</th><th>Apellidos</th><th>Departamento</th><th>Telefono</th><th>Email</th></tr>';

	foreach ($queryA as $fila) {
		echo '<tr><td>' . $fila['nombre'] . '</td>
			  <td>' . $fila['apellidos'] . '</td><td>
			  '. $fila['departamento'] . '</td><td>
			  ' . $fila['telefono'] . '</td><td>
			  ' . $fila['email'] . '</td></tr>';
	}
	echo '</table>';







 ?>