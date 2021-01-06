<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Venta Linea</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.0.0/animate.min.css"/>
	<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
	<link rel="stylesheet" href="css/ventalinea.css">
</head>
<body>
	 <nav class="navbar navbar-expand-lg navbar-toggleable-sm  navbar-dark bg-dark animate_animated animate_fadeInDown  shadow-lg sticky-top">
		<button class="navbar-toggler navbar-toggler-right togglercolor" type="button" data-toggle="collapse" data-target="#menu" aria-controls="menu" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
        </button>
        <a class="navbar-brand" href="principal.jsp">Cinema<img class="imagenav mx-sm-2"  alt""></a>
         <div class="collapse navbar-collapse  " id="menu">
            <div class="navbar-nav" >
                <a class="nav-link" href="principal.jsp">PUNTO DE VENTA</a>
                <a class="nav-link" href="#">VENTA EN LINEA </a>
          </div>
         </div>
     </nav>
     
     <br>
     <section id="busqueda" class="container">
     	<h2>Busqueda Productos</h2>
     	<br> 
     	<div class="row">
     		<div class="col-sm-4 col-lg-4">
     			<input type="text" class="form-control" placeholder="Ticket"
     			id="ticket">
     		</div>
     		<div class="col-sm-4 col-lg-4">
     			<button type="button" class="btn btn-outline-primary" id="buscar"
     			>Buscar</button>
     		</div>
     	</div>
     </section>
     <br>
     <section id="productos" class="container">
     	
	    <ul class="list-group" id="lista">
			  
		</ul>
		<br>
		<div class="boton entregado" id="entregada">
			<button type="button" class="btn btn-outline-success" id="botonEntregado"
			 >Orden entregada</button>
		 </div>
     </section>
     
     <!-- JS PARA BOOTSTRAP -->	
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
	<!-- JQUERY -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
     
     <script src="js/ventalinea.js"></script>
</body>
</html>