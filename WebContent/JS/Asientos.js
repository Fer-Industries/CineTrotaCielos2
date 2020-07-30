/**
 * 
 */


console.log(sessionStorage.getItem("funcion"));
let idFuncioon = sessionStorage.getItem("funcion"); 
$.ajax({
         url: '/Cinema/CupoSala',
         type: 'post',
         data: { 
        	 enviarInfo: idFuncioon
         },
         success: function(asientos) {
			console.log(asientos);
			asientos.foreach(asientos=>{
			});
		}
}); 


/*$.post("/Cinema/CupoSala",function(response){
	response.listaAsientos.forEach(asiento =>{
		console.log(asiento);
})});*/
		
