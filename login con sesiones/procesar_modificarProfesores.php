<?php 

//Fichero para el procesamiento de la modificacion de los usuarios profesores

require_once('conexion.php');

$dni = $_POST['dni'];
$nombre = $_POST['nombre'];
$apellidos = $_POST['apellidos'];
$usuario = $_POST['usuario'];
$clave = $_POST['clave'];
$email = $_POST['email'];
$departamento = $_POST['departamento'];
$ciudad = $_POST['ciudad'];
$pais = $_POST['pais'];
$direccion = $_POST['direccion'];
$fecha = $_POST['fecha'];
$telefono = $_POST['telefono'];

//Actualizar los datos 

$actualizar = "UPDATE registrar_usuarios SET  nombre = '$nombre', apellidos = '$apellidos', usuario = '$usuario',clave = '$clave' , email = '$email',departamento = '$departamento' ,  ciudad = '$ciudad' , pais = '$pais' , direccion = '$direccion' , fecha = '$fecha' , telefono = '$telefono' WHERE dni = '$dni'";


$query = mysqli_query($connection, $actualizar);

if ($query) {
	echo "<script> alert('Se han actualizado los cambios correctamente');
	location.href = 'consultar.php';</script>";
}else{

	echo "no se pudo actualizar los datos";
	echo "<script> alert('no se pudo actualizar los datos');
	location.href = 'modificarProfesores.php';</script>";
}

?>