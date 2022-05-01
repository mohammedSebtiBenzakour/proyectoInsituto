
var noValido = /\s/;
var i = document.getElementById("h1");
while (confirm("vamos")) {
	var hol = prompt("hola");
	if (hol == "" || hol == null || noValido.test(hol) ) {

	
			alert("no vasler");
			

		
		
	} else {
		i.innerHTML = "si";
		alert(" vasler");
		break;
	}

}

// var hol = prompt("hola");
// if(noValido.test(hol)){ // se chequea el regex de que el string no tenga espacio
//      alert ("La contraseña no puede contener espacios en blanco"); 
//     return false; 
// }
// else{
//      alert ("Ok"); 
//     return false; 
// }