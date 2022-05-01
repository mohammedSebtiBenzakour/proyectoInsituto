<?php 

include_once('conexionBaseDatosEncuesta.php');

class Encuesta extends DB{

	private $votosTotales;
	private $opcionSeleccionada;

	public function setOpcionSeleccionada($opcion){

		$this->opcionSeleccionada = $opcion;
	}

	public function getOpcionSeleccionada(){

		return $this->opcionSeleccionada;
	}

	public function votar(){

		$consulta = $this->connect()->prepare('update encuesta set votos = votos + 1 where opcion = :opcion');

		$consulta -> execute(['opcion' => $this->opcionSeleccionada]);

	}


	public function mostrarResultados(){

		$sql = 'select * from encuesta';
		return $this->connect()->query($sql);
	}

	public function getVotosTotales(){

		$sqlSuma = 'select sum(votos) as votos_totales from encuesta';

		$sql = $this->connect()->query($sqlSuma);


		$this->votosTotales = $sql->fetch(PDO::FETCH_OBJ)->votos_totales;

		return $this->votosTotales;


	}

	public function getPorcentajeDEVotos($votos){

		return round(($votos / $this->votosTotales)*100, 0);


	}


}


?>