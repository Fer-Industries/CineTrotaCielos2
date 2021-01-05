let datosCatalogos;
Swal.fire('Espere por favor');
Swal.showLoading();

$.get("/Cinema/CatalogoDulceria",function(response){
	datosCatalogos = response;
	const opciones = datosCatalogos.opciones
	opciones.forEach(opcion=>{
		$("#opcProducto").append("<option value="+opcion.id+">"+opcion.nombre+"</option>");
	});
	
	let arregloCarrito = localStorage.getItem('ArregloCarrito');
	let arregloProductos= [];
	var longitudCarrito = 0;
	if(arregloCarrito != null){ //ya seleccionó un producto
		var arregloLocal = arregloCarrito;
		arregloProductos = JSON.parse(arregloLocal);
		longitudCarrito = arregloProductos.length;
		$("#cantidadProductos").html("");
		$("#cantidadProductos").html(longitudCarrito + ''); 
	}
	Swal.close();
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
			                "<img class='card-img-top' src='https://fer-industries.s3.amazonaws.com/Cinema/"+combo.img+"' alt='Card image cap'>"+
			                "<div class='card-body'>"+
			                    "<h5 class='card-title'>"+combo.nombre+"</h5>"+
			                    /*"<p>$"+combo.precio+"</p>"+*/
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
		                    /*"<p>$"+producto.precio+"</p>"+*/
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
	            	"<img class='' src='https://fer-industries.s3.amazonaws.com/Cinema/"+producto.img+"' alt='Card image cap'>"+
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
	            			"<button class='btn btn-success' onclick='confirmar("+JSON.stringify(producto)+")'>Confirmar</button>"+
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

function confirmar(producto){
	/*Se crea el producto a agregar en el carrito*/
	let productoSeleccionado={
			cantidad:0,
			id:'0',
			precio:0,
			nombre:''
	};
	productoSeleccionado.cantidad = parseInt(document.getElementById("valorCantidad").value);
	productoSeleccionado.id =producto.id+'';
	productoSeleccionado.precio = producto.precio;
	productoSeleccionado.nombre = producto.nombre;
	/*Se obtiene el arreglo de productos*/
	let arregloProductos = [];
	
	let arregloCarrito = localStorage.getItem('ArregloCarrito');
	var longitudCarrito = 0;
	if(arregloCarrito != null){ //ya seleccionó un producto
		var arregloLocal = arregloCarrito;
		arregloProductos = JSON.parse(arregloLocal);
		let contador = 0;
		arregloProductos.forEach(producto =>{
			if(producto.id == productoSeleccionado.id){
				producto.cantidad = producto.cantidad +productoSeleccionado.cantidad;
				contador++;
			}
		});
		if(contador == 0){
			arregloProductos.push(productoSeleccionado);
		}
	}else{ // no ha seleccionado nada 
		arregloProductos.push(productoSeleccionado);
	}
	
	localStorage.setItem('ArregloCarrito',JSON.stringify(arregloProductos));
	longitudCarrito = arregloProductos.length;
	
	console.log(localStorage.getItem('ArregloCarrito'));
	
	$("#cantidadProductos").html("");
	$("#cantidadProductos").html(longitudCarrito + ''); 
	$( ".overlay" ).removeClass("active");
	$( ".overlay" ).html("");
}

function cancelar(){
	$( ".overlay" ).removeClass("active");
	$( ".overlay" ).html("");
}

const carrito = () =>{
	// Se utilizo para saber en dónde se había quedado el usuario
	sessionStorage.setItem("paginaActual","carrito.jsp");
	window.location.href="Asientos.jsp";
	window.location.href='carrito.jsp';
};