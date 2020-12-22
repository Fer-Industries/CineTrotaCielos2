/**
 * 
 */

function aumentar(id){
	let resultado = document.getElementById("idcantidad"+id).value;
	if(parseInt(resultado)+1>=99){
		console.log(resultado);
		document.getElementById("idcantidad"+id).value = 99;
	}else{
		resultado = parseInt(resultado)+1;
		console.log(resultado);
		document.getElementById("idcantidad"+id).value = resultado;	
	}
}

function agregarAlCarrito(){
	
}

function disminuir(id){
	let resultado = document.getElementById("idcantidad"+id).value;
	
	if(parseInt(resultado)-1<=0){
		console.log(resultado);
		document.getElementById("idcantidad"+id).value =0 ;
	}else{
		resultado = parseInt(resultado)-1;
		console.log(resultado);
		document.getElementById("idcantidad"+id).value = resultado;	
	}
	
	
}