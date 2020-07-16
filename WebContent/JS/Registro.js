const pNombre = /[a-zA-Z ]/;
const pEmailRg = /^(([^<>()\[\]\.,;:\s@\"]+(\.[^<>()\[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
const pPhone = /^[0-9]$/;
let nombre;
let paterno;
let materno;
let correoRg;
let passwordRg;
let verifpassRg;
let telefono;
let fecha;

function validacionNombre(){
        let elementoMensaje = document.getElementById("nombreMensaje");
        nombre = document.getElementById("Nombre").value;
        if(nombre.length == 0){
            elementoMensaje.innerHTML = "Debes rellenar este campo";
			return false;
        }else{
            elementoMensaje.innerHTML = "";
			if(pNombre.test(nombre)){
				return true;	
			}else{
				elementoMensaje.innerHTML = "Solo se aceptan letras en este campo";
				return false;	
			}
        }
    }

function validacionPaterno(){
        let elementoMensaje = document.getElementById("paternoMensaje");
        paterno = document.getElementById("Paterno").value;
        if(paterno.length == 0){
            elementoMensaje.innerHTML = "Debes rellenar este campo";
			return false;
        }else{
            elementoMensaje.innerHTML = "";
			if(pNombre.test(paterno)){
				return true;	
			}else{
				elementoMensaje.innerHTML = "Solo se aceptan letras en este campo";
				return false;	
			}
        }
    }

function validacionMaterno(){
        let elementoMensaje = document.getElementById("maternoMensaje");
        materno = document.getElementById("Materno").value;
        if(materno.length == 0){
            elementoMensaje.innerHTML = "Debes rellenar este campo";
			return false;
        }else{
            elementoMensaje.innerHTML = "";
			if(pNombre.test(materno)){
				return true;	
			}else{
				elementoMensaje.innerHTML = "Solo se aceptan letras en este campo";
				return false;	
			}
        }
    }

function validacionCorreoRg(){
        let elementoMensaje = document.getElementById("emailrgMensaje");
        correoRg = document.getElementById("EmailRg").value;
        if(correoRg.length == 0){
            elementoMensaje.innerHTML = "Debes rellenar este campo";
			return false;
        }else{
            elementoMensaje.innerHTML = "";
			if(pEmailRg.test(correoRg)){
				return true;	
			}else{
				elementoMensaje.innerHTML = "Inserta una direcci\u00F3n v\u00E1lida";
				return false;	
			}
        }
    }

function validacionPasswordRg(){
        let elementoMensaje = document.getElementById("passwordrgMensaje");
        passwordRg = document.getElementById("PasswordRg").value;
        if(passwordRg.length == 0){
            elementoMensaje.innerHTML = "Debes rellenar este campo";
			return false;
        }else{
            elementoMensaje.innerHTML = "";
			if(passwordRg.length < 8){
				elementoMensaje.innerHTML ="Coloca una contrase\u00F1a de m\u00EDnimo 8 car\u00E1cteres";
				return false;	
			}else{
				return true;	
			}
        }
    }
function validacionVerifPasswordRg(){
	let elementoMensaje = document.getElementById("verifpasswordMensaje")
	verifpassRg = document.getElementById("VerifPasswordRg").value;
	if(verifpassRg.length == 0){
		elementoMensaje.innerHTML = "Debes rellenar este campo";
		return false;
	}else{
		elementoMensaje.innerHTML = "";
		if(passwordRg != verifpassRg){
			elementoMensaje.innerHTML = "Sus constrase\u00F1as no coinciden, verif\u00EDquelos";
			return false;
		}else{
			return true;
		}
	}
}


function validacionTelefono(){
        let elementoMensaje = document.getElementById("telefonoMensaje");
        telefono = document.getElementById("Telefono").value;
        if(telefono.length == 0){
            elementoMensaje.innerHTML = "";
			return false;
        }else{
            elementoMensaje.innerHTML = "";
			if(pPhone.test(telefono)){
				return true;	
			}else{
				elementoMensaje.innerHTML = "Solo se aceptan n\u00FAmeros en este campo";
				return false;	
			}
        }
    }

function validacionFecha(){
        let elementoMensaje = document.getElementById("fechaMensaje");
        fecha = document.getElementById("Fecha").value;
        if(fecha.length == 0){
            elementoMensaje.innerHTML = "Debes llenar este campo";
			return false;
        }else{
            elementoMensaje.innerHTML = "";
			
        }
    }

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

