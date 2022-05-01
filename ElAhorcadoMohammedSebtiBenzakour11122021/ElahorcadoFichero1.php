<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="estilo.css"> 
    <title>El ahorcado </title>
</head>

<body>
    <center>
       <h1>El ahorcado</h1>
       <?php
       session_start();


       include "valorSeguro.php";

        // echo var_dump($_POST);
//---------------------------------------------------------------------------

//una funccion por si quiero mostrar el fichero con colores

       function mostrarFichero($nombreFichero){
        $fichero = fopen($nombreFichero, "r"); 
        while (!feof($fichero)) {
            $n1 = rand(0,255);
            $n2 = rand(0,255);
            $n3 = rand(0,255);

            $linea = fgets($fichero);

            if (mb_substr(trim($linea) , -1) != "\n") {
                echo  "<span style='color:rgb(" . $n1 ."," . $n2 . "," . $n3 . ")'>" .$linea . "</span><br>";
            }
        }
        fclose($fichero);
    }

//--------------------------------------------------------------------------

//compruebo que el fichero se ha enviado o subido

    if (isset($_FILES['fichero'])){

        $ficheroE = $_FILES['fichero'];
            // echo "<pre>";
            // print_r($ficheroE);
            // echo "<pre>";

            // echo "<br>";

//propiedades del fichero enviado

        $nombre_fichero = $ficheroE['name'];
        $fichero_tmp =$ficheroE['tmp_name'];
        $fichero_size = $ficheroE['size'];
        $fichero_error = $ficheroE['error'];

// // ver las extensiones del fichero subido

        $fichero_ext = explode('.', $nombre_fichero);
        $fichero_ext = strtolower(end($fichero_ext));

        $permitidos= array('txt');

// carpeta donde se va enviar el fichero subido en este caso es la carpeta principal
        $carpeta = '';
        $enviado = 1;
        $enviarFichero =  $carpeta.basename($_FILES["fichero"]["name"]);

        if (isset($_POST['enviar'])) {

        //comprobar que existe el fichero 

            if (file_exists($enviarFichero)) {
                echo "<br><h4>El fichero ya existe en la carpeta </h4><br>";
                $enviado = 0;
            }else{
// si la extension del fichero es correcta se procede a su envio

                if (in_array($fichero_ext, $permitidos)) {
                    if (move_uploaded_file($_FILES['fichero']["tmp_name"], $enviarFichero)) {
                        echo "El archivo se envio correctamente <br>";
                            // mostrarFichero($nombre_fichero);

                        $enviado = 1;
                    }
                }else{
                    echo "<h4>La extension del fichero no esta permitida  </h4><br>";
                }
            }
        }else{
            echo " Error al enviar el fichero <br>";
        }

        //con la funccion file Transfiero un fichero completo a un array

        if (empty($nombre_fichero)) {
            echo "<h4>Debes seleccionar algun fichero de texto , pulsa aqui para volver a empezar </h4>";
            echo '<a href="enviarFichero.php" class="volver1">Volver a empezar</a>';
        }else{

         $ficheroFile = file($nombre_fichero);

        // abro el fichero para su lectura 

         $gestor = fopen($nombre_fichero, "r"); 

        // leo el contenido del fichero de una sola vez y lo guardo como si fuera una sola palabra string

         $contenido = fread($gestor, filesize($nombre_fichero));

        // elijo al azar una linea del fichero de texto que en este caso es una palabra ya que tengo una palabra por linea

         $palabraExtraida = $ficheroFile[rand(0, count($ficheroFile) - 1)];

        //cierro el fichero 

         fclose($gestor);

         echo "La palabra extraida es " . $palabraExtraida ;

            // guardo la palabra extraida en la session para recuperarla en el siguiente fichero

         $_SESSION["palabraExtraida"] = $palabraExtraida ;


        // compruebo si no esta establecida la variable palabra le doy el valor de la palabra extraida al azar del fichero 

         if (!isset($_POST['palabra'])) {
            $_SESSION["palabra"] = $palabra;
            $palabra = trim($_SESSION["palabraExtraida"]);
        }
    }
}
?>
<div>

    <form action="ElahorcadoFichero2.php" name="formulario" method="POST" enctype="multipart/form-data">
        <br>

        <label>Introduce tu nombre para jugar:</label> <input type="text" name="nombre" value="" required  size="30" class="nombre"><br>


        <!-- utilizo este input de manera escondida para poder pasar la palabra de un fichero a otro conservandola -->

        <input type="hidden" name="palabra" value=" <?php echo $_SESSION["palabraExtraida"]; ?> ">
        <input type="hidden" name="palabraConBarras" value="">
        <input type="hidden" name="intentos" value="">
        <input type="reset" value="Borrar" class="borrar">
        <input type="submit" value="Empezar a jugar" name="enviar">
    </form>
    
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