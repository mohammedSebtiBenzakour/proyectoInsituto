<?php 
//Fichero que no se utiliza por el momento

session_start();
require_once('conexion.php');

$nombre = $_POST['nombre'];
$apellido = $_POST['apellido'];
$email = $_POST['email'];

$insertar = "insert into clientes values('$nombre','$apellido','$email')";

$query = mysqli_query($connection, $insertar);

if ($query) {
	echo "<script> alert('guardado correctamente');
	location.href = 'formularioInsertar.php';</script>";
}else{

	echo "no se pudo guardar los datos";
	echo "<script> alert('no se pudo guardar los datos');
	location.href = 'formularioInsertar.php';</script>";
}


 ?>