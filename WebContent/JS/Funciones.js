/*
async function getCatalogo(){
	
	const respuesta = await fetch("http://localhost:8080/Cinema/CatalogoServlet");
	const jsonCatalogos = await respuesta.json();
	
	return jsonCatalogos;
	/*fetch("http://localhost:8080/Cinema/CatalogoServlet")
		.then(response =>{
			//console.log(response.json());
			return response.json();
		})
		.then(json =>{
			console.log(json);
		})
	;
}
console.log(getCatalogo());
getCatalogo()
	.then(jsonCatalogos => console.log(jsonCatalogos));*/

$.get("/Cinema/CatalogoServlet",function(response){
	console.log(response);
	response.listaSucursales.forEach(sucursal =>{
		console.log(sucursal);
		$("#inputCine").append("<option value="+sucursal.idSucursal+">"+sucursal.nombre+"</option>");
	});
	//
});

$.get("/Cinema/CatalogoServlet",function(response){
	console.log(response);
	response.listaFormatos.forEach(formato =>{
		console.log(formato);
		$("#inputFormato").append("<option value="+formato.idFormato+">"+formato.nombreFormato+"</option>");
	});
	//
});

$.get("/Cinema/CatalogoServlet",function(response){
	
	console.log(response);
	let bandera = 0;
	response.listaIdiomas.forEach(idioma=>{
		console.log(idioma);
		$("#idioma").append("<input id="+bandera+" type='radio' name='pamela' value="+idioma.ididioma+">"+idioma.nombre + "<br>");
		bandera++;
	});
});


$.get("/Cinema/CatalogoServlet",function(response){
	console.log(response);
	response.listaPeliculas.forEach(pelencontrada =>{
		console.log(pelencontrada);
		$("#inputPelicula").append("<option value="+pelencontrada.idPelicula+">"+pelencontrada.nombrePelicula+"</option>");
	});
	
});



   
let minimo;
let maximo;





$(document).ready(function() {
$('.noUi-handle').on('click', function() {
 $(this).width(50);
});
var rangeSlider = document.getElementById('slider-range');

rangeSlider.style.height = '8px';
rangeSlider.style.margin = '0 auto 3px';


var aproximateHour = function (mins)
{
var minutes = Math.round(mins % 60);
if (minutes == 60 || minutes == 0)
{
 return mins / 60;
}
return Math.trunc (mins / 60) + minutes / 100;
}


noUiSlider.create(rangeSlider, {
start : [800, 1080],
connect: true, 
orientation: 'horizontal', 
behaviour: 'tap-drag', 
step: 30,
tooltips: true,
range : {'min': 540, 'max': 1440},
format:  wNumb({
		decimals: 2,
 mark: ":",
		encoder: function(a){
    return aproximateHour(a);
   }
	}),
	  pips: {
		    mode : 'steps',  
		    format:  wNumb({
		    mark: ":",
		    decimals: 2,
				encoder: function(a ){
		        return aproximateHour(a);
		      }
				}),
		  	filter : filter_hour,
		  	stepped : true,
		    density:1
		  }
		});



 		function filter_hour(value, type) {
 		  return (value % 60 == 0) ? 1 : 0;
 		}
 		
rangeSlider.noUiSlider.on('update', function(values, handle) {
	  minimo=values[0];
	  maximo=values[1];
 document.getElementById('slider-range-value1').innerHTML = values[0];
 document.getElementById('slider-range-value2').innerHTML = values[1];
 
});
});


var day, month, year; 

function  idiomaseleccionado(){
	var elementos = document.getElementsByName("pamela");
	var register;
	var flag = 0;
	for(var i = 0; i< elementos.length;i++){
		if(elementos[i].checked){
			register = elementos[i].value; break;
			flag = 1;
		}
	}
	if(flag <= 0){
		register = 0;
	}
	return register;
}



document.getElementById("#fecha").addEventListener(onpageload,function(){
	var date = new date.getDate();
	var dia = date.getDate()+1; 
    var mes = date.getMonth() + 1; 
    var aniyear = date.getFullYear(); 
	document.getElementById("fecha").min(date);	
})
 
	
 

const enviarInfo=()=>{
	var date = new Date($('#fecha').val()); 
    day = date.getDate()+1; 
    month = date.getMonth() + 1; 
    year = date.getFullYear(); 
		 

 	let fechaselec = [day, month, year].join('/');
	console.log(fechaselec);
 	/*console.log([day, month, year].join('/')); */ 
	console.log(minimo);
	console.log(maximo);	 
	
	let idubicacion = document.getElementById("inputCine").value;
	console.log("id ubicacion"+idubicacion);
	
	let idformato = document.getElementById("inputFormato").value;
	console.log("id formato"+idformato);
	//console.log(document.getElementById("inputFormato"));
	//console.log(document.getElementById("idioma"));
	let ididioma =  idiomaseleccionado();	
	console.log ("id idoma: " + ididioma);
	let idpelicula = document.getElementById("inputPelicula").value;
	console.log("id pelicula"+ idpelicula);
	
	/* Fuente http://www.eslomas.com/2005/09/obtener-el-valor-de-un-radiobutton-seleccionado-con-javascript/ */
}

function infoOrden(){
	let customerVal = document.getElementById("busquedaCustomer").value;
	let requiredDate = document.getElementById("requiredDate").value;
	
	if(customerVal.length == 0){
		Swal.fire({
			icon:'error',
			text:'No ha escrito el cliente'
		});
		//impedir que siga la función corriendo después del if 
		return;
	}
	
	if(Idioma.length == 0){
		Idioma.value = 0;
	}
	// guardo el arreglo del tbody que regresa el jQuery
	let arregloTBody = $("#tbodySeleccionados");
	//DESPUÉS OBTENGO EL ARREGLO DE TR
	let arregloTR = arregloTBody[0].children;
	// estoy entrando a cada row de la tabla
	let arregloProductos = [];
	//push() agregar elementos a nuestro arreglo
	for(let tr of arregloTR){
		if(tr.children[4].textContent == 0){
			Swal.fire({
				icon:'error',
				text:'No ha indicado cantidad del producto ' + tr.children[1].textContent  
			});
			return;
		}else{
			let producto = {
				id:parseInt(tr.children[0].textContent,10),
				cantidad:parseInt(tr.children[4].textContent,10)
			};
			arregloProductos.push(producto);
		}
	}

	let infoOrder = {
		customer: customerVal,
		fechaReq:requiredDate,
		products:arregloProductos,
		horafinal:idioma
	};
	
	let ParametrosPel = {
		nombre : custemerVal
	}
	
	
	
	console.log(ParametrosPel);
	 $.ajax( {
         url: '/Cinema/BusquedaPeliculas',
         type: 'get',
         contentType:'application/json',
         data: { // EL ENVIO DEL JSON, PONEMOS EN LA PROPIEDAD person el valor convertido en JSON para jQuery 
        	 infoOrder: JSON.stringify(ParametrosPel)
         },
         success: function (response) {
        	 console.log(response);
        	 if(parseInt(response) > 0){
        		 Swal.fire({
            		 icon:'success',
            		 text:'Para seguimiento de la orden el id es ' + response
            	 });
        	 }else{
        		 Swal.fire({
            		 icon:'error',
            		 text:'Se produjo un error para generar la orden'
            	 });
        	 }
        	 
         }
     } );
}






