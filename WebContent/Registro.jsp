<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
    <title>Registro Cinema</title>
    <link rel="stylesheet" href="Css/Registro.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Unica+One&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.0.0/animate.min.css"/>
</head>
<body>
<h2 class="text">Registro de Cinema</h2>
<div class="container rgt">
<div>
	  <div class="form-row">
		    <div class="col">
		      <label for ="Nombre"> Nombre(s):</label>	
		      <input type="text" class="form-control" placeholder="Nombre" id="Nombre" onfocusout="validacionNombre()">
		      <label id = "nombreMensaje" class="mensajeErroneo"></label>
		    </div>
		  	<div class="col">
		      <label for ="Paterno"> Apellido paterno:</label>	
		      <input type="text" class="form-control" placeholder="Apellido Paterno" id="Paterno" onfocusout="validacionPaterno()">
		      <label id = "paternoMensaje" class="mensajeErroneo"></label>
		    </div>
		    <div class="col">
		      <label for ="Materno"> Apellido materno:</label>	
		      <input type="text" class="form-control" placeholder="Apellido Materno" id="Materno" onfocusout= "validacionMaterno()">
		      <label id = "maternoMensaje" class="mensajeErroneo"></label>
		    </div>
	  </div>
	  <div class="form-row cr">
		    <div class="col">
		      <label for ="EmailRg">Correo electrónico: </label>	
		      <input type="email" class="form-control" placeholder="example@.com" id="EmailRg" onfocusout="validacionCorreoRg()">
		      <label id = "emailrgMensaje" class="mensajeErroneo"></label>
		    </div>
	  </div>
	  	<div class="form-row cr">
		    <div class="col">
		      <label for ="PasswordRg"> Contraseña: </label>	
		      <input type="password" class="form-control" placeholder="" id="PasswordRg" onfocusout="validacionPasswordRg()">
		      <label id = "passwordrgMensaje" class="mensajeErroneo"></label>
	    	</div>
		   	<div class="col">
		      <label for ="VerifPasswordRg"> Verificar Contraseña: </label>	
		      <input type="password" class="form-control" placeholder="" id="VerifPasswordRg" onfocusout="validacionVerifPasswordRg()">
		      <label id = "verifpasswordMensaje" class="mensajeErroneo"></label>
		    </div>
		</div>
	    <div class="form-row cr">
	     <div class="col-sm-6">
	      <label for ="Fecha"> Fecha de Nacimiento: </label>	
	      <input type="date" class="form-control" placeholder="" id="Fecha">
	      <label id = "fechaMensaje" class="mensajeErroneo"></label>
	    </div>
	    <div class="boton">
	    <input class="btn btn-primary padding1" id="Registro"
				type="submit"  value="Registrarse" > 
	    </div>
	  </div>

</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="JS/Registro.js"></script>
</div>


</body>