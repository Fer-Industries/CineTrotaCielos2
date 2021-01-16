/**
 * 
 */
const pEmail = /^(([^<>()\[\]\.,;:\s@\"]+(\.[^<>()\[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
let correo;
let password;

function validacionEmail(){
    let elementoMensaje = document.getElementById("emailMensaje");
    correo = document.getElementById("Email").value;
    if(correo.length == 0){
        elementoMensaje.innerHTML = "Colocar tu direcci\u00F3n de correo electr\u00F3nico";
		return false;
    }else{
        elementoMensaje.innerHTML = "";
		if(pEmail.test(correo)){
			return true;	
		}else{
			elementoMensaje.innerHTML = "Coloca una direcci\u00F3n v\u00E1lida";
			return false;	
		}
    }
}

function validacionPass(){
        
    let elementoMensaje = document.getElementById("passwordMensaje");
    password = document.getElementById("Password").value;
    if(password.length == 0 ){
        elementoMensaje.innerHTML = "Coloca tu contrase\u00F1a de m\u00EDnimo 8 car\u00E1cteres";
		return false;
    }else{
        elementoMensaje.innerHTML = "";
		if(password.length < 8){
			elementoMensaje.innerHTML = "Coloca tu contrase\u00F1a de m\u00EDnimo 8 car\u00E1cteres";
			return false;	
		}else{
			return true;
		}
    }
}

document.getElementById("enviar").addEventListener("click",() =>{
	let identificacion= document.getElementById("Email").value;
	let pass= document.getElementById("Password").value;
	console.log(identificacion)
	console.log(pass);
	const reg = /^[\+\-]?\d*\.?\d+(?:[Ee][\+\-]?\d+)?$/;
	if(reg.test(identificacion)== false || identificacion.charAt(0) == '.'){
		 Swal.fire({
	        			  icon: 'error',
	        			  title: 'Credenciales Invalidas',
	        			  showConfirmButton: false,
	        			  timer: 1500
	        			});
	}else{
	Swal.fire('Espere por favor');
	Swal.showLoading();
		 $.ajax( {
	         url: '/Cinema/Login_emp',
	         type: 'post',
	         data: {  
	        	 id:identificacion,
	        	 contra:pass
	         },
	         success: function (response) {
	        	 Swal.close();
				 console.log(response);
	        	 if(response == '0'){
	        		 Swal.fire({
	        			  icon: 'error',
	        			  title: 'Credenciales Invalidas',
	        			  showConfirmButton: false,
	        			  timer: 1500
	        			});
	        	 }else{					
	        		 Swal.fire({
	        			  icon: 'success',
	        			  title: 'Bienvenido',
	        			  showConfirmButton: false,
	        			  timer: 1500
	        			})
	        			window.location.href = "PuntodeVenta.jsp";
	        	 }
	         }
	     } );
	}
	
		
		//alert('se envia la info');
	
});
