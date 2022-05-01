<?php 
require_once('../login con sesiones/conexion.php');

$consultarA ="select * from registrar_alumnos";
$queryA = mysqli_query($connection, $consultarA);


$xml = new DOMDocument("1.0");
$xml->formatOutput=true;
$productos=$xml->createElement("ALUMNOS");
$xml->appendChild($productos);

foreach ($queryA as $fila) {

	$user=$xml->createElement("ALUMNO");
	$productos->appendChild($user);

	$uid=$xml->createElement("NOMBRE", $fila['nombre_alumno']);
	$user->appendChild($uid);

	$uname=$xml->createElement("PRIMER_APELLIDO", $fila['primer_apellido_alumno']);
	$user->appendChild($uname);

	$precio=$xml->createElement("SEGUNDO_APELLIDO", $fila['segundo_apellido_alumno']);
	$user->appendChild($precio);

	$cantidad=$xml->createElement("TELEFONO", $fila['telefono_alumno']);
	$user->appendChild($cantidad);

	$cantidad=$xml->createElement("EMAIL", $fila['email_alumno']);
	$user->appendChild($cantidad);

}

echo "<xmp>".$xml->saveXML()."</xmp>";
$xml->save("alumnos.xml");



?>


