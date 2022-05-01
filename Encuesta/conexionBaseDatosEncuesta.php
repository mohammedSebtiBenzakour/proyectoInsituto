<?php 


class DB{

private $host ;
private $usuario ;
private $contraseña ;
private $nombreBaseDatos;
private $charset ;


public function __construct(){

	$this->host = "localhost";
	$this->usuario ="instituto";
	$this->contraseña = "instituto";
	$this->nombreBaseDatos = "instituto";
	$this->charset ="utf8mb4";


}

public function connect(){

	try {
		$conexion = "mysql:host=" . $this->host . ";dbname=" . $this->nombreBaseDatos . ";charset=" . $this->charset;

		$opciones = [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION, PDO::ATTR_EMULATE_PREPARES => false];

		$pdo = new PDO($conexion , $this->usuario , $this->contraseña, $opciones);

		return $pdo;

		
	} catch (Exception $e) {
		echo "<pre>";
		print_r("Error de conexion : " . $e->getMessage());
		echo "</pre>";
	}
}


}


 ?>