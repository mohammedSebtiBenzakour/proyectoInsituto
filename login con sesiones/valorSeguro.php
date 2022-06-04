<?php

//Fichero para evitar la insercion de codigo malicioso dentro los inputs 

function valorSeguro($cadena){

    $cadena =trim($cadena);
    $cadena = stripslashes($cadena);
    $cadena = strip_tags($cadena);
    $cadena = htmlspecialchars($cadena);
    return $cadena;

}

?>