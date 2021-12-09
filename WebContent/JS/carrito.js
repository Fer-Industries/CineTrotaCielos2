let total = 0;
let arregloCarrito = localStorage.getItem('ArregloCarrito');
let arregloProductos= [];

const getInfoCarrito = () =>{
	//var longitudCarrito = 0;
	if(arregloCarrito != null){ //ya seleccionó un producto
		var arregloLocal = arregloCarrito;
		arregloProductos = JSON.parse(arregloLocal);
		console.log(arregloProductos);
		arregloProductos.forEach(producto =>{
			var totalProducto = producto.precio * producto.cantidad;
			producto.total = totalProducto;
			$("#productos").append(
				"<li class='list-group-item d-flex justify-content-between lh-sm'" +
				"id = '"+producto.id+"'>"+
                    "<i class='fas fa-trash' onclick='borrarProducto("+JSON.stringify(producto)+")'></i>"+
					"<div>"+
                        "<h6 class='my-0'>"+producto.nombre+"</h6>"+
                        "<small class='text-muted'>Cantidad "+producto.cantidad+"</small>"+
                    "</div>"+
                    "<span class='text-muted'>$"+totalProducto+"</span>"+
                "</li>"
			);
			total = total + totalProducto;
		});
		
		$("#productos").append(
				"<li class='list-group-item d-flex justify-content-between bg-light'>"+
	                "<div class='text-success'>"+
	                    "<h6 class='my-0'>Total</h6>"+
	                "</div>"+
	                "<span class='text-success' id='totalCuenta'>$"+total+"</span>"+
                "</li>"
			);
		
		/*longitudCarrito = arregloProductos.length;
		
		$("#totalProd").html(longitudCarrito);*/
		Swal.fire({
			  icon: 'success',
			  title: 'Listo',
			  text: 'Proceder al pago'
		});
		
	}else{
		Swal.fire({
			  icon: 'error',
			  title: 'Vacio',
			  text: 'El carrito esta vacío'
		})
	}
}

getInfoCarrito();

const borrarProducto = (producto) =>{
	console.log(producto);
	console.log(arregloProductos);
	total = total - producto.total;
	
	$("#totalCuenta").html(total+"");
	$("#"+producto.id).remove();
	
	const nuevoArreglo = arregloProductos.filter(productoArreglo => productoArreglo.id  != producto.id);
	console.log(nuevoArreglo);
	localStorage.setItem('ArregloCarrito',JSON.stringify(nuevoArreglo));
}

/*LOGICA PARA LA VALIDACION DE TARJETA*/
let letrasPattern = /^[A-Za-zÁáÉéÍíÓóÚúÑñ]+$/;
let letrasNumbers = /^[0-9-]+$/;
var emailPattern = /^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$/;
let correctNombre = false;
let correctoNumero = false;
let correctaFecha = false;
let correctoCVV = false;

document.getElementById("Name").addEventListener("focusout", function() {

    let elementoMensajeN = document.getElementById("mensajeNombre");
    let nombre = document.getElementById("Name").value;
    if (nombre.length == 0) {
        elementoMensajeN.innerHTML = "Debes de poner el nombre de la tarjeta";
        correctNombre = false;
    } else {
        elementoMensajeN.innerHTML = "";
        let correctoNombre = letrasPattern.test(nombre);
        if (correctoNombre == false) {
            elementoMensajeN.innerHTML = "Solo se pueden letras";
            $("#Name").val("");
            correctNombre = false;
        } else {
            elementoMensajeN.innerHTML = "";
            correctNombre = true;
        }
    }
});

document.getElementById("cc-number").addEventListener("focusout", function() {

    let elementoMensajeN1 = document.getElementById("mensajeNumero");
    let cod = document.getElementById("cc-number").value;
    if (cod.length == 0) {
        elementoMensajeN1.innerHTML = "Debes de poner el numero de tu tarjeta";
        correctaFecha = false
    } else {
        elementoMensajeN1.innerHTML = "";
        let correctoCod = letrasNumbers.test(cod);
        if (correctoCod == false) {
            elementoMensajeN1.innerHTML = "Solo se pueden numeros";
            $("#cc-number").val("");
            correctaFecha = false
        } else {
            elementoMensajeN1innerHTML = "";
            correctoNumero = true;
        }
    }
});

document.getElementById("vigencia").addEventListener("focusout", function() {

    let elementoMensajeN1 = document.getElementById("mensajeVigencia");
    let cod = document.getElementById("vigencia").value;
    if (cod.length == 0) {
        elementoMensajeN1.innerHTML = "Debes de poner el numero de la vigencia de tu tarjeta";
        correctaFecha = false
    } else {
        elementoMensajeN1.innerHTML = "";
        let correctoCod = letrasNumbers.test(cod);
        if (correctoCod == false) {
            elementoMensajeN1.innerHTML = "Solo se pueden numeros";
            $("#vigencia").val("");
            correctaFecha = false;
        } else {
            elementoMensajeN1innerHTML = "";
            correctaFecha = true;
        }
    }
});

document.getElementById("cvv").addEventListener("focusout", function() {
    let elementoMensajeN1 = document.getElementById("mensajeCvv");
    let cod = document.getElementById("cvv").value;
    if (cod.length == 0) {
        elementoMensajeN1.innerHTML = "Debes de poner el numero de seguridad de tu tarjeta";
        correctoCVV = false;
    } else {
        elementoMensajeN1.innerHTML = "";
        let correctoCod = letrasNumbers.test(cod);
        if (correctoCod == false) {
            elementoMensajeN1.innerHTML = "Solo se pueden numeros";
            $("#cvv").val("");
            correctoCVV = false;
        } else {
            elementoMensajeN1innerHTML = "";
            correctoCVV = true;
        }
    }
});

document.getElementById("pagar").addEventListener("click",function(){
	console.log('pago');

	if(correctNombre == true && correctoNumero == true && correctaFecha == true
			&& correctoCVV == true){
		
		console.log(arregloProductos);
		Swal.fire('Estamos preparando tu orden :D');
		Swal.showLoading();
		$.ajax({
			 url: '/Cinema/Carrito',
			 type: 'get',
			 data: { 
				 carrito: JSON.stringify(arregloProductos)
			 },
			 success: function(response) {
				 
				 console.log(response);
				 Swal.close();
				 if(response > 0 ){
					 /*Swal.fire({
						  icon: 'success',
						  title: 'Exito',
						  text: 'Por favor presente el siguiente codigo en la caja para recoger su pedido : ' + response
					});*/
					 
					 Swal.fire({
						  title: 'Exito',
						  text: "Por favor presente el siguiente codigo en la caja para recoger su pedido : " + response+", tambi&eacute;n se env&iacute;o un correo con el ticket de su pedido",
						  icon: 'warning',
						  confirmButtonColor: '#3085d6',
						  confirmButtonText: 'Ya lo anote'
						}).then((result) => {
						  if (result.isConfirmed) {
							  localStorage.removeItem('ArregloCarrito');
							 window.location.href = 'principal.jsp';
						  }
						});
				 }else{
					 Swal.fire({
						  icon: 'error',
						  title: 'Error',
						  text: 'Hubo un pequeño problema para realizar la venta'
					});
				 }
			 }
		});
	}else{
		Swal.fire({
			  icon: 'error',
			  title: 'Error',
			  text: 'Hay un problema con la info de pago'
		});
	}
})