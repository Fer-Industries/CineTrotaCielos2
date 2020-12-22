/**
 * 
 */

function aumentar(elementoSeleccionado){
	let resultado =elementoSeleccionado.children[1].children[4].children[0].children[1].children[0].value;
	let eleme =document.getElementsByName("elemento1");
	console.log(eleme);
	if(parseInt(resultado)+1>=99){
		console.log(resultado);
		elementoSeleccionado.children[1].children[4].children[0].children[1].children[0].value = 99;
	}else{
		resultado = parseInt(resultado)+1;
		console.log(resultado);
		elementoSeleccionado.children[1].children[4].children[0].children[1].children[0].value = resultado;	
	}
}

function agregarAlCarrito(elementoSeleccionado){
	console.log(elementoSeleccionado);
	let eleme =document.getElementsByName("elemento1");
	console.log(eleme);
	let vale =elementoSeleccionado.children[1].children[4].children[0].children[1].children[0].value;
	console.log(vale);
}

function disminuir(elementoSeleccionado){
	/*Validacion pattern solo numeros y tiene un error el pattern para validar los decimales asi que con solo poner charat funciona si se pone espacio en blanco 
	y luego el . marca error asi que ya esta*/
	let resultado =elementoSeleccionado.children[1].children[4].children[0].children[1].children[0].value;
	
	var reg = /^[\+\-]?\d*\.?\d+(?:[Ee][\+\-]?\d+)?$/;
	console.log(reg.test(resultado));
	console.log(resultado.charAt(0));
	if(reg.test(resultado) == false || resultado.charAt(0) == '.'){
			elementoSeleccionado.children[1].children[4].children[0].children[1].children[0].value = 0;
	}else{
		let eleme =document.getElementsByName("elemento1");
		console.log(eleme);
		
		if(parseInt(resultado)-1 < 1 || parseInt(resultado) > 99){
			console.log(resultado);
			elementoSeleccionado.children[1].children[4].children[0].children[1].children[0].value = 0;
		}else{
			resultado = parseInt(resultado)-1;
			console.log(resultado);
			elementoSeleccionado.children[1].children[4].children[0].children[1].children[0].value = resultado;	
		}	
	}
	//console.log("Resultado vale");
	//console.log(resultado);	
}

function out(elementoSeleccionado){
	let resultado =elementoSeleccionado.children[1].children[4].children[0].children[1].children[0].value;
	var reg = /^[\+\-]?\d*\.?\d+(?:[Ee][\+\-]?\d+)?$/;
	console.log(reg.test(resultado));
	console.log(resultado.charAt(0));
	if(reg.test(resultado) == false || resultado.charAt(0) == '.' || resultado < 1 || resultado > 99){
		if(resultado>99){
			elementoSeleccionado.children[1].children[4].children[0].children[1].children[0].value = 99;
		}else{
			elementoSeleccionado.children[1].children[4].children[0].children[1].children[0].value = 0;
		}
	}
}