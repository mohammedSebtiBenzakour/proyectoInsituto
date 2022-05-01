
// document.write("<center>");

//  window.onload=iniciar;

// function iniciar(){

//     // document.getElementById("boton").addEventListener('click', 
//     //     validar, false);
//     document.getElementById("imprimir").addEventListener('click', window.print(), false);

// }

// function validar(e){

// document.getElementById("imprimir").addEventListener('click', window.print(), false);

var tabla =new Array();

var tablaColor =new Array();

var palabras = [];
var palabrasInsertadas = [];
var palabrasNoInsertadas = [];


// son todos al abecedario 

var alfabeto = String.fromCharCode(...Array(123).keys()).slice(97);

console.log("el alfabeto es " + alfabeto);

alfabeto = alfabeto.toUpperCase();

var filas = 0;
var columnas = 0;
var vacio = true;
var noVale = true;
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
        filas = prompt("Introduce  las filas de la tabla : \nRecordatorio: solo estan permitidos valores numericos superiores a cero");
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
       columnas = prompt("Introduce las columnas de la tabla : \nRecordatorio: solo estan permitidos valores numericos superiores a cero ");
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

var fila1 = 0;
var columna1 = 0;

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

    //Introduzco el numero de la columna en la fila anterior donde se va a colocar la palabra

        while (true) {

            var fila = prompt("Introduce un numero de la fila de la tabla donde se va colocar la palabra elegida : ");

            console.log(" fila es : " + fila);
        // Compruebo que el numero de la columa no sea mayor que las columnas de la tabla
            if (  fila > filas || isNaN(fila) ) {
                alert("La fila introducida no es valida");

            }else{

               fila = parseInt(fila);
               fila1 = fila-1;
               break;
           }
        }
    //Introduzco el numero de la columna en la fila anterior donde se va a colocar la palabra
        while (true) {
            var columna = prompt("Introduce la posicion horizontal en esa fila de la tabla donde se va a colocar la palabra : ");
            
            console.log(" columna es : " + columna);
        // Compruebo que el numero de la columa no sea mayor que las columnas de la tabla
            if (columna > columnas || isNaN(columna)) {
                alert("La columna introducida no es valida");

            }else{
             columna = parseInt(columna);
             columna1 = columna-1;
             break;
            }

        }
 // SI todo es correcto insertamos la palabra en la direccion introducida

             if (verificar == false) {
                noCabe = false;
                insertarPalabra(palabra, fila1, columna1, direccion);
            }

            break;
        }
    }

}


}

// Muestro las palabras insertadas 

var hola4 = document.getElementById("hola4");
var palab = palabrasInsertadas.join(' ');
hola4.innerHTML= "Las palabras introducidas son => (palabra - direccion elegida - pos fila - pos columna) : <br> " +  palab;

//Muestro las palabras no insertadas

var hola7 = document.getElementById("hola7");
var palabF = palabrasNoInsertadas.join(' ');
hola7.innerHTML= "Las palabras NO introducidas son => (palabra - direccion elegida - pos fila - pos columna) : <br> " +  palabF;

// Funcion para rellenar la tabla con letras aleatorias en el lugar de ? una vez insertadas las palabras

rellenar(tabla);

//Incluyo un titulo a la sopa de letras ( tematica)

var tematica =  prompt("¿Desea Incluir la tematica para la sopa de letra?");
var tematic = document.getElementById("tematic");
tematic.innerHTML = "La tematica : " + tematica.toUpperCase();

//Funcion para mostrar la tabla completa

mostrarTabla(tabla);

var hide = document.getElementById("hide");
hide.style.opacity = "1"; 

// Imprimir la sopa de letras al final 

var btn= document.querySelector(".imprimir");
btn.addEventListener('click', function(){
 window.print();
});


/************************************************************/
// Las funciones

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
var mensaj = "";

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

