<?php 

//Fichero que permite logearse desde la ventana principal de la aplicación

require_once("conexion.php");

session_start();

$perfil = $_POST['perfil'];

$clave = $_POST['clave'];

if (!isset($_POST['usuario'])) {
	$usuario = "";
} else {
	$usuario = $_POST['usuario'];
}


	// echo $_POST['usuario'] . "<br>";
	// echo $_POST['clave'] . "<br>" ;

// $consulta = "select usuario, count(*) as contar from registrar_usuarios where usuario = '$usuario' and clave = '$clave'";

$consulta= "select u.usuario , u.clave, u.perfil, count(*) as contar from registrar_usuarios u INNER join perfiles p on u.perfil = '$perfil' where u.usuario = '$usuario' and u.clave='$clave'";

$query = mysqli_query($connection , $consulta);

$array = mysqli_fetch_array($query);


$consultaP= "select u.usuario , u.clave, u.perfil, count(*) as contar from personal_no_docente u INNER join perfiles p on u.perfil = '$perfil' where u.usuario = '$usuario' and u.clave='$clave'";

$queryP = mysqli_query($connection , $consultaP);

$arrayP = mysqli_fetch_array($queryP);


// echo $array['contar'] . " - " . $array['usuario'] . " - " . $array["perfil"];

if ($array['contar'] > 0) {

		//echo "<h1>acceso denegado</h1>";
		//echo "usuario : " . $usuario .  "  and contraseña " . $clave ;

	if ($perfil == $array['perfil'] && $usuario == $array['usuario'] && $clave = $array['clave'] && ($perfil == 'administrador' || $perfil == 'jefatura' || $perfil == 'profesor') ) {
		//	echo "correcto";
		$_SESSION['usuario'] = $array['usuario'];
		$_SESSION['perfil'] = $perfil;
		$_SESSION['clave'] = $array['clave'];

		// header("location: paginaPrincipal.php");
		header("location: paginaMenuAside.php");
	}	else{

		$error = "No eres administrador";
		echo "No eres administrador";
		$_SESSION['usuario'] = $usuario;
		$_SESSION['perfil'] = $perfil;
		$_SESSION['error'] = $error;
		header("location: paginaSegundaria.php");
	}
		//header("location: paginaPrincipal.php");
}else{

	if ( $perfil == 'estudiante' ) {
		
		header("location: vistaEstudiantes.php");
	} else {
		if($perfil == $arrayP['perfil'] && $usuario == $arrayP['usuario'] && $clave = $arrayP['clave'] && $perfil == 'personal_no_docente'){

			$_SESSION['usuario'] = $usuario;
			$_SESSION['perfil'] = $perfil;
			
			header("location: vistaPersonalNoDocente.php");
		}else{
			
			$error = "datos incorrectos";

			$_SESSION['error'] = $error;

			header("location: loginPorPerfiles.php");
		}
	}
}



?>