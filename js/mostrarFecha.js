



var fecha = new Date();
var mostrarFecha = document.getElementById("fecha");
mostrarFecha.innerHTML = fecha.getDate();

var meses = new Array ("Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre");
var diasSemana = new Array("Domingo","Lunes","Martes","Miércoles","Jueves","Viernes","Sábado");
var f=new Date();

function ceros( e){

	if (e < 10) {
		return "0"+ e;
	} else {
		return e;
	}
	return e;

}



var hora = ceros(fecha.getHours()) + ':' + ceros(fecha.getMinutes()) + ':' + ceros(fecha.getSeconds());

mostrarFecha.innerHTML = diasSemana[f.getDay()] + ", " + f.getDate() + " de " + meses[f.getMonth()] + " de " + f.getFullYear() + " Empezaste a las " + hora;

