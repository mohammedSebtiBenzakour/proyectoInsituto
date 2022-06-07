<?php
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require 'PHPMailer/Exception.php';
require 'PHPMailer/PHPMailer.php';
require 'PHPMailer/SMTP.php';

function comprobarEmail($email){
    return (filter_var($email, FILTER_VALIDATE_EMAIL)) ? 1 : 0;
}

if ($_POST && isset($_FILES['ficheroASubir'])) {
   $to = $_POST['email'];
   $nombre = $_POST['name'];
   $texto = $_POST['message'];
   $movil = $_POST['phone'];

   $texto = "su telefono es : " . $movil . " y el mensaje es : ".$texto;

   $file_tmp_name    = $_FILES['ficheroASubir']['tmp_name'];
   $file_name        = $_FILES['ficheroASubir']['name'];
   $file_size        = $_FILES['ficheroASubir']['size'];
   $file_type        = $_FILES['ficheroASubir']['type'];
   $file_error       = $_FILES['ficheroASubir']['error'];

    // // ver las extensiones

   $fichero_ext = explode('.', $file_name);
   $fichero_ext = strtolower(end($fichero_ext));
   $permitidos= array('txt','pdf','doc','rtf','zip','rar','xml','xls','jpg','sql','png', 'jar', 'war','java','gif','jpeg','css','html','php','js');

// carpeta donde se va enviar el fichero 
   $carpeta = 'ficherosEnviados/';

   $enviarFichero =  $carpeta.basename($_FILES["ficheroASubir"]["name"]);

   if (isset($_POST['enviar'])) {

    if (comprobarEmail($_POST['email'])) {
        

        //comprobar que existe
        if (file_exists($enviarFichero)) {
            echo "<br><br>El fichero ya existe en la carpeta .";

        }else{

            if (in_array($fichero_ext, $permitidos)) {
                if (move_uploaded_file($_FILES['ficheroASubir']["tmp_name"], $enviarFichero)) {
                    echo "El archivo se envio correctamente <br>";
                    // if($file_error>0)
                    // {
                    //     die('upload error');
                    // }

                    // $fichero = fopen($file_name, "r");
                    // $contenido = fread($fichero, $file_size);



                }
            }else{
                echo "la extension del fichero no esta permitida";

            }
        }
    }else{
        echo '<p>El email introducido no es correcto!</p>';

    }
}else{

    echo " error al enviar el fichero";
}





// fclose($fichero);

    //albertortor2000@gmail.com


//Create an instance; passing `true` enables exceptions
$mail = new PHPMailer(true);

try {
    //Server settings
    $mail->SMTPDebug = 0;                      //Enable verbose debug output or 2
    $mail->isSMTP();                                            //Send using SMTP
    $mail->Host       = 'smtp.gmail.com';                     //Set the SMTP server to send through
    $mail->SMTPAuth   = true;                                   //Enable SMTP authentication
    $mail->Username   = 'msb.caixa@gmail.com';                     //SMTP username
    $mail->Password   = 'abxiqabjudlpxcmk';                               //SMTP password
    $mail->SMTPSecure = 'tls';            //Enable implicit TLS encryption
    $mail->Port       = 587;                                    //TCP port to connect to; use 587 if you have set `SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS`

    //Recipients
    $mail->setFrom('msb.caixa@gmail.com', 'mohammed');
    $mail->addAddress($to, 'sebti');     //Add a recipient
    $mail->addAddress('msb.tesla@gmail.com');               //Name is optional
    $mail->addReplyTo('msb.duck@gmail.com', 'Information');
    $mail->addCC('sebti74@gmail.com');
    $mail->addBCC('sebti.benzakour.mohammed@iescamas.es');

    //Attachments
    //  $mail->addAttachment('C:\Users\daw44\Downloads\Tema5.pdf');  
    $mail->addAttachment($enviarFichero);         //Add attachments
    // $mail->addAttachment('/tmp/image.jpg', 'new.jpg');    //Optional name

    //Content
    $mail->isHTML(true);                                  //Set email format to HTML
    $mail->Subject = $nombre;
    $mail->Body    = $texto;
    $mail->AltBody = $movil;

    //  $mail->Subject = 'Here is the subject';
    // $mail->Body    = 'This is the HTML message body <b>in bold!</b>';
    // $mail->AltBody = 'This is the body in plain text for non-HTML mail clients';

    $mail->send();
   // echo 'El Mensage se ha enviado a su destinatario';
    echo '<script> alert("El Mensage se ha enviado a su destinatario");
             location.href="../login con sesiones/paginaMenuAside.php"; </script>';



} catch (Exception $e) {
   // echo "Message could not be sent. Mailer Error: {$mail->ErrorInfo}";
 //   echo $e->getMessage();
    echo '<script> alert("Message could not be sent. ");
            location.href="../login con sesiones/paginaMenuAside.php"; </script>';
}

}
?>

