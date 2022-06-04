<?php 
// Fichero para la conexion a la base de datos instituto

	 $host = "localhost";
	 $usuario = "instituto";
	 $password = "instituto";
	 $nombreBaseDatos = "instituto";

	 $connection = mysqli_connect($host, $usuario, $password, $nombreBaseDatos);

	 //para comprobar que la conexion se ha hecho correctamente

	 // if ($connection) {
	 // 	echo "conectado correctamente";
	 // }else{
	 // 	echo "no se pudo conectar";
	 // }

 ?>