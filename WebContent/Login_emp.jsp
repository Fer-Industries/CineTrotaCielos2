<%@page import="mx.com.cinema.entities.EmpleadoBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="es">
<head>

<link rel="stylesheet" href="Css/Login.css">
<link rel="stylesheet" href="Css/navbar.css">
<link href="https://fonts.googleapis.com/css2?family=Fira+Sans:wght@800&family=Kanit:ital,wght@1,600&family=Roboto:wght@300;500&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Unica+One&display=swap" rel="stylesheet">
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.0.0/animate.min.css"/>
</head>
<body>

    <nav class="navbar navbar-expand-lg navbar-toggleable-sm navbar-dark 
  animate_animated animate_fadeInDown  shadow-lg sticky-top">
		<button class="navbar-toggler navbar-toggler-right togglercolor" type="button" data-toggle="collapse" data-target="#menu" aria-controls="menu" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
        </button>
        <a class="navbar-brand" href="principal.jsp">Cinema<img class="imagenav mx-sm-2"  alt""></a>
         <div class="collapse navbar-collapse" id="menu">
            <div class="navbar-nav" >
          </div>
         </div>
     </nav>
<div class="container animate__animated animate__backInDown padown">
		<h3 class="tittle text-center textWhite"> Inicio de sesión de Empleados</h3>
		<div class="contf shadow" action="">
			<div class="padcenter">
			<div class="text1">
		  	<div class="row">
		      <label for="inputEmail4">Email: </label>
		      <input type="email" class="form-control " id="Email" name="Login">
		      <label id="emailMensaje" class="mensajeErroneo"></label>
			</div>
		</div>

		 	<div class="row">
		      <label for="inputPassword4">Password:</label>
		      <input type="password" class="form-control" id="Password"  minlength="8" name="Pass" >
		      <label id="passwordMensaje" class="mensajeErroneo"></label>
			</div>	
			

			<div class="Olv">
		 	<div class="row">
		 	<a href="#" class="text-center">¿Olvidaste tu contraseña?</a>
			</div>	
			</div>
			<div class="paddingB">
			<input class="btn btn-primary padding1" id="enviar"
			type="submit"  value="Entrar" > 
			</div>
			</div>
</div>
<script src="https://kit.fontawesome.com/af8d928238.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="JS/Login_emp.js"></script>

</body>
</html>