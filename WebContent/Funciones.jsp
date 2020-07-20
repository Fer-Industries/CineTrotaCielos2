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

    <link rel="stylesheet" href="Css/Funciones.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <link rel="stylesheet" href="css/weather-icons.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.0.0/animate.min.css"/>
</head>
<body class= "fondo" >

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

<section class="pelis letra ">
  <div class="container a ">

      <div class="row">

          <div class="col-lg-3">


     <div class="sidebar-box">
   <div class="sidebar-box-title"  style="background: linear-gradient(to right ,#3E3241,#6E2C7E);" >Ubicación <i class="fas fa-search-location"></i></i></div>
        <div class="sidebar-box-content">
      <select id="inputCine" class="form-control col-md-10">
        <option selected>Selecciona tu cine </option>
        <option>Norte</option>
        <option>Este</option>
        <option>Oeste</option>
        <option>Sur</option>
      </select>
    </div>
  </div>
 
  

<div class="sidebar-box">
   <div class="sidebar-box-title"  style="background: linear-gradient(to right ,#3E3241,#6E2C7E);" >Horario <i class="far fa-clock"></i></i></div>
        <div class="sidebar-box-content">
		<div class="outerrainge"> 
		   <div id="slider-range" ></div>
		   <div class="slider-labels">
		    <div class=" caption">
		      <strong >De: <span id="slider-range-value1"> AM</strong></span>
		    </div>
		    <div class=" text-right caption">
		      <strong >A las:</strong> <span id="slider-range-value2"><strong>PM</strong></span>
		    </div>
  			</div>
		</div>
  </div>
</div>


<div class="sidebar-box">
        <div class="sidebar-box-title" style="background: linear-gradient(to right ,#3E3241,#6E2C7E);">Día <i class="far fa-calendar-alt"></i></div>
        <div class="sidebar-box-content">
        <input type="date" id="fecha" name="fecha" min="2020-07-20" max="2020-08-20">
 </div>
  </div>
  
  
   
        <div class="sidebar-box">
        <div class="sidebar-box-title" style="background: linear-gradient(to right ,#3E3241,#6E2C7E);">Idioma <i class="fas fa-language"></i></div>
        <div class="sidebar-box-content">
          <div class="check-row"><label><input type="radio" name="lang-filter" value="" checked="checked" /> <span>Todos los idiomas</span></label></div>
          <div class="check-row"><label><input type="radio" name="lang-filter" value="es" /> <span>Español</span></label></div>
          <div class="check-row"><label><input type="radio" name="lang-filter" value="en" /> <span>Inglés</span></label></div>
          <div class="check-row"><label><input type="radio" name="lang-filter" value="other" /> <span>Otros idiomas</span></label></div>
        </div>
      </div>
  
  
     <div class="sidebar-box">
        <div class="sidebar-box-title" style="background: linear-gradient(to right ,#3E3241,#6E2C7E);">Formato <i class="fas fa-film"></i></div>
        <div class="sidebar-box-content">
          <div class="check-row no-platinum"><label><input type="checkbox" name="format-filter" value="trad" /> <span>Salas tradicionales</span></label></div>
          <div class="check-row no-platinum"><label><input type="checkbox" name="format-filter" value="premium" /> <span>Salas Premium</span></label></div>
          <div class="check-row"><label><input type="checkbox" name="format-filter" value="v3d" /> <span>3D</span></label></div>
          <div class="check-row no-platinum"><label><input type="checkbox" name="format-filter" value="v4d" /> <span>4D</span></label></div>
        </div>
      </div>


 	 <div class="sidebar-box">
  		<button type="button" class="btn btn-secondary">Buscar</button>
 	 </div>
 </div>
          
          <div class="col-lg-9">

              <div class="card  " style="background-color:  #A497A7;">
                  <h5 class="card-header mb-3 " style="background: linear-gradient(to right, #1B1B1B,#3E3241,#6E2C7E);"><i class="fas fa-film"></i>  Cinema sucursal...</h5>



                  <div class=" mb-3" style="max-width: 540px;">
                      <div class="row no-gutters">
                          <div class="col-md-4">
                              <img src="Img/duro.jpg" class="card-img" alt="...">
                          </div>
                          <div class="col-md-8">
                              <div class="card-body">
                                  <h5 class="card-title">Titulo de la pelicula</h5>
                                  <p class="card-text">Idioma</p>
                                  <p class="card-text">Clasificacion</p>
                                  <p class="card-text">Duración</p>
                                  <p class="card-text">Horarios</p>
                                  <button type="button" class="btn btn-dark btn-lg donwload-buttons"><i class="fas fa-ticket-alt"></i>  Boletos</button>
                              </div>
                          </div>
                      </div>
                  </div>


                  <div class=" mb-3" style="max-width: 540px;">
                      <div class="row no-gutters">
                          <div class="col-md-4">
                              <img src="Img/duro.jpg" class="card-img" alt="...">
                          </div>
                          <div class="col-md-8">
                              <div class="card-body">
                                  <h5 class="card-title">Titulo de la pelicula</h5>
                                  <p class="card-text">Idioma</p>
                                  <p class="card-text">Clasificacion</p>
                                  <p class="card-text">Duración</p>
                                  <p class="card-text">Horarios</p>
                                  <button type="button" class="btn btn-dark btn-lg donwload-buttons"><i class="fas fa-ticket-alt"></i>  Boletos</button>
                              </div>
                          </div>
                      </div>
                  </div>


                  <div class=" mb-3" style="max-width: 540px;">
                      <div class="row no-gutters">
                          <div class="col-md-4">
                             <img src="Img/duro.jpg" class="card-img contenedor:hover contenedor imagen" alt="...">   
                          </div>
                          <div class="col-md-8">
                              <div class="card-body">
                                  <h5 class="card-title">Titulo de la pelicula</h5>
                                  <p class="card-text">Idioma</p>
                                  <p class="card-text">Clasificacion</p>
                                  <p class="card-text">Duración</p>
                                  <p class="card-text">Horarios</p>
                                  <button type="button" class="btn btn-dark btn-lg donwload-buttons"><i class="fas fa-ticket-alt"></i>  Boletos</button>
                              </div>
                          </div>
                      </div>
                  </div>


                  <div class=" mb-3" style="max-width: 540px;">
                      <div class="row no-gutters">
                          <div class="col-md-4">
                               <img src="Img/duro.jpg" class="card-img contenedor:hover contenedor imagen" alt="...">   
                          </div>
                          <div class="col-md-8">
                              <div class="card-body">
                                  <h5 class="card-title">Titulo de la pelicula</h5>
                                  <p class="card-text">Idioma</p>
                                  <p class="card-text">Clasificacion</p>
                                  <p class="card-text">Duración</p>
                                  <p class="card-text">Horarios</p>
                                  <button type="button" class="btn btn-dark btn-lg donwload-buttons"><i class="fas fa-ticket-alt"></i>  Boletos</button>
                              </div>
                          </div>
                      </div>
                  </div>
              </div>

          </div>

      </div>

  </div>

