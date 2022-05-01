
// document.write("<center>");

//  window.onload=iniciar;

// function iniciar(){

//     document.getElementById("boton").addEventListener('click', 
//         validar, false);
// }

// function validar(e){


var tabla =new Array();

var tablaColor =new Array();

var palabras = [];
var palabrasInsertadas = [];
var palabrasNoInsertadas = [];


//  todos el abecedario menos ñ

var alfabeto = String.fromCharCode(...Array(123).keys()).slice(97);

console.log("el alfabeto es " + alfabeto);

alfabeto = alfabeto.toUpperCase();

var vacio = true;
var comprobar = false;
var verificar = false;
var noCabe = true;
var direccion = "";
var palabra = "";
var TextoDireccion = "Elige una opcion para la direccion donde quieres insertar la palabra \n"+
"- 1 : Derecha \n" + 
"- 2 : Izquierda  \n" + 
"- 3 : Abajo \n" + 
"- 4 : Arriba  \n" + 
"- 5 : Derecha abajo \n" + 
"- 6 : Derecha arriba \n" +
"- 7 : Izquierda abajo \n" +  
"- 8 : Izquierda arriba \n";

var palabras = ['Derecha','Izquierda','Abajo','Arriba','Derecha abajo','Derecha arriba','Izquierda abajo','Izquierda arriba'];

    //se comprueba que se debe introducir una fila de la tabla 

    while (confirm("Bienvenido al Juego de sopa de letras. \nSi deseas jugar tienes que indicar cuantas filas tendra la tabla de la sopa de letras : ")) {
       var filas = prompt("Introduce  las filas de la tabla : \nRecordatorio: solo estan permitidos valores numericos superiores a cero");
       if (filas == null || filas == "" || filas == 0  || filas < 0 || isNaN(filas)) {

        console.log(filas);
        alert("El dato '" + filas + "' introducido no es un numero superior a cero. \nDebes introducir un numero para la fila");


         } else{
        filas = parseInt(filas);
        break;

    }


}
     //se comprueba que se debe introducir una columna de la tabla 

     while (confirm("Y ahora tienes que  indicar cuantas columnas tendra la tabla de la sopa de letras: ")) {
       var columnas = prompt("Introduce las columnas de la tabla : \nRecordatorio: solo estan permitidos valores numericos superiores a cero ");
       if (columnas == null || columnas == "" || columnas == 0 || columnas < 0 || isNaN(columnas)) {
            console.log(columnas);
            alert("El dato '" + columnas + "'  introducido no es un numero superior a cero. \nDebes introducir un numero para la columna");
       } else{
            columnas = parseInt(columnas);
            break;

    }

}

ponerTabla();

console.log("poner tabla  " + tabla);


while (confirm("¿ Deseas introducir una palabra en la tabla  ? : ") || noCabe ) {
  palabra = prompt("Introduce una palabra en la tabla : ");

  var noValido = /\s/;

  //compruebo que la palabra no esta vacia ni nula
  //Compruebo que la palabra no tenga espacio en blanco por ningun lado con noValido
  
  if (palabra == '' || palabra == null || noValido.test(palabra)) {

     console.log("la palabra es " + palabra);

    alert("Debes introducir una palabra diferente de :  ' " + palabra + " ' ");
    verificar = true;

   console.log("el vacio es " + vacio);
   

} else{
        palabra = palabra.trim();
        palabra = palabra.toUpperCase();

        console.log("la palabra es " + palabra);

    // Pedir la direccion 

    while (confirm("Ahora tienes que eligir un numero entre ' 1 y 8 ' para posicionar la palabra en la tabla : \nPulsa aceptar para ver las opciones : ")) {
      direccion = prompt(TextoDireccion).trim();
    //Comprobar que la direccion no es ni nula ni vacia ni igual y que este entre el rango 1 y 8

      if (direccion == null || direccion === "" || direccion == "0" || direccion > 8 || direccion < 0 ) {

         alert("Debes eligir una direccion correcta : tiene que ser un numero entre 1 y 8 .");
     } else{

    // SI todo es correcto insertamos la palabra en la direccion introducida

        if (verificar == false) {
            noCabe = false;
           
            insertarPalabra(palabra, direccion);
            console.log("el vacio es " + vacio);
        }

        break;

    }

}

}


}

// Muestro las palabras insertadas 

var hola4 = document.getElementById("hola4");
var palab = palabrasInsertadas.join(' ');
hola4.innerHTML= "Las palabras introducidas son : " +  palab;

//Muestro las palabras no insertadas

