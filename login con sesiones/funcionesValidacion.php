<?php 

function validDniCifNie($dni){
	$cif = strtoupper($dni);
	for ($i = 0; $i < 9; $i ++){
		$num[$i] = substr($cif, $i, 1);
	}
  // Si no tiene un formato valido devuelve error
	if (!preg_match('/((^[A-Z]{1}[0-9]{7}[A-Z0-9]{1}$|^[T]{1}[A-Z0-9]{8}$)|^[0-9]{8}[A-Z]{1}$)/', $cif)){
		return false;
	}
  // Comprobacion de NIFs estandar
	if (preg_match('/(^[0-9]{8}[A-Z]{1}$)/', $cif)){
		if ($num[8] == substr('TRWAGMYFPDXBNJZSQVHLCKE', substr($cif, 0, 8) % 23, 1)){
			return true;
		}else{
			return false;
		}
	}
  // Algoritmo para comprobacion de codigos tipo CIF
	$suma = $num[2] + $num[4] + $num[6];
	for ($i = 1; $i < 8; $i += 2){
		$suma += (int)substr((2 * $num[$i]),0,1) + (int)substr((2 * $num[$i]), 1, 1);
	}
	$n = 10 - substr($suma, strlen($suma) - 1, 1);
  // Comprobacion de NIFs especiales (se calculan como CIFs o como NIFs)
	if (preg_match('/^[KLM]{1}/', $cif)){
		if ($num[8] == chr(64 + $n) || $num[8] == substr('TRWAGMYFPDXBNJZSQVHLCKE', substr($cif, 1, 8) % 23, 1)){
			return true;
		}else{
			return false;
		}
	}
  // Comprobacion de CIFs
	if (preg_match('/^[ABCDEFGHJNPQRSUVW]{1}/', $cif)){
		if ($num[8] == chr(64 + $n) || $num[8] == substr($n, strlen($n) - 1, 1)){
			return true;
		}else{
			return false;
		}
	}
  // Comprobacion de NIEs
  // T
	if (preg_match('/^[T]{1}/', $cif)){
		if ($num[8] == preg_match('/^[T]{1}[A-Z0-9]{8}$/', $cif)){
			return true;
		}else{
			return false;
		}
	}
  // XYZ
	if (preg_match('/^[XYZ]{1}/', $cif)){
		if ($num[8] == substr('TRWAGMYFPDXBNJZSQVHLCKE', substr(str_replace(array('X','Y','Z'), array('0','1','2'), $cif), 0, 8) % 23, 1)){
			return true;
		}else{
			return false;
		}
	}
  // Si todavía no se ha verificado devuelve error
	return false;
}

function validarNombreApellido($nombre){

	if(!preg_match("/^([A-Za-zÑñ]+[áéíóú]?[A-Za-z]*){3,18}\s+([A-Za-zÑñ]+[áéíóú]?[A-Za-z]*){3,36}$/iu", $nombre)) {
		echo "malo";
		return false;
	} else {
		echo "Okey";
		return true;
	}
	return false;
}

function validarNombreOapellido($nombre){

	if(preg_match ( "/^([A-Za-zÑñ]+[áéíóú]?[A-Za-z]*){3,18}$/" , $nombre )) {
		echo "ok";
		return true;
	} else {
		echo "no vale";
		return false;
	}
	return false;
}

function validarUsuario_password($nombre){

	if (preg_match('/^[A-Za-z][A-Za-z0-9]{5,31}$/', $nombre)){
		echo "ok nombre o pass";
		return true;
	} else {
		echo "no vale nombre o pass";
		return false;
	}
	return false;
}


function validar_email($str)
{
	return (false !== filter_var($str, FILTER_VALIDATE_EMAIL));
}

function validarDireccion($nombre){

	if(preg_match ( "/^[a-zA-Z1-9À-ÖØ-öø-ÿ]+\.?(( |\-)[a-zA-Z1-9À-ÖØ-öø-ÿ]+\.?)* (((#|[nN][oO]\.?) ?)?\d{1,4}(( ?[a-zA-Z0-9\-]+)+)?)$/" , $nombre )) {
		echo "ok";
		return true;
	} else {
		echo "no vale";
		return false;
	}
	return false;
}

function validarCiudadPais($nombre){

	if(preg_match ( "/^[A-Za-zÑñ',.\s-]{1,25}$/" , $nombre )) {
		echo "ok";
		return true;
	} else {
		echo "no vale";
		return false;
	}
	return false;
}

function validarTelefono($nombre){

	if (preg_match('/^(\+34|0034|34)?[ -]*(6|7|8|9)[ -]*([0-9][ -]*){8}$/', $nombre)){
		echo "ok telefono ";
		return true;
	} else {
		echo "no vale telefono";
		return false;
	}
	return false;
}

function validarCodigoPostal($nombre){

	if (preg_match('/^(?:0?[1-9]|[1-4]\d|5[0-2])\d{3}$/', $nombre)){
		echo "ok codigo postal ";
		return true;
	} else {
		echo "no vale el codigo postal";
		return false;
	}
	return false;
}

function validarDescripcion($nombre){


	if(preg_match ( "/^[A-Za-zÑñ',.\s-]{3,600}$/" , $nombre )) {
		echo "ok";
		return true;
	} else {
		echo "no vale";
		return false;
	}
	return false;
}

function validarNombreNoticia($nombre){

	if(preg_match ( "/^([A-Za-zÑñ]+[áéíóú]?[A-Za-z]*){3,55}$/" , $nombre )) {
		echo "ok";
		return true;
	} else {
		echo "no vale";
		return false;
	}
	return false;
}

function validarTextoNoticia($nombre){

	if(preg_match ( "/^[a-zA-Z0-9 àâäèéêëîïôœùûüÿçÀÂÄÈÉÊËÎÏÔŒÙÛÜŸÇ[:punct:]]{3,600}$/" , $nombre )) {
		echo "ok";
		return true;
	} else {
		echo "no vale";
		return false;
	}
	return false;
}

 ?>