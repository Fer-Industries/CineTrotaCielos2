/*referencia de los dioses 
https://www.etnassoft.com/2013/10/15/copiando-arrays-y-objetos-en-javascript/
 */
 
let arregloActual = []; // es el arreglo actual
let arregloPeliculas = [];
 $.get("/Cinema/AdmonPeliculaInfo",function obtener(data){
	console.log("Se obtiene la informacion==========");
	arregloPeliculas=JSON.parse( JSON.stringify(data) );
	arregloActual=JSON.parse( JSON.stringify(data) );
	crearTabla(data);	
	//arregloPeliculas = Object.assing({},temp); solo funciona con ES6	
	console.log("Se termina de obtiener la informacion==========");	
}); 

$("#salir").on("click",function(){});//aqui va el log out 

/*Busca las peliculas pero en el arreglo que se obtuvo al cargar por primera vez la pagina */
$("#buscador").on("keyup",function(){
	console.log("Empieza la funcion buscador+++++++++++");
	let parametro = document.getElementById("buscador").value;
	let coincidentes = arregloPeliculas.filter(pelicula =>{
			const expRegular = new RegExp(`^${parametro}`,'gi'); // i para ignorar mayusculas y minusculas
			return pelicula.nombrePelicula.match(expRegular) || pelicula.clasificacionPeliculas.match(expRegular);
		}
	);
	crearTabla(coincidentes);
	arregloActual=JSON.parse( JSON.stringify(coincidentes));
});

$("#inputBuscar").on("click",function(){
	let parametro = document.getElementById("buscador").value;
	let coincidentes = arregloPeliculas.filter(pelicula =>{
			const expRegular = new RegExp(`^${parametro}`,'gi'); // i para ignorar mayusculas y minusculas
			return pelicula.nombrePelicula.match(expRegular) || pelicula.clasificacionPeliculas.match(expRegular);
		}
	);
	arregloActual=JSON.parse( JSON.stringify(coincidentes) );
	
});

/* LLena la tabla con la informacion de las peliculas y recibe un parametro que es un arreglo*/

const crearTabla =(arreglo)=>{
	const a = arreglo;
	//console.log(a);
	//console.log("Empieza la funcion crearTabla----------");
	//console.log(document.getElementsByName("catpelicula"));
	let list = document.getElementById("catpelicula");
	while(list.hasChildNodes()){
    	list.removeChild(list.firstChild);
  	}	
	arreglo.forEach(pelicula=>{
		$("#catpelicula").append("<tr  id="+pelicula.idPelicula+" name="+pelicula.idPelicula+"><th scope='row'>"+pelicula.idPelicula+"</th>"
		+"<td><input id='"+"inputNombre"+pelicula.idPelicula+"'  onchange=diferente("+pelicula.idPelicula+") value='"+pelicula.nombrePelicula+"'></td>"
		+"<td> <input onchange=diferente("+pelicula.idPelicula+") value='"+pelicula.clasificacionPeliculas+"' ></td>"
		+"<td> <input onchange=diferente("+pelicula.idPelicula+") value='"+pelicula.duracionPelicula+"'></td>"
		+"<td><input onchange=diferente("+pelicula.idPelicula+") type='date' value="+pelicula.fechaEstreno+"></td>"
		+"<td> <img  class='img-radious ' width='250px' height='150px' src='https://fer-industries.s3.amazonaws.com/Cinema/"+ pelicula.imagenPelicula+"'>"
			+" <button class='mt-1 btn btn-info' style='width:250px'  onclick='showEditImagen("+"editImagenpelicula"+pelicula.idPelicula+")' id='btneditarImagen'>Editar</button> "
			+" <div   id="+"editImagenpelicula"+pelicula.idPelicula+"  style='display: none'>"
			+" <img id='"+pelicula.idPelicula+"newImagen' class='rounded mx-auto d-block my-1' src=''  width='250' height='150'>  "
			+" <input type='file' id="+pelicula.idPelicula+"p"+" onchange=diferente("+pelicula.idPelicula+")  onclick='myFunction("+pelicula.idPelicula+")'  accept='image/*' multiple> </div>"
		+" </td>"
		+"<td> <button onclick='elmininar("+pelicula.idPelicula+")' class='btn btn-secundary'><i class='fas fa-trash coloricono '></i></button></td>"
		+"<td> <button onclick='editar("+pelicula.idPelicula+")' class='btn btn-secundary'><i class='fas fa-edit coloricono '></i></button></td> "
		+"<td> <button onclick='reestablecer("+pelicula.idPelicula+")' class='btn btn-secundary'><i class='fas fa-redo-alt coloricono'></i> </td> </tr>"
		);
	});
	console.log("Termina la funcion crearTabla----------");
	return arreglo;
}

const  reestablecer = (identificador) =>{
	console.log("Empezo la funcion reestablecer");
	console.log(document.getElementsByName(identificador));
	Swal.fire({
		  title: '<strong>Seguro quieres Reestrablecer los valores</strong>',
		  icon: 'info',
		  html:
		    'Se sustituiran los valores por los valores por defecto',
		  showCloseButton: true,
		  showCancelButton: true,
		  focusConfirm: false,
		  confirmButtonText:
		    'Si!',
		  cancelButtonText:
		    'Cancelar'
	}).then((result) => {
		if (result.isConfirmed) {
			console.log(arregloPeliculas);
			let elemento = document.getElementById(identificador);
			elemento.style.background="white";
			arregloPeliculas.map(pelicula=>{
				if(identificador == pelicula.idPelicula){
					elemento.children[1].children[0].value = pelicula.nombrePelicula;
					elemento.children[2].children[0].value = pelicula.clasificacionPeliculas;
					elemento.children[3].children[0].value = pelicula.duracionPelicula;
					elemento.children[4].children[0].value = pelicula.fechaEstreno;
					elemento.children[5].children[2].children[0].src = "";
					elemento.children[5].children[2].children[1].value = "";
					elemento.children[5].children[2].style.display='none';
					
				}
			});
		}
	});
	console.log("Termino la funcion reestablecer");
}
function showEditImagen(editar){
	if (editar.style.display === 'block') {
    	editar.style.display = 'none';
  	} else {
    editar.style.display = 'block';
  }
};


//Función para actualizar cada 5 segundos(5000 milisegundos)
function  myTimer() {
 location.reload(); 
}
/*Se declara un arreglo de 6 posiciones 
la 0 es nombre 
la 1 es la imagen
la 2 estreno
la 3 la duracion 
la 4 la clasificacion
la 5 es para saber si si tenemos un cambio;
 */


const diferente =   (id)=>{
	console.log("Empieza la funcion diferente*************");
	let arreglo =[null,null,null,null,null,0];
	let elemento =document.getElementById(id);
	console.log("Voy a ver si es diferente");
	console.log("arreglo actual");
	console.log(arregloActual);
	console.log("Arreglo fijo");	
	console.log(arregloPeliculas);
	arregloPeliculas.map(ap=>{
		if(ap.idPelicula == id){
			arregloActual.forEach(act=>{
				if(act.idPelicula == id){
					let nombre = elemento.children[1].children[0].value;
					let clasificacion = elemento.children[2].children[0].value;
					let duracion = elemento.children[3].children[0].value;
					let fechaEstreno =elemento.children[4].children[0].value;
					let imagen;
					if( elemento.children[5].children[2].children[1].files[0]){
						imagen=elemento.children[5].children[2].children[1].files[0].name;	
					}else{
						imagen =ap.imagenPelicula;
					}
					if(imagen != ap.imagenPelicula){
						arreglo.fill(imagen,1,2);
						arreglo.fill(1,5,6);
						act.imagenPelicula = imagen;
					}
					if(fechaEstreno != ap.fechaEstreno){
						arreglo.fill(fechaEstreno,2,3);
						arreglo.fill(1,5,6);
						act.fechaEstreno = fechaEstreno;
					}	
					if(duracion != ap.duracionPelicula ){
						arreglo.fill(1,5,6);
						arreglo.fill(duracion,3,4);
						act.duracionPelicula = duracion;
					}
					if(clasificacion != ap.clasificacionPeliculas){
						arreglo.fill(1,5,6);
						arreglo.fill(clasificacion,4,5);
						act.clasificacionPeliculas = clasificacion;
					}
					if(nombre != ap.nombrePelicula){
						arreglo.fill(1,5,6);
						arreglo.fill(nombre,0,1);
						act.nombrePelicula = nombre;
					}
				}
			});
		}
	});	
	if(arreglo[5] == 0){
		elemento.style.background="white";
	}else{
		elemento.style.background="#eeffe6";
	}
	console.log("termina la funcion diferente*************");
return arreglo;
}
function editar(identificador){
	let arreglo =diferente(identificador);
	let encontrado = []
	arregloPeliculas.forEach(x=>{
		if(x.id= identificador){
			encontrado.push(x);
		}
	})
	console.log(document.getElementsByName(identificador));
	if(arreglo[5] > 0){
	let	info={
		 	infoidPelicula: identificador,
		 	nombrePelicula: arreglo[0],
		 	clasificacionPeliculas: arreglo[2],
		 	duracionPelicula: arreglo[3],
		 	fechaEstreno: arreglo[4],
		 	imagenPelicula: arreglo[1]
		}
		for(let i = 0;i < arreglo.length;i++){
			if(arreglo[i] == null)
				arreglo[i] = "Sin cambios";
		}
		console.log(arreglo);
		Swal.fire({
			title: 'Seguro que desea realizar los siguientes cambios',
			html:  '<table class="text-left" id="tableAler">'
				+'<thead>'
					+'<th>Concepto</th>'
					+'<th class="ml-3">Actual</th>'
					+'<th class="ml-3">Cambio</th>'
				+'</thead>'
				+'<tbody class="ml-1">'
					+'<tr>'
						+'<td><b>Nombre</b></td>'
						+'<td>'+encontrado[0].nombrePelicula+'</td>'
						+'<td>'+arreglo[0]+'</td>'
					+'</tr>'
					+'<tr>'
			          	+'<td><b>Clasificacion</b></td>'
						+'<td>'+encontrado[0].clasificacionPeliculas+'</td>'
						+'<td>'+arreglo[2]+'</td>'
					+'</tr>'
				  	+'<tr>'
						+'<td><b>Duracion</b></td>'
						+'<td>'+encontrado[0].duracionPelicula+'</td>'
						+'<td>'+arreglo[3]+'</td>'
					+'</tr>'
				  	+'<tr>'
						+'<td><b>Estreno</b> </td>'
						+'<td>'+encontrado[0].fechaEstreno+'</td>'
						+'<td>'+arreglo[4]+'</td>'
					+'</tr>'
				  	+'<tr>'
						+'<td><b>Imagen </b></td>'
						+'<td>'+encontrado[0].imagenPelicula+'</td>'
						+'<td>'+arreglo[1]+'</td>'
				  	+'</tr>'
				+'<table>',
			icon: 'warning',
			showCancelButton: true,
			confirmButtonColor: '#3085d6',
			cancelButtonColor: '#d33',
			cancelButtonText:'Cancelar',
			confirmButtonText: 'Borrar!'
		}).then((result) => {
			if(result.isConfirmed){
				Swal.fire({
			title: 'REALMENTE ESTA SEGURO ',
			icon: 'error',
			showCancelButton: true,
			confirmButtonColor: '#3085d6',
			cancelButtonColor: '#d33',
			cancelButtonText:'Cancelar',
			confirmButtonText: 'Borrar!'
		}).then((result) => {
			if (result.isConfirmed) {}
				
			});	
			}
		});	
	}
	else{
		Swal.fire({
		  title: '<strong>Nada que editar</strong>',
		  icon: 'info',
		})	
	}
}

function elmininar(identificador){
	let elemento =document.getElementById(identificador);
	Swal.fire({
		title: 'Seguro que desea eliminar la pelicula '+elemento.children[1].children[0].value,
		text: "No seras capas de revertir el proceso!",
		icon: 'warning',
		showCancelButton: true,
		confirmButtonColor: '#3085d6',
		cancelButtonColor: '#d33',
		cancelButtonText:'Cancelar',
		confirmButtonText: 'Borrar!'
	}).then((result) => {
		if (result.isConfirmed) {
			Swal.fire({
			title: 'REALMENTE ESTA SEGURO DE BORRAR '+elemento.children[1].children[0].value,
			text: "No seras capas de revertir el proceso!",
			icon: 'error',
			showCancelButton: true,
			confirmButtonColor: '#3085d6',
			cancelButtonColor: '#d33',
			cancelButtonText:'Cancelar',
			confirmButtonText: 'Borrar!'
		}).then((result) => {
	  		if (result.isConfirmed) {
				console.log(identificador);
				$.ajax({
					url:'/Cinema/DeletedEditPelServlet',
					type:'get',
					contentType:'text/plain',
					data:{
						id: identificador
					},
					success:function(response){
						console.log(response);
						if(response>0){
							Swal.fire({
								  icon: 'success',
								  title: 'Se dio de baja la Pelicula con exito',
								  showConfirmButton: false,
								  timer: 2000
								})
							setInterval(myTimer,2000);	
						}else{
							Swal.fire({
							  icon: 'error',
							  title: 'Oops...',
							  text: 'Algo salio mal lamentamos las molestias, por favor intente mas tarde',
						
							})
						}
					}
				}); 
			}
		})
	  }
	})
};

/*Metodo que no se usa pero sirve para recibir cierto formato de fecha y convertirlo a lo que necesita el input type date pero no funciona al 100% */
function formatoFecha(fecha){
	console.log("fecha: "+fecha);
	let date = new Date(fecha);
	console.log("date: "+date);	
	let fechaF,day,month,year;
	let agregar0= '0';
	day = date.getDate()+1;
	month =date.getMonth()/*+1*/;
	year = date.getFullYear();
	if(day <= 9){
	   day = agregar0 + day;	
	}
	if(month <= 9){
		month = agregar0 +month;	
	}
	fechaF = [year,month,day].join('-');
	console.log("corregido"+ fechaF);
	return fechaF;
}
/*No se usa solo es informativo para saber como se obtiene la informacion  */
function relleno(){
	let elemento =document.getElementById(1); 
	let elem = document.getElementsByName(1);
	console.log(elem);
	let nombre = elemento.children[1].children[0].value;
	//let id = elemento.children[0].children[0].value;
	let clasificacion = elemento.children[2].children[0].value;
	let fechaEstreno =elemento.children[4].children[0].value;
	
	console.log(elemento.children[4].children[0].value);
	let imagen = elemento.children[5].children[1].files[0].name;
	console.log(imagen);
	let info = {
		//id: id,
		newNombrePelicula: nombre,
		newClasificacion: clasificacion,
		fechaEstreno: fechaEstreno
	}
	console.log(info);
}

//Setea por primara vez el form agregar a que no se despliegue 
document.getElementById("formagregar").style.display = 'none';
document.getElementById("imagenSelec").style.display = 'none';
function esconder(){
	document.getElementById("editImagen").style.display = 'none';
}
/*event listener con gquery para guardar la pelicula  */
$("#btnagregar").on("click",function(){
	/*let titulo = document.getElementsByName("inputtitulo").value;
	console.log(titulo) imprimir con especificaciones*/ 
	let requerimientos = document.getElementsByName("requerido");
	let bandera = 0;
	requerimientos.forEach(valido=>{
		if( valido.value.length == 0){
			 bandera++;
		}else{
		}
	});
	if(document.getElementById('inputimagen').value == ""){
		bandera++;
		console.log("tienes que elegir una imagen");
	}else{
		console.log("todo bien en la imagen");
		console.log(document.getElementById('inputimagen').files[0].name); 
	}	
	if(bandera>0){
		document.getElementById("errorAgregar").innerHTML="te falto llenar un campo";	
	}else{
	 document.getElementById("errorAgregar").innerHTML="all fine";
			 let titulo = document.getElementById("inputtitulo").value;
			 let categoria = document.getElementById("inputcategoria").value;
			 let fecha = document.getElementById("inputfecha").value;
			 let hora = document.getElementById("inputhora").value;
			 let minutos = document.getElementById("inputminutos").value;
			 let segundos = document.getElementById("inputsegundos").value;
			 let duracion=[ hora, minutos, segundos].join(':');
			 let imagen =document.getElementById('inputimagen').files[0].name;
			 let info = {
				nombrePelicula: titulo,
				clasificacionPeliculas: categoria,
				fechaEstreno: fecha,
				duracionPelicula: duracion,
				imagenPelicula: imagen
			 }
			console.log(info);
			 $.ajax({
				url:'/Cinema/AdmonPeliculaInfo',
				type:'post',
				data:{
					pelicula:JSON.stringify(info)
				},success:function (response){
					console.log(response);
					if(response > 0 ){
						Swal.fire({
						  icon: 'success',
						  title: 'Se dio de ALTA la Pelicula con exito',
						  showConfirmButton: false,
						  timer: 2000
						})
					
					setInterval(myTimer,2000);					
					}else{
						Swal.fire({
						  icon: 'error',
						  title: 'Oops...',
						  text: 'Something went wrong!',
						  footer: 'Uno error comun en que el nombre de la imagen exeda 15 letras'
						})
					}
				}
			}); 	
	}	
});
//Pone la imagen que seleccionaste 
/*$(window).load(function(){ */
 $(function() { 
  $('#inputimagen').change(function(e) {
      addImage(e); 
     });
     function addImage(e){
      var file = e.target.files[0],
      imageType = /image.*/;
      if (!file.type.match(imageType))
       return;
      var reader = new FileReader();
      reader.onload = function(e){
         var result=e.target.result;
        $('#imagenSelec').attr("src",result);
      }
      reader.readAsDataURL(file);
     }
   });
/* });*/

 function myFunction(p){
	let imagen= "#"+p+"newImagen";
	p = "#"+p+"p";
	console.log(p);
  $(p).change(function(e) {
      addImage(e); 	
     });
     function addImage(e){
      var file = e.target.files[0],
      imageType = /image.*/;
      if (!file.type.match(imageType))
       return;
      var reader = new FileReader();
      reader.onload = function(e){
         var result=e.target.result;
        $(imagen).attr("src",result);
      }
      reader.readAsDataURL(file);
     }
 }; 
/*Hace que aparezca y deshaparezca el form para agregar la pelicula  */
$("#btnformagregar").on("click",function(){
	let formagregar = document.getElementById("formagregar");
	if (formagregar.style.display === 'block') {
    	formagregar.style.display = 'none';
  	} else {
    formagregar.style.display = 'block';
  }
});
$(function(){
	let d = new Date();
	let dd = d.getDate();
	let currMonth = d.getMonth();
	let currYear = d.getFullYear();
	let agregar0= '0';
	if(dd <= 9){
	   dd = agregar0 + dd;	
	}
	if(currMonth <= 9){
		currMonth = agregar0 +currMonth;	
	}	
	let hoy = [  currYear, currMonth,dd].join('-');    
	document.getElementById("inputfecha").value=hoy;
});
let ordenar = 0;
/* ordenar por id */
$("#ordenarId").on("click",function(){
	ordenandoDinamico("idPelicula");
});
$("#ordenarNombre").on("click",function(){
	ordenandoDinamico("nombrePelicula");
});
$("#ordenarClasificacion").on("click",function(){
	ordenandoDinamico("clasificacionPeliculas");
});
$("#ordenarDuracion").on("click",function(){
	ordenandoDinamico("duracionPelicula");
});
$("#ordenarEstreno").on("click",function(){
	ordenandoDinamico("fechaEstreno");
});

function ordenandoDinamico(parametro){
	let tipoArreglo = 0;
	let arregloID =[];
	let nuevoarreglo = arregloPeliculas.map(elemento=>{
		if(parametro == "idPelicula"){
			tipoArreglo=1;			
			return elemento.idPelicula;
		}
		if(parametro == "clasificacionPeliculas"){
			tipoArreglo=2;
			return elemento.clasificacionPeliculas+elemento.idPelicula;
		}
		if(parametro == "duracionPelicula"){
			tipoArreglo=3;
			return elemento.duracionPelicula+elemento.idPelicula;
		}
		if(parametro == "fechaEstreno"){
			tipoArreglo=4;
			return elemento.fechaEstreno+elemento.idPelicula;
		}
		if(parametro == "nombrePelicula"){
			tipoArreglo=5;
			return elemento.nombrePelicula+elemento.idPelicula;
		}
	});
	
	if(tipoArreglo == 1 ){
		nuevoarreglo.sort(function(a, b){return b-a});
	}else{
		nuevoarreglo.sort();
	}
	if(ordenar > 0){
		nuevoarreglo.reverse();
		ordenar--;
	}
	else{
		ordenar++;
	}
	if(tipoArreglo != 1){
		nuevoarreglo.forEach(element=>{
			arregloID.push(element.charAt(element.length-1));
		});
	}else{
		arregloID=nuevoarreglo; 
	}
	let arreglado=[];
	
	arregloID.forEach(elemento=>{
		arregloActual.forEach(pelicula=>{
			if(elemento == pelicula.idPelicula)
				arreglado.push(pelicula);
			});
	});
	/*arregloID.forEach(elemento=>{
		for(let i =0;i<arregloActual.length;i++){
			if(elemento == arregloActual[i].idPelicula)
				arreglado.push(arregloActual[i]);
			}
	}); */
	console.log(arreglado);
	crearTabla(arreglado);
};



/*
back up
 
let arregloActual = []; // es el arreglo actual
let arregloPeliculas = [];
 $.get("/Cinema/AdmonPeliculaInfo",function obtener(data){
	console.log("Se obtiene la informacion==========");
	arregloPeliculas= [ ...data];
	arregloActual = [ ...arregloPeliculas];
	crearTabla(arregloActual);
	
	//arregloPeliculas = Object.assing({},temp); solo funciona con ES6	
	console.log("Se termina de obtiener la informacion==========");	
}); 

$("#salir").on("click",function(){});//aqui va el log out 

//Busca las peliculas pero en el arreglo que se obtuvo al cargar por primera vez la pagina 
$("#buscador").on("keyup",function(){
	console.log("Empieza la funcion buscador+++++++++++");
	let parametro = document.getElementById("buscador").value;
	let coincidentes = arregloPeliculas.filter(pelicula =>{
			const expRegular = new RegExp(`^${parametro}`,'gi'); // i para ignorar mayusculas y minusculas
			return pelicula.nombrePelicula.match(expRegular) || pelicula.clasificacionPeliculas.match(expRegular);
		}
	);
	arregloActual=coincidentes;
	crearTabla(arregloActual);
	console.log("!!!!arregloPeliculas");
	console.log(arregloPeliculas);
	console.log("Termina la funcion buscador+++++++++++");
});

$("#inputBuscar").on("click",function(){
	let parametro = document.getElementById("buscador").value;
	let coincidentes = arregloPeliculas.filter(pelicula =>{
			const expRegular = new RegExp(`^${parametro}`,'gi'); // i para ignorar mayusculas y minusculas
			return pelicula.nombrePelicula.match(expRegular) || pelicula.clasificacionPeliculas.match(expRegular);
		}
	);
	arregloActual=coincidentes;
	crearTabla(arregloActual);
});

// LLena la tabla con la informacion de las peliculas y recibe un parametro que es un arreglo

function crearTabla(arreglo){
	console.log("Empieza la funcion crearTabla----------");
	console.log(document.getElementsByName("catpelicula"));
	let list = document.getElementById("catpelicula");
	while(list.hasChildNodes()){
    	list.removeChild(list.firstChild);
  	}	
	arreglo.forEach(pelicula=>{
		$("#catpelicula").append("<tr  id="+pelicula.idPelicula+" name="+pelicula.idPelicula+"><th scope='row'>"+pelicula.idPelicula+"</th>"
		+"<td><input id='"+"inputNombre"+pelicula.idPelicula+"'  onchange=diferente("+pelicula.idPelicula+") value='"+pelicula.nombrePelicula+"'></td>"
		+"<td> <input onchange=diferente("+pelicula.idPelicula+") value='"+pelicula.clasificacionPeliculas+"' ></td>"
		+"<td> <input onchange=diferente("+pelicula.idPelicula+") value='"+pelicula.duracionPelicula+"'></td>"
		+"<td><input onchange=diferente("+pelicula.idPelicula+") type='date' value="+pelicula.fechaEstreno+"></td>"
		+"<td> <img  class='img-radious ' width='250px' height='150px' src='https://fer-industries.s3.amazonaws.com/Cinema/"+ pelicula.imagenPelicula+"'>"
			+" <button class='mt-1 btn btn-info' style='width:250px'  onclick='showEditImagen("+"editImagenpelicula"+pelicula.idPelicula+")' id='btneditarImagen'>Editar</button> "
			+" <div   id="+"editImagenpelicula"+pelicula.idPelicula+"  style='display: none'>"
			+" <img id='"+pelicula.idPelicula+"newImagen' class='rounded mx-auto d-block my-1' src=''  width='250' height='150'>  "
			+" <input type='file' id="+pelicula.idPelicula+"p"+" onchange=diferente("+pelicula.idPelicula+")  onclick='myFunction("+pelicula.idPelicula+")'  accept='image/*' multiple> </div>"
		+" </td>"
		+"<td> <button onclick='elmininar("+pelicula.idPelicula+")' class='btn btn-secundary'><i class='fas fa-trash coloricono '></i></button></td>"
		+"<td> <button onclick='editar("+pelicula.idPelicula+")' class='btn btn-secundary'><i class='fas fa-edit coloricono '></i></button></td> "
		+"<td> <button onclick='reestablecer("+pelicula.idPelicula+")' class='btn btn-secundary'><i class='fas fa-redo-alt coloricono'></i> </td> </tr>"
		);
	});
	console.log("Termina la funcion crearTabla----------");
}

const  reestablecer = (identificador) =>{
	console.log("Empezo la funcion reestablecer");
	console.log(document.getElementsByName(identificador));
	Swal.fire({
		  title: '<strong>Seguro quieres Reestrablecer los valores</strong>',
		  icon: 'info',
		  html:
		    'Se sustituiran los valores por los valores por defecto',
		  showCloseButton: true,
		  showCancelButton: true,
		  focusConfirm: false,
		  confirmButtonText:
		    'Si!',
		  cancelButtonText:
		    'Cancelar'
	}).then((result) => {
		if (result.isConfirmed) {
			console.log(arregloPeliculas);
			let elemento = document.getElementById(identificador);
			elemento.style.background="white";
			arregloPeliculas.map(pelicula=>{
				if(identificador == pelicula.idPelicula){
					elemento.children[1].children[0].value = pelicula.nombrePelicula;
					elemento.children[2].children[0].value = pelicula.clasificacionPeliculas;
					elemento.children[3].children[0].value = pelicula.duracionPelicula;
					elemento.children[4].children[0].value = pelicula.fechaEstreno;
					elemento.children[5].children[2].children[0].src = "";
					elemento.children[5].children[2].children[1].value = "";
					elemento.children[5].children[2].style.display='none';
					
				}
			});
		}
	});
	console.log("Termino la funcion reestablecer");
}
function showEditImagen(editar){
	if (editar.style.display === 'block') {
    	editar.style.display = 'none';
  	} else {
    editar.style.display = 'block';
  }
};


//Función para actualizar cada 5 segundos(5000 milisegundos)
function  myTimer() {
 location.reload(); 
}
//Se declara un arreglo de 6 posiciones 
//la 0 es nombre 
//la 1 es la imagen
//la 2 estreno
//la 3 la duracion 
//la 4 la clasificacion
//la 5 es para saber si si tenemos un cambio;
 


const diferente =   (id)=>{
	console.log("Empieza la funcion diferente*************");
	let arreglo =[null,null,null,null,null,0];
	let elemento =document.getElementById(id);
	console.log("Voy a ver si es diferente");
	console.log("arreglo actual");
	console.log(arregloActual);
	console.log("Arreglo fijo");	
	console.log(arregloPeliculas);
	
	arregloPeliculas.map(ap=>{
		if(ap.idPelicula == id){
			arregloActual.forEach(act=>{
				if(act.idPelicula == id){
					let nombre = elemento.children[1].children[0].value;
					let clasificacion = elemento.children[2].children[0].value;
					let duracion = elemento.children[3].children[0].value;
					let fechaEstreno =elemento.children[4].children[0].value;
					let imagen;
					if( elemento.children[5].children[2].children[1].files[0]){
						imagen=elemento.children[5].children[2].children[1].files[0].name;	
					}else{
						imagen =ap.imagenPelicula;
					}
					if(imagen != ap.imagenPelicula){
						arreglo.fill(imagen,1,2);
						arreglo.fill(1,5,6);
						act.imagenPelicula = imagen;
					}
					if(fechaEstreno != ap.fechaEstreno){
						arreglo.fill(fechaEstreno,2,3);
						arreglo.fill(1,5,6);
						act.fechaEstreno = fechaEstreno;
					}	
					if(duracion != ap.duracionPelicula ){
						arreglo.fill(1,5,6);
						arreglo.fill(duracion,3,4);
						act.duracionPelicula = duracion;
					}
					if(clasificacion != ap.clasificacionPeliculas){
						arreglo.fill(1,5,6);
						arreglo.fill(clasificacion,4,5);
						act.clasificacionPeliculas = clasificacion;
					}
					if(nombre != ap.nombrePelicula){
						arreglo.fill(1,5,6);
						arreglo.fill(nombre,0,1);
						act.nombrePelicula = nombre;
					}
				}
			});
		}
	});	
	if(arreglo[5] == 0){
		elemento.style.background="white";
	}else{
		elemento.style.background="#eeffe6";
	}
	console.log("termina la funcion diferente*************");
return arreglo;
}
function editar(identificador){
	let arreglo =diferente(identificador);
	console.log(document.getElementsByName(identificador));
	if(arreglo[5] > 0){
	let	info={
		 	infoidPelicula: identificador,
		 	nombrePelicula: arreglo[0],
		 	clasificacionPeliculas: arreglo[2],
		 	duracionPelicula: arreglo[3],
		 	fechaEstreno: arreglo[4],
		 	imagenPelicula: arreglo[1]
		}
		for(let i = 0;i < arreglo.length;i++){
			if(arreglo[i] == null)
				arreglo[i] = "Sin cambios";
		}
		console.log(arreglo);
		Swal.fire({
			title: 'Seguro que desea realizar los siguientes cambios',
			html:  '<table class="text-left" id="tableAler"><thead><th>Concepto</th><th class="ml-3">Cambio</th></thead>'
				  +'<tbody class="ml-1"><tr><td><b>Nombre</b> </td><td>'+arreglo[0]+'</td></tr>'
				  +'<tr><td><b>Clasificacion</b> </td><td>'+arreglo[2]+'</tr>'
				  +'<tr><td><b>Duracion</b> </td><td>'+arreglo[3]+'</td></tr>'
				  +'<tr><td><b>Estreno</b> </td><td>'+arreglo[4]+'</td></tr>'
				  +'<tr><td><b>Imagen </b></td><td>'+arreglo[1]+'</td></tr><table>',
			icon: 'warning',
			showCancelButton: true,
			confirmButtonColor: '#3085d6',
			cancelButtonColor: '#d33',
			cancelButtonText:'Cancelar',
			confirmButtonText: 'Borrar!'
		}).then((result) => {
			if(result.isConfirmed){
				Swal.fire({
			title: 'REALMENTE ESTA SEGURO ',
			icon: 'error',
			showCancelButton: true,
			confirmButtonColor: '#3085d6',
			cancelButtonColor: '#d33',
			cancelButtonText:'Cancelar',
			confirmButtonText: 'Borrar!'
		}).then((result) => {
			if (result.isConfirmed) {}
				
			});	
			}
		});	
	}
	else{
		Swal.fire({
		  title: '<strong>Nada que editar</strong>',
		  icon: 'info',
		})	
	}
}

function elmininar(identificador){
	let elemento =document.getElementById(identificador);
	Swal.fire({
		title: 'Seguro que desea eliminar la pelicula '+elemento.children[1].children[0].value,
		text: "No seras capas de revertir el proceso!",
		icon: 'warning',
		showCancelButton: true,
		confirmButtonColor: '#3085d6',
		cancelButtonColor: '#d33',
		cancelButtonText:'Cancelar',
		confirmButtonText: 'Borrar!'
	}).then((result) => {
		if (result.isConfirmed) {
			Swal.fire({
			title: 'REALMENTE ESTA SEGURO DE BORRAR '+elemento.children[1].children[0].value,
			text: "No seras capas de revertir el proceso!",
			icon: 'error',
			showCancelButton: true,
			confirmButtonColor: '#3085d6',
			cancelButtonColor: '#d33',
			cancelButtonText:'Cancelar',
			confirmButtonText: 'Borrar!'
		}).then((result) => {
	  		if (result.isConfirmed) {
				console.log(identificador);
				$.ajax({
					url:'/Cinema/DeletedEditPelServlet',
					type:'get',
					contentType:'text/plain',
					data:{
						id: identificador
					},
					success:function(response){
						console.log(response);
						if(response>0){
							Swal.fire({
								  icon: 'success',
								  title: 'Se dio de baja la Pelicula con exito',
								  showConfirmButton: false,
								  timer: 2000
								})
							setInterval(myTimer,2000);	
						}else{
							Swal.fire({
							  icon: 'error',
							  title: 'Oops...',
							  text: 'Algo salio mal lamentamos las molestias, por favor intente mas tarde',
						
							})
						}
					}
				}); 
			}
		})
	  }
	})
};

//Metodo que no se usa pero sirve para recibir cierto formato de fecha y convertirlo a lo que necesita el input type date pero no funciona al 100% 
function formatoFecha(fecha){
	console.log("fecha: "+fecha);
	let date = new Date(fecha);
	console.log("date: "+date);	
	let fechaF,day,month,year;
	let agregar0= '0';
	day = date.getDate()+1;
	month =date.getMonth();//+1
	year = date.getFullYear();
	if(day <= 9){
	   day = agregar0 + day;	
	}
	if(month <= 9){
		month = agregar0 +month;	
	}
	fechaF = [year,month,day].join('-');
	console.log("corregido"+ fechaF);
	return fechaF;
}
//No se usa solo es informativo para saber como se obtiene la informacion  
function relleno(){
	let elemento =document.getElementById(1); 
	let elem = document.getElementsByName(1);
	console.log(elem);
	let nombre = elemento.children[1].children[0].value;
	//let id = elemento.children[0].children[0].value;
	let clasificacion = elemento.children[2].children[0].value;
	let fechaEstreno =elemento.children[4].children[0].value;
	
	console.log(elemento.children[4].children[0].value);
	let imagen = elemento.children[5].children[1].files[0].name;
	console.log(imagen);
	let info = {
		//id: id,
		newNombrePelicula: nombre,
		newClasificacion: clasificacion,
		fechaEstreno: fechaEstreno
	}
	console.log(info);
}

//Setea por primara vez el form agregar a que no se despliegue 
document.getElementById("formagregar").style.display = 'none';
document.getElementById("imagenSelec").style.display = 'none';
function esconder(){
	document.getElementById("editImagen").style.display = 'none';
}
//event listener con gquery para guardar la pelicula  
$("#btnagregar").on("click",function(){
	//let titulo = document.getElementsByName("inputtitulo").value;
	//console.log(titulo) imprimir con especificaciones 
	let requerimientos = document.getElementsByName("requerido");
	let bandera = 0;
	requerimientos.forEach(valido=>{
		if( valido.value.length == 0){
			 bandera++;
		}else{
		}
	});
	if(document.getElementById('inputimagen').value == ""){
		bandera++;
		console.log("tienes que elegir una imagen");
	}else{
		console.log("todo bien en la imagen");
		console.log(document.getElementById('inputimagen').files[0].name); 
	}	
	if(bandera>0){
		document.getElementById("errorAgregar").innerHTML="te falto llenar un campo";	
	}else{
	 document.getElementById("errorAgregar").innerHTML="all fine";
			 let titulo = document.getElementById("inputtitulo").value;
			 let categoria = document.getElementById("inputcategoria").value;
			 let fecha = document.getElementById("inputfecha").value;
			 let hora = document.getElementById("inputhora").value;
			 let minutos = document.getElementById("inputminutos").value;
			 let segundos = document.getElementById("inputsegundos").value;
			 let duracion=[ hora, minutos, segundos].join(':');
			 let imagen =document.getElementById('inputimagen').files[0].name;
			 let info = {
				nombrePelicula: titulo,
				clasificacionPeliculas: categoria,
				fechaEstreno: fecha,
				duracionPelicula: duracion,
				imagenPelicula: imagen
			 }
			console.log(info);
			 $.ajax({
				url:'/Cinema/AdmonPeliculaInfo',
				type:'post',
				data:{
					pelicula:JSON.stringify(info)
				},success:function (response){
					console.log(response);
					if(response > 0 ){
						Swal.fire({
						  icon: 'success',
						  title: 'Se dio de ALTA la Pelicula con exito',
						  showConfirmButton: false,
						  timer: 2000
						})
					
					setInterval(myTimer,2000);					
					}else{
						Swal.fire({
						  icon: 'error',
						  title: 'Oops...',
						  text: 'Something went wrong!',
						  footer: 'Uno error comun en que el nombre de la imagen exeda 15 letras'
						})
					}
				}
			}); 	
	}	
});
//Pone la imagen que seleccionaste 
//$(window).load(function(){ 
 $(function() { 
  $('#inputimagen').change(function(e) {
      addImage(e); 
     });
     function addImage(e){
      var file = e.target.files[0],
      imageType = /image.;
      if (!file.type.match(imageType))
       return;
      var reader = new FileReader();
      reader.onload = function(e){
         var result=e.target.result;
        $('#imagenSelec').attr("src",result);
      }
      reader.readAsDataURL(file);
     }
   });
// });

 function myFunction(p){
	let imagen= "#"+p+"newImagen";
	p = "#"+p+"p";
	console.log(p);
  $(p).change(function(e) {
      addImage(e); 	
     });
     function addImage(e){
      var file = e.target.files[0],
      imageType = /image.;
      if (!file.type.match(imageType))
       return;
      var reader = new FileReader();
      reader.onload = function(e){
         var result=e.target.result;
        $(imagen).attr("src",result);
      }
      reader.readAsDataURL(file);
     }
 }; 
/*Hace que aparezca y deshaparezca el form para agregar la pelicula  
$("#btnformagregar").on("click",function(){
	let formagregar = document.getElementById("formagregar");
	if (formagregar.style.display === 'block') {
    	formagregar.style.display = 'none';
  	} else {
    formagregar.style.display = 'block';
  }
});
$(function(){
	let d = new Date();
	let dd = d.getDate();
	let currMonth = d.getMonth();
	let currYear = d.getFullYear();
	let agregar0= '0';
	if(dd <= 9){
	   dd = agregar0 + dd;	
	}
	if(currMonth <= 9){
		currMonth = agregar0 +currMonth;	
	}	
	let hoy = [  currYear, currMonth,dd].join('-');    
	document.getElementById("inputfecha").value=hoy;
});
let ordenar = 0;
// ordenar por id 
$("#ordenarId").on("click",function(){
	ordenandoDinamico("idPelicula");
});
$("#ordenarNombre").on("click",function(){
	ordenandoDinamico("nombrePelicula");
});
$("#ordenarClasificacion").on("click",function(){
	ordenandoDinamico("clasificacionPeliculas");
});
$("#ordenarDuracion").on("click",function(){
	ordenandoDinamico("duracionPelicula");
});
$("#ordenarEstreno").on("click",function(){
	ordenandoDinamico("fechaEstreno");
});

function ordenandoDinamico(parametro){
	let tipoArreglo = 0;
	let arregloID =[];
	let nuevoarreglo = arregloActual.map(elemento=>{
		if(parametro == "idPelicula"){
			tipoArreglo=1;			
			return elemento.idPelicula;
		}
		if(parametro == "clasificacionPeliculas"){
			tipoArreglo=2;
			return elemento.clasificacionPeliculas+elemento.idPelicula;
		}
		if(parametro == "duracionPelicula"){
			tipoArreglo=3;
			return elemento.duracionPelicula+elemento.idPelicula;
		}
		if(parametro == "fechaEstreno"){
			tipoArreglo=4;
			return elemento.fechaEstreno+elemento.idPelicula;
		}
		if(parametro == "nombrePelicula"){
			tipoArreglo=5;
			return elemento.nombrePelicula+elemento.idPelicula;
		}
	});
	
	if(tipoArreglo == 1 ){
		nuevoarreglo.sort(function(a, b){return b-a});
	}else{
		nuevoarreglo.sort();
	}
	if(ordenar > 0){
		nuevoarreglo.reverse();
		ordenar--;
	}
	else{
		ordenar++;
	}
	if(tipoArreglo != 1){
		nuevoarreglo.forEach(element=>{
			arregloID.push(element.charAt(element.length-1));
		});
	}else{
		arregloID=nuevoarreglo; 
	}
	let arreglado=[];
	
	arregloID.forEach(elemento=>{
		arregloActual.forEach(pelicula=>{
			if(elemento == pelicula.idPelicula)
				arreglado.push(pelicula);
			});
	});
	/*arregloID.forEach(elemento=>{
		for(let i =0;i<arregloActual.length;i++){
			if(elemento == arregloActual[i].idPelicula)
				arreglado.push(arregloActual[i]);
			}
	}); 
	console.log(arreglado);
	crearTabla(arreglado);
};





 */

/**
 *https://www.w3schools.com/jsref/jsref_match.asp
https://www.w3schools.com/jsref/dom_obj_event.asp
https://stackoverflow.com/questions/38815255/array-filter-changes-the-main-array
https://parzibyte.me/blog/2018/02/26/angular-copy-sin-angularjs-eliminar-referencias-javascript/
https://stackoverflow.com/questions/31764414/object-assign-is-not-a-function
https://medium.com/laboratoria-developers/por-valor-vs-por-referencia-en-javascript-de3daf53a8b9 
 */

 //se usa en el evento de inputbuscar, ordenarId


/**HUMJ981106HDFRNM08 */
//al cargar la pagina obtiene el arreglo de las peliculas disponibles

/*
$.ajax({
	url:'/Cinema/AdmonPeliculaInfo',
	type:'get',	
	success:function(data){
		/*arregloPeliculas = data.map(function(x){
		    return x;
		}); 
		data.forEach(function(x){{
		        arregloActual.push(x);
		    }
		});
		data.forEach(function(x){{
		        arregloActual.push(x);
		    }
		});
		/*arregloActual= data.map(function(a){
		    return a;
		});
		crearTabla(arregloActual);	
	}
}); */