var hola7 = document.getElementById("hola7");
var palabF = palabrasNoInsertadas.join(' ');
hola7.innerHTML= "Las palabras NO introducidas son => (palabra - direccion elegida) : " +  palabF;

rellenar(tabla);

mostrarTabla(tabla);

//Funcion para crear la tabla con los ?

function ponerTabla(){
    for (var i = 0; i < filas; i++) {
        tabla[i]= new Array();
        tablaColor[i] = new Array();
        for (var j = 0; j < columnas; j++) {
            tabla[i][j] = '?';
            tablaColor[i][j] = '?';
        }
    }
}

// Funcion para rellenar la tabla con letras aleatorias en el lugar de ? una vez insertadas las palabras

function rellenar(tabl){
    for (var i = 0; i < filas; i++) {
        for (var j = 0; j < columnas; j++) {
            if (tabl[i][j] == '?') {
                tabl[i][j] = alfabeto[Math.round(Math.random()*25)];
            }
        }
    }
}

//Funcion para mostrar la tabla completa

function mostrarTabla(tabl){
    var tablaD = "<table class='tabla'>";
    for (var i = 0; i < filas; i++) {
        tabl[i]= tabla[i];
        tablaD+="<tr>";
        for (var j = 0; j < columnas; j++) {
            if (tabl[i][j] == tablaColor[i][j]) {

                tablaD+="<td style= 'color: blue;'>"+tabl[i][j]+"</td>";
            }else{
               tablaD+="<td >"+tabl[i][j]+"</td>";
               verificar = true;
           }
       }
       tablaD+="</tr>";
   }
   tablaD+="</table>";
   var hola1 = document.getElementById("hola1");
   hola1.innerHTML= tablaD;
}


//Funcion para comprobar si hay espacio en la tabla para colocar la palabra

function comprobarEspacio(palabra, fila, columna, direccion){

    switch (direccion) {
        case "1":
        for (var pos = 0; pos < palabra.length; pos++) {
            if (tabla[fila][columna + pos] != '?' && tabla[fila][columna + pos] != palabra.charAt(pos) ) {
                return false;
            }
        }
        break;
        case "2":
        for (var pos = 0; pos < palabra.length; pos++) {
            if (tabla[fila][columna - pos] != '?' && tabla[fila][columna - pos] != palabra.charAt(pos) ) {
                return false;
            }
        }
        break;
        case "3":
        for (var pos = 0; pos < palabra.length; pos++) {
            if (tabla[fila + pos][columna] != '?' && tabla[fila + pos][columna] != palabra.charAt(pos) ) {
                return false;
            }
        }
        break;
        case "4":
        for (var pos = 0; pos < palabra.length; pos++) {
            if (tabla[fila - pos][columna] != '?' && tabla[fila - pos][columna] != palabra.charAt(pos) ) {
                return false;
            }
        }
        break;
        case "5":
        for (var pos = 0; pos < palabra.length; pos++) {
            if (tabla[fila + pos][columna + pos] != '?' && tabla[fila + pos][columna + pos] != palabra.charAt(pos) ) {
                return false;
            }
        }
        break;
        case "6":
        for (var pos = 0; pos < palabra.length; pos++) {
            if (tabla[fila - pos][columna + pos] != '?' && tabla[fila - pos][columna + pos] != palabra.charAt(pos) ) {
                return false;
            }
        }
        break;
        case "7":
        for (var pos = 0; pos < palabra.length; pos++) {
            if (tabla[fila + pos][columna - pos] != '?' && tabla[fila + pos][columna - pos] != palabra.charAt(pos) ) {
                return false;
            }
        }
        break;
        case "8":
        for (var pos = 0; pos < palabra.length; pos++) {
            if (tabla[fila - pos][columna - pos] != '?' && tabla[fila - pos][columna - pos] != palabra.charAt(pos) ) {
                return false;
            }
        }
        break;

    }
    return true;

}

//Funcion para insertar la palabra 

function insertarPalabra(palabra , direccion){

    var fila , columna;
    var intentos = 0 ;
    var maxIntentos = 1000;
    var mensaje = "";


    switch (direccion) {
        case "1":
       // Compruebo que la palabra no cabe en la direccion solicitada
             if (palabra.length > tabla[0].length) {
              alert("La palabra  no cabe en la fila");
                comprobar = true;
                noCabe = true;
               
                palabrasNoInsertadas.push(palabra + ' - ' + palabras[direccion-1]);
                return;
             }
       

                // buscamos una posicion aleatoria que no pise otra palabra
                do {
                    fila = Math.floor(Math.random() * tabla.length);

                    columna = Math.floor(Math.random() * (tabla[fila].length - palabra.length + 1));
                    intentos++;

                } while (!comprobarEspacio(palabra, fila, columna, direccion) && intentos < maxIntentos);
                // colocamos la palabra

                if (intentos < maxIntentos) {
                    for (var pos = 0; pos < palabra.length; pos++) {
                        tabla[fila][columna + pos] = palabra.charAt(pos);
                        tablaColor[fila][columna + pos] = palabra.charAt(pos);
                        

                    }
                     palabrasInsertadas.push(palabra);
                }else{
                     palabrasNoInsertadas.push(palabra + ' - ' + palabras[direccion-1]);
                }

                break;
        case "2":
                 // Compruebo que la palabra no cabe en la direccion solicitada
                  if (palabra.length > tabla[0].length) {
                    alert("La palabra  no cabe en la fila");
                    comprobar = true;
                    noCabe = true;
                    palabrasNoInsertadas.push(palabra + ' - ' + palabras[direccion-1]);
                    return;
                }


              do {
                fila = Math.floor(Math.random() * tabla.length);
                var length = tabla[fila].length;
                columna = length  - (Math.floor(Math.random() * palabra.length + 1));
                intentos++;
            } while (!comprobarEspacio(palabra, fila, columna, direccion) && intentos < maxIntentos);
                if (intentos < maxIntentos) {
                    for (var pos = 0; pos < palabra.length; pos++) {
                        tabla[fila][columna - pos] = palabra.charAt(pos);
                        tablaColor[fila][columna - pos] = palabra.charAt(pos);
                      
                    }
                      palabrasInsertadas.push(palabra);
                }else{
                      palabrasNoInsertadas.push(palabra + ' - ' + palabras[direccion-1]);
                    }

        break;
        case "3":
             // Compruebo que la palabra no cabe en la direccion solicitada
                  if (palabra.length > tabla.length) {
                    alert("La palabra  no cabe en la columna");
                    comprobar = true;
                    noCabe = true;
                    palabrasNoInsertadas.push(palabra + ' - ' + palabras[direccion-1]);
                    return;
                }
       

                    // buscamos una posicion aleatoria que no pise otra palabra
                    do {
                        columna = Math.floor(Math.random() * tabla[0].length);

                        fila = Math.floor(Math.random() * (tabla.length - palabra.length + 1));
                        intentos++;
                    } while (!comprobarEspacio(palabra, fila, columna, direccion) && intentos < maxIntentos);
                    // colocamos la palabra

                    if (intentos < maxIntentos) {
                        for (var pos = 0; pos < palabra.length; pos++) {
                            tabla[fila + pos][columna] = palabra.charAt(pos);
                            tablaColor[fila + pos][columna] = palabra.charAt(pos);
                            
                        }
                        palabrasInsertadas.push(palabra);
                    }else{
                        palabrasNoInsertadas.push(palabra + ' - ' + palabras[direccion-1]);
                    }

        break;
        case "4":
                 // Compruebo que la palabra no cabe en la direccion solicitada    
                if (palabra.length > tabla.length) {
                    alert("La palabra  no cabe en la columna");
                    comprobar = true;
                    noCabe = true;
                    palabrasNoInsertadas.push(palabra + ' - ' + palabras[direccion-1]);
                    return;
                }
                

              do {
                columna = Math.floor(Math.random() * tabla[0].length);
                var length = tabla.length;
                fila = length - 1 - (Math.floor(Math.random() * (length - palabra.length + 1)));
                intentos++;
            } while (!comprobarEspacio(palabra, fila, columna, direccion) && intentos < maxIntentos);
                if (intentos < maxIntentos) {
                    for (var pos = 0; pos < palabra.length; pos++) {
                        tabla[fila - pos][columna] = palabra.charAt(pos);
                        tablaColor[fila - pos][columna] = palabra.charAt(pos);
                       
                    }
                     palabrasInsertadas.push(palabra);
                }else{
                     palabrasNoInsertadas.push(palabra + ' - ' + palabras[direccion-1]);
                    }

        break;
        case "5":
             // Compruebo que la palabra no cabe en la direccion solicitada
             if (palabra.length > tabla.length || palabra.length > tabla.length) {
                alert("La palabra  no cabe en la columna y fila");
                comprobar = true;
                noCabe = true;
                palabrasNoInsertadas.push(palabra + ' - ' + palabras[direccion-1]);
                return;
            }
       
                // buscamos una posicion aleatoria que no pise otra palabra
                
                do {

                    fila = Math.floor(Math.random() * (tabla.length - palabra.length + 1));
                    columna = Math.floor(Math.random() * (tabla[fila].length - palabra.length + 1));

                    intentos++;
                } while (!comprobarEspacio(palabra, fila, columna, direccion) && intentos < maxIntentos);
                // colocamos la palabra
                
                if (intentos < maxIntentos) {
                    for (var pos = 0; pos < palabra.length; pos++) {
                        tabla[fila + pos][columna + pos] = palabra.charAt(pos);
                        tablaColor[fila + pos][columna + pos] = palabra.charAt(pos);
                       
                    }
                     palabrasInsertadas.push(palabra);
                }else{
                     palabrasNoInsertadas.push(palabra + ' - ' + palabras[direccion-1]);
                }

        break;
        case "6":
                 // Compruebo que la palabra no cabe en la direccion solicitada
                if (palabra.length > tabla.length) {
                    alert("La palabra  no cabe en la columna y fila");
                    comprobar = true;
                    noCabe = true;
                    palabrasNoInsertadas.push(palabra + ' - ' + palabras[direccion-1]);
                    return;
                }
            

                // buscamos una posicion aleatoria que no pise otra palabra
                do {

                    var length = tabla.length;
                    fila = length - 1 - (Math.floor(Math.random() * (length - palabra.length + 1)));
                    columna = Math.floor(Math.random() * (tabla[fila].length - palabra.length + 1));

                    intentos++;
                } while (!comprobarEspacio(palabra, fila, columna, direccion) && intentos < maxIntentos);
                // colocamos la palabra

                if (intentos < maxIntentos) {
                    for (var pos = 0; pos < palabra.length; pos++) {
                        tabla[fila - pos][columna + pos] = palabra.charAt(pos);
                        tablaColor[fila - pos][columna + pos] = palabra.charAt(pos);
                       
                    }
                     palabrasInsertadas.push(palabra);
                }else{
                     palabrasNoInsertadas.push(palabra + ' - ' + palabras[direccion-1]);
                }

        break;
        case "7":
                // Compruebo que la palabra no cabe en la direccion solicitada
                if (palabra.length > tabla.length) {
                    alert("La palabra  no cabe en la columna y fila");
                    comprobar = true;
                    noCabe = true;
                    palabrasNoInsertadas.push(palabra + ' - ' + palabras[direccion-1]);
                    return;
                }
            
                // buscamos una posicion aleatoria que no pise otra palabra
                
                do {
                    fila = Math.floor(Math.random() * (tabla.length - palabra.length + 1));
                    var cLength = tabla[0].length;
                    columna = cLength - 1 - (Math.floor(Math.random() * (cLength - palabra.length + 1)));

                    intentos++;
                } while (!comprobarEspacio(palabra, fila, columna, direccion) && intentos < maxIntentos);
                // colocamos la palabra
                
                if (intentos < maxIntentos) {
                    for (var pos = 0; pos < palabra.length; pos++) {
                        tabla[fila + pos][columna - pos] = palabra.charAt(pos);
                        tablaColor[fila + pos][columna - pos] = palabra.charAt(pos);
                       
                    }
                     palabrasInsertadas.push(palabra);
                }else{
                     palabrasNoInsertadas.push(palabra + ' - ' + palabras[direccion-1]);
                }

        break;
        case "8":
                 // Compruebo que la palabra no cabe en la direccion solicitada
                if (palabra.length > tabla.length) {
                    alert("La palabra  no cabe en la columna y fila");
                    comprobar = true;
                    noCabe = true;
                    palabrasNoInsertadas.push(palabra + ' - ' + palabras[direccion-1]);
                    return;

                }
           
                // buscamos una posicion aleatoria que no pise otra palabra
                do {
                    var fLength = tabla.length;
                    var cLength = tabla[0].length;

                    columna = cLength - 1 - (Math.floor(Math.random() * (cLength - palabra.length + 1)));
                    fila = fLength - 1 - (Math.floor(Math.random() * (fLength - palabra.length + 1)));

                    intentos++;
                } while (!comprobarEspacio(palabra, fila, columna, direccion) && intentos < maxIntentos);
                // colocamos la palabra

                if (intentos < maxIntentos) {
                    for (var pos = 0; pos < palabra.length; pos++) {
                        tabla[fila - pos][columna - pos] = palabra.charAt(pos);
                        tablaColor[fila - pos][columna - pos] = palabra.charAt(pos);
                        
                    }
                    palabrasInsertadas.push(palabra);
                }else{
                     palabrasNoInsertadas.push(palabra + ' - ' + palabras[direccion-1]);
                }

                break;

            }


        }


  // }     


   // document.write("</center>"); 


