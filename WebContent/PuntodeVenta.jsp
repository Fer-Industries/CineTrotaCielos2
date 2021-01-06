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
<title></title>
	<!-- CSS only -->
	<link href="Css/PuntodeVenta.css" rel="stylesheet" type="text/css">
	<link href="//cdn.jsdelivr.net/npm/@sweetalert2/theme-dark@4/dark.css" rel="stylesheet">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.0.0/animate.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Fira+Sans:wght@800&family=Kanit:ital,wght@1,600&family=Roboto:wght@300;500&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Unica+One&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.0.0/animate.min.css"/>
</head>
<body class="fondo  animate__animated animate__fadeIn ">
 <nav class="navbar navbar-expand-lg navbar-toggleable-sm  navbar-dark bg-dark animate_animated animate_fadeInDown  shadow-lg sticky-top">
		<button class="navbar-toggler navbar-toggler-right togglercolor" type="button" data-toggle="collapse" data-target="#menu" aria-controls="menu" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
        </button>
        <a class="navbar-brand" href="principal.jsp">Cinema<img class="imagenav mx-sm-2"  alt""></a>
         <div class="collapse navbar-collapse  " id="menu">
            <div class="navbar-nav" >
                <a class="nav-link" href="principal.jsp">INICIO<span class="sr-only">(current)</span></a>
                <a class="nav-link" href=""> CARTELERA <span class="sr-only">(current)</span></a>
                <a class="nav-link" href="">PRODUCTOS</a>
                <a class="nav-link" href="">CONTACTO</a>
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
     <div class="container text-center">
      	<p class="tittle1">VENTAS DESDE EL MOSTRADOR</p>
    </div>
    <div class="row">
    	<div class="col-8 align-self-end ">
	    	<div class="container-fluid ">
				 <!-- <input  id="buscador" type="search" placeholder="nombre o codigo....">  <button id="inputBuscar" class="btn btn-primary">buscar</button> -->
				<div class="input-group">
				  <span class="input-group-text">Nombre o Codigo...</span>
				  <input type="text" id="buscador" aria-label="First name" class="form-control">
				</div>
		   	</div>
    	</div>
    	<div class="col-4">
	    	<div class="container mt-1">
		    	<div class="row justify-content-around">
				  <div class="col-sm">
				  	<h5><i class="iconoCarrito fas fa-shopping-cart"></i></h5>
				  	<h5>Pedido</h5>
				  	 
				  </div>
				  <div class="col-sm cajatotal text-center">
				  	<h5>Total</h5>
				   
				   <div class="input-group mb-3">
					   <span class="input-group-text">$</span>
					   <input type="text" id="grantotal" disabled class="form-control" aria-label="Amount (to the nearest dollar)">
				   </div>
				  </div>
				  <div class="col-sm mt-1">
				  	<button id="confirmarPedido" class="btn btn-primary ml-5">Confirmar pedido</button>
				  </div>
				</div>
		    </div>
    	</div>
    	
    </div>
    <div >
   	<div class="row">
   		<div class="col-sm-8 ">
   		  <div class="container-fluid scrolleando">
   		  <hr class="estilohr">
		    <div id="contenedorCartas" name="contene"class="row row-cols-1 row-cols-md-3 g-4">
			</div>
	    </div>
	    
   		</div>
   		<div class="col-sm-4 ">
	   		<hr class="estilohr">
	   		<div class="container scrolleando">
		   		<table class="table" id="tablacarrito">
				  <thead id="headcarrito" class="table-warning "> 
				    <tr>
				      <th scope="col">#</th>
				      <th scope="col">Eliminar</th>
				      <th scope="col">Precio</th>
				      <th scope="col">Código</th>
				      <th scope="col">Nombre del producto</th>
				      <th scope="col">Cantidad</th>
				      <th scope="col">Total</th>
				    </tr>
				  </thead>
				  <tbody id="bodycarrito">
				  </tbody>
				</table>
	   		</div>
   		</div>
   	</div>
    </div>
    
 
<Footer class="footer mt-3">
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
  <!-- Footer Elements -->

  <!-- Copyright -->
  <div class="footer-copyright text-center py-3">© 2020 Copyright:
    <a href="https://mdbootstrap.com/"> www.Cinema.com</a>
  </div>
  <!-- Copyright -->

</footer>
<!-- Footer -->	


<!-- JS, Popper.js, and jQuery -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
	<script src="https://kit.fontawesome.com/af8d928238.js" crossorigin="anonymous"></script>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> 
	<script src="https://cdnjs.cloudflare.com/ajax/libs/wnumb/1.0.4/wNumb.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/9.1.0/nouislider.js"></script>
	
	
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@10/dist/sweetalert2.min.js"></script>
	
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="JS/PuntodeVenta.js"></script>
</body>
</html>