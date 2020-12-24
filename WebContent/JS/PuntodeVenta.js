/**
 * https://es.stackoverflow.com/questions/113944/eliminar-objeto-en-javascript
 */
/*obtener los productos */
/*$.get("/Cinema/AdmonPeliculaInfo",function obtener(data){
	console.log("Se obtiene la informacion==========");
	arregloActual=data;
	crearTabla(arregloActual);
	data.map(function(x){
		arregloPeliculas.push(x);
	});
	//arregloPeliculas = Object.assing({},temp); solo funciona con ES6	
	console.log("Se termina de obtiener la informacion==========");	
}); */
  
let  arregloProductos=[
  {
    "id": "13",
    "producto": "Hot Dog",
    "imagen": "Img/AsientoG.png",
    "precio": 23,
	"unidad":"gr",
	"cantidad":0
  },
  {
	"id": "12",
    "producto": "Palomitas",
    "imagen": "Img/AsientoG.png",
    "precio": 45,
	"unidad":"pz",
	"cantidad":0
    /*"name": "Madame Uppercut",
    "age": 39,
    "secretIdentity": "Jane Wilson",
    "powers": [
      "Million tonne punch",
      "Damage resistance",
      "Superhuman reflexes"
    ] */
  },
  {
	"id": "14",
    "producto": "Refresco 600",
    "imagen": "Img/AsientoG.png",
    "precio": 48,
	"unidad":"pz",
	"cantidad":0
    /*"name": "Madame Uppercut",
    "age": 39,
    "secretIdentity": "Jane Wilson",
    "powers": [
      "Million tonne punch",
      "Damage resistance",
      "Superhuman reflexes"
    ] */
  }
]

function aumentar(elementoSeleccionado){
	let resultado =elementoSeleccionado.value;
	console.log(elementoSeleccionado);
	var reg = /^[\+\-]?\d*\.?\d+(?:[Ee][\+\-]?\d+)?$/;
	if(reg.test(resultado) == false || resultado.charAt(0) == '.'){
			elementoSeleccionado.value = 1;
	}else{
		if(parseInt(resultado)+1>=99){
			//console.log(resultado);
			elementoSeleccionado.value = 99;
		}else{
			resultado = parseInt(resultado)+1;
			//console.log(resultado);
			elementoSeleccionado.value = resultado;	
		}
	}
}

function disminuir(elementoSeleccionado){
	/*Validacion pattern solo numeros y tiene un error el pattern para validar los decimales asi que con solo poner charat funciona si se pone espacio en blanco 
	y luego el . marca error asi que ya esta*/
	let resultado =elementoSeleccionado.value;
	var reg = /^[\+\-]?\d*\.?\d+(?:[Ee][\+\-]?\d+)?$/;
	if(reg.test(resultado) == false || resultado.charAt(0) == '.'){
			elementoSeleccionado.value = 1;
	}else{
		if(parseInt(resultado)-1 < 1 || parseInt(resultado) > 99){
			//console.log(resultado);
			elementoSeleccionado.value = 1;
		}else{
			resultado = parseInt(resultado)-1;
			//console.log(resultado);
			elementoSeleccionado.value = resultado;	
		}	
	}
	//console.log("Resultado vale");
	//console.log(resultado);	
}

function out(elementoSeleccionado){
	let resultado =elementoSeleccionado.value;
	var reg = /^[\+\-]?\d*\.?\d+(?:[Ee][\+\-]?\d+)?$/;
	console.log(reg.test(resultado));
	console.log(resultado.charAt(0));
	if(reg.test(resultado) == false || resultado.charAt(0) == '.' || resultado < 1 || resultado > 99){
		if(resultado>99){
			elementoSeleccionado.value = 99;
		}else{
			elementoSeleccionado.value = 1;
		}
	}
}


$(function() { 
	arregloProductos.forEach(producto=> {
	$("#contenedorCartas").append(
		"<div class='col-4 mb-1' >"
			    +"<div id='"+"elemento"+producto.id+"' class='card'>"
			      +"<img src='"+producto.imagen+"' class='mx-auto rounded d-block'   width='100' height='100'>"
					
					+"<div class='card-body p-1'>"
					 +"<div class='d-inline-flex  bd-highlight'>"
						+"<h5 class='card-title ml-1'>Codigo: </h5><h6 id='"+"producto"+producto.id+"' class='mt-1 mx-1 text-decoration-underline'  card-title>"+producto.id	+"</h6>"
					 +"</div>"
					 +"<div class='d-inline-flex  bd-highlight'>"
					 	+"<h5 class='card-title ml-1'>Producto: </h5><h6  class='mt-1 mx-1 text-decoration-underline'  card-title>"+producto.producto	+"</h6>"
					 +"</div>"
			         +"<div class='d-inline-flex  bd-highlight'>"
						+"<h5 class='card-title ml-1'>Precio: </h5><h6  class='mt-1 mx-1 text-decoration-underline'  card-title>"+producto.precio+"</h6>"
					 +"</div>"	
					 +"<div class='d-inline-flex  bd-highlight'>"
						+"<h5 class='card-title ml-1'>Unidad: </h5><h6  class='mt-1 mx-1 text-decoration-underline'  card-title>"+producto.unidad+"</h6>"					
					 +"</div>"			
					+"<div class='container'>"
						 +"<div class='row'>"
				        	+"<div class='col-4 d-grid gap-2 d-md-flex justify-content-md-end'>"
				        		+"<button onclick='disminuir(cantidadTabla"+producto.id+")'  class='btn btn-primary '> <i class='fas fa-minus-square'></i></button>"
				        	+"</div>"
				        	+"<div class='col-4  text-center border border-primary'>"
				        	+"<input  id='"+"cantidadTabla"+producto.id+"'  onchange='out(cantidadTabla"+producto.id+")' class='cantidad border mt-1' min='1' max='99'  value='1'>" 
				        	+"</div>"
				        	+"<div class='col-4 container'>"
				        		+"<button onclick='aumentar(cantidadTabla"+producto.id+")' class='btn btn-primary'> <i class='fas fa-plus-square'></i></button>"
				        	+"</div>"
					     +"</div>"
					+"</div>"					 		       
			      +'</div>'
			    +"<button class='btn btn-success' onclick='agregarAlCarrito("+producto.id+")'>Agregar</button>"
			    +'</div>'
			  +'</div>'
		);
	});
	arregloProductos.forEach(w=>{
		console.log(w);
	});
});


/*Funcioneeees del caritooooooooooooooooooooooooooo */
let carro= [];

const carrito = (producto) =>{
		let bandera = 0;
		//console.log("h en arreglar carrito");
		//console.log(can);
		bandera = existente(producto)
		if(bandera == 0){
			arregloProductos.forEach(x=>{
				if(producto == x.id){
					carro.push(x);	
				}	
			});
			carro.forEach(produ =>{
				if(producto == produ.id){
					produ.cantidad=document.getElementById("cantidadTabla"+producto).value;
				}
			});	
			grantotal();
		}
		return bandera;
};
const existente = (producto) =>{
	console.log("Empieza existente");
	let bandera = 0;
	carro.forEach(produ =>{
			if(producto == produ.id){
				bandera=1;
			}	
		});
	console.log("Termina existente");
	return bandera
}
function agregarAlCarrito(elemento){
		console.log("Estoy en agregar al carrito");
		carrito(elemento);
		crearCarrito();
		console.log("Termina agregar al carrito");
}
 
function crearCarrito(){
	let i = 1;
	let list = document.getElementById("bodycarrito");
				while(list.hasChildNodes()){
			    	list.removeChild(list.firstChild);
			  	}
				carro.forEach(producto =>{
					$("#bodycarrito").append("<tr id='"+"carritoid"+producto.id+"'>"
				      +"<td class='text-center'><button class='btn btn-light' onclick='borrar("+producto.id+")'> <i class='fas fa-trash iconoBasura'></i> </button></td>"
				      +"<td scope='row'><img src='"+producto.imagen+"'  class='mx-auto rounded d-block' width=50 height=50 alt=Houston tenemos Problemas></td>"
				      +"<th>"+i+"</th>"
				      +"<td>"+producto.id+"</td>"
				      +"<td>"+producto.producto+"</td>"
				      +"<td>"
					  +"<input  id='"+"cantidadCarrito"+producto.id+"' onfocusout='actualizarCantidad("+producto.id+")' onchange='out(cantidadCarrito"+producto.id+")' class='cantidadCarrito border mt-1' min=1 max=99  value="+producto.cantidad+">" 				 		     
				      +"</td>"
				      +"<td><input id='"+"total"+producto.id+"' value="+producto.precio * producto.cantidad+"></td>"
				    +"</tr>"
					);
				i++;	
				});
}

function grantotal(){
	let supertotal = 0;
	console.log("estoy en gran total");
	console.log(carro);
	carro.forEach(total=>{
		supertotal= supertotal + total.precio*total.cantidad;
	})
	console.log(supertotal);
	document.getElementById("grantotal").value = supertotal;
	console.log("termina gran total");
};

function actualizarCantidad(id){
	console.log("Estoy en actualizar Cantidad");
	let total = document.getElementById("cantidadCarrito"+id).value;
	carro.forEach(produ =>{
		console.log("estoy comparando "+produ.id+"con "+id);
		if(id == produ.id){
			produ.cantidad=total;
			console.log("la nueva cantidad es");
			console.log(produ.total);
			console.log("voy a multiplicar"+ total +" por "+produ.precio);
			console.log(total * produ.precio);
			document.getElementById("total"+id).value = produ.cantidad * produ.precio;
		}		
	 });
grantotal();
}

function borrar(id){
	console.log("comienza borrar");
	console.log(carro);
	let i=0;
	let bandera= 0;
	carro.forEach(product=>{
		if(product.id = id){
			bandera =i;
		}
		i++;
	});
	console.log("bandera vale:");
	console.log(bandera);
	carro.splice(bandera,1); 
	
/*	let ids= [];
	carro.forEach(product=>{
		console.log(product);
		ids.push(product.id);
	});
	console.log(ids)
	console.log(id);
	const indexaBorrar = ids.indexOf(id);	
	
	console.log(indexaBorrar);
	if (indexaBorrar > -1) {
  		carro.splice(indexaBorrar, 1);
	} */	 
	 
	console.log("carro vale");
	console.log(carro);
	crearCarrito()
	console.log("Termina borrar");
	
}


/*Funcioneeees del caritooooooooooooooooooooooooooo */

/*
 ir te de viaje cancun  
 */