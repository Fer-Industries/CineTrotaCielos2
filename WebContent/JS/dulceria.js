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
			                    "<a class='btn btn-primary'>Seleccionar</a>"+
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
		                    "<a class='btn btn-primary'>Seleccionar</a>"+
		                "</div>"+
		              "</div>"+
					"</div>" );
		});
	});
}

