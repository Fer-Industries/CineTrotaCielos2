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
	const respuestaCorreo =validacionEmail();
	const respuestaPass = validacionPass(); 
	if(respuestaCorreo == false || respuestaPass == false){
		Swal.fire({
		  icon: 'error',
		  title: 'Verifique que sus datos sean correctos',
		  showConfirmButton: false,
		  timer: 1500
		})
		
	//	alert('Corriga sus errores');
		return;
	}else{//ya esta correct la info
		Swal.fire({
		  icon: 'success',
		  title: 'Bienvendo',
		  showConfirmButton: false,
		  timer: 1500
		})
		//alert('se envia la info');
	}
});
