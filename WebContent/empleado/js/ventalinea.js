let idVenta=0;

document.getElementById("buscar").addEventListener("click",function(){
	Swal.fire('Espere por favor');
	Swal.showLoading();
	var ticket = document.getElementById("ticket").value;
	idVenta = parseInt(ticket);
	if(ticket.trim() == ''){
		Swal.fire({
			icon:'error',
			title:'Por favor ingrese el ticket'
		});
	}else{
		$.get("/Cinema/VentaLinea?idVenta="+ticket,function(productos){
			console.log(productos);
			$("#lista").html("");
			if(productos.length != 0){				
				let consecutivo = 1;
				
				productos.forEach(producto =>{
					$("#lista").append(
						"<li class='list-group-item'>"+
						  	"<div class='form-check'>"+
							  "<input class='form-check-input' type='checkbox' id='"+consecutivo+"'>"+
							  "<label class='form-check-label' for='"+consecutivo+"'>"+
							    producto+
							  "</label>"+
							"</div>"+
						"</li>"
					);
					consecutivo++;
				});
				$("#entregada").removeClass("entregado");
				Swal.close();
			}else{
				Swal.close();
				Swal.fire({
					icon:'error',
					title:'El ticket no se encontr&oacute; o la orden ya fue entregada'
				});
			}
			
		});
	}
});

document.getElementById("botonEntregado").addEventListener("click",function(){
	console.log(idVenta);
	Swal.fire('Espere por favor');
	Swal.showLoading();
	$.post("/Cinema/VentaLinea?idVenta="+idVenta,function(response){
		console.log(response);
		Swal.close();
		if(response > 0){
			Swal.fire({
				icon:'success',
				title:'Orden entregada'
			});
			document.getElementById("ticket").value = "";
			$("#lista").html("");
			$("#entregada").addClass("entregado");
		}else{
			Swal.fire({
				icon:'error',
				title:'Ocurrio un error intentelo mas tarde'
			});
		}
	});
});