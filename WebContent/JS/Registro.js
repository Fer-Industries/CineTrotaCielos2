const pNombre = /[a-zA-Z ]/;
const pEmailRg = /^(([^<>()\[\]\.,;:\s@\"]+(\.[^<>()\[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
const pPhone = /^[0-9]$/;
let usuarioNuevo = {
 nombre: " ",
 aPaterno: " ",
 aMaterno: " ",
 correo: " ",
 contrasena: " ",
 verifpassRg:" ",
 birthday:" "
};


function validacionNombre(){
        let elementoMensaje = document.getElementById("nombreMensaje");
        usuarioNuevo.nombre = document.getElementById("Nombre").value;
        if(usuarioNuevo.nombre.length == 0){
            elementoMensaje.innerHTML = "Debes rellenar este campo";
			return false;
        }else{
            elementoMensaje.innerHTML = "";
			if(pNombre.test(usuarioNuevo.nombre)){
				return true;	
			}else{
				elementoMensaje.innerHTML = "Solo se aceptan letras en este campo";
				return false;	
			}
        }
    }

function validacionPaterno(){
        let elementoMensaje = document.getElementById("paternoMensaje");
        usuarioNuevo.aPaterno = document.getElementById("Paterno").value;
        if(usuarioNuevo.aPaterno.length == 0){
            elementoMensaje.innerHTML = "Debes rellenar este campo";
			return false;
        }else{
            elementoMensaje.innerHTML = "";
			if(pNombre.test(usuarioNuevo.aPaterno)){
				return true;	
			}else{
				elementoMensaje.innerHTML = "Solo se aceptan letras en este campo";
				return false;	
			}
        }
    }

function validacionMaterno(){
        let elementoMensaje = document.getElementById("maternoMensaje");
        usuarioNuevo.aMaterno = document.getElementById("Materno").value;
        if(usuarioNuevo.aMaterno.length == 0){
            elementoMensaje.innerHTML = "Debes rellenar este campo";
			return false;
        }else{
            elementoMensaje.innerHTML = "";
			if(pNombre.test(usuarioNuevo.aMaterno)){
				return true;	
			}else{
				elementoMensaje.innerHTML = "Solo se aceptan letras en este campo";
				return false;	
			}
        }
    }

function validacionCorreoRg(){
        let elementoMensaje = document.getElementById("emailrgMensaje");
        usuarioNuevo.correo = document.getElementById("EmailRg").value;
        if(usuarioNuevo.correo.length == 0){
            elementoMensaje.innerHTML = "Debes rellenar este campo";
			return false;
        }else{
            elementoMensaje.innerHTML = "";
			if(pEmailRg.test(usuarioNuevo.correo)){
				return true;	
			}else{
				elementoMensaje.innerHTML = "Inserta una direcci\u00F3n v\u00E1lida";
				return false;	
			}
        }
    }

function validacionPasswordRg(){
        let elementoMensaje = document.getElementById("passwordrgMensaje");
        usuarioNuevo.contrasena = document.getElementById("PasswordRg").value;
        if(usuarioNuevo.contrasena.length == 0){
            elementoMensaje.innerHTML = "Debes rellenar este campo";
			return false;
        }else{
            elementoMensaje.innerHTML = "";
			if(usuarioNuevo.contrasena.length < 8){
				elementoMensaje.innerHTML ="Coloca una contrase\u00F1a de m\u00EDnimo 8 car\u00E1cteres";
				return false;	
			}else{
				elementoMensaje.innerHTML = "";
				if(usuarioNuevo.contrasena.length > 16){
					elementoMensaje.innerHTML ="Coloca una contrase\u00F1a de maximo 16 car\u00E1cteres";
					return false;
				}else{
				return true;
				}	
			}
        }
    }
function validacionVerifPasswordRg(){
	let elementoMensaje = document.getElementById("verifpasswordMensaje")
	usuarioNuevo.verifpassRg = document.getElementById("VerifPasswordRg").value;
	if(usuarioNuevo.verifpassRg.length == 0){
		elementoMensaje.innerHTML = "Debes rellenar este campo";
		return false;
	}else{
		elementoMensaje.innerHTML = "";
		if(usuarioNuevo.contrasena != usuarioNuevo.verifpassRg){
			elementoMensaje.innerHTML = "Sus constrase\u00F1as no coinciden, verif\u00EDquelos";
			return false;
		}else{
			return true;
		}
	}
}


function validacionFecha(){
        let elementoMensaje = document.getElementById("fechaMensaje");
        usuarioNuevo.birthday = document.getElementById("Fecha").value;
        if(usuarioNuevo.birthday == " " || usuarioNuevo.birthday ==0){
            elementoMensaje.innerHTML = "Debes llenar este campo";
			return false;
        }else{
            elementoMensaje.innerHTML = "";
			
        }
    }

document.getElementById("Registro").addEventListener("click",()=>{
	console.log(usuarioNuevo);
	const resCorreo = validacionCorreoRg();
	const resPass = validacionPasswordRg();
	const resNomb = validacionNombre();
	const resaPa = validacionPaterno();
	const resaMa = validacionMaterno();
	const resVerifPass = validacionVerifPasswordRg();
	const resFecha = validacionFecha();
	Swal.fire('Espere por favor');
	Swal.showLoading();
	if(resNomb == false || resaPa == false || resaMa == false || resCorreo == false || resPass == false || resVerifPass == false || resFecha == false){
			Swal.fire({
		  icon: 'error',
		  title: 'Verifique que los campos esten llenos',
		  showConfirmButton: false,
		  timer: 1500
		})
		return;
		
	}else{
	 $.ajax( {
         url: '/Cinema/Registro',
         type: 'POST',
         data:{info:JSON.stringify (usuarioNuevo)},
         success: function (response) {
			Swal.close();
			if (response == "3"){
			Swal.fire({
	        			  icon: 'succes',
	        			  title: 'Registro Exitoso',
	        			  showConfirmButton: false,
	        			  timer: 1500
	        			});
			}else if(response == "2"){
				Swal.fire({
  				title: 'Ya existe un usuario con este correo',
  				showClass: {
    			popup: 'animate__animated animate__fadeInDown'
  				},
  				hideClass: {
    			popup: 'animate__animated animate__fadeOutUp'
  						}
					});
			}else if(response == "1"){
				Swal.fire({
  				title: 'Tu usuario ya está dado de baja',
  				showClass: {
    			popup: 'animate__animated animate__fadeInDown'
  				},
  				hideClass: {
    			popup: 'animate__animated animate__fadeOutUp'
  						}
					});
					}
					}
     });
	}
});

/*
document.getElementById("enviar").addEventListener("click",() =>{
	const respuestaCorreo =validacionEmail();
	const respuestaPass = validacionPass(); 
	Swal.fire('Espere por favor');
	Swal.showLoading();
	if(respuestaCorreo == false || respuestaPass == false){
		Swal.fire({
		  icon: 'error',
		  title: 'Verifique que sus datos sean correctos',
		  showConfirmButton: false,
		  timer: 1500
		})
		return;
	}else{//ya esta correct la info
		 $.ajax( {
	         url: '/Cinema/Login',
	         type: 'post',
	         data: {  
	        	 correo:correo,
	        	 contra:password
	         },
	         success: function (response) {
	        	 Swal.close();
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
	        			window.location.href = "principal.jsp";
	        	 }
	         }
	     } );
		
		//alert('se envia la info');
	}
});

	}*/

