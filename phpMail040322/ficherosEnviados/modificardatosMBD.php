<?php  

// $usuarioBD=$_REQUEST["usuarioBD"];//recoger datos de la puntuacion
// $contrasenaBD=$_REQUEST["contrasenaBD"];//recoger datos de la puntuacion

$usuarioBD=$_REQUEST["usuarioBD"];//recoger datos de la puntuacion
$contrasenaBD=$_REQUEST["contrasenaBD"];//recoger datos de la puntuacion
$nombreBD=$_REQUEST["nombreBD"];
$apellidosBD=$_REQUEST["apellidosBD"];//recoger datos de la puntuacion
$fecha_nacimientoBD=$_REQUEST["fecha_nacimientoBD"];//recoger datos de la puntuacion
$sexoBD=$_REQUEST["sexoBD"];
$direccionBD=$_REQUEST["direccionBD"];//recoger datos de la puntuacion
$movilBD=$_REQUEST["movilBD"];//recoger datos de la puntuacion
$emailBD=$_REQUEST["emailBD"];

//echo "El valor del campo puntuacion es $valornumero";

/* UPDATE `alumnos` SET `localidad`="Cox" WHERE idAlumno=2; */

$servername = "localhost";
$database = "usuarios";
/* $database = "ejercicio4"; */
$username = "root";
$password = "";

// Create connection
$conn = new mysqli($servername, $username, $password, $database);
// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

$sql = "UPDATE usuarios SET usuario = '$usuarioBD' , password = '$contrasenaBD' , nombre = '$nombreBD' , apellidos = '$apellidosBD'
          , fecha_nacimiento = '$fecha_nacimientoBD' , sexo = '$sexoBD' , direccion = '$direccionBD' , movil = '$movilBD' , email = '$emailBD' WHERE usuario = '$usuarioBD'";

$result = $conn->query($sql);



if ($result === true ){
  echo "si";

} else {
  //echo "El usuario " . $usuarioBD . " ya existe en la base de datos ";
  echo "no";
}


$conn->close();


?>