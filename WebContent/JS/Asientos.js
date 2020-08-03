/**
 * 
 */


console.log(sessionStorage.getItem("funcion"));
$("#contenidoP").append(  "<h6 class=card-text card-title tittle>Titulo: "+sessionStorage.getItem("pele")+ "</h6>"
						  + "<h6 class='card-text '>Dia: "+sessionStorage.getItem("diafune")+ "</h6>"
						  + "<h6 class='card-text '>Formato: "+sessionStorage.getItem("formatoe")+ "</h6>"
						  + "<h6 class='card-text '>Sucursal: "+sessionStorage.getItem("sucursale")+ "</h6>"
						  + "<h6 class='card-text '>Horario: "+sessionStorage.getItem("horae")+ "</h6>"
						  + "<h6 class='card-text '>Idioma: "+sessionStorage.getItem("idiomae")+ "</h6>"
						 );
					
$("#imagenP").append("<img class='card-img img-radious'  width=110 height=200   src='https://fer-industries.s3.amazonaws.com/Cinema/"+sessionStorage.getItem("imagene")+"'>");
					
let idFuncioon = sessionStorage.getItem("funcion"); 

$.ajax({
	 url: '/Cinema/CupoSala',
	 type: 'post',
	 data: { 
		 enviarInfo: idFuncioon
	 },
	 success: function(respuesta) {
		console.log("yoo soy la resouesta");
		console.log(respuesta);
		
		const asientos = respuesta;
		
		//console.log(asientos.listaAsientos.sort());
		
		//console.log(asientos.sort());
		//seria obtener las letras que vienen en nuestro arreglo
		let arregloLetras = [];
		let arregloNumeros = asientos;
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
		    if(asientoC.disponibilidad == 0){
		      tr = tr + "<td id=" + asientoC.idAsiento+" onclick='eligiendo("+JSON.stringify(asientoC)+")'><i class='fas fa-chair dispo' id="+ asientoC.asiento +" ></i><h6 class=titulos>"+asientoC.asiento+"</h6></td>";
		    }else{
		      tr = tr + "<td id=" + asientoC.idAsiento +" onclick='eligiendo("+JSON.stringify(asientoC)+")'><i class='fas fa-chair dispoNo'  id="+ asientoC.asiento +" ></i><h6 class=titulos>"+asientoC.asiento+"</h6></td>";
		    }
		  });
		  tr = tr + "</tr>";
		  $("#cuerpoTabla").append(tr);
		});
	}
}); 
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
		
	
/* +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  */

/*$.post("/Cinema/CupoSala",function(response){
	response.listaAsientos.forEach(asiento =>{
		console.log(asiento);
})});*/
		
