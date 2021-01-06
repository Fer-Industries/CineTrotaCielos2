/**
 * https://es.stackoverflow.com/questions/113944/eliminar-objeto-en-javascript
 */
/*obtener los productos */

let  arregloProductos=[];
$.get("/Cinema/PuntoDeVenta",function (data){
	console.log("Se obtiene la informacion==========");
	arregloProductos=JSON.parse( JSON.stringify(data) );
	arregloProductos.forEach(produc=>{
		produc.cantidad=0;
	});
	crearTablaProductos(arregloProductos);	
	console.log("Se termina de obtiener la informacion==========");	
}); 
 
function aumentar(elementoSeleccionado){
	const cantidadTabla = document.getElementById("cantidadTabla"+elementoSeleccionado.id);
	const cantidadCarrito = document.getElementById("cantidadCarrito"+elementoSeleccionado.id);
	let resultado =cantidadTabla.value; 
	console.log(elementoSeleccionado);
	const reg = /^[\+\-]?\d*\.?\d+(?:[Ee][\+\-]?\d+)?$/;
	if(reg.test(resultado) == false || resultado.charAt(0) == '.'){
			cantidadTabla.value = 1;
			if(cantidadCarrito != null){
				cantidadCarrito.value = 1;
			}
	}else{
		if(parseInt(resultado)+1>=99){
			//console.log(resultado);
			cantidadTabla.value  = 99;
			if(cantidadCarrito != null){
				cantidadCarrito.value = 99;
			}
		}else{
			resultado = parseInt(resultado)+1;
			//console.log(resultado);
			cantidadTabla.value = resultado;
			if(cantidadCarrito != null){
				cantidadCarrito.value = resultado;
			}	
		}
	}
	actualizarCantidad(elementoSeleccionado.id);
}
function disminuir(elementoSeleccionado){
	/*Validacion pattern solo numeros y tiene un error el pattern para validar los decimales asi que con solo poner charat funciona si se pone espacio en blanco 
	y luego el . marca error asi que ya esta*/
	const cantidadTabla = document.getElementById("cantidadTabla"+elementoSeleccionado.id);
	const cantidadCarrito = document.getElementById("cantidadCarrito"+elementoSeleccionado.id);
	let resultado =cantidadTabla.value;
	const reg = /^[\+\-]?\d*\.?\d+(?:[Ee][\+\-]?\d+)?$/;
	if(reg.test(resultado) == false || resultado.charAt(0) == '.'){
			cantidadTabla.value = 1;
			if(cantidadCarrito != null){
				cantidadCarrito.value = 1;	
			}
	}else{
		if(parseInt(resultado)-1 < 1 || parseInt(resultado) > 99){
			//console.log(resultado);
			cantidadTabla.value = 1;
			if(cantidadCarrito != null){
				cantidadCarrito.value = 1;
			}
		}else{
			resultado = parseInt(resultado)-1;
			//console.log(resultado);
			cantidadTabla.value = resultado;	
			if(cantidadCarrito != null){
				cantidadCarrito.value = resultado;
			}	
		}	
	}
	//console.log("Resultado vale");
	//console.log(resultado);	
	actualizarCantidad(elementoSeleccionado.id);
}
function out(elementoSeleccionado){
	let resultado =elementoSeleccionado.value;
	let bandera = 0;
	const reg = /^[\+\-]?\d*\.?\d+(?:[Ee][\+\-]?\d+)?$/;
	console.log(reg.test(resultado));
	console.log(resultado.charAt(0));
	if(reg.test(resultado) == false || resultado.charAt(0) == '.' || resultado < 1 || resultado > 99){
		if(resultado>99){
			elementoSeleccionado.value = 99;
			bandera= 1;
		}else{
			elementoSeleccionado.value = 1;
			bandera = 2;
		}
	}
	return bandera;
}
/*$(function(){
	arregloProductos.forEach(produc=>{
		produc.cantidad=0;
	});
	crearTablaProductos(arregloProductos);
});	*/	
function crearTablaProductos(nuevaTabla){ 
	console.log(document.getElementsByName("contene"));
	let list = document.getElementById("contenedorCartas");
	console.log(nuevaTabla);
	while(list.hasChildNodes()){
    	list.removeChild(list.firstChild);
  	}	
	nuevaTabla.forEach(producto=> {
	$("#contenedorCartas").append(
			"<div  id='"+"elemento"+producto.id+"' class='card'>"
			    +"<div class='card-body'>"
			  	+ "<h5 class='card-title'>"+producto.nombre+"</h5>"
				+  "<p class='card-text'><b> Codigo: </b> "+ producto.id+"</p>"
				+  "<p class='card-text'><b> Precio: </b> "+producto.precio+"</p>"
				 +"<div class='row'>"
			        	+"<div class='col-4 d-grid gap-2 d-md-flex justify-content-md-end'>"
			        		+"<button onclick='disminuir("+JSON.stringify(producto)+")'  class='btn btn-primary '> <i class='fas fa-minus-square'></i></button>"
			        	+"</div>"
			        	+"<div class='col-4  text-center '>"
			        	+"<input  id='cantidadTabla"+producto.id+"'  onchange='out(cantidadTabla"+producto.id+")' class='cantidad mt-1' min='1' max='99'  value='1'>" 
			        	+"</div>"
			        	+"<div class='col-4 container'>"
			        		+"<button onclick='aumentar("+JSON.stringify(producto)+")' class='btn btn-primary'> <i class='fas fa-plus-square'></i></button>"
			        	+"</div>"
				     +"</div>"
				+"</div>"					 		       
				+"<button class='btn btn-secondary' onclick='agregarAlCarrito("+JSON.stringify(producto)+")'><i class='fas fa-plus-square'></i> Agregar</button>"
		  	+"</div>" 
		);
	});
	nuevaTabla.forEach(w=>{
		console.log(w);
	});
}
/*Funcioneeees del caritooooooooooooooooooooooooooo */
/*variable global que se va a estar jugando con el carro */
let carro= [];

