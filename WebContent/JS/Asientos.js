/**
 * 
 */


console.log(sessionStorage.getItem("funcion"));

	$("#contenido").append("<img class='my-1 foto'  height=100px   src='https://fer-industries.s3.amazonaws.com/Cinema/"+sessionStorage.getItem("imagene")+"'>" 
						  + "<p>Dia: "+sessionStorage.getItem("diafune")+ "</p>"
						  + "<p>Formato: "+sessionStorage.getItem("formatoe")+ "</p>"
						  + "<p>Titulo: "+sessionStorage.getItem("pele")+ "</p>"
						  + "<p>Sucursal: "+sessionStorage.getItem("sucursale")+ "</p>"
						  + "<p>Horario: "+sessionStorage.getItem("horae")+ "</p>"
						  + "<p>Idioma: "+sessionStorage.getItem("idiomae")+ "</p>"
						 );
let idFuncioon = sessionStorage.getItem("funcion"); 

	$.ajax({
	         url: '/Cinema/CupoSala',
	         type: 'post',
	         data: { 
	        	 enviarInfo: idFuncioon
	         },
	         success: function(respuesta) {
				//console.log(respuesta);
				const 	asientos = respuesta;
				//console.log(asientos.listaAsientos.sort());
				let asientoSeleccionados = [];
				//console.log(asientos.sort());
				//seria obtener las letras que vienen en nuestro arreglo
				let arregloLetras = [];
				let arregloNumeros = respuesta;
				
				for(let i=0; i <arregloNumeros.listaAsientos.length;i++){
					for(let j=i+1; j <arregloNumeros.listaAsientos.length;j++){
						//console.log("Estoy comparando " + arregloNumeros.listaAsientos[i].asiento.substring(1,3) + " con " + arregloNumeros.listaAsientos[j].asiento.substring(1,3) );
						let gutsu =  parseInt (arregloNumeros.listaAsientos[j].asiento.substring(1,3));
						 if(arregloNumeros.listaAsientos[i].asiento.substring(1,3) > gutsu ){
						//	console.log("Entre en el if");
							let aux;
							aux = arregloNumeros.listaAsientos[i];
							arregloNumeros.listaAsientos[i] = arregloNumeros.listaAsientos[j];
							arregloNumeros.listaAsientos[j] = aux;
							}	
						} 
				 } 
				console.log("Arrreglo ordenado");
				console.log(arregloNumeros.listaAsientos);

				//let arregloLetras = asientos.map(asiento => asiento.nombre.charAt(0));
				
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
				//Arreglo letras sin repetirse
				//console.log(arregloLetras);
				//acomodando el arreglo de letras por orden alfaabetico
				arregloLetras.sort();
				arregloLetras.map(individual=>{
				  let tr = "<tr>";
				  // se crea mediante el arreglode letras
				  let asientosCoincidentes = asientos.listaAsientos.filter(asiento => asiento.asiento.charAt(0) == individual);
				  asientosCoincidentes.map(asientoC =>{
					//console.log(asientoC);
					//console.log(document.getElementById(asientoC.idAsiento));
				    if(asientoC.disponibilidad == 0){
				      tr = tr + "<td id=" + asientoC.idAsiento+" class='dispo' onclick='elegir("+JSON.stringify(asientoC)+")'>"+asientoC.asiento+"</td>";
				    }else{
				      tr = tr + "<td id=" + asientoC.idAsiento +" class='dispoNo' onclick='elegir("+JSON.stringify(asientoC)+")'>"+asientoC.asiento+"</td>";
				    }
				  });
				  tr = tr + "</tr>";
				  $("#cuerpoTabla").append(tr);
				});	
				const elegir= (asiento) => {
				    let bandera = 0;
				    if (asiento.disponibilidad != 1) {
				        asientoSeleccionados.forEach(asientoo => {
				            if (asiento.idasiento == asientoo.idasiento )
				            {
				                bandera++;
				            }
				        });
				        if (bandera == 0) {
				            document.getElementById(asiento.idasiento).className = "selec";
				            asientoSeleccionados.push(asiento);
				        }else {
				          document.getElementById(asiento.idasiento).className = "dispo";
				          asientoSeleccionados = asientoSeleccionados.filter(asientoSeleccionado => {
				               return asientoSeleccionado.idasiento != asiento.idasiento;
				          });
				        }
				        //console.log(asientoSeleccionados);
				    }
				};	
				console.log("Sii");
				console.log(asientos);
				var separador = asientos.listaAsientos.slice(0);
				console.log(separador);
				}
	}); 
/* +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  */

/*$.post("/Cinema/CupoSala",function(response){
	response.listaAsientos.forEach(asiento =>{
		console.log(asiento);
})});*/
		
