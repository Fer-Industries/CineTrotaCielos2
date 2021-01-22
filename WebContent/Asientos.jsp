<%@page import="mx.com.cinema.entities.UsuarioBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <% HttpSession sesion = request.getSession();
    		UsuarioBean usuarioLogueado = (UsuarioBean) sesion.getAttribute("usuario");
     %>
<!DOCTYPE html>
<html>
<head>


<meta charset="ISO-8859-1">
<title>Asientos</title>

	
	<link rel="stylesheet" href="Css/Asientos.css">
 	<link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.0.0/animate.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Fira+Sans:wght@800&family=Kanit:ital,wght@1,600&family=Roboto:wght@300;500&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Unica+One&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.0.0/animate.min.css"/>
  
</head>
<body class="fondo animate__animated animate__fadeIn">
<nav class="navbar navbar-expand-lg navbar-toggleable-sm navbar-dark 
  animate_animated animate_fadeInDown  shadow-lg sticky-top">
		<button class="navbar-toggler navbar-toggler-right togglercolor" type="button" data-toggle="collapse" data-target="#menu" aria-controls="menu" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
        </button>
        <a class="navbar-brand" href="principal.jsp"><img class="imagenav mx-sm-2 logo"  alt="logo" src="Img/logo.png"></a>
         <div class="collapse navbar-collapse" id="menu">
            <div class="navbar-nav" >
                <a class="nav-link" href="principal.jsp">INICIO<span class="sr-only">(current)</span></a>
                <a class="nav-link" href="dulceria.jsp">DULCERIA</a>
                <a class="nav-link" href="Funciones.jsp">BUSQUEDA<span class="sr-only">(current)</span></a>
            	<% if(usuarioLogueado == null){%>
                <a class="nav-link buttonnav pl" href="Login.jsp">INICIAR SESIÓN <i class="fas fa-user-circle"></i></a>
                <a class="nav-link buttonnav pl2" href="Registro.jsp">REGISTRARME  <i class="fas fa-user-edit"></i></a>
          		<% }else{%>
          			<a class="nav-link buttonnav pl2" ><%=usuarioLogueado.getNombre() +" "+ usuarioLogueado.getaPaterno()%></a>
          		<%}%>
          </div>
         </div>
     </nav>
<% if(usuarioLogueado == null){%>
	<script>
		window.location.href = "Login.jsp";
	</script> 
<%}else{%>
	<div class="container text-center">
      	<p class="tittle1"> ASIENTOS </p>
      	<p class="cont"> Checa los asientos disponibles y selecciona los de tu agrado <p>
    </div>
    <div class="container container1  animate__animated animate__backInDown padown mb-4">
	<div class="infocard" >
	  <div class="row no-gutters card-block" >
	    <div id="imagenP"  class="col-md-7">
	    </div>
	    <div class="col-md-5">
	      <div id="contenidoP" class="card-body ">
	    </div>
	  </div>
	</div>
	</div>
	</div>
	
	<div class="container fondo-cont table-responsive">
	<div class="container-fluid container1 fondo2 mt-2">
		<div class="row ">
			<div class="col-md-4">
			<i class="fas fa-chair container text-center dispo"></i>
			<p class="cont text-center">Asientos disponibles  </p>
			</div>
			<div class="col-md-4 ">
			<i class="fas fa-chair dispoNo container text-center"></i>
			<p class="cont text-center">Asientos no disponibles </p>
			</div>
			<div class="col-md-4">
			<i class="fas fa-chair container text-center selec"></i>
			<p class="cont text-center">Asientos seleccionados  </p>
			</div>
		</div>
	</div>
		<table id="userdata" class="table table-sm mt-3">
		  <tbody id="cuerpoTabla">
		  </tbody>
		</table>
		<div class="boton-confirmacion">
			<button class="btn btn-primary" id="botonConfirmacion">Aceptar</button>
		</div>
	</div>
<%}%>
<footer class="footer mt-3">
    <ul class="list-unstyled list-inline text-center">
      <li class="list-inline-item">
        <a class="btn-floating btn-fb mx-1">
          <i class="fab fa-facebook-f fa-2x"> </i>
        </a>
      </li>
      <li class="list-inline-item">
        <a class="btn-floating btn-tw mx-1">
          <i class="fab fa-twitter fa-2x"> </i>
        </a>
      </li>
      <li class="list-inline-item">
        <a class="btn-floating btn-gplus mx-1">
          <i class="fab fa-google-plus-g fa-2x"> </i>
        </a>
      </li>
      <li class="list-inline-item">
        <a class="btn-floating btn-li mx-1">
          <i class="fab fa-linkedin-in fa-2x"> </i>
        </a>
      </li>
     
    </ul>
    <!-- Social buttons -->

  </div>
  <!-- Footer Elements -->

  <!-- Copyright -->
  <div class="footer-copyright text-center py-3">© 2020 Copyright:
    <a href="https://mdbootstrap.com/"> www.Cinema.com</a>
  </div>
  <!-- Copyright -->

</footer>
<!-- Footer -->	

	
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> 
	<script src="https://kit.fontawesome.com/af8d928238.js" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
	<script src="JS/Asientos.js"></script>
	
</body>
</html>