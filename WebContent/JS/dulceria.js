let datosCatalogos;

$.get("/Cinema/CatalogoDulceria",function(response){
	console.log(response);
	
	datosCatalogos = response;
	
	const opciones = datosCatalogos.opciones
	opciones.forEach(opcion=>{
		$("#opcProducto").append("<option value="+opcion.id+">"+opcion.nombre+"</option>");
	});
});

function opcionSeleccionada(selectOpcion){
	
	var opcion = selectOpcion.value;  
	
	$("#productos").html("");
	
	if(opcion == 1){
		const tipos = datosCatalogos.tiposProductos;
		
		$( "#divTipo" ).removeClass("selectTipoDefault");
		$( "#divTipo" ).addClass("selectTipoMostrar");		
		$("#tipoProducto").append("<option selected value='0'>Seleccionar</option >");
		tipos.forEach(tipo =>{
			$("#tipoProducto").append("<option value="+tipo.id+">"+tipo.nombre+"</option>");
		});
	}else{
		$( "#divTipo" ).removeClass("selectTipoMostrar");
		$( "#divTipo" ).addClass("selectTipoDefault");
		$("#tipoProducto").html("");
		
		if(opcion == 2){
			const combos = datosCatalogos.combos;
			
			combos.forEach(combo =>{
				$("#productos").append(
						"<div class='col-sm-12 col-md-6 col-lg-4 mb-4'>" +
							"<div class='card reb mx-sm-4' style='width: 18rem;''>"+
			                "<img class='card-img-top' src='imgsdulc/COMBO.jpg' alt='Card image cap'>"+
			                "<div class='card-body'>"+
			                    "<h5 class='card-title'>"+combo.nombre+"</h5>"+
			                    "<p>$"+combo.precio+"</p>"+
			                    "<button onclick='seleccion("+JSON.stringify(combo)+")' class='btn btn-primary'>Seleccionar</button>"+
			                "</div>"+
			              "</div>"+
						"</div>" );
			});
		}
	}
}

function tipoSeleccionada(selectTipo){
	var tipo = selectTipo.value;
	let productosEncontrados;
	$("#productos").html("");
	console.log(tipo);
	$.post("/Cinema/CatalogoDulceria?tipo="+tipo ,function(response){
		console.log(response);
		productosEncontrados = response;
		productosEncontrados.forEach(producto=>{
			$("#productos").append(
					"<div class='col-sm-12 col-md-6 col-lg-4 mb-4'>" +
						"<div class='card reb mx-sm-4' style='width: 18rem;''>"+
		                "<img class='card-img-top' src='imgsdulc/COMBO.jpg' alt='Card image cap'>"+
		                "<div class='card-body'>"+
		                    "<h5 class='card-title'>"+producto.nombre+"</h5>"+
		                    "<p>$"+producto.precio+"</p>"+
		                    "<button class='btn btn-primary' onclick='seleccion("+JSON.stringify(producto)+")'>Seleccionar</button>"+
		                "</div>"+
		              "</div>"+
					"</div>" );
		});
	});
}

function seleccion(producto){
	console.log(producto);
	
	
	$( ".overlay" ).addClass("active");
	$(".overlay").append(
		"<div class='popup'>"+
            "<h3>"+producto.nombre+"</h3>"+
            "<div class='row'>" +
	            "<div class='col-sm-12 col-lg-6'>" +
	            	"<img class='' src='imgsdulc/COMBO.jpg' alt='Card image cap'>"+
	            "</div>"+
	            "<div class='col-sm-12 col-lg-6'>" +
	            	"<p>Cantidad</p>"+
	            	"<div class='form-inline cantidad mb-4'>" +
	            		"<button onclick='disminuir()'  " +
	            				"class='btn btn-primary mx-sm-2 '> <i class='fas fa-minus-square'></i>" +
        				"</button>"+
            			"<input  id='valorCantidad'" +
            					"onchange='out(cantidadTabla"+producto.id+")' " +
            							"class='mx-sm-2 mt-1' min='1' max='99'  value='1'" +
            							"type='number'>"+
						"<button onclick='aumentar()' " +
								"class='mx-sm-2 btn btn-primary'> " +
								"<i class='fas fa-plus-square'></i>" +
						"</button>"+
	            	"</div>"+
	            	"<div class='row'>" + 
	            		"<div class='col-sm-6 col-lg-6 mb-2'>" +
	            			"<button class='btn btn-success' onclick='confirmar("+producto.id+")'>Confirmar</button>"+
	            		"</div>"+
	            		"<div class='col-sm-6 col-lg-6 mb-2'>" +
	            			"<button class='btn btn-danger' onclick='cancelar()'>Cancelar</button>"+
	            		"</div>"+
	            	"</div>"+
	            "</div>"+
            "</div>"+
        "</div>"
	);
}

function aumentar(){
	let cantidad = document.getElementById("valorCantidad").value;
	let cantidadNumero = parseInt(cantidad);
	console.log(cantidadNumero);
	if(cantidadNumero == false){
		document.getElementById("valorCantidad").value = 1;
	}else{
		suma = cantidadNumero + 1;
		if( suma >=99){
			document.getElementById("valorCantidad").value = 99;
		}else{
			document.getElementById("valorCantidad").value = suma;	
		}
	}
}

function disminuir(){
	let cantidad = document.getElementById("valorCantidad").value;
	let cantidadNumero = parseInt(cantidad);
	if(cantidadNumero== false){
		document.getElementById("valorCantidad").value = 1;
	}else{
		resta = cantidadNumero - 1;
		if(resta  < 1 || resta > 99){
			document.getElementById("valorCantidad").value = 1;
		}else{
			document.getElementById("valorCantidad").value = resta;
		}	
	}
}

function confirmar(productoId){
	let productoSeleccionado;
	productoSeleccionado.cantidad = parseInt(document.getElementById("valorCantidad").value);
	productoSeleccionado.id =(productoId); 
}

function cancelar(){
	$( ".overlay" ).removeClass("active");
	$( ".overlay" ).html("");
}