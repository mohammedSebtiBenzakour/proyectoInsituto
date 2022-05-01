<?php 
require_once('../login con sesiones/conexion.php');

$consultarA ="select * from registrar_usuarios";
$queryA = mysqli_query($connection, $consultarA);


$xml = new DOMDocument("1.0");
$xml->formatOutput=true;
$productos=$xml->createElement("PROFESORES");
$xml->appendChild($productos);

foreach ($queryA as $fila) {

	$user=$xml->createElement("PROFESOR");
	$productos->appendChild($user);

	$uid=$xml->createElement("NOMBRE", $fila['nombre']);
	$user->appendChild($uid);

	$uname=$xml->createElement("APELLIDOS", $fila['apellidos']);
	$user->appendChild($uname);

	$precio=$xml->createElement("DEPARTAMENTO", $fila['departamento']);
	$user->appendChild($precio);

	$cantidad=$xml->createElement("TELEFONO", $fila['telefono']);
	$user->appendChild($cantidad);

	$cantidad=$xml->createElement("EMAIL", $fila['email']);
	$user->appendChild($cantidad);

}

echo "<xmp>".$xml->saveXML()."</xmp>";
$xml->save("profesores.xml");



?>


