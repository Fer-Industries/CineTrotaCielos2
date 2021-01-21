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
		$.get("/Cinema/VentaLinea?idVenta="+ticket,function(saleInformation){
			console.log(saleInformation);
			let productos = saleInformation.productosEntregar;
			let infoUser = saleInformation.infoUsuEncontrada;
			//productos.sort();
			$("#entregada").removeClass("entregado");
			$("#lista").html("");
			$("#cardBody").html("");
			if(productos.length != 0){				
				let consecutivo = 1;
				productos.sort();
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
				$("#cardBody").append(
						"<p class='card-text'>Ticket: "+infoUser.idVenta+"</p>"+
						"<p class='card-text'>ID Cliente: "+infoUser.idTarjeta+"</p>"+
						"<p class='card-text'>Nombre: "+infoUser.nombreCompleto+"</p>"+
						"<p class='card-text'>Fecha Venta: "+infoUser.fechaVenta+"</p>"
				);
				
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
			$("#cardBody").html("");
			$("#entregada").addClass("entregado");
		}else{
			Swal.fire({
				icon:'error',
				title:'Ocurrio un error intentelo mas tarde'
			});
		}
	});
});