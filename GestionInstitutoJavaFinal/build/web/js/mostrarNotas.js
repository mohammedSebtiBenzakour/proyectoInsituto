/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */



function mostrarNotas()
{   
    var i = 0;
    var suma = 0;
    var media = 0.0;
    var maketable = '<table class="table table-hover">';
    maketable += '<tr><th>Notas</th></tr>';
    $('#evaluacion').each(function () {
        $(this).find('option').map(function () {
            if ($(this).text() != "Select evaluacion") {
                var dato = parseInt($(this).text());
                suma += dato;
                maketable = maketable + '<tr><td scope="row">' + $(this).text() + '</td></tr>';
                i++;
            }
            console.log("la suma es " + suma);
            console.log("la i es " + i);
            
        });
    });
    media = Math.round((suma/i)*100)/100;
    if (!isNaN(media)) {
         maketable += '<tr><th> La media de todas las notas es : ' + media  + '</th></tr>';
    } else {
        maketable +=  '<tr><th>No hay notas para esta materia</th></tr>';
    }
   
    maketable = maketable + '</table>';
    document.getElementById("tbl1").innerHTML = maketable;
   // alert(maketable);

}