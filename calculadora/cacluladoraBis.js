function darNumero(x) {
  if(String(document.getElementById("valor_numero").value).charAt(0)=="0"){
    document.getElementById("valor_numero").value = String(document.getElementById("valor_numero").value).substr(1)+x;
  }else{
    document.getElementById("valor_numero").value += x;
  }
  
}

function borrar(y) {
  document.getElementById("valor_numero").value = "0";
  
}

function calcularResultado() {
  var result = eval(document.getElementById("valor_numero").value);
  document.getElementById("valor_numero").value = result;
}

var numero1 = document.getElementById("1");
numero1.onclick = function () {
  
  darNumero(1);
};
var numero2 = document.getElementById("2");
numero2.onclick = function () {
  darNumero(2);
};
var numero3 = document.getElementById("3");
numero3.onclick = function () {
  darNumero(3);
};
var numero4 = document.getElementById("4");
numero4.onclick = function () {
  darNumero(4);
};
var numero5 = document.getElementById("5");
numero5.onclick = function () {
  darNumero(5);
};
var numero6 = document.getElementById("6");
numero6.onclick = function () {
  darNumero(6);
};
var numero7 = document.getElementById("7");
numero7.onclick = function () {
  darNumero(7);
};
var numero8 = document.getElementById("8");
numero8.onclick = function () {
  darNumero(8);
};
var numero9 = document.getElementById("9");
numero9.onclick = function () {
  darNumero(9);
};
var numero0 = document.getElementById("0");
numero0.onclick = function () {
  darNumero(0);
};



function exp_function() {
  document.getElementById("valor_numero").value = Math.exp(
    document.getElementById("valor_numero").value
  );
}

function sqrt_function() {
  document.getElementById("valor_numero").value = Math.sqrt(
    document.getElementById("valor_numero").value
  );
}

document.getElementById("potencia").onclick = function () {
  exp_function();
};

document.getElementById("igual").onclick = function () {
  calcularResultado();
};

var dividir = document.getElementById("dividir");
dividir.onclick = function () {
  darNumero(document.getElementById("dividir").value);
};
var multiplicar = document.getElementById("multiplicar");
multiplicar.onclick = function () {
  darNumero(document.getElementById("multiplicar").value);
};
var restar = document.getElementById("restar");
restar.onclick = function () {
  darNumero(document.getElementById("restar").value);
};
var sumar = document.getElementById("sumar");
sumar.onclick = function () {
  darNumero(document.getElementById("sumar").value);
};
var raiz = document.getElementById("raizCuadrada");
raiz.onclick = function () {
  sqrt_function();
};
var porcentaje = document.getElementById("%");
porcentaje.onclick = function () {
  document.getElementById("valor_numero").value =
    document.getElementById("valor_numero").value / 100;
};
var modulo = document.getElementById("modulo");
modulo.onclick = function () {
  darNumero(document.getElementById("modulo").value);
};

var coma = document.getElementById(",");
coma.onclick = function () {
  darNumero(document.getElementById(",").value);
};

var ce = document.getElementById("ce");
ce.onclick = function () {
  borrar(document.getElementById("ce").value);
  
};

var apagar = document.getElementById("apagar");
apagar.onclick = function () {
  onOff();
};

//Función para apagar y encender
function onOff() {
  apagar = document.getElementById("apagar").value;
  if (apagar == "On") {
    document.getElementById("apagar").value = "Off";
    document.getElementById("apagar").style.background = "red";
    document.getElementById("1").style.opacity = "1";
    document.getElementById("2").style.opacity = "1";
    document.getElementById("3").style.opacity = "1";
    document.getElementById("4").style.opacity = "1";
    document.getElementById("5").style.opacity = "1";
    document.getElementById("6").style.opacity = "1";
    document.getElementById("7").style.opacity = "1";
    document.getElementById("8").style.opacity = "1";
    document.getElementById("9").style.opacity = "1";
    document.getElementById("0").style.opacity = "1";
    document.getElementById("potencia").style.opacity = "1";
    document.getElementById("dividir").style.opacity = "1";
    document.getElementById("multiplicar").style.opacity = "1";
    document.getElementById("restar").style.opacity = "1";
    document.getElementById("sumar").style.opacity = "1";
    document.getElementById("raizCuadrada").style.opacity = "1";
    document.getElementById("%").style.opacity = "1";
    document.getElementById("modulo").style.opacity = "1";
    document.getElementById("igual").style.opacity = "1";
    document.getElementById(",").style.opacity = "1";
    document.getElementById("ce").style.opacity = "1";
    document.getElementById("checkboxLabel").style.opacity = "1";
    document.getElementById("valor_numero").style.opacity = "1";
    document.getElementById("0").disabled = false;
     document.getElementById("1").disabled = false;
    document.getElementById("2").disabled = false;
    document.getElementById("3").disabled = false;
    document.getElementById("4").disabled = false;
    document.getElementById("5").disabled = false;
    document.getElementById("6").disabled = false;
    document.getElementById("7").disabled = false;
    document.getElementById("8").disabled = false;
    document.getElementById("9").disabled = false;
    document.getElementById("potencia").disabled = false;
    document.getElementById("dividir").disabled = false;
    document.getElementById("multiplicar").disabled = false;
    document.getElementById("restar").disabled = false;
    document.getElementById("sumar").disabled = false;
    document.getElementById("raizCuadrada").disabled = false;
    document.getElementById("%").disabled = false;
    document.getElementById("modulo").disabled = false;
    document.getElementById("igual").disabled = false;
    document.getElementById(",").disabled = false;
    document.getElementById("ce").disabled = false;
    document.getElementById("checkboxLabel").disabled = false;
    document.getElementById("valor_numero").disabled = false;
    document.getElementById("checkboxLabel").disabled = false;
    document.getElementById("mod").disabled = false;

  } else {
    document.getElementById("apagar").value = "On";
    document.getElementById("apagar").style.background = "blue";
    /*  document.getElementById("calculadora").style.visibility = "hidden"; */
    document.getElementById("1").style.opacity = "0.2";
    document.getElementById("2").style.opacity = "0.2";
    document.getElementById("3").style.opacity = "0.2";
    document.getElementById("4").style.opacity = "0.2";
    document.getElementById("5").style.opacity = "0.2";
    document.getElementById("6").style.opacity = "0.2";
    document.getElementById("7").style.opacity = "0.2";
    document.getElementById("8").style.opacity = "0.2";
    document.getElementById("9").style.opacity = "0.2";
    document.getElementById("0").style.opacity = "0.2";
    document.getElementById("potencia").style.opacity = "0.2";
    document.getElementById("dividir").style.opacity = "0.2";
    document.getElementById("multiplicar").style.opacity = "0.2";
    document.getElementById("restar").style.opacity = "0.2";
    document.getElementById("sumar").style.opacity = "0.2";
    document.getElementById("raizCuadrada").style.opacity = "0.2";
    document.getElementById("%").style.opacity = "0.2";
    document.getElementById("modulo").style.opacity = "0.2";
    document.getElementById("igual").style.opacity = "0.2";
    document.getElementById(",").style.opacity = "0.2";
    document.getElementById("ce").style.opacity = "0.2";
    document.getElementById("checkboxLabel").style.opacity = "0.2";
    document.getElementById("valor_numero").style.opacity = "0.2";
    document.getElementById("1").disabled = true;
    document.getElementById("2").disabled = true;
    document.getElementById("3").disabled = true;
    document.getElementById("4").disabled = true;
    document.getElementById("5").disabled = true;
    document.getElementById("6").disabled = true;
    document.getElementById("7").disabled = true;
    document.getElementById("8").disabled = true;
    document.getElementById("9").disabled = true;
    document.getElementById("0").disabled = true;
    document.getElementById("potencia").disabled = true;
    document.getElementById("dividir").disabled = true;
    document.getElementById("multiplicar").disabled = true;
    document.getElementById("restar").disabled = true;
    document.getElementById("sumar").disabled = true;
    document.getElementById("raizCuadrada").disabled = true;
    document.getElementById("%").disabled = true;
    document.getElementById("modulo").disabled = true;
    document.getElementById("igual").disabled = true;
    document.getElementById(",").disabled = true;
    document.getElementById("ce").disabled = true;
    document.getElementById("checkboxLabel").disabled = true;
    document.getElementById("valor_numero").disabled = true;
    document.getElementById("checkboxLabel").disabled = true;
    document.getElementById("mod").disabled = true; 
   


  }
}

var result = eval("Math.sqrt(2)");
var result = eval("Math.pow(2, 3)");
var result = eval("(12 / 100) * 3");
var result = eval("Math.pow(" + 2 + "," + 3 + ")");

var num1 = Math.round(Math.random() * 255);
var num2 = Math.round(Math.random() * 255);
var num3 = Math.round(Math.random() * 255);

document.getElementById("calculadora").style.backgroundColor =
  "rgb(" + num1 + "," + num2 + "," + num3 + ")";

document.getElementById("calculadora").style.boxShadow =
  "2px 2px 25px " + "rgb(" + num3 + "," + num1 + "," + num2 + ")";

var x = document.getElementsByTagName("button");
var i;
for (i = 0; i < x.length; i++) {
  x[i].style.boxShadow =
    "3px 3px  " + "rgb(" + num2 + "," + num3 + "," + num1 + ")";
}

var checkBox = document.getElementById("mod");

checkBox.onclick = function () {
  var text = document.getElementById("checkboxLabel");

  // If the checkbox is checked, display the output text
  if (checkBox.checked) {
    text.innerHTML = "MENOS";
  } else {
    text.innerHTML = "MAS";
  }
};
