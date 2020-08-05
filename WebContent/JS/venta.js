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