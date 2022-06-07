<?php
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require 'PHPMailer/Exception.php';
require 'PHPMailer/PHPMailer.php';
require 'PHPMailer/SMTP.php';

function comprobarEmail($email){
    return (filter_var($email, FILTER_VALIDATE_EMAIL)) ? 1 : 0;
}

if ($_POST) {
   $email = $_POST['email'];
   $name = $_POST['name'];
   $message = $_POST['message'];
  

   if (isset($_POST['enviar'])) {

    if (comprobarEmail($_POST['email'])) {
        

      
    }else{
     //   echo '<p>El email introducido no es correcto!</p>';

    }
}else{

 //   echo " error al enviar el fichero";
}





// fclose($fichero);

    //albertortor2000@gmail.com


//Create an instance; passing `true` enables exceptions
$mail = new PHPMailer(true);

try {
    //Server settings
    $mail->SMTPDebug = 0;                      //Enable verbose debug output
    $mail->isSMTP();                                            //Send using SMTP
    $mail->Host       = 'smtp.gmail.com';                     //Set the SMTP server to send through
    $mail->SMTPAuth   = true;                                   //Enable SMTP authentication
    $mail->Username   = 'msb.caixa@gmail.com';                     //SMTP username
    $mail->Password   = 'abxiqabjudlpxcmk';                               //SMTP password
    $mail->SMTPSecure = 'tls';            //Enable implicit TLS encryption
    $mail->Port       = 587;                                    //TCP port to connect to; use 587 if you have set `SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS`

    //Recipients
    $mail->setFrom('msb.caixa@gmail.com', 'mohammed');
    $mail->addAddress($email, 'sebti');     //Add a recipient
    $mail->addAddress('msb.tesla@gmail.com');               //Name is optional
    $mail->addReplyTo('msb.duck@gmail.com', 'Information');
    $mail->addCC('sebti74@gmail.com');
    $mail->addBCC('sebti.benzakour.mohammed@iescamas.es');

    //Attachments
    //  $mail->addAttachment('C:\Users\daw44\Downloads\Tema5.pdf');  
   // $mail->addAttachment($enviarFichero);         //Add attachments
    // $mail->addAttachment('/tmp/image.jpg', 'new.jpg');    //Optional name

    //Content
    $mail->isHTML(true);                                  //Set email format to HTML
    $mail->Subject = $name;
    $mail->Body    = $message;
    $mail->AltBody = $message;

    //  $mail->Subject = 'Here is the subject';
    // $mail->Body    = 'This is the HTML message body <b>in bold!</b>';
    // $mail->AltBody = 'This is the body in plain text for non-HTML mail clients';

    $mail->send();
  //  echo 'El Mensage se ha enviado a su destinatario';
    echo '<script> alert("El Mensage se ha enviado a su destinatario");
             location.href="../login%20con%20sesiones/indexNuevo.php"; </script>';



} catch (Exception $e) {
  //  echo "Message could not be sent. Mailer Error: {$mail->ErrorInfo}";
     echo '<script> alert("Error al enviar el mensaje por favor revisa los datos Gracias");
             location.href="../login%20con%20sesiones/indexNuevo.php"; </script>';
}

}
?>