function insertarPalabra(palabra , f, c, direccion){

    var intentos = 0 ;
    var maxIntentos = 1000;
    var mensaje = "";


    switch (direccion) {
        case "1":
       // Compruebo que la palabra no cabe en la direccion solicitada
       if (palabra.length > tabla[0].length) {
          alert("Error \nLa palabra  no cabe en la fila");
          comprobar = true;
          noCabe = true;
          palabrasNoInsertadas.push("- " + palabra + ' - ' + palabras[direccion-1] + ' - ' + (f+1) + ' - ' + (c+1) + '<br>');
          return;
      }

       //Compruebo que hay espacio 
       if (comprobarEspacio(palabra, f, c, direccion)) {
        //Compruebo que la posicion en la fila este disponible asi como lo mismo para la posicion en la columna de esa fila
        
        if (f < tabla.length && c < ((tabla[f].length - palabra.length + 1))) {

         for (var pos = 0; pos < palabra.length; pos++) {

            tabla[f][c + pos] = palabra.charAt(pos);
            tablaColor[f][c + pos] = palabra.charAt(pos);

        } 
    }
    palabrasInsertadas.push("- " + palabra + ' - ' + palabras[direccion-1] + ' - ' + (f+1) + ' - ' + (c+1) + '<br>');

} else {
    alert("Error \nLa palabra  no cabe en la posicion  " + (f+1) + " de la fila y la posicion " + (c+1) + " de la columna en esa fila" );
    palabrasNoInsertadas.push("- " + palabra + ' - ' + palabras[direccion-1] + ' - ' + (f+1) + ' - ' + (c+1) + '<br>');
    intentos++;
} 
break;
case "2":
         // Compruebo que la palabra no cabe en la direccion solicitada
     if (palabra.length > tabla[0].length) {
            alert("Error \nLa palabra  no cabe en la fila");
            comprobar = true;
            noCabe = true;
            palabrasNoInsertadas.push("- " + palabra + ' - ' + palabras[direccion-1] + ' - ' + (f+1) + ' - ' + (c+1) + '<br>');
            return;
    }

        //Compruebo que hay espacio 
    if (comprobarEspacio(palabra, f, c, direccion)) {
        //Compruebo que la posicion en la fila este disponible asi como lo mismo para la posicion en la columna de esa fila
        var length = tabla[f].length;
        console.log(" la pal fuera es : " + tabla[f][c - pos]);
        if (f < tabla.length || c < (tabla[f].length - 1 - (palabra.length + 1))) {

         for (var pos = 0; pos < palabra.length; pos++) {

            tabla[f][c - pos] = palabra.charAt(pos);
            tablaColor[f][c - pos] = palabra.charAt(pos);
            console.log(" la pal dentro es : " + tabla[f][c - pos]);

        } 
    }
        palabrasInsertadas.push("- " + palabra + ' - ' + palabras[direccion-1] + ' - ' + (f+1) + ' - ' + (c+1) + '<br>');

    } else {
        alert("Error \nLa palabra  no cabe en la posicion  " + (f+1) + " de la fila y la posicion " + (c+1) + " de la columna en esa fila" );
        palabrasNoInsertadas.push("- " + palabra + ' - ' + palabras[direccion-1] + ' - ' + (f+1) + ' - ' + (c+1) + '<br>');
        intentos++;
    } 
    break;
    case "3": //Abajo
         // Compruebo que la palabra no cabe en la direccion solicitada
         if (palabra.length > tabla.length) {
        alert("Error \nLa palabra  no cabe en la columna");
        comprobar = true;
        noCabe = true;
        palabrasNoInsertadas.push("- " + palabra + ' - ' + palabras[direccion-1] + ' - ' + (f+1) + ' - ' + (c+1) + '<br>');
        return;
    }
        //Compruebo que la fila elegida este permitida
        if (f >= (tabla.length - palabra.length + 1 )) {
            alert("Error \nLa fila " + (f+1) + "  no es valida ");
            console.log(" pal tab : " + tabla.length);
            console.log(" pal tam : " + palabra.length);
            console.log(" pal suma : " + (tabla.length - palabra.length + 1));
            palabrasNoInsertadas.push("- " + palabra + ' - ' + palabras[direccion-1] + ' - ' + (f+1) + ' - ' + (c+1) + '<br>');

        }else{

        //Compruebo que hay espacio 
        if (comprobarEspacio(palabra, f, c, direccion)) {
        //Compruebo que la posicion en la fila este disponible asi como lo mismo para la posicion en la columna de esa fila

        console.log(" la pal fuera es : " + tabla[f][c]);
        if (c <= tabla[0].length || f < (tabla.length - palabra.length + 1)) {

         for (var pos = 0; pos < palabra.length; pos++) {

            tabla[f + pos][c] = palabra.charAt(pos);
            tablaColor[f + pos][c] = palabra.charAt(pos);
            console.log(" la pal dentro es : " + tabla[f + pos][c]);

            } 
        }
        palabrasInsertadas.push("- " + palabra + ' - ' + palabras[direccion-1] + ' - ' + (f+1) + ' - ' + (c+1) + '<br>');

    } else {
        alert("Error \nLa palabra  no cabe en la posicion  " + (f+1) + " de la fila y la posicion " + (c+1) + " de la columna en esa fila" );
        palabrasNoInsertadas.push("- " + palabra + ' - ' + palabras[direccion-1] + ' - ' + (f+1) + ' - ' + (c+1) + '<br>');
        intentos++;
    } 
    }    
    break;
    case "4": //arriba
         // Compruebo que la palabra no cabe en la direccion solicitada    
         if (palabra.length > tabla.length) {
            alert("La palabra  no cabe en la columna");
            comprobar = true;
            noCabe = true;
            palabrasNoInsertadas.push("- " + palabra + ' - ' + palabras[direccion-1] + ' - ' + (f+1) + ' - ' + (c+1) + '<br>');
            return;
        }
         //Compruebo que la fila elegida este permitida
         if (f < (tabla.length - palabra.length)) {
            alert("Error \nLa fila " + (f+1) + " no es valida 222 ");
            console.log(" pal tab : " + tabla.length);
            console.log(" pal tam : " + palabra.length);
            console.log(" pal suma : " + (tabla.length - palabra.length + 1));
            palabrasNoInsertadas.push("- " + palabra + ' - ' + palabras[direccion-1] + ' - ' + (f+1) + ' - ' + (c+1) + '<br>');

        }else{

        //Compruebo que hay espacio 
        if (comprobarEspacio(palabra, f, c, direccion)) {
        //Compruebo que la posicion en la fila este disponible asi como lo mismo para la posicion en la columna de esa fila

        console.log(" la pal fuera es : " + tabla[f][c]);
        if (c <= tabla[f].length || f <= (tabla.length - 1 - (tabla.length - palabra.length + 1)) || f <= tabla.length) {

         for (var pos = 0; pos < palabra.length; pos++) {

            tabla[f - pos][c] = palabra.charAt(pos);
            tablaColor[f - pos][c] = palabra.charAt(pos);
            console.log(" la pal dentro es : " + tabla[f - pos][c]);

            } 
        }
        palabrasInsertadas.push("- " + palabra + ' - ' + palabras[direccion-1] + ' - ' + (f+1) + ' - ' + (c+1) + '<br>');

        } else {
            alert("Error \nLa palabra  no cabe en la posicion  " + (f+1) + " de la fila y la posicion " + (c+1) + " de la columna en esa fila" );
            palabrasNoInsertadas.push("- " + palabra + ' - ' + palabras[direccion-1] + ' - ' + (f+1) + ' - ' + (c+1) + '<br>');
            intentos++;
        } 
        }   
        break;
    case "5": //Derecha abajo 
         // Compruebo que la palabra no cabe en la direccion solicitada
         if (palabra.length > tabla.length ) {
            alert("Error \nLa palabra  no cabe en la columna y fila");
            comprobar = true;
            noCabe = true;
            palabrasNoInsertadas.push("- " + palabra + ' - ' + palabras[direccion-1] + ' - ' + (f+1) + ' - ' + (c+1) + '<br>');
            return;
        }
         //Compruebo que la fila elegida este permitida
        if (f >= (tabla.length - palabra.length + 1 )) {
            alert("Error \nLa fila " + (f+1) + "  no es valida ");
            console.log(" pal tab : " + tabla.length);
            console.log(" pal tam : " + palabra.length);
            console.log(" pal suma : " + (tabla.length - palabra.length + 1));
            palabrasNoInsertadas.push("- " + palabra + ' - ' + palabras[direccion-1] + ' - ' + (f+1) + ' - ' + (c+1) + '<br>');

        }else{

        //Compruebo que hay espacio 
        if (comprobarEspacio(palabra, f, c, direccion)) {
        //Compruebo que la posicion en la fila este disponible asi como lo mismo para la posicion en la columna de esa fila

        console.log(" la pal fuera es : " + tabla[f][c]);
        if (f < (tabla.length - palabra.length + 1 ) || c < (tabla[f].length - palabra.length + 1)) {

         for (var pos = 0; pos < palabra.length; pos++) {

            tabla[f + pos][c + pos] = palabra.charAt(pos);
            tablaColor[f + pos][c + pos] = palabra.charAt(pos);
            console.log(" la pal dentro es : " + tabla[f + pos][c + pos]);

            } 
        }
        palabrasInsertadas.push("- " + palabra + ' - ' + palabras[direccion-1] + ' - ' + (f+1) + ' - ' + (c+1) + '<br>');

    } else {
        alert("Error \nLa palabra  no cabe en la posicion  " + (f+1) + " de la fila y la posicion " + (c+1) + " de la columna en esa fila" );
        palabrasNoInsertadas.push("- " + palabra + ' - ' + palabras[direccion-1] + ' - ' + (f+1) + ' - ' + (c+1) + '<br>');
        intentos++;
    } 
    }
    break;
    case "6": //Derecha arriba
         // Compruebo que la palabra no cabe en la direccion solicitada
         if (palabra.length > tabla.length) {
            alert("Error \nLa palabra  no cabe en la columna y fila");
            comprobar = true;
            noCabe = true;
            palabrasNoInsertadas.push("- " + palabra + ' - ' + palabras[direccion-1] + ' - ' + (f+1) + ' - ' + (c+1) + '<br>');
            return;
        }
             //Compruebo que la fila elegida este permitida
             if (f <= (tabla.length - palabra.length + 1)) {
                alert("Error \nLa fila " + (f+1) + " no es valida ");
                console.log(" pal tab : " + tabla.length);
                console.log(" pal tam : " + palabra.length);
                console.log(" pal suma : " + (tabla.length - palabra.length + 1));
                palabrasNoInsertadas.push("- " + palabra + ' - ' + palabras[direccion-1] + ' - ' + (f+1) + ' - ' + (c+1) + '<br>');

            }else{

        //Compruebo que hay espacio 
        if (comprobarEspacio(palabra, f, c, direccion)) {
        //Compruebo que la posicion en la fila este disponible asi como lo mismo para la posicion en la columna de esa fila

        console.log(" la pal fuera es : " + tabla[f][c]);
        if (f < (tabla.length - 1 - (tabla.length - palabra.length + 1 )) || c < (tabla[f].length - palabra.length + 1)) {

         for (var pos = 0; pos < palabra.length; pos++) {

            tabla[f - pos][c + pos] = palabra.charAt(pos);
            tablaColor[f - pos][c + pos] = palabra.charAt(pos);
            console.log(" la pal dentro es : " + tabla[f - pos][c + pos]);

            } 
        }
        palabrasInsertadas.push("- " + palabra + ' - ' + palabras[direccion-1] + ' - ' + (f+1) + ' - ' + (c+1) + '<br>');

    } else {
        alert("Error \nLa palabra  no cabe en la posicion  " + (f+1) + " de la fila y la posicion " + (c+1) + " de la columna en esa fila" );
        palabrasNoInsertadas.push("- " + palabra + ' - ' + palabras[direccion-1] + ' - ' + (f+1) + ' - ' + (c+1) + '<br>');
        intentos++;
    } 
    }
    break;
    case "7": //Izquierda abajo
        // Compruebo que la palabra no cabe en la direccion solicitada
        if (palabra.length > tabla.length) {
            alert("Error \nLa palabra  no cabe en la columna y fila");
            comprobar = true;
            noCabe = true;
            palabrasNoInsertadas.push("- " + palabra + ' - ' + palabras[direccion-1] + ' - ' + (f+1) + ' - ' + (c+1) + '<br>');
            return;
        }
             //Compruebo que la fila elegida este permitida
             if (f >= (tabla.length - palabra.length + 1 )) {
                alert("Error : \nLa fila " + (f+1) + "  no es valida ");
                console.log(" pal tab : " + tabla.length);
                console.log(" pal tam : " + palabra.length);
                console.log(" pal suma : " + (tabla.length - palabra.length + 1));
                palabrasNoInsertadas.push("- " + palabra + ' - ' + palabras[direccion-1] + ' - ' + (f+1) + ' - ' + (c+1) + '<br>');

            }else{

        //Compruebo que hay espacio 
        if (comprobarEspacio(palabra, f, c, direccion)) {
        //Compruebo que la posicion en la fila este disponible asi como lo mismo para la posicion en la columna de esa fila

        console.log(" la pal fuera es : " + tabla[f][c]);
        if (f < (tabla.length - palabra.length + 1 ) || c < (tabla[0].length - 1 - (tabla[0].length - palabra.length + 1))) {

         for (var pos = 0; pos < palabra.length; pos++) {

            tabla[f + pos][c - pos] = palabra.charAt(pos);
            tablaColor[f + pos][c - pos] = palabra.charAt(pos);
            console.log(" la pal dentro es : " + tabla[f + pos][c - pos]);

            } 
        }
        palabrasInsertadas.push("- " + palabra + ' - ' + palabras[direccion-1] + ' - ' + (f+1) + ' - ' + (c+1) + '<br>');

    } else {
        alert("Error \nLa palabra  no cabe en la posicion  " + (f+1) + " de la fila y la posicion " + (c+1) + " de la columna en esa fila" );
        palabrasNoInsertadas.push("- " + palabra + ' - ' + palabras[direccion-1] + ' - ' + (f+1) + ' - ' + (c+1) + '<br>');
        intentos++;
    } 
    }
    break;
    case "8": //Izquierda arriba
         // Compruebo que la palabra no cabe en la direccion solicitada
         if (palabra.length > tabla.length) {
            alert("Error \nLa palabra  no cabe en la columna y fila");
            comprobar = true;
            noCabe = true;
            palabrasNoInsertadas.push("- " + palabra + ' - ' + palabras[direccion-1] + ' - ' + (f+1) + ' - ' + (c+1) + '<br>');
            return;
        }
        //Compruebo que la fila elegida este permitida
        if (f <= (tabla.length - palabra.length)) {
            alert("Error : \nLa fila " + (f+1) + " no es valida ");
            console.log(" pal tab : " + tabla.length);
            console.log(" pal tam : " + palabra.length);
            console.log(" pal suma : " + (tabla.length - palabra.length + 1));
            palabrasNoInsertadas.push("- " + palabra + ' - ' + palabras[direccion-1] + ' - ' + (f+1) + ' - ' + (c+1) + '<br>');

        }else{

                //Compruebo que hay espacio 
            if (comprobarEspacio(palabra, f, c, direccion)) {
        //Compruebo que la posicion en la fila este disponible asi como lo mismo para la posicion en la columna de esa fila
        
      //Profesor estoy conciente que en el if se debe reducir a una sola cosa 
      //lo he dejado asi para acordarme que para esa direccion se cojen ambas direcciones corespondientes

              console.log(" la pal fuera es : " + tabla[f][c]);
            if (c <= (tabla[f].length - 1 - (tabla[f].length - palabra.length +1)) || f <= (tabla.length -1 - (tabla.length - palabra.length + 1 )) || c < tabla[f].length || f < tabla.length) {

                 for (var pos = 0; pos < palabra.length; pos++) {

                    tabla[f - pos][c - pos] = palabra.charAt(pos);
                    tablaColor[f - pos][c - pos] = palabra.charAt(pos);
                    console.log(" la pal dentro es : " + tabla[f - pos][c - pos]);

                } 
            }
            palabrasInsertadas.push("- " + palabra + ' - ' + palabras[direccion-1] + ' - ' + (f+1) + ' - ' + (c+1) + '<br>');

            } else {
                alert("Error \nLa palabra  no cabe en la posicion  " + (f+1) + " de la fila y la posicion " + (c+1) + " de la columna en esa fila" );
                palabrasNoInsertadas.push("- " + palabra + ' - ' + palabras[direccion-1] + ' - ' + (f+1) + ' - ' + (c+1) + '<br>');
                intentos++;
            } 
            break;
            }
        }
    }



