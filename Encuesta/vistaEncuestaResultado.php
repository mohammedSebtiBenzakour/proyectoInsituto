<div class="opcion">

	<?php 
		//el ancho maximo es 100 px
		$anchoBarra = $porcentaje * 8;
		$estilo = "barra";

		if ($encuesta->getOpcionSeleccionada() == $resultado['opcion']) {
			$estilo = "seleccionado";
		}

		echo $resultado['opcion'];

	 ?>


	 	<div class=" <?php echo $estilo; ?>" style="width: <?php echo $anchoBarra . 'px' ?>"> <?php echo $porcentaje . "%" ?></div>
	

</div>