</section>

      <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
      <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
      <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
      <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
      <script src="https://kit.fontawesome.com/af8d928238.js" crossorigin="anonymous"></script>
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/wnumb/1.0.4/wNumb.js"></script>
	  <script src="https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/9.1.0/nouislider.js"></script>
	  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
   <script>   
// Requires jQuery

// Initialize slider:
$(document).ready(function() {
  $('.noUi-handle').on('click', function() {
    $(this).width(50);
  });
  var rangeSlider = document.getElementById('slider-range');
  
rangeSlider.style.height = '8px';
rangeSlider.style.margin = '0 auto 3px';
  

var aproximateHour = function (mins)
{
 var minutes = Math.round(mins % 60);
  if (minutes == 60 || minutes == 0)
  {
    return mins / 60;
  }
  return Math.trunc (mins / 60) + minutes / 100;
}
 

  noUiSlider.create(rangeSlider, {
  start : [800, 1080],
  connect: true, 
  orientation: 'horizontal', 
  behaviour: 'tap-drag', 
  step: 30,
  tooltips: true,
  range : {'min': 540, 'max': 1440},
  format:  wNumb({
		decimals: 2,
    mark: ":",
		encoder: function(a){
       return aproximateHour(a);
      }
	}),
	  pips: {
		    mode : 'steps',  
		    format:  wNumb({
		    mark: ":",
		    decimals: 2,
				encoder: function(a ){
		        return aproximateHour(a);
		      }
				}),
		  	filter : filter_hour,
		  	stepped : true,
		    density:1
		  }
		});



    		function filter_hour(value, type) {
    		  return (value % 60 == 0) ? 1 : 0;
    		}
    		
  rangeSlider.noUiSlider.on('update', function(values, handle) {
    document.getElementById('slider-range-value1').innerHTML = values[0];
    document.getElementById('slider-range-value2').innerHTML = values[1];
    document.getElementsByName('slider-range-value1').value = aproximateHour.from(
      values[0]);
    document.getElementsByName('slider-range-value2').value = aproximateHour.from(
      values[1]);
  });});

   </script>
</body>
</html>