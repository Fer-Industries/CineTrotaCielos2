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
Swal.fire({
	text:'Espere por favor'
});
Swal.showLoading();
$.get("/Cinema/CatalogoServlet",function(response){
	response.listaSucursales.forEach(sucursal =>{
		console.log(sucursal);
		$("#inputCine").append("<option value="+sucursal.idSucursal+">"+sucursal.nombre+"</option>");
	});
	
	response.listaFormatos.forEach(formato =>{
		console.log(formato);
		$("#inputFormato").append("<option value="+formato.idFormato+">"+formato.nombreFormato+"</option>");
	});
	let bandera = 0;
	response.listaIdiomas.forEach(idioma=>{
		console.log(idioma);
		$("#idiomas").append("<input id="+bandera+" type='radio' name='languages' value="+idioma.ididioma+"><label for='"+bandera+"'>"+idioma.nombre +"</label><br>");
		bandera++;
	});
	response.listaPeliculas.forEach(pelencontrada =>{
		console.log(pelencontrada);
		$("#inputPelicula").append("<option value="+pelencontrada.idPelicula+">"+pelencontrada.nombrePelicula+"</option>");
	});
	Swal.close();
});


/*
$("#btnfuncion").on("click",function(){
	console.log("event listener btnfuncion");
});*/

let peliculajson;

$("#buscar").on("click",function(){
	Swal.fire({
		text:'Obteniendo datos'
	});
	Swal.showLoading();
	//CAMEL CASE
	$("#funcionesEncontradas").html("");
	var date = new Date($('#fecha').val()); 
    day = date.getDate() ; 
    month = date.getMonth() + 1; 
    year = date.getFullYear(); 
	
	console.log(document.getElementById("fecha"));
 	let fechaselec = [year,month,day].join('/');
	
	console.log("yo soy la fecha que selecciono :" + fechaselec);
	
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
	console.log ("id idioma: " + ididioma);
	
	let idpelicula = document.getElementById("inputPelicula").value;
	console.log("id pelicula"+ idpelicula);
	//CAMEL CASE
	let ParametrosPel = {
		idPelicula: idpelicula,
		idSucursal: idubicacion,
		horaInicio: minimo,
		diaFuncion: fechaselec,
		idFormato: idformato,
		idIdioma:ididioma,
		horaFinal:maximo
	}
	 $.ajax( {
         url: '/Cinema/BusquedaPelicula',
         type: 'get',
         contentType:'application/json',
         data: { 
        	 enviarInfo: JSON.stringify(ParametrosPel)
         },
         success: function (peliculas) {
			 peliculajson = peliculas;
        	 console.log(peliculas); 
			 console.log(peliculajson);
        	 peliculas.forEach(pelicula=>{
     			$("#funcionesEncontradas").append("<div class='margeniz mb-3' style='max-width: 540px;'>"+
                           "<div class='row no-gutters'>"+
                               "<div class='col-md-4'>"+
                                   "<img src='https://fer-industries.s3.amazonaws.com/Cinema/"+pelicula.imagen+"'  id='imagenEncontrada' class='card-img sombra'>"+
                               "</div>"+
                               "<div class='col-md-8'>"+
                                   "<div class='card-body'>"+
                                       "<h5 class='card-title'>"+pelicula.nombrePel+"</h5>"+
                                       "<p class=\"card-text\">"+pelicula.nombreIdioma+"</p>"+
                                       "<p class='card-text'>"+pelicula.nombreFormato+"</p>"+
                                       "<p class='card-text'>"+pelicula.horaFuncion+"</p>"+
									   "<p class='card-text'>"+pelicula.idFuncion+"</p>"+
                                       "<button type='button' id='btnfuncion' onclick='disponibilidad()' value="+pelicula.idFuncion +" class='btn btn-dark btn-lg donwload-buttons'>" +
                                       		"<i class='fas fa-ticket-alt'></i>Boletos</button>"+
                                   "</div>"+
                               "</div>"+
                           "</div>"+
                      	"</div><hr>");
     		});
         }
     } );
	 Swal.close();
});
		
function disponibilidad(){
	console.log(document.getElementById("btnfuncion").value);
	let idFun = document.getElementById("btnfuncion").value;
	let diafune;
	let imagene;
	let formatoe;
	let pele;
	let sucursale;
	let horae;
	let idiomae;
	
	let parametroFuncion ={
		idFuncion: idFun
	} 
	Swal.fire({
		text:'Verificando cupo'
	});
	Swal.showLoading();
	$.ajax({
         url: '/Cinema/CupoSala',
         type: 'get',
         contentType:'application/json',
         data: { 
        	 enviarInfo: JSON.stringify(parametroFuncion)
         },
         success: function(cupo) {
         	console.log(cupo);
			if(cupo = 1){
				Swal.fire({
	  				title: 'Lo sentimos la sala ya esta llena',
					type: "warning",
	  				showClass: {
	    				popup: 'animate__animated animate__fadeInDown'
	  				},
	  				hideClass: {
	    				popup: 'animate__animated animate__fadeOutUp'
	  				}
				});
			}	 
			else{
				let informacion; 
				peliculajson.forEach(pel=>{
					if(pel.idFuncion = idFun){
						informacion = {
						diafune = pel.diaFuncion,
						imagene = pel.imagen,
						formatoe = pel.nombreFormato,
						pele = pel.nombrePel,
						sucursale = pel.nombreSuc,
						horae = pel.horaFuncion,
						idiomae = pel.nombreIdioma
						}
					 break;
					} 
				 });				
				$.ajax( {
					 url: '/Cinema/AsientosController',
			         type: 'get',
			         contentType:'application/json',
			         data: { 
			        	 enviarInfo: JSON.stringify(informacion)
			         }
				});
				window.location.href ="/Cinema/Asientos.jsp";
			}
         }
     });
	 Swal.close(); 
	
	
};
   
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
			register = elementos[i].value; 
			flag = 1;
			break;
		}
	}
	if(flag <= 0){
		register = 0;
	}
	return register;
}



let enviarfecha=()=>{
var hoy = new Date();
var dd = hoy.getDate();
var mm = hoy.getMonth()+1;
var yyyy = hoy.getFullYear();
hoy = yyyy+'/'+mm+'/'+dd;
console.log("Desde loasbody"+ hoy);
return hoy;

}


$(function() {
$("#fecha").datepicker({ minDate: 0 });
});
