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
	<link href="css/Peliculas.css" rel="stylesheet" type="text/css">
	<link href="//cdn.jsdelivr.net/npm/@sweetalert2/theme-dark@4/dark.css" rel="stylesheet">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.0.0/animate.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Fira+Sans:wght@800&family=Kanit:ital,wght@1,600&family=Roboto:wght@300;500&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Unica+One&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.0.0/animate.min.css"/>
</head>
<body class="fondo  animate__animated animate__fadeIn ">
 <%
 /*usuarioLogueado.tipo != 'gerente' */
 if(1 != 1) { %>
 window.location.href= principal.jsp;
<% }else { %>
 <nav class="navbar navbar-expand-lg navbar-toggleable-sm  navbar-dark bg-dark"  animate_animated animate_fadeInDown  shadow-lg sticky-top">
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
      	<p class="tittle1">MOVIES MANAGEMENT </p>
    </div>
   	<div class="mb-3">
    <input id="buscador" type="search" placeholder="pelicula...."> <button id="inputBuscar" class="btn btn-primary">buscar</button>
    </div>
    <div class="scrolleando tablaContenedor ">
			<table class="table table-hover">
			  <thead class="text-center" class="thead-dark">
			    <tr>
			      <th scope="col"><button class="btn btn-secondary  btn-block" id="ordenarId" value=0><i class="fas fa-arrows-alt-v"></i> #ID</button></th>
			      <th scope="col"><button class="btn btn-secondary  btn-block" id="ordenarNombre"><i class="fas fa-arrows-alt-v"></i> Nombre</button></th>
			      <th scope="col"><button class="btn btn-secondary  btn-block" id="ordenarClasificacion"><i class="fas fa-arrows-alt-v"></i> Clasificacion</button></th>
			      <th scope="col"><button class="btn btn-secondary  btn-block" id="ordenarDuracion"><i class="fas fa-arrows-alt-v"></i> Duracion</button></th>
			      <th scope="col"><button class="btn btn-secondary  btn-block" id="ordenarEstreno"><i class="fas fa-arrows-alt-v"></i> Estreno</button></th>
			      <th scope="col" style='width:300px' >Imagen</th>
			      <th scope="col">Eliminar</th>
			      <th scope="col">Editar</th>
			      <th scope="col">Restablecer</th>		
			    </tr>
			  </thead>
			  
			  <tbody  id="catpelicula" name="catpelicula" class="text-center">
			  </tbody>
			</table>
	</div>
    <div class="tablaContenedor mt-3">
		<div class="row ">
			<div class="col-auto">
				<div class="card carta mt-2">
			    <button class="btn btn-secundary">
			    	<i id="btnformagregar" class="fas fa-plus-circle iconosize"></i>
			    </button>		    
			    <div class="card-body">
			        <h5 class="card-title">Agregar pelicula</h5>
			        <p class="card-text">Aqui puede agregar las peliculas que desee</p>
			    </div>
		    	</div>
			</div>
			<div class="col-auto ajustable ">
				<div id="formagregar" class="animate__animated animate__backInDown padown mb-2 ">
				  <div class="row  card-block" >
				    <div id="imagenP"  class="col-md-7 border text-center"> 
				    	 <label  for="inputimagen"><i id="btnagreagar" class="fas fa-image iconosize"></i></label>	
				    	 <input  type="file" id="inputimagen" name="inputimagen" accept="image/*" multiple>
				    	 <img id="imagenSelec" class="rounded mx-auto d-block my-1" src=""  width="400" height="250"> 		    	  
				    </div>
				    <div class="col-auto-md-5 m-1">
				      <div id="contenidoP" class="card-body" >
				      	  <h6 class= "card-text card-title tittle ">Titulo </h6><input name="requerido" id="inputtitulo" type="text" class="titulo2 ajustable" >
						  <h6 class='card-text '>Categoria:</h6> <input name="requerido" id="inputcategoria" type="text" class="card-text">
						  <h6 class='card-text '>Estreno:</h6><input name="requerido" id="inputfecha" type="date" placeholder="selecciona una fecha" class="card-text">
						  <h6 class='card-text '>Duracion:</h6><input name="requerido" id="inputhora" class="entrada formatohora"size="1" type="text" placeholder="hr">:<input name="requerido" id="inputminutos" class="entrada formatohora"size="1" type="text" size="1" placeholder="min">:<input name="requerido" id="inputsegundos" class="entrada formatohora"size="1" size="1" type="text" placeholder="seg">
				      </div>
				      <p id="errorAgregar" >error</p>
				    </div>
				  </div>
				  <button id="btnagregar" class="my-4 btn btn-primary btn-lg btn-block">Guardar</button>
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
	<script src="js/Peliculas.js"></script>
<% } %>
</body>
</html>