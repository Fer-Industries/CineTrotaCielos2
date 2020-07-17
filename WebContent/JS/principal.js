
$.get("/Cinema/Peliculas",function(peliculasEstreno){

	console.log(peliculasEstreno);
	let i = 1;
	peliculasEstreno.forEach(pelicula =>{
		console.log(pelicula);
		$("#pelImg"+i).attr("src","https://fer-industries.s3.amazonaws.com/Cinema/"+pelicula.imagenPelicula);
		$("#pelNom"+i).text(pelicula.nombrePelicula);
		i++;
	});
});