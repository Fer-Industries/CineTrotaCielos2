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
        if(usuarioNuevo.birthday.length == 0){
            elementoMensaje.innerHTML = "Debes llenar este campo";
			return false;
        }else{
            elementoMensaje.innerHTML = "";
			
        }
    }

document.getElementById("Registro").addEventListener("click",()=>{
	console.log(usuarioNuevo);
	 $.ajax({
         url: '/Cinema/Registro',
         type: 'post',
         contentType:'application/json',
         data:{usuarioNuevo:usuarioNuevo},
         success: function (response) {
        	 console.log(response);
         }
     });
});
/*
document.getElementById("Registro").addEventListener("click",() =>{
	const respuestaCorreoRg =validacionCorreoRg();
	const respuestaPassRg = validacionPasswordRg(); 
	Swal.fire('Espere por favor');
	Swal.showLoading();
	if(respuestaCorreoRg == false || respuestaPassRg  == false){
		Swal.fire({
		  icon: 'error',
		  title: 'Verifique que sus datos sean correctos',
		  showConfirmButton: false,
		  timer: 1500
		})
		return;
	}*/

