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
<title>Dulceria</title>

    <link rel="stylesheet" href="Css/dulceria.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.0.0/animate.min.css"/>
	<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
</head>
<body class="fondo">
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
                <a class="nav-link buttonnav pl" href="Login.jsp">INICIAR SESI�N <i class="fas fa-user-circle"></i></a>
                <a class="nav-link buttonnav pl2" href="Registro.jsp">REGISTRARME  <i class="fas fa-user-edit"></i></a>
          		<% }else{%>
          			<a class="nav-link buttonnav pl2" ><%=usuarioLogueado.getNombre() +" "+ usuarioLogueado.getaPaterno()%></a>
          		<%}%>
          </div>
         </div>
     </nav>
	<br>
	
	<section id="filtros" class="container">
		<h1 class="descripcion">Dulceria</h1>
         <p class="descripcion">Selecciona la opci�n de producto para mostrar los productos o combos disponibles</p>
		<div class="row">
			<div class="input-group mb-3 col-sm-12 col-md-6 col-lg-4"style="width:350px">
	            <div class="input-group-prepend">
	            
	              <label class="input-group-text" for="opcProducto">Opci�n producto</label>
	            </div>
	            <select class="custom-select" id="opcProducto" onchange="opcionSeleccionada(this)">
	            	<option selected value='0'>Seleccionar</option > 
	            </select>
	         </div>
	         
	         <div class="input-group mb-3 col-sm-12 col-md-6 col-lg-4 selectTipoDefault" style="width:350px"
	         id="divTipo">
	            <div class="input-group-prepend">
	              <label class="input-group-text" for="tipoProducto">Tipo Producto</label>
	            </div>
	            <select class="custom-select" id="tipoProducto" onchange="tipoSeleccionada(this)">
	            	 
	            </select>
	         </div>
         </div> 
	</section>
	
	<br>
	
	<section  class="container">
		<div id=productos class="row">
		</div>
	</section>
	
	<section class="overlay">
	
	</section>

    
  	<div class="bottomcorner" onclick='carrito()'>
		<i class=" far fa-shopping-cart "></i>
		<p class=" number" id="cantidadProductos">0</p>
	</div>
	
<!-- JS PARA BOOTSTRAP -->	
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
<!-- JQUERY -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

<script src="JS/dulceria.js"></script>
<!-- FONT-AWESOME -->
<!-- <script src="https://kit.fontawesome.com/af8d928238.js" crossorigin="anonymous"></script>-->
</body>
</html>