const carrito = (producto) =>{
/* 
	metodo llamado carrito el cual recibe el id del producto que se quiere agregar al carrito y este lo que hace es 
	del arreglo que se recibe ce la BD compara que el id exista y si existe lo setea al Arreglo global carro 
	y tambien se le asigna la cantidad que se ordena de ese producto
 */
		arregloProductos.forEach(x=>{
			if(producto == x.id){
				carro.push(x);	
			}	
		});
		actualizarCantidadCarro(producto);
		grantotal();
};
const actualizarCantidadCarro = (producto)=>{
	carro.forEach(produ =>{
			if(producto == produ.id){
				produ.cantidad=document.getElementById("cantidadTabla"+producto).value;
			}
	});	
}
const existente = (producto) =>{
/*metodo que sirve para saber si el producto que se quiere agregar ya se encuentra en el arreglo globar carro
  o si este esta vacio si este esta vacio o si ya se encuentra el producto se regresara una bandera = 1 lo cual indica 
  que no se debe de hacer nada.
 */
	console.log("Empieza existente");
	let bandera = 0;
	//console.log(carro.length);
	//console.log(carro);
	if(carro.length > 0){
		carro.forEach(produ =>{
			if(producto == produ.id){
				bandera=1;
			}	
		});
	console.log("Termina existente");	
	}
	return bandera;
}
function agregarAlCarrito(elemento){
/*
  Esta funcion se manda a llamar en las cards y recibe como parametro el id del producto a agregar al carrito 
  este lo que hace es invocar a existente lo cual nos dira si se debe de agregar o no 0 significa agregar
  si se agrega se manda a llamar el metodo carrito para agregarlo al arreglo global y crearCarrito para crear la tabla del nuevo carro
 */
		console.log("Estoy en agregar al carrito");
		let bandera = existente(elemento.id);
		if(bandera == 0){
			carrito(elemento.id);
			crearCarrito(carro);
		}
		console.log("Termina agregar al carrito");
}
function crearCarrito(nuevocarro){
	/*
	Este metodo lo que hace es crear en bodycarrito los productos que se encuentren en el arreglo que recibe como parametro 
	tambien borra lo que ya existia con anterioridad en bodycarro. 
	*/
	let i = 1;
	let list = document.getElementById("bodycarrito");
		while(list.hasChildNodes()){
	    	list.removeChild(list.firstChild);
	  	}
		nuevocarro.forEach(producto =>{
			$("#bodycarrito").append("<tr id='"+"carritoid"+producto.id+"'>"
		      +"<th>"+i+"</th>"
			  +"<td class='text-center'><button class='btn btn-light' onclick='borrar("+JSON.stringify(producto)+")'> <i class='fas fa-trash iconoBasura'></i> </button></td>"
		      +"<td scope='row'>$ "+producto.precio+"</td>"
		      +"<td>"+producto.id+"</td>"
		      +"<td>"+producto.nombre+"</td>"
		      +"<td>"
			  +"<input  id='"+"cantidadCarrito"+producto.id+"' onfocusout='actualizarCantidad("+producto.id+")' onchange='out(cantidadCarrito"+producto.id+")' class='cantidadCarrito border mt-1' min=1 max=99  value="+producto.cantidad+">" 				 		     
		      +"</td>"
		      +"<td><input id='"+"total"+producto.id+"'  value="+producto.precio * producto.cantidad+" disabled></td>"
		    +"</tr>"
		);
		i++;	
	});
}
/*Buscadooooor */
$("#buscador").on("keyup",function(){
	console.log("Empieza la funcion buscador+++++++++++");
	let parametro = document.getElementById("buscador").value;
	if(parametro.length == 0){
		crearTablaProductos(arregloProductos);
	}else{
	let coincidentes = arregloProductos.filter(producto=>{
			const expRegular = new RegExp(`^${parametro}`,'gi'); // i para ignorar mayusculas y minusculas
			return producto.nombre.match(expRegular) || producto.id.match(expRegular);
		}
	);
	crearTablaProductos(coincidentes);	
	}
	
});
/*Buscadooooor */
function grantotal(){
	/* 
	  Este metodo lo que hace es del arreglo global carro 
	  voy obtener el total de cada producto que se encuentra en el arreglo carro 
	  y se van a sumar a la variable supertotal que es lo que hace que tenga la suma general
	  y  al valor de supertotal se le asigna como valor al elemento html grantotal
	*/
	let supertotal = 0;
	console.log("estoy en gran total");
	console.log(carro);
	carro.forEach(total=>{
		supertotal= supertotal + total.precio*total.cantidad;
	})
	document.getElementById("grantotal").value = supertotal;
	console.log("termina gran total");
};
function actualizarCantidad(id){
	/*
	Se manda a llamar en el evento onfocusout del elemento html  input relacionado al id del producto
	esto va a obtener el valor que se encuentre en el input cantidadCarritoid id se sustituye por el id del producto
	donde los ids coincidan en el arreglo carro se va a cambiar la cantidad del carro a la nueva cantidad que es total
	y luego en en el input totalid id se sustituye se va a setar el nuevo valor. 
	 */
	console.log("Estoy en actualizar Cantidad");
	const cantidadCarrito = document.getElementById('cantidadCarrito'+id);
	const cantidadTabla = document.getElementById("cantidadTabla"+id);
	const elementoTotal = document.getElementById("total"+id);
	if(cantidadCarrito != null){
	let total = cantidadCarrito.value;
		cantidadTabla.value=total;
		carro.forEach(produ =>{
			if(id == produ.id){
				produ.cantidad=total;
				elementoTotal.value = produ.cantidad * produ.precio;
			}		
		 });
		grantotal();	
	}	
	console.log("Termina actualizar cantidad");
}
function borrar(id){
/*	borra el elemento del html bodycarrito y tambien del arreglo global carro
	pero se hace trampa ya que no se borra en realidad se hace un nuevo arreglo llamado n */
	console.log("comienza borrar");
	let n = carro.filter(producto=>{
		if(producto.id != id.id){
			return producto;
		}
	}) ;
	carro = n;
	crearCarrito(n);
	grantotal();
	console.log("Termina borrar");
}
/*Funcioneeees del Terminaa caritooooooooooooooooooooooooooo */
/*Funcioneeeeessss del total inician */
$("#confirmarPedido").on("click",function(){
	console.log("el carrito acutal es ");
	console.log(carro);
});

/*let  arregloProductos=[
  {
    "id": "13",
    "producto": "Hot Dog",
    "imagen": "Img/AsientoG.png",
    "precio": 23,
	"unidad":"gr",
  },
  {
	"id": "12",
    "producto": "Palomitas",
    "imagen": "Img/AsientoG.png",
    "precio": 45,
	"unidad":"pz",
  },
  {
	"id": "14",
    "producto": "Refresco 600",
    "imagen": "Img/AsientoG.png",
    "precio": 48,
	"unidad":"pz",

  },
  {
	"id": "1",
    "producto": "Refresco grande",
    "imagen": "Img/AsientoG.png",
    "precio": 68,
	"unidad":"pz",
  }
]
*/