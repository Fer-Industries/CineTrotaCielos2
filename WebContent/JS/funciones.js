let peliculajson;
Swal.fire({
	text:'Espere por favor'
});
Swal.showLoading();
$.get("/Cinema/CatalogoServlet",function(response){
	console.log(response);
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

$("#buscar").on("click",function(){
	Swal.fire({
		text:'Obteniendo datos'
	});
	Swal.showLoading();
	//CAMEL CASE
	$("#funcionesEncontradas").html("");
	let fechaselec;
	var date = new Date($('#fecha').val());
	console.log("fecha solita"+ date);
	if(date == "Invalid Date") {
		date = enviarfecha();
		day = date.getDate();
		month = date.getMonth()+1;	
		year = date.getFullYear();
		fechaselec = [year,month,day].join('/');
		console.log("La fecha default es el dia de hoy "+ fechaselec);
	}
	else{
		day = date.getDate(); 
	    month = date.getMonth() + 1; 
	    year = date.getFullYear();
		fechaselec = [year,month,day].join('/'); 	
	} 
	
	let idubicacion = document.getElementById("inputCine").value;
	
	let idformato = document.getElementById("inputFormato").value;
	
	let ididioma =  idiomaseleccionado();	
	
	let idpelicula = document.getElementById("inputPelicula").value;
	
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
                                       "<button type='button' id='btnfuncion' onclick='disponibilidad("+pelicula.idFuncion+")'class='btn btn-dark btn-lg donwload-buttons'>" +
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
		
function disponibilidad(idFuncioon){
	Swal.fire({
		text:'Verificando cupo'
	});
	Swal.showLoading();
	$.ajax({ //jQuery, es una libreria de javascript
         url: '/Cinema/CupoSala', // a que servidor vamos a llamar
         type: 'get',
		 contentType:'text/plain', // el tipo de información que s e va a enviar
         data: { 
        	 enviarInfo: idFuncioon  // la información que se va a enviar
         },
         success: function(cupo) { // es la response del Servlet, que al final del día es si hay o no asientos disponibles
			if(cupo == 1){
				Swal.fire({
					icon:"error",
	  				title: 'Lo sentimos la sala ya esta llena',
	  				showClass: {
	    				popup: 'animate__animated animate__fadeInDown'
	  				},
	  				hideClass: {
	    				popup: 'animate__animated animate__fadeOutUp'
	  				}
				});
			}	 
			else{
				peliculajson.forEach(pel=>{
					if(pel.idFuncion == idFuncioon){			
						// para pasar la información que había elegido
						sessionStorage.setItem("diafune", pel.diaFuncion);
						sessionStorage.setItem("imagene", pel.imagen);
						sessionStorage.setItem("formatoe", pel.nombreFormato);
						sessionStorage.setItem("pele", pel.nombrePel);
						sessionStorage.setItem("sucursale", pel.nombreSuc);
						sessionStorage.setItem("horae", pel.horaFuncion);
						sessionStorage.setItem("idiomae", pel.nombreIdioma);
						return;
					} 
				});	
				sessionStorage.setItem("funcion",idFuncioon);
				// Se utilizo para saber en dónde se había quedado el usuario
				sessionStorage.setItem("paginaActual","Asientos.jsp");
				window.location.href="Asientos.jsp";
			}
         }
     });
	 Swal.close(); 
};
   
let minimo;
let maximo;


$(document).ready(function() {
	$('.noUi-handle').on('click', function(){
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
start : [540, 1320],
connect: true, 
orientation: 'horizontal', 
behaviour: 'tap-drag', 
step: 30,
tooltips: true,
range : {'min': 540, 'max': 1320},
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
	let d = new Date();
	let dd = d.getDate();
	let currMonth = d.getMonth();
	let currYear = d.getFullYear();
	let hoy = new Date(currYear, currMonth, dd);                      
	return hoy;
}

$(function() {
	$("#fecha").datepicker({ minDate: 0});
	$("#fecha").datepicker("setDate", enviarfecha());
});