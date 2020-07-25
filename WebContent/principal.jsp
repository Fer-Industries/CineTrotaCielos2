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
<title>Principal Cinema</title>
    <link rel="stylesheet" href="Css/Principal.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.0.0/animate.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Fira+Sans:wght@800&family=Kanit:ital,wght@1,600&family=Roboto:wght@300;500&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Unica+One&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.0.0/animate.min.css"/>
</head>
<body>
  <nav class="navbar navbar-expand-lg navbar-toggleable-sm navbar-dark animate_animated animate_fadeInDown  shadow-lg sticky-top">
		<button class="navbar-toggler navbar-toggler-right togglercolor" type="button" data-toggle="collapse" data-target="#menu" aria-controls="menu" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
        </button>
        <a class="navbar-brand" href="principal.jsp">Cinema<img class="imagenav mx-sm-2"  alt""></a>
         <div class="collapse navbar-collapse" id="menu">
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
      <br>
      <br>
      
      <div class="page-header">
            <h1 class="tittle text-center">ESTRENOS</h1>
            <p class="sutitulos text-center">CONSULTA LOS ESTRENOS QUE TRAEMOS PARA TI</p>
      </div>
 
	<!--Carrusel-->
	<div class="carrusel">
		<div class="container-fluid Carrusel">
			<div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
			  <ol class="carousel-indicators">
			    <li data-target="#carouselExampleCaptions" data-slide-to=" 1" class="active"></li>
			    <li data-target="#carouselExampleCaptions" data-slide-to=" 2"></li>
			    <li data-target="#carouselExampleCaptions" data-slide-to=" 3"></li>
			    <li data-target="#carouselExampleCaptions" data-slide-to=" 4"></li>
			  </ol>
			  <div class="carousel-inner">
			    <div class="carousel-item active">
			      <img id="pelImg1" class="d-block w-100" alt="...">
			      <div class="carousel-caption d-none d-md-block">
			        <h5 id="pelNom1"></h5>
			      </div>
			    </div>
			    <div class="carousel-item">
			      <img id="pelImg2" class="d-block w-100" alt="...">
			      <div class="carousel-caption d-none d-md-block">
			        <h5 id="pelNom2"><strong></strong></h5>
			      </div>
			    </div>
			    <div class="carousel-item">
			      <img id="pelImg3" class="d-block w-100" alt="...">
			      <div class="carousel-caption d-none d-md-block">
			        <h5 id="pelNom3"><strong></strong></h5>
			      </div>
			    </div>
			    <div class="carousel-item">
			      <img id="pelImg4" class="d-block w-100" alt="...">
			      <div class="carousel-caption d-none d-md-block">
			        <h5 id="pelNom4"> <strong></strong></h5>
			      </div>
			    </div>
			  </div>
			  <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
			    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			    <span class="sr-only">Previous</span>
			  </a>
			  <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
			    <span class="carousel-control-next-icon" aria-hidden="true"></span>
			    <span class="sr-only">Next</span>
			  </a>
			</div>
		</div>
	</div>
	<br>
	<br>
	  <div class="container anuncios rounded">
		    <!-- Example row of columns -->
		    <div class="row">
		      <div class="col-sm-12 col-md-6">
		        <h2>Promociones</h2>
		        <ul>
 				    <li>Martes: Taquilla 2x1 con credencial de estudiante</li>
  					<li>Entrada Gratis Niños Sábados de 12:00 - 13:00</li>
  					<li>Viernes: Palomitas Grandes en la compra de cualquier snack</li>
  					<li>Pase CineUp $250.00 </li>
				</ul>
		      </div>
		      <div class="col-sm-12 col-md-6">
		        <h2>COVID-19</h2>
		        <p>Agradecemos el cuidado y respeto que ústed da a las medidas de salud. Los cines actúalmente cuenta con el equipo de sanitización y la atención de salud para recibir
					su visita, de igual manera le pedimos que conserve su distancia y cuente con un cubrebocas.
					Atentamente Cine Trotacielos.<p>
		      </div>
		    </div>
		    <hr>
		
		  </div> 
	
	<br>
	<br>
	
	<footer class="container-fluid pie">
			  <div class="row">
			    <div class="col-6 col-md">
			      <h5>Fer Industries</h5>
			      <small class="d-block mb-3 text-muted">&copy; 2020</small>
			      <p>
			      	Grupo líder en méxico de entrenimiento, 
			      	encargados de brindar el mejor servicio 
			      	para el cliente. Uniendo la amistad, familiar 
			      	y al pueblo mexicano para una mejor convivencia.
			      </p>
			    </div>
			    <div class="col-6 col-md">
			      	<h5>Legalidad</h5>
			      	<p>* Términos y condiciones</p>
					<p>* Aviso de privacidad</p>					
					<p>* Código de Integridad</p>
			    </div>
			    <div class="col-6 col-md">
			      <h5>Servicios</h5>
			      	<p>* Cine y productos</p>
					<p>* Atención a clientes</p>					
					<p>* CinemaSky App</p>
			    </div> 
			  </div>
			</footer>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
	<script src="https://kit.fontawesome.com/af8d928238.js" crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="JS/principal.js"></script>
</body>
</html>