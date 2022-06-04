<?php 
// Fichero para desconectar asi como cerrar la sesion del usuario

session_start();

session_destroy();

header("location: loginPorPerfiles.php");
exit();


 ?>