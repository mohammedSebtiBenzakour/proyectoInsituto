<?php 

require_once('conexion.php');

$consultar = "select * from registrar_usuarios";
$query = mysqli_query($connection, $consultar);
$array = mysqli_fetch_array($query);



 ?>