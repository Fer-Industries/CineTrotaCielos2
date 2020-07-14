<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Cinema</title>
<link rel="stylesheet" href="Css/Login.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Unica+One&display=swap" rel="stylesheet">
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.0.0/animate.min.css"/>
     <style type="text/css">
     body{
	background-image: url("Img/Back.PNG") !important;
		}
     </style>
</head>
<body>

<div class="container animate__animated animate__backInDown padown">
		<h3 class="tittle text-center"> Inicio de sesión</h3>
		<form class="contf shadow">
			<div class="padcenter">
			<div class="text1">
		  	<div class="row">
		      <label for="inputEmail4">Email: </label>
		      <input type="email" class="form-control " id="inputEmail4" name="Login">
			</div>
		</div>

		 	<div class="row">
		      <label for="inputPassword4">Password:</label>
		      <input type="password" class="form-control" id="inputPassword4">
			</div>	
			

			<div class="Olv">
		 	<div class="row">
		 	<a href="#" class="text-center">¿Olvidaste tu contraseña?</a>
			</div>	
			</div>
			<div class="paddingB">
			<input class="btn btn-primary padding1" type="submit" value="Entrar"> 
			</div>
			</div>
				

				</form>
				<div class="Cuen">
				<p class="text-center">¿No tienes una cuenta? <a href="#" class="rgt"> <strong>¡Regístrate aquí! </strong></a></p> 
				</div>
</div>
</body>
</html>