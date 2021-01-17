<%@page import="mx.com.cinema.entities.EmpleadoBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<% HttpSession sesion = request.getSession();
       EmpleadoBean empleadoLogueado = (EmpleadoBean) sesion.getAttribute("empleado");  
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Reportes</title>
	<!-- CSS only -->
	<link href="css/reporte.css" rel="stylesheet" type="text/css">
	<!-- CSS only -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Fira+Sans:wght@800&family=Kanit:ital,wght@1,600&family=Roboto:wght@300;500&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Unica+One&display=swap" rel="stylesheet">
</head>
<body>
<% if(  empleadoLogueado == null){%>
       <h1>no puedes estar aqui</h1>
<% }else{%>
	<nav class="navbar navbar-expand-lg navbar-toggleable-sm  navbar-dark bg-dark animate_animated animate_fadeInDown  shadow-lg sticky-top">
		<button class="navbar-toggler navbar-toggler-right togglercolor" type="button" data-toggle="collapse" data-target="#menu" aria-controls="menu" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
        </button>
        <a class="navbar-brand" >Cinema<img class="imagenav mx-sm-2"  alt""></a>
         <div class="collapse navbar-collapse  " id="menu">
            <div class="navbar-nav" >
         		<a class="nav-link buttonnav pl2" href="/Cinema/PuntodeVenta.jsp">
         			Punto de Venta
         		</a>
          </div>
         </div>
     </nav>
     <br>
	<section class="container">
		<div class="row">
			<div class="col-sm-12 col-lg-6">
				<select class="form-select" aria-label="Default select example" id="selectEmpleado">
				  <option selected></option>				  
				</select>
			</div>
			<div class="col-sm-12 col-lg-3">
				<button class="btn btn-primary wth-100" id="btnBuscar">Buscar</button>
			</div>
		</div>
	</section>     
	<br>
	<section class="container">
		<canvas id="myChart" width="400" height="250"></canvas>	
	</section>
	
	
	<script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js"></script>

	<!-- JS, Popper.js, and jQuery -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
	
	<script src="https://kit.fontawesome.com/af8d928238.js" crossorigin="anonymous"></script>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> 	
	
	<script src="js/reporte.js"></script>
<%}%>
</body>
</html>