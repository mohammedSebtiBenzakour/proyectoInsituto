<?php 

//Fichero para la validacion de acceso a los usuarios tanto administrador como otros en la aplicacion

require_once("conexion.php");

session_start();


$usuario = $_POST['usuario'];
$clave = $_POST['clave'];



// $consulta = "select usuario, count(*) as contar from registrar_usuarios where usuario = '$usuario' and clave = '$clave'";

$consulta= "select u.usuario , u.clave,  count(*) as contar from registrar_usuarios u where u.usuario = '$usuario' and u.clave='$clave'";

$query = mysqli_query($connection , $consulta);

$array = mysqli_fetch_array($query);

echo $array['contar'] . " - " . $array['usuario'] ;

if ($array['contar'] > 0) {

		//echo "<h1>acceso denegado</h1>";
		//echo "usuario : " . $usuario .  "  and contraseña " . $clave ;

	if ( $usuario == $array['usuario'] && $clave = $array['clave'] ) {
		//	echo "correcto";
		$_SESSION['usuario'] = $usuario;
		$_SESSION['perfil'] = $perfil;
		// header("location: paginaPrincipal.php");
		header("location: http://localhost:8080/GestionInstitutoJavaFinal/");
	}else{
		$error = "No eres administrador";
		echo "No eres administrador";
		$_SESSION['usuario'] = $usuario;
		$_SESSION['error'] = $error;
		header("location: paginaSegundaria.php");
	}
		//header("location: paginaPrincipal.php");
}else{
		//header("location: PanelDeControl.php");
	$error = "datos incorrectos";
		//echo "usuario : " . $usuario .  "  and contraseña " . $clave ;

	$_SESSION['error'] = $error;

		header("location: loginProfesores.php");
}



?>