<?php 
session_start();

require_once('conexion.php');

if (!isset($_SESSION['email'])) {
	//header("location: EjercicioClaseBootstrap.php");
	$email = "";
}else{
	$email = $_SESSION['email'] ;
	//echo "<h1>Bienvenido : $email </h1>";
	
// echo "<h2></h2>";
}

$id = $_GET['id'];

// if ($email == 'a') {
	
$eliminar = "DELETE FROM personal_no_docente WHERE dni = '$id'";

$query = mysqli_query($connection, $eliminar);

if ($query) {
			 echo "<script> alert('ERES EL ADMINISTRADOR : Se ha eliminado el registro correctamente');
			 location.href = 'consultarListadoPersonalNoDocente.php';</script>";
		}else{

			echo "no se pudo eliminar el registro de la base de datos";
			 echo "<script> alert('no se pudo actualizar los datos');
			 location.href = 'consultarListadoPersonalNoDocente.php';</script>";
		}

	// }else{
	// 	echo "<script> alert('NO ERES EL ADMINISTRADOR Y No tienes permisos para eliminar los registros de la base de datos');
	// 		location.href = 'paginaAdministrarCurso.php';</script>";

	// }

 ?>