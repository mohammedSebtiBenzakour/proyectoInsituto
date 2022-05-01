<?php 

require_once('conexion.php');

$consultar = "select * from insertar_oferta";
$query = mysqli_query($connection, $consultar);
$array = mysqli_fetch_array($query);



 ?>