/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function () {
            $.ajax({
                url: "MostrarNotasAlumnos",
                method: "GET",
                headers: {"Accept": "application/json"},
                data: {operation: 'profesor'},
                success: function (data, textStatus, jqXHR) {
//                    console.log(data);
                   // var jStr = JSON.stringify(data);
//                    document.getElementById("mostrarPaises").innerHTML = data;
                    let obj = $.parseJSON(data);
                    $.each(obj, function (key, value) {
                        $('#profesor').append('<option value="' + value.dni + '">' + value.nombre + '</option>')
                    });
                    $('select').formSelect();

                },
                error: function (jqXHR, textStatus, errorThrown) {
                    $('#profesor').append('<option>Profesor Unavailable</option>');
                },
                cache: false
            });




            $('#profesor').change(function () {
                $('#materia').find('option').remove();
                $('#materia').append('<option>Select materia</option>');
                $('#matricula').find('option').remove();
                $('#matricula').append('<option>Select matricula</option>');
                $('#evaluacion').find('option').remove();
                $('#evaluacion').append('<option>Select evaluacion</option>');

                let dni = $('#profesor').val();
//                console.log("El dni es " + dni);
                let data = {
                    operation: "materia",
                    id: dni
                };

              //  var jStr = JSON.stringify(data);
                // document.getElementById("mostrarEstados").innerHTML = jStr;

                $.ajax({
                    url: "MostrarNotasAlumnos",
                    method: "GET",
                    headers: {"Accept": "application/json"},
                    data: data,
                    success: function (data, textStatus, jqXHR) {
//                        console.log(data);
//                        document.getElementById("mostrarEstados").innerHTML = data;
                        let obj = $.parseJSON(data);
                        $.each(obj, function (key, value) {
                            $('#materia').append('<option value="' + value.materia + '">' + value.materia + '</option>')
                        });
                        $('select').formSelect();
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        $('#materia').append('<option>materia Unavailable</option>');
                    },
                    cache: false
                });
            });

            $('#materia').change(function () {
                $('#matricula').find('option').remove();
                $('#matricula').append('<option>Select matricula</option>');
                $('#evaluacion').find('option').remove();
                $('#evaluacion').append('<option>Select evaluacion</option>');

                let sid = $('#materia').val();
                let data = {
                    operation: "matricula",
                    id: sid
                };
              //  var jStr = JSON.stringify(data);
                //  document.getElementById("mostrarCiudades").innerHTML = jStr;

                $.ajax({
                    url: "MostrarNotasAlumnos",
                    method: "GET",
                    headers: {"Accept": "application/json"},
                    data: data,
                    success: function (data, textStatus, jqXHR) {
//                        console.log(data);
//                        document.getElementById("mostrarCiudades").innerHTML = data;
                        let obj = $.parseJSON(data);
                        $.each(obj, function (key, value) {
                            $('#matricula').append('<option value="' + value.nombre_matricula + '">' + value.nombre_matricula + '</option>')
                        });
                        $('select').formSelect();
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        $('#matricula').append('<option>matricula Unavailable</option>');
                    },
                    cache: false
                });
            });
            
                $('#matricula').change(function () {
             
                $('#evaluacion').find('option').remove();
                $('#evaluacion').append('<option>Select evaluacion</option>');

                let sid = $('#matricula').val();
               
                let data = {
                    operation: "evaluacion",
                    id: sid
                };
              //  var jStr = JSON.stringify(data);
                //  document.getElementById("mostrarCiudades").innerHTML = jStr;
                 console.log("el dni es " + sid);
                $.ajax({
                    url: "MostrarNotasAlumnos",
                    method: "GET",
                    headers: {"Accept": "application/json"},
                    data: data,
                    success: function (data, textStatus, jqXHR) {
//                        console.log(data);
//                        document.getElementById("mostrarCiudades").innerHTML = data;
                        let obj = $.parseJSON(data);
                        $.each(obj, function (key, value) {
                            $('#evaluacion').append('<option value="' + value.dni_alumno + '">' + value.nota + '</option>')
                        });
                        $('select').formSelect();
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        $('#evaluacion').append('<option>evaluacion Unavailable</option>');
                    },
                    cache: false
                });
            });

        });
