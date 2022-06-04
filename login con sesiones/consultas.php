<?php 
// Fichero para la consulta del listado de usuarios profesores
require_once('conexion.php');

$consultar = "select * from registrar_usuarios";
$query = mysqli_query($connection, $consultar);
$array = mysqli_fetch_array($query);



 ?>