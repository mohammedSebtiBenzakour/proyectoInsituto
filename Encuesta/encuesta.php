<?php 

include_once('ClaseEncuesta.php');

?>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet" type="text/css"/>
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="estiloEncuesta.css">
	<link rel="stylesheet" type="text/css" href="estiloEncuestaResto.css">
	<title>Encuesta</title>
</head>
<body>
	<center>
		<section class="container mb-4">
			<h1 class="h1 display-4  bg-warning mt-2 w-50 rounded-top position-relative shadow-lg p-3  rounded" >Encuesta <span class="position-absolute top-0 start-100 translate-middle p-2 bg-success border border-light rounded-circle">
    <span class="visually-hidden">New alerts</span>
  </span></h1>
			<h3 class="btn btn-primary rounded-top mt-2  shadow-lg p-3  rounded">Votar al mejor lenguaje de programación</h3>
			<form action="" method="post">
				<?php 

				$encuesta = new Encuesta();

				$mostrarResultados = false;

				if (isset($_POST['exampleRadios'])) {
					$mostrarResultados = true;
					$encuesta->setOpcionSeleccionada($_POST['exampleRadios']);
					$encuesta->votar();

				}

			//echo "<h3> votos totales : " . $encuesta->getVotosTotales() . "</h3>";
			// echo "<h3> porcentaje votos : " . $encuesta->getPorcentajeDEVotos($encuesta->getOpcionSeleccionada()) . "</h3>";

				?>


				<?php 

				if ($mostrarResultados) {
					$resultados = $encuesta->mostrarResultados();
					echo "<h3 class='encuesta'> votos totales : " . $encuesta->getVotosTotales() . "</h3>";

					foreach ($resultados as $resultado) {
						$porcentaje = $encuesta->getPorcentajeDEVotos($resultado['votos']);

						include('vistaEncuestaResultado.php');

					}
				}else{
					include('vistaEncuestaResultadoVotacion.php');

				}

				?>

			</form>

			<?php 
//para ver que se conect bien y sin problemas
			$db = new DB();
			$db->connect();

			?>
			<a href="../index.php" class="btn btn-danger rounded-pill mt-2" >Volver</a>
			<a href="encuesta.php" class="btn btn-warning rounded-pill mt-2" >Volver a votar</a>
		</section>
	</center>
	<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript" src="../js/bootstrap-select.min.js"></script>
	<script type="text/javascript" src="../js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript" src=""></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.5.4/bootstrap-select.js"></script>
</body>
</html>