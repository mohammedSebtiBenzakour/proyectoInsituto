<?php
// include class
require('fpdf/fpdf.php');
require_once('../login con sesiones/conexion.php');

// create document
$pdf = new FPDF();
$pdf->AddPage();

// config document
$pdf->SetTitle('Listado de alumnos de la base de datos');
$pdf->SetAuthor('Mohammed');
$pdf->SetCreator('FPDF Maker');

// add title
$pdf->SetFont('Arial', 'B', 24);
$pdf->Cell(0, 10, 'Listado de alumnos ', 0,1,'C');
$pdf->Ln();


// add image
//$pdf->Image('mifoto.jpg', 180,12,13);



// add text
$pdf->SetFont('Arial', '', 12);
$pdf->MultiCell(0, 7, utf8_decode('Los archivos PDF se utilizan ampliamente en documentos y informes que necesitan mantener el diseño y contenido (imágenes, tipos de letra, colores, etc), por ello vamos a aprender a crear archivos PDF utilizando PHP.'), 0, 1);
$pdf->Ln();
// $pdf->MultiCell(0, 7, utf8_decode('FPDF es una clase PHP que permite la generación de archivos PDF de forma sencilla y sin necesidad de instalar librerías adicionales, cuenta con métodos bien documentados que facilitan su uso.'), 0, 1);
// $pdf->Ln();
// $pdf->MultiCell(0, 7, utf8_decode('Antes de comenzar lo primero es descargar FPDF e incluir los archivos necesarios en nuestro proyecto.'), 0, 1);
// $pdf->Ln();

$consultarA = "select * from registrar_alumnos";
$queryA = mysqli_query($connection, $consultarA);
$arrayA = mysqli_fetch_array($queryA);

$miCabecera = array('Nombre','Primer Apellido', 'Segundo Apellido', 'Telefono' , 'Email');


$pdf->SetFont('Arial','B',10);
        $pdf->SetFillColor(2,157,116);//Fondo verde de celda
        $pdf->SetTextColor(240, 255, 240); //Letra color blanco


        $pdf->Cell(24,7, $miCabecera[0],1, 0 , 'C', true);
        $pdf->Cell(34,7, $miCabecera[1],1, 0 , 'C', true);
        $pdf->Cell(34,7, $miCabecera[2],1, 0 , 'C', true);
        $pdf->Cell(24,7, $miCabecera[3],1, 0 , 'C', true);
        $pdf->Cell(64,7, $miCabecera[4],1, 0 , 'C', true);
        $pdf->Ln();



        $pdf->SetFont('Arial','',10);
        $pdf->SetFillColor(229, 229, 229); //Gris tenue de cada fila
        $pdf->SetTextColor(3, 3, 3); //Color del texto: Negro
        $bandera = false;


        foreach ($queryA as $fila) {

        	
        	$pdf->Cell(24, 7, $fila['nombre_alumno'],  1 , 0 , 'C' , $bandera);
        	$pdf->Cell(34, 7, $fila['primer_apellido_alumno'],  1 , 0 , 'C' , $bandera);
        	$pdf->Cell(34, 7, $fila['segundo_apellido_alumno'],  1 , 0 , 'C' , $bandera);
                $pdf->Cell(24, 7, $fila['telefono_alumno'], 1 , 0 , 'C' , $bandera);
        	$pdf->Cell(64, 7, $fila['email_alumno'],  1 ,0 , 'C' , $bandera);
        	$pdf->Ln();
        	$bandera = !$bandera;
        }




// output file
        $pdf->Output('', 'alumnos.pdf');