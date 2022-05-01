<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="estilo.css"> 
    <title>El ahorcado</title>
</head>

<body>
    <center>
        <?php

        include "valorSeguro.php";

        //creo manualmente el fichero de texto palabras.txt que contiene unas cuantas palabras

        $fichero = "palabras.txt";

        //con la funccion file Transfiero un fichero completo a un array

        $ficheroFile = file($fichero);

        // abro el fichero para su lectura 

        $gestor = fopen($fichero, "r"); 

        // leo el contenido del fichero de una sola vez y lo guardo como si fuera una sola palabra string

        $contenido = fread($gestor, filesize($fichero));

        // elijo al azar una linea del fichero de texto que en este caso es una palabra ya que tengo una palabra por linea

        $palabraExtraida = $ficheroFile[rand(0, count($ficheroFile) - 1)];

        //cierro el fichero 

        fclose($gestor);


        echo "la palabra extraida es " . $palabraExtraida ;

        // compruebo si no esta establecida la variable palabra le doy el valor de la palabra extraida al azar del fichero 

        if (!isset($_POST['palabra'])) {
           $palabra = trim($palabraExtraida);
       }

       ?>
       <div>
        <h1>El ahorcado</h1>

        <form action="Elahorcado2.php" name="formulario" method="POST" enctype="multipart/form-data">
            <br><br>

            <label>Introduce tu nombre para jugar:</label> <input type="text" name="nombre" value="" required  title="Introduce tu nombre para jugar"  class="nombre" ><br><br>

            <!-- utilizo este input de manera escondida para poder pasar la palabra de un fichero a otro conservandola -->

            <input type="hidden" name="palabra" value=" <?php echo $palabra ?> "><br><br>
            <input type="hidden" name="palabraConBarras" value="">
            <input type="hidden" name="intentos" value="">
            <input type="reset" value="Borrar" class="borrar">
            <input type="submit" value="Empezar a jugar" name="enviar">
        </form>


        <br><br>
        <p class="a">
            <a href="index1.php" class="volver1">Volver</a>
        </p>
    </div>


</center>
<?php 

include("footer.php");


?>
</body>

</html>