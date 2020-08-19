let asientos; // asientos que ya estan pintados
let idFuncioon = sessionStorage.getItem("funcion");

setInterval(()=>{
	// espreguntar nuevamente al servidor si los asientos que ya cargue siguen disponibles		
		$.ajax({
			 url: '/Cinema/CupoSala',
			 type: 'post',
			 data: { 
				 enviarInfo: idFuncioon
			 },
			 success: function(asientosActualizados) {
				  asientosActualizados.listaAsientos.filter(asiento =>asiento.disponibilidad == 1)
				  .map(asiento=>document.getElementById(asiento.idAsiento).outerHTML  = "<td id=" + asiento.idAsiento +" onclick='eligiendo("+JSON.stringify(asiento)+")'><i class='fas fa-chair dispoNo'  id="+ asiento.asiento +" ></i><h6 class=titulos>"+asiento.asiento+"</h6></td>"	);
			}
		}); 
},3000);
/*asientoPintado.classList.remove("dispo");
asientoPintado.classList.add("dispoNo");*/


$("#contenidoP").append(  "<h6 class=card-text card-title tittle>Titulo: "+sessionStorage.getItem("pele")+ "</h6>"
						  + "<h6 class='card-text '>Dia: "+sessionStorage.getItem("diafune")+ "</h6>"
						  + "<h6 class='card-text '>Formato: "+sessionStorage.getItem("formatoe")+ "</h6>"
						  + "<h6 class='card-text '>Sucursal: "+sessionStorage.getItem("sucursale")+ "</h6>"
						  + "<h6 class='card-text '>Horario: "+sessionStorage.getItem("horae")+ "</h6>"
						  + "<h6 class='card-text '>Idioma: "+sessionStorage.getItem("idiomae")+ "</h6>"
						 );
					
$("#imagenP").append("<img class='card-img img-radious'  width=110 height=200   src='https://fer-industries.s3.amazonaws.com/Cinema/"+sessionStorage.getItem("imagene")+"'>");

$.ajax({
	 url: '/Cinema/CupoSala',
	 type: 'post',
	 data: { 
		 enviarInfo: idFuncioon
	 },
	 success: function(respuesta) {
		console.log(respuesta);
		asientos = respuesta;
		generarAsientos(asientos);
	}
}); 

const generarAsientos = (asientos) =>{
	let arregloLetras = [];
	let arregloNumeros = asientos;
	//Ordenando el arreglo conforme al NÚMERO (A12) de asiento
	for(let i=0; i <arregloNumeros.listaAsientos.length;i++){
		for(let j=i+1; j <arregloNumeros.listaAsientos.length;j++){
			//console.log("Estoy comparando " + arregloNumeros.listaAsientos[i].asiento.substring(1,3) + " con " + arregloNumeros.listaAsientos[j].asiento.substring(1,3) );
			let numeroAsiento =  parseInt (arregloNumeros.listaAsientos[j].asiento.substring(1,3));
			 	if(arregloNumeros.listaAsientos[i].asiento.substring(1,3) > numeroAsiento ){
			 		//	console.log("Entre en el if");
					let aux;
					aux = arregloNumeros.listaAsientos[i];
					arregloNumeros.listaAsientos[i] = arregloNumeros.listaAsientos[j];
					arregloNumeros.listaAsientos[j] = aux;
				}	
			} 
	 } 
	console.log("Arrreglo ordenado por ");
	console.log(arregloNumeros.listaAsientos);

	//let arregloLetras = asientos.map(asiento => asiento.nombre.charAt(0));
	// SE HACE EL ARREGLO DE LAS LETRAS DISPONIBLES [A,B,C,D] SIN REPETICIÓN DE LETRAS
	asientos.listaAsientos.map(asiento => asiento.asiento.charAt(0)).forEach(letra => {
	    let banderaIgual = 0;
	    if (arregloLetras.length == 0) {
	        banderaIgual=0;
	    }else{
	        arregloLetras.forEach(individual=> {
	            if (individual == letra) {
	                banderaIgual = 1;
	            }
	        });
	    }
	    if (banderaIgual != 1) {
	        arregloLetras.push(letra);
	    }
	});		
	//acomodando el arreglo de letras por orden alfabetico
	arregloLetras.sort();
	// Aqui se empieza a pintar en l pantalla los asientos respecto a las letras
	arregloLetras.map(individual=>{
	  let tr = "<tr>";
	  // se crea mediante el arreglode letras
	  let asientosCoincidentes = asientos.listaAsientos.filter(asiento => asiento.asiento.charAt(0) == individual);
	  asientosCoincidentes.map(asientoC =>{
	    if(asientoC.disponibilidad == 0){
	      tr = tr + "<td id=" + asientoC.idAsiento+" onclick='eligiendo("+JSON.stringify(asientoC)+")'><i class='fas fa-chair dispo' id="+ asientoC.asiento +" ></i><h6 class=titulos>"+asientoC.asiento+"</h6></td>";
	    }else{
	      tr = tr + "<td id=" + asientoC.idAsiento +" onclick='eligiendo("+JSON.stringify(asientoC)+")'><i class='fas fa-chair dispoNo'  id="+ asientoC.asiento +" ></i><h6 class=titulos>"+asientoC.asiento+"</h6></td>";
	    }
	  });
	  tr = tr + "</tr>";
	  $("#cuerpoTabla").append(tr);
	});
};

let asientoSeleccionados = []; // el arreglo que guarda los asientos que selecciono el usuario 
		const eligiendo =  (asiento) =>{
			console.log("Estoy en la funcion eligiendo");
		    let bandera = 0;
		    if (asiento.disponibilidad != 1) {
		        asientoSeleccionados.forEach(asientoo => {
		            if (asiento.idAsiento == asientoo.idAsiento )
		            {
		                bandera++;
		            }
		        });
		        if (bandera == 0) {
					console.log(asiento);
					console.log(asiento.idAsiento);
					document.getElementById(asiento.asiento).className= "fas fa-chair selec";
		            asientoSeleccionados.push(asiento);
		        }else {
				  document.getElementById(asiento.asiento).className = "fas fa-chair dispo";				 				  
		          asientoSeleccionados = asientoSeleccionados.filter(asientoSeleccionado => {
		               return asientoSeleccionado.idAsiento != asiento.idAsiento;
		          });
		        }
		    }
		};	
		
$("#botonConfirmacion").on("click",function(){
	if(asientoSeleccionados.length == 0){
		Swal.fire(
				'',
				'Debe seleccionar por lo menos un asiento',
				'error'
		);
		return;
	}
	let idAsientos = asientoSeleccionados.map(asiento => asiento.idAsiento);
	//console.log(idAsientos);
	let infoAsientosApartados = {
			arregloAsientos:idAsientos,
			idFuncion:idFuncioon
	};
	sessionStorage.setItem("asientosSeleccionados",idAsientos);
	$.ajax({
		url:"/Cinema/ApartarLugar",
		type:'get',
		data:{
			infoAsientos:JSON.stringify(infoAsientosApartados)
		},
		success:function(response){
			console.log(response);
			if(response > 0){
				window.location.href = "/Cinema/ventas.jsp";
			}else if(response == -1){
				Swal.fire(
						'',
						'Ya se ocupo uno de los asientos disculpe la molestia',
						'error'
				);	
			}else{
				Swal.fire(
						'Tuvimos un prolema',
						'intentelo mas tarde',
						'error'
				);
			}
		},error:function(response){
			Swal.fire(
					'Tuvimos un prolema',
					'intentelo mas tarde',
					'error'
			);
		}
	});
	
	// NECESITAMOS EL DÍA (LUNES, MARTES, MIERCOLES, JUEVES..)EN EL QUE SE ESTA EFECTUANDO LA COMPRA
	//NECESITAMOS INSTANCIAR LA CLASE DATE PERO HAY UN POCO DE TRAMPA 
	// EL YEAR NO HAY PROBLEMA PUEDES MANDAR EL AÑO COMO TAL
	/* EL MES ES DONDE ESTA LA TRAMPA, 
	 * 										[0,       1,               2,         3,         4,		5,			6,			7,				8,		9,		10,   11] =
									[ENERO,FEBRERO,MARZO,ABRIL,MAYO,JUNIO,JULIO,AGOSTO ,SEP,OCT ,NOV, DIC]
		LOS DÍAS TAMBIÉN SE RESPETAN COMO EL AÑO
		LOS DÍAS DE LA SEMANA IGUAL FUNCIONARIAN COMO UN ARREGLO
					[        0					1,			2,				3,						4,				5,			6]
					[DOMINGO, LUNES, MARTES, MIERCOLES, JUEVES, VIERNES, SABADO]
	*/
	// es el apartado de los asientos!!!
	
	//
});	
