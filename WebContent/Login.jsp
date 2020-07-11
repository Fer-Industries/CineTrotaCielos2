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
</head>
<body>
<section class="padding1">
	<div class="padding">
	<div class="container">
		<div class="title">
		<h3 class="padding6">Inicio de sesión</h3>
		</div>
		<form>
			<div class="text1">
		  	<div class="row">
		  	<div class="col-sm-4">
		      <label for="inputEmail4">Usuario o Email: </label>
		      <input type="email" class="form-control" id="inputEmail4" name="Email">
		    </div>
			</div>

			<div class="padding3">
		 	<div class="row">
		 	<div class="col-sm-4">
		      <label for="inputPassword4">Password:</label>
		      <input type="password" class="form-control" id="inputPassword4 " name="Pass">
		    </div>
			</div>	
			</div> 

			<div class="Olv">
		 	<div class="row">
		 	<div class="col-sm-4">
		 	<a href="#" class="padding3" id="Olvido" >¿Olvidaste tu contraseña?</a>
		 	</div>
			</div>	
			</div> 
			</div>
		</form>
	</div>
	</div>
</section>

	<div class="padding2">	
	<input class="btn btn-primary" type="submit" value="Submit" id="btn1">
	</div>

	<div class="Cuen">
	<p>¿No tienes una cuenta? <a href="#" class="padding3" id="Rgt" >Regístrate aquí </a></p> 
	</div>

</body>
</html>