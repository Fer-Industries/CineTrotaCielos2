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
			//console.log(asientoC);
			//console.log(document.getElementById(asientoC.idAsiento));
		    if(asientoC.disponibilidad == 0){
		      tr = tr + "<td id=" + asientoC.idAsiento+" class='dispo' onclick='eligiendo("+JSON.stringify(asientoC)+")'><img height=15px class='img img-fluid' id=" + asientoC.asiento+" src=Img/AsientoV.png > "+asientoC.asiento+"</td>";
		    }else{
		      tr = tr + "<td id=" + asientoC.idAsiento +" class='dispoNo' onclick='eligiendo("+JSON.stringify(asientoC)+")'><img height=15px class='img img-fluid' id=" + asientoC.asiento+" src=Img/AsientoG.png >"+asientoC.asiento+"</td>";
		    }
		  });
		  tr = tr + "</tr>";
		  $("#cuerpoTabla").append(tr);
		});
	}
}); 
let asientoSeleccionados = [];
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
					const foto = "Img/AsientoG.png"
					document.getElementById(asiento.idAsiento).className = "selec";
					document.getElementById(asiento.asiento).src= foto;
		            asientoSeleccionados.push(asiento);
		        }else {
		          const foto = "Img/AsientoV.png" 
				  document.getElementById(asiento.idAsiento).className = "dispo";
				  document.getElementById(asiento.asiento).src= foto;				 				  
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
		
