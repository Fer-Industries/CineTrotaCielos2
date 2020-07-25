<%@page import="mx.com.cinema.entities.UsuarioBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <% HttpSession sesion = request.getSession();
    UsuarioBean usuarioLogueado = (UsuarioBean) sesion.getAttribute("usuario"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Busqueda</title>

	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

    <link rel="stylesheet" href="Css/Funciones.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.0.0/animate.min.css"/>
    <link rel="stylesheet" href="css/weather-icons.css">
</head>
<body id="cuerpo" class= "fondo animate__animated animate__fadeIn" >

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

<section class="pelis letra mb-5">
	<div class="container a ">
    	<div class="row">
       	 	<div class="col-lg-3">
       	 	
       	 	
	     		<div  class="card caja-1 " style="background-color:  #A497A7;">
	     				<div class="caja-2 sidebar-box-title px-2"  style="background: linear-gradient(to right ,#3E3241,#6E2C7E);" >
		     			Ubicación <i class="fas fa-search-location"></i>
		     			</div>
		     			<div class="container mx-auto p-3 ">
			     			<select id="inputCine" class="form-control col-md-10">
						        <option selected value=0 >Selecciona tu cine </option>
						    </select>
		     			</div>
 				</div>
 				
				<div class="sidebar-box  rounded  " >
				<div class="card caja-1" style="background-color:  #A497A7;">
				   <div class="sidebar-box-title caja-2 "  style="background: linear-gradient(to right ,#3E3241,#6E2C7E);" >Horario <i class="far fa-clock"></i> </div>
				        <div class="sidebar-box-content ">
						<div class="outerrainge"> 
						   <div id="slider-range" ></div>
						   <div class="slider-labels  letrachi">
						    <div class=" caption letrachi marginder">
						      <strong >De: </strong><span id="slider-range-value1"> AM</span>
						    </div>
						    <div class=" text-right caption letrachi text-center">
						      <strong >A las:</strong> <span id="slider-range-value2"><strong>PM</strong></span>
						    </div>
				  			</div>
						</div>
						</div>
						</div>
				 
				</div>
				
				
				<div class="sidebar-box rounded mb-3">
				<div  class="card caja-1 " style="background-color:  #A497A7;">
				        <div class="caja-2 sidebar-box-title px-2" style="background: linear-gradient(to right ,#3E3241,#6E2C7E);">Día <i class="far fa-calendar-alt"></i></div>
				         <div class="container mx-auto p-3">
				         <p>Date: <input type="text" id="fecha" placeholder="seleciona la fecha <3">
				       
				       <!--   <input type="date" id="fecha" name="fecha"  max="2020-08-20">-->
				 
				  </div>
				  </div>
				  </div>
				   
				       <div  class="card caja-1 " style="background-color:  #A497A7;">
				       <div class="sidebar-box-title px-2 caja-2" style="background: linear-gradient(to right ,#3E3241,#6E2C7E);">Idioma <i class="fas fa-language"></i></div>
				        
				        <div class=" sidebar-box rounded">
				        
				        <!--  <div class="check-row"><label><input id="idioma" type="radio" name="lang-filter" value="" checked="checked" /> </label></div>
				          <div class="check-row"><label><input id="idioma" type="radio" name="lang-filter" value="es" /> </label></div>
				          <div class="check-row"><label><input id="idioma" type="radio" name="lang-filter" value="en" /></label></div>
				          <div class="check-row"><label><input id="idioma" type="radio" name="lang-filter" value="other" /> </label></div>
				        Social buttons -->
				        
				       <div class="check-row" >
				       <label  id="idioma"></label>
				       
				       </div><br>	
				       			       
				        </div>
				      </div>
				      <div class="sidebar-box rounded ">
				      <div  class="card caja-1 " style="background-color:  #A497A7;">
				      
				     <div class="caja-2 sidebar-box-title px-2" style="background: 
				     linear-gradient(to right ,#3E3241,#6E2C7E);">Pelicula 
				     <i class="fas fa-tv"></i></div>
				     <div class="container mx-auto p-3">
				      <select id="inputPelicula" class="form-control col-md-10">
				        <option selected value=0>Selecciona Pelicula </option>
				      </select>
				    </div>
				  </div>
				  </div>
				  
				       <div class="sidebar-box rounded ">
				       <div  class="card caja-1 " style="background-color:  #A497A7;">
				     <div class="caja-2 sidebar-box-title px-2" style="background: linear-gradient(to right ,#3E3241,#6E2C7E);">Formato <i class="fas fa-film"></i></div>
				     
				     <div class="container mx-auto p-3">
				      <select id="inputFormato" class="form-control col-md-10">
				        <option selected value=0>Selecciona Formato </option>
				      </select>
			
				  </div>
				     </div>
				     </div>
				
				 	 <div class="sidebar-box rounded">
				  		<button type="button" id="buscar" class="btn btn-secondary">Buscar</button>
				  		
				 	 </div>
			 </div>
          
          <div class="col-lg-9 " >
			  <h5 class="card-header mb-3 caja-2" style="background: linear-gradient(to right, #1B1B1B,#3E3241,#6E2C7E);"><i class="fas fa-film"></i>  Cinema sucursal...</h5>
              <div class="card caja-1 contenedor-pel" style="background-color:  #A497A7;"
              id="funcionesEncontradas">
              </div>
				
          </div>

      </div>
  </div>

</section>

<!-- Footer -->
<footer class="page-footer font-small special-color-dark pt-4">

  <!-- Footer Elements -->
  <div class="container">

    <!-- Social buttons -->
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
 	  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
      <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
      <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
      <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
      <script src="https://kit.fontawesome.com/af8d928238.js" crossorigin="anonymous"></script>

  	
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/wnumb/1.0.4/wNumb.js"></script>
	  <script src="https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/9.1.0/nouislider.js"></script>
	  <script src="JS/Funciones.js"></script>
		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	  
  
</body>
</html>