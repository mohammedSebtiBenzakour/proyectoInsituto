<?php



function valorSeguro($cadena){

    $cadena =trim($cadena);
    $cadena = stripslashes($cadena);
    $cadena = strip_tags($cadena);
    $cadena = htmlspecialchars($cadena);
    return $cadena;

}

?>