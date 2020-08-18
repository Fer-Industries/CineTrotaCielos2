let idFuncion = sessionStorage.getItem("funcion");

let arregloAsientos = sessionStorage.getItem("asientosSeleccionados").split(",");
let numeroAsientos = arregloAsientos.length;
let date = new Date();
let total = 0;
//	ESTE JSON LO VAS A ENVIAR AL SERVLET!!!!
let infoVenta = {
		idFuncion:idFuncion,
		numeroAsientos:numeroAsientos,
		dia:date.getDay()
}
let infCompra = {
		arregloAsientos:arregloAsientos,
		total:total,
		idFuncion:idFuncion
}

function llenarCampos(){
	$.ajax( {
        url: '/Cinema/Ventas_ticket',
        type: 'get',
        contentType:'application/json',
        data: { 
        	infoVenta: JSON.stringify(infoVenta)
        },
        success: function (infoRecibidaVenta) {
        	console.log(infoRecibidaVenta);
	//prepend para ponerlo antes
			$("#lista").append("<li class='list-group-item d-flex justify-content-between lh-condensed'>"+
			          "<div>" +
			            "<h6 class='my-0'>"+infoRecibidaVenta.tipoBoleto +"</h6>"+
			            "<small class='text-muted'>Cantidad: "+ infoRecibidaVenta.numeroAsientos+"</small>" +
			          "</div>"+
			          "<span class='text-muted'>$"+infoRecibidaVenta.subtotal+"</span>" +
			        "</li>");
			if(infoRecibidaVenta.nombreDescuento != undefined){
				$("#lista").append("<li class='list-group-item d-flex justify-content-between bg-light'>"+
				          "<div class='text-success'>"+
				            "<h6 class='my-0'>Descuento:</h6>"+
				            "<small class=''>"+ infoRecibidaVenta.nombreDescuento+"</small>" +
				          "</div>"+
				          "<span class='text-success'>"+infoRecibidaVenta.descuento+"</span>"+
				        "</li>");
			}
			
		    $("#lista").append("<li class='list-group-item d-flex justify-content-between'>"+
		          "<span>Total:</span>"+
		          "<strong>$"+infoRecibidaVenta.total+"</strong>"+
		        "</li>");
		    infCompra.total = infoRecibidaVenta.total;
        }
	});
}

llenarCampos();


console.log(infCompra);
const tarjeta = document.querySelector('#tarjeta'),
btnAbrirFormulario = document.querySelector('#btn-abrir-formulario'),
formulario = document.querySelector('#formulario-tarjeta'),
numeroTarjeta = document.querySelector('#tarjeta .numero'),
nombreTarjeta = document.querySelector('#tarjeta .nombre'),
firma = document.querySelector('#tarjeta .firma p'),
mesExpiracion = document.querySelector('#tarjeta .mes'),
yearExpiracion = document.querySelector('#tarjeta .year');
ccv = document.querySelector('#tarjeta .ccv'),
botonCompra = document.querySelector("#compra"),
d = document;

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
	document.querySelector("#selectMes").appendChild(opcion);
	//formulario.selectMes.appendChild(opcion);
}
	
	//* Select  año generado dinamicamente.
const yearActual = new Date().getFullYear();
for(let i = yearActual; i <= yearActual + 6; i++){
	let opcion = document.createElement('option');
	opcion.value = i;
	opcion.innerText = i;
	document.querySelector("#selectYear").appendChild(opcion);
	//formulario.selectYear.appendChild(opcion);
}
	
//* Input numero de tarjeta
d.querySelector("#inputNumero").addEventListener('keyup', (e) => {
	let valorInput = e.target.value;
	
	d.querySelector("#inputNumero").value = valorInput
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
d.querySelector("#inputNombre").addEventListener('keyup', (e) => {
	let valorInput = e.target.value;
	
	d.querySelector("#inputNombre").value = valorInput.replace(/[0-9]/g, '');
	nombreTarjeta.textContent = valorInput;
	firma.textContent = valorInput;
	
	mostrarFrente();
});
	
	// * Select mes	
d.querySelector("#selectMes").addEventListener('change', (e) => {
	mesExpiracion.textContent = e.target.value;
	mostrarFrente();
});

	// * Select Año
d.querySelector("#selectYear").addEventListener('change', (e) => {
	yearExpiracion.textContent = e.target.value.slice(2);
	mostrarFrente();
});

	// * CCV
d.querySelector("#inputCCV").addEventListener('keyup', () => {
	if(!tarjeta.classList.contains('active')){
		tarjeta.classList.toggle('active');
}
		
d.querySelector("#inputCCV").value = d.querySelector("#inputCCV").value
	// Eliminar los espacios
	.replace(/\s/g, '')
	// Eliminar las letras
	.replace(/\D/g, '');
	ccv.textContent = d.querySelector("#inputCCV").value;
});
botonCompra.addEventListener("click",function(){
	$.ajax({
		url:'/Cinema/Ventas_ticket',
		type:'post',
		data:{
			infoVenta:JSON.stringify(infCompra)
		},
		success:function(response){
			console.log(response);
			if(response > 0){
				Swal.close();
				Swal.fire(
						'Venta realizada',
						'disfrute su función',
						'success'
				);
				// se tendría que descargar el pdf!!!!
				window.location.href = '/Cinema/principal.jsp';
			}else if(response == -3){
				Swal.fire(
						'Disculpe',
						'uno de los asientos ya esta ocupado',
						'error'
				);
			}else{
				Swal.close();
				Swal.fire(
						'Tuvimos un problema',
						'disculpe las molestias',
						'error'
				);
			}
		},
		error:function(response){
			Swal.close();
			Swal.fire(
					'Hubo un problema',
					'intentelo mas tarde',
					'error'
			);
		}
	});
});
/*
botonCompra.addEventListener("click",function(){
	let infoTarjeta = {
			idTarCliente:d.querySelector("#inputNumero").value.replace(/\s/g, ''),
			cvv:parseInt(d.querySelector("#inputCCV").value),
			month:parseInt(d.querySelector("#selectMes").value),
			year:parseInt(d.querySelector("#selectYear").value)
	}
	
	let infoMovimiento = {
			idTarjetaCliente:d.querySelector("#inputNumero").value.replace(/\s/g, ''),
			empresa:'Cinema sa de cv',
			concepto:'Venta de boletos',
			monto:infCompra.total
	}
	Swal.fire('Espere por favor');
	Swal.showLoading();
	
	//ESTAMOS VALIDANDO SI LA TARJETA QUE PUSO EL USUARIO ES VALIDA
	$.ajax({
		url:'http://localhost:9080/bank/tarjetaExistente',
		type:'post',
		contentType: "application/json",
		dataType: "json",
		data:JSON.stringify(infoTarjeta),
		success:function(response){
			if(!response){
				Swal.close();
				Swal.fire(
						'Tarjeta invalida',
						'Intenta con otra forma de pago',
						'error'
				);
			}else{//vamos a guardar la transacción en el banco
				$.ajax({
					url:'http://localhost:9080/bank/registrarMovimiento',
					type:'post',
					contentType: "application/json",
					dataType: "json",
					data:JSON.stringify(infoMovimiento),
					success:function(respuesta){
						if(respuesta.status == 1){ // guardariamos la compra en nuestra BD
							$.ajax({
								url:'/Cinema/Ventas_ticket',
								type:'post',
								data:{
									infoVenta:JSON.stringify(infCompra)
								},
								success:function(response){
									console.log(response);
									if(response > 0){
										Swal.close();
										Swal.fire(
												'Venta realizada',
												'disfrute su función',
												'success'
										);
										// se tendría que descargar el pdf!!!!
										window.location.href = '/Cinema/principal.jsp';
									}else{
										Swal.close();
										Swal.fire(
												'Tuvimos un problema',
												'disculpe las molestias',
												'error'
										);
									}
								},
								error:function(response){
									Swal.close();
									Swal.fire(
											'Hubo un problema',
											'intentelo mas tarde',
											'error'
									);
								}
							});
						}else{
							Swal.close();
							Swal.fire(
									respuesta.mensaje,
									'',
									'error'
							);
						}
					},error:function(respuesta){ // ESTO SE VA A EJECUTAR CUANDO HAYA UN CODIGO DE ERROR (400 - 500)
						Swal.close();
						console.log(respuesta);
						Swal.fire(
								'Lo sentimos',
								'El banco esta teniendo problemas',
								'error'
						);
					}
				});
			}
		},error:function(respuesta){
			Swal.fire(
					'Lo sentimos',
					'El banco esta teniendo problemas',
					'error'
			);
		}
	});
});
*/
