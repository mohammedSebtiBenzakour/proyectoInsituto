    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="estilo.css"> 
        <title>El ahorcado</title>
    </head>

    <body>
        <center>
         <h1>El ahorcado</h1>
         <?php

         session_start();

         include "valorSeguro.php";

        // guardo la variable palabra recogida al enviar desde Elahorcado1.php para conservarla 
         
         if (isset($_SESSION["palabraExtraida"])) {
             // echo "la pal extra : " .  $_SESSION["palabraExtraida"] . "<br>";

             $palabra = $_SESSION["palabraExtraida"];

         }else{

            $palabra = "";
            header("location: enviarFichero.php");
        }

        

        //guardo la variable nombre recogida al enviar desde Elahorcado1.php 

        $nombre = $_POST["nombre"];

         $_SESSION["nombre"] = $nombre;

        //compruebo que el nombre introducido cumple el pattern establecido

        $pattern = "/^[a-z]+$/i";
        $resNombre =  preg_match($pattern, $nombre);

        if ($resNombre == 1) {
           // echo "El nombre es correcto y cumple el pattern <br>";
        }else{
            echo "El nombre : " . $nombre . "  no cumple el pattern <br>";
            header("location: errorFichero.php");                }

        //guardo la variable palabraConBarras recogida al enviar desde Elahorcado2.php para conservarla 

            $palabraConBarras = $_POST["palabraConBarras"];

         //guardo la variable intentos recogida al enviar desde Elahorcado2.php para conservarla 

            $intentos = $_POST['intentos'];

        //paso la palabra palabra por el filtro de caracteres raros por si acaso

            $palabra = valorSeguro($palabra);

        //paso la palabra palabraConBarras por el filtro de caracteres raros por si acaso

            $palabraConBarras = valorSeguro($palabraConBarras);

        // si la variable intentos esta vacia le doy un valor inicial 

            if (empty($_POST['intentos'])) {
                $intentos = 0;
            }

        // si la variable palabraConBarras esta vacia le doy un valor inicial rellenandola con linea sustituendo la letra de la palabra a adivinar.

            if (empty($_POST["palabraConBarras"])) {
             for ($i = 0; $i < strlen($palabra); $i++) {
                $palabraConBarras .= "_";
            }
        } 

        echo " <p class='nom'>Tu nombre es : " . $nombre . "</p>";
    //    echo " <br> la palabra a adivinar  al azar es : " . $palabra . " ";

    // le doy una pista al usuario para jugar dandole la longitud de la palabra a adivinar

        // echo "<br> Una simple pista para jugar la palabra es de " . strlen($palabra) . " letras.";

        // echo " <br>  palabra con barras es : " . $palabraConBarras . " ";
        // echo " <br>  los intentos son  : " . $intentos . " ";


        $correcto = false ;
        $longitud = strlen($palabra);

    // creo los caracteres permitidos

        $permitidos = " -abcdefghijklmnopqrstuvwxyz";
        $longi = 0;

    //compruebo que si o no se he insertado la letra para el juego

        if (!isset($_POST["letra"])) {
            $_POST["letra"] = "";
        } else {
            $letra = $_POST["letra"];

        // compruebo que no se introduzca caracteres no permitidos

            for ($i=0; $i < $longitud; $i++) { 
               if (stripos($permitidos, substr($palabra, $i , 1)) == false) {
                  echo "La palabra no puede contener TILDES, NUMEROS o Caracteres Especiales";
              }
          }

      //compruebo si la letra introducida cuencide con alguna letra de la palabra y la pongo en la palabra con barras con la letra que se puede ver y el resto sin adivinar con lineas.

          for ($i = 0; $i < strlen($palabra); $i++) {
            if ($palabra[$i] == $letra) {
                $palabraConBarras[$i] = $letra;
                $correcto = true;
            }

        }

        echo " <br><p class='barraLetra'>  Palabra con barras y con la letra es : " . $palabraConBarras . " </p>";
    // echo "<br>";
    // echo " los intentos son :" . $intentos;  
    // echo "<br>";
    // echo "<br>";

    // compruebo que si la letra introducida no existe en la palabra y al mismo tiempo cuento los intentos fallidos

        if ($correcto == false) {
            echo "<span class='no'> La letra : ' " . $letra . " ' no existe en la palabra a adivinar </span>";
            $intentos++;

        }

        echo "<br>";

    // compruebo que la palabra con barras una vez adivinadas todas las letras si es igual que la palabra original (a adivinar) 

        for ($i=0; $i < $longitud ; $i++) { 
           if ($palabra[$i] == $palabraConBarras[$i]) {
               $longi++;
           }
       }

   //compruebo que los intentos fallidos son iguales a 6 antes de terminar de adivinar la palabra

       if ($intentos == 6) {

        echo '<br>';
    // echo '<br>';
        echo "<p class='perdido'> Has perdido . vuelva a jugar de nuevo si quieres . <p>";
    // echo '<br>';
        echo " <p class='perdido'>La palabra secreta era : " . $palabra . "<p>";
    // echo '<br>';
        echo "<a href='index1.php' class='volver1'>Vuelva a jugar</a>";

    }else{
 // echo '<p align="center">Lleva ' . $intentos . '  intentos fallidos</p>';
    }
}
?>
<div>

    <form action="<?= $_SERVER["PHP_SELF"]; ?>" name="formulario" method="POST" enctype="multipart/form-data">

        <?php
        // comrpuebo que la la longitud de la palabra a adivinar es igual que las veces que es todo correcto durante la introduccion de las letras correctas
        if ($longi == $longitud) {
          echo "<br>";
          echo " <h3>Has ganado . vuelva a jugar de nuevo si quieres .</h3> ";
          echo '<p class="volver1">
          <a href="index1.php">Volver a jugar</a></p>';
          
      }else{

        //solo muestro los intentos fallidos
        
       if ($intentos != 0) {
        echo '<p align="center" class="intento">Llevas ' . $intentos . '  intentos fallidos</p>';
    }

    ?>

    <input type="hidden" name="nombre" value="<?php echo $_POST["nombre"]; ?>">
    <input type="hidden" name="palabra" value="<?php echo $_POST["palabra"]; ?>">
    <input type="hidden" name="palabraConBarras" value="<?php echo $palabraConBarras; ?>">
    <input type="hidden" name="intentos" value="<?php echo $intentos; ?>">
    <?php 

        //compruebo si los intentos son diferentes de 6 para poder mostrar o no la opcion de volver a jugar

    if ($intentos != 6) {

     echo ' <span class="let1"><label for="letra">Introduce una letra:</label> <input type="text" name="letra" value="" class="letra" id="letra" placeholder="Solo estan permitidas letras sin accento" title="Solo estan permitidas letras sin accento" required pattern="[A-Za-z]{1}"></span><br><br>';

     ?>
     <input type="reset" value="Borrar" class="borrar">
     <input type="submit" value="Enviar letra" name="enviar">
 </form>

 <br><!-- <br> -->
 <p class="a">
    <a href="index1.php" class="volver1">Volver a jugar</a>
</p>

<?php
}
}
?>

<!-- <br><br>
<p class="a">
    <a href="index1.php">Volver a jugar</a>
</p> -->
</div>
</center>
<?php 

include("footer.php");

?>
</body>

</html>