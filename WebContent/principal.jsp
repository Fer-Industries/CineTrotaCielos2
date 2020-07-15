<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%String nombreImagen = "vader.jpg"; %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Principal Cinema</title>
    <link rel="stylesheet" href="Css/Login.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Unica+One&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.0.0/animate.min.css"/>
</head>
<body>

		<nav class="navbar navbar-expand-lg navbar-dark animate_animated animate_fadeInDown sticky-top">
         <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav" >
              <li class="nav-item ">
              <a class="navbar-brand" href="">TrotaCielos<img class="imagenav mx-sm-2"  alt></a>
              </li>
              <li class="nav-item  active   mx-sm-2">
                <a class="nav-link" href="principal.jsp">INICIO<span class="sr-only">(current)</span></a>
              </li>
              <li class="nav-item  mx-sm-2">
                <a class="nav-link" href=""> CARTELERA <span class="sr-only">(current)</span></a>
              </li>
              <li class="nav-item ">
                <a class="nav-link" href="">PRODUCTOS</a>
              </li>
              <li class="nav-item mx-sm-2">
                <a class="nav-link" href="">CONTACTO</a>
              </li>
            </ul>
          </div>
          <div class=" ml-auto" id="navbarNav1">
              <ul class="navbar-nav" >
              <li class="nav-item active mx-sm-2">
                  <a class="btn btn-primary" href="Login.jsp">Iniciar Sesión  <i class="fas fa-user-circle"></i></a>
              </li>
              <li class="nav-item active mx-sm-2">
                  <a class="nav-link buttonnav" href="index.html">Registrarme<i class="fas fa-user-edit"></i></a>
              </li>
            </ul>
          </div>
      </nav>
	<!--Carrusel-->
	<div class="carrusel">
		<div class="container paddingC">
			<div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
			  <ol class="carousel-indicators">
			    <li data-target="#carouselExampleCaptions" data-slide-to=" 1" class="active"></li>
			    <li data-target="#carouselExampleCaptions" data-slide-to=" 2"></li>
			    <li data-target="#carouselExampleCaptions" data-slide-to=" 3"></li>
			    <li data-target="#carouselExampleCaptions" data-slide-to=" 4"></li>
			  </ol>
			  <div class="carousel-inner">
			    <div class="carousel-item active">
			      <img src="Carrusel_Img/John4.png" class="d-block w-100" alt="...">
			      <div class="carousel-caption d-none d-md-block">
			        <h5>John Wick Chapter 4</h5>
			      </div>
			    </div>
			    <div class="carousel-item">
			      <img src="Carrusel_Img/BackTo.png" class="d-block w-100" alt="...">
			      <div class="carousel-caption d-none d-md-block">
			        <h5 class="text2" ><strong>Regreso al futuro</strong></h5>
			      </div>
			    </div>
			    <div class="carousel-item">
			      <img src="Carrusel_Img/Nemo.png" class="d-block w-100" alt="...">
			      <div class="carousel-caption d-none d-md-block">
			        <h5 class="text2"><strong>Buscando a Nemo</strong></h5>
			      </div>
			    </div>
			    <div class="carousel-item">
			      <img src="Carrusel_Img/Parasite.png" class="d-block w-100" alt="...">
			      <div class="carousel-caption d-none d-md-block">
			        <h5 class="text3"> <strong>Parasite </strong></h5>
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
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
	<script src="https://kit.fontawesome.com/af8d928238.js" crossorigin="anonymous"></script>
</body>
</html>