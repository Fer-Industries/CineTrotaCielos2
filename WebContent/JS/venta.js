let idFuncion = sessionStorage.getItem("funcion");
//[95,96,97] 
//split me a servir para dividir un String
let arregloAsientos = sessionStorage.getItem("asientosSeleccionados").split(",");
let numeroAsientos = arregloAsientos.length;
let date = new Date();
//	ESTE JSON LO VAS A ENVIAR AL SERVLET!!!!
let infoVenta = {
		funcion:idFuncion,
		numAsientos:numeroAsientos,
		diaSemana:date.getDay()
}
//LA PETICIÓN AL SERVLET 

console.log(infoVenta);
// PARA QUE EL SERVLET RESPONDA EL SIGUIENTE JSON
let infoRecibida = { //JSON EMULA LA RESPUESTA QUE NOS VA A REGRESAR EL JAVA
		subtotal:'90',
		nombreDescuento:'Miercoles',
		descuento:'30%',
		total:'63',
		tipoBoleto:'Tradicional',
		numeroAsientos:2,
}

console.log(infoRecibida);

function llenarCampos(){
	//prepend para ponerlo antes
	$("#lista").append("<li class='list-group-item d-flex justify-content-between lh-condensed'>"+
	          "<div>" +
	            "<h6 class='my-0'>"+infoRecibida.tipoBoleto +"</h6>"+
	            "<small class='text-muted'>Cantidad: "+ infoRecibida.numeroAsientos+"</small>" +
	          "</div>"+
	          "<span class='text-muted'>$"+infoRecibida.subtotal+"</span>" +
	        "</li>");
	$("#lista").append("<li class='list-group-item d-flex justify-content-between bg-light'>"+
	          "<div class='text-success'>"+
	            "<h6 class='my-0'>Descuento:</h6>"+
	            "<small class=''>"+ infoRecibida.nombreDescuento+"</small>" +
	          "</div>"+
	          "<span class='text-success'>"+infoRecibida.descuento+"</span>"+
	        "</li>");
	    $("#lista").append("<li class='list-group-item d-flex justify-content-between'>"+
	          "<span>Total:</span>"+
	          "<strong>$"+infoRecibida.total+"</strong>"+
	        "</li>");
}

llenarCampos();




const tarjeta = document.querySelector('#tarjeta'),
btnAbrirFormulario = document.querySelector('#btn-abrir-formulario'),
formulario = document.querySelector('#formulario-tarjeta'),
numeroTarjeta = document.querySelector('#tarjeta .numero'),
nombreTarjeta = document.querySelector('#tarjeta .nombre'),
firma = document.querySelector('#tarjeta .firma p'),
mesExpiracion = document.querySelector('#tarjeta .mes'),
yearExpiracion = document.querySelector('#tarjeta .year');
ccv = document.querySelector('#tarjeta .ccv');


//* Volteamos la tarjeta para mostrar el frente.
const mostrarFrente = () => {
if(tarjeta.classList.contains('active')){
	tarjeta.classList.remove('active');
}
}

//* Rotacion de  tarjeta
tarjeta.addEventListener('click', () => {
tarjeta.classList.toggle('active');
});

//* Boton abrir formulario
btnAbrirFormulario.addEventListener('click', () => {
btnAbrirFormulario.classList.toggle('active');
formulario.classList.toggle('active');
});

//* Select  mes generado dinamicamente.
for(let i = 1; i <= 12; i++){
let opcion = document.createElement('option');
opcion.value = i;
opcion.innerText = i;
formulario.selectMes.appendChild(opcion);
}

//* Select  año generado dinamicamente.
const yearActual = new Date().getFullYear();
for(let i = yearActual; i <= yearActual + 6; i++){
let opcion = document.createElement('option');
opcion.value = i;
opcion.innerText = i;
formulario.selectYear.appendChild(opcion);
}

//* Input numero de tarjeta
formulario.inputNumero.addEventListener('keyup', (e) => {
let valorInput = e.target.value;

formulario.inputNumero.value = valorInput
// Eliminamos espacios en blanco
.replace(/\s/g, '')
// Eliminar las letras
.replace(/\D/g, '')
//  espacio cada cuatro numeros
.replace(/([0-9]{4})/g, '$1 ')
.trim();

numeroTarjeta.textContent = valorInput;

if(valorInput == ''){
	numeroTarjeta.textContent = '#### #### #### ####';
}

// Volteamos la tarjeta para que el usuario vea el frente.
mostrarFrente();
});

//* Input nombre de tarjeta
formulario.inputNombre.addEventListener('keyup', (e) => {
let valorInput = e.target.value;

formulario.inputNombre.value = valorInput.replace(/[0-9]/g, '');
nombreTarjeta.textContent = valorInput;
firma.textContent = valorInput;

mostrarFrente();
});



