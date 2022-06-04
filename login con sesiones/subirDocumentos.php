<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<?php 
//Fichero para el procesamiento de la subida de cualquier documento al servidor
session_start();
$conn = new PDO('mysql:host=localhost;dbname=instituto','instituto','instituto');
$msg = '';
if (isset($_POST['subir'])) {
	$imagen = $_FILES['imagen']['name'];
	$path = 'imagenes/'.$imagen;

	$sql ="insert into subidadocumento (subida_documento, creado_el) values ('$path', CURRENT_TIMESTAMP)";
	$stmt = $conn->prepare($sql);
	$stmt->execute();

	if ($stmt) {
		move_uploaded_file($_FILES['imagen']['tmp_name'], $path);
		$msg = 'Documento subido correctamente';
		echo $msg;

		$_SESSION['$msg'] = $msg;
				//header('location: subidaDocumentosServido.php');
		echo '<script>  Swal.fire({
			title: "Wow!",
			text: "'. $msg .'",
			type: "success"
			}).then(function() {
				window.location = "subidaDocumentosServido.php";
			});;</script>';
		}else{
			$msg = 'Error al subir la imagen';
			echo $msg;
			$_SESSION['$msg'] = $msg;
				//header('location: subidaDocumentosServido.php');
			echo '<script>  Swal.fire({
			title: "ERROR!",
			text: "'. $msg .'",
			icon: "warning",
			}).then(function() {
				window.location = "subidaDocumentosServido.php";
			});;</script>';
			}


		}





	?>