<?php 

require_once('conexion.php');

$dni = $_POST['dni'];
$nombre = $_POST['nombre'];
$apellidos = $_POST['apellidos'];
$email = $_POST['email'];
$telefono = $_POST['telefono'];
$departamento = $_POST['departamento'];
//Actualizar los datos 
//
$actualizar = "UPDATE personal_no_docente SET nombre = '$nombre', apellidos = '$apellidos', email = '$email' , telefono = '$telefono', departamento = '$departamento' WHERE dni = '$dni'";

$query = mysqli_query($connection, $actualizar);

if ($query) {
			echo "<script> alert('Se han actualizado los cambios correctamente');
			location.href = 'consultarListadoPersonalNoDocente.php';</script>";
		}else{

			echo "no se pudo actualizar los datos";
			echo "<script> alert('no se pudo actualizar los datos');
			location.href = 'modificarPersonalNoDocente.php';</script>";
		}

 ?>