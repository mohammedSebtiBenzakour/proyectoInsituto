var monthNames = ["January", "February", "March", "April", "May", "June",
  "July", "August", "September", "October", "November", "December"
];
var dayNames = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];

var meses = new Array ("Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre");
var diasSemana = new Array("Domingo","Lunes","Martes","Miércoles","Jueves","Viernes","Sábado");

function checkTime() {
  var date = new Date();
  var sufix = '';
  var hours = ('0' + date.getHours()).slice(-2);
  var minutes = ('0' + date.getMinutes()).slice(-2);
  var day = date.getDate();
  var month = meses[date.getMonth()];
  var weekday = diasSemana[date.getDay()];
  var año = date.getFullYear();
  if (day > 3 && day < 21) sufix = 'th';
  switch (day % 10) {
    case 1:
      sufix = "st";
    case 2:
      sufix = "nd";
    case 3:
      sufix = "rd";
    default:
      sufix = "th";
  }

    document.getElementById('time').innerHTML = "<span class='date'>" + weekday +  " "  + day + " de " + month + " de " + año + "</span>" + "<span class='hour'> y son las : " + hours + ":" + minutes + " .</span> ";

  // document.getElementById('time').innerHTML = "  It's <span class='hour'>" + hours + ":" + minutes + "</span> <span class='date'>" + month + ' ' + day + sufix + ', ' + weekday + '.';


}

setInterval(checkTime(), 1000);