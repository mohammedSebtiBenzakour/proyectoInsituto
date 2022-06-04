<?php 

// Fichero para procesar la modificacion de los alumnos

require_once('conexion.php');

$dni_alumno = $_POST['dni_alumno'];
$nombre_alumno = $_POST['nombre_alumno'];
$primer_apellido_alumno = $_POST['primer_apellido_alumno'];
$segundo_apellido_alumno = $_POST['segundo_apellido_alumno'];
$email_alumno = $_POST['email_alumno'];
$nivel_alumno = $_POST['nivel_alumno'];
$telefono_alumno = $_POST['telefono_alumno'];

// Recibo los datos de la imagen
$imagen_alumno = $_FILES['imagen_alumno']['name'];
$tipo = $_FILES['imagen_alumno']['type'];
$tamano = $_FILES['imagen_alumno']['size'];

if (!empty($imagen_alumno) && ($_FILES['imagen_alumno']['error'] == 0)) {
	

//Si existe imagen y tiene un tamaño correcto
	if (!empty($imagen_alumno) && ($_FILES['imagen_alumno']['size'] <= 2000000)) 
	{
   //indicamos los formatos que permitimos subir a nuestro servidor
		if (($_FILES["imagen_alumno"]["type"] == "image/gif")
			|| ($_FILES["imagen_alumno"]["type"] == "image/jpeg")
			|| ($_FILES["imagen_alumno"]["type"] == "image/jpg")
			|| ($_FILES["imagen_alumno"]["type"] == "image/png"))
		{
      // Ruta donde se guardarán las imágenes que subamos
			$directorio = '../imagenesAlumnos/';
      // Muevo la imagen desde el directorio temporal a nuestra ruta indicada anteriormente
			move_uploaded_file($_FILES['imagen_alumno']['tmp_name'],$directorio.$imagen_alumno);
		} 
		else 
		{
       //si no cumple con el formato
			echo "No se puede subir una imagen con ese formato ";
		}
	} 
	else 
	{
   //si existe la variable pero se pasa del tamaño permitido
		if($imagen_alumno == !NULL) echo "La imagen es demasiado grande "; 
	}
	$actualizar = "UPDATE registrar_alumnos SET imagen_alumno = '$imagen_alumno',  nombre_alumno = '$nombre_alumno', primer_apellido_alumno = '$primer_apellido_alumno', segundo_apellido_alumno = '$segundo_apellido_alumno',email_alumno = '$email_alumno' , nivel_alumno = '$nivel_alumno', telefono_alumno = '$telefono_alumno' WHERE dni_alumno = '$dni_alumno'";

}else{
	$actualizar = "UPDATE registrar_alumnos SET  nombre_alumno = '$nombre_alumno', primer_apellido_alumno = '$primer_apellido_alumno', segundo_apellido_alumno = '$segundo_apellido_alumno',email_alumno = '$email_alumno' , nivel_alumno = '$nivel_alumno', telefono_alumno = '$telefono_alumno' WHERE dni_alumno = '$dni_alumno'";
}

//Actualizar los datos 
//
// $actualizar = "UPDATE registrar_alumnos SET imagen_alumno = '$imagen_alumno',  nombre_alumno = '$nombre_alumno', primer_apellido_alumno = '$primer_apellido_alumno', segundo_apellido_alumno = '$segundo_apellido_alumno',email_alumno = '$email_alumno' , nivel_alumno = '$nivel_alumno', telefono_alumno = '$telefono_alumno' WHERE dni_alumno = '$dni_alumno'";

$query = mysqli_query($connection, $actualizar);

if ($query) {
	echo "<script> alert('Se han actualizado los cambios correctamente');
	location.href = 'consultarListadoAlumnos.php';</script>";
}else{

	echo "no se pudo actualizar los datos";
	echo "<script> alert('no se pudo actualizar los datos');
	location.href = 'modificarAlumnos.php';</script>";
}

?>