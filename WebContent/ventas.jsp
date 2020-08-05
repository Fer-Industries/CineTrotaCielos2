<%@page import="mx.com.cinema.entities.UsuarioBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<% HttpSession sesion = request.getSession();
    UsuarioBean usuarioLogueado = (UsuarioBean) sesion.getAttribute("usuario");
     %>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ventas</title>
<link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.0.0/animate.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.0.0/animate.min.css"/>
<link rel="stylesheet" href="Css/ventas.css">
</head>
<body class="animate__animated animate__fadeIn">
<% if(usuarioLogueado == null){%>
	<script>
		window.location.href = "Login.jsp";
	</script> 
<%}else{%>
<nav class="navbar navbar-expand-lg navbar-toggleable-sm navbar-dark 
  animate_animated animate_fadeInDown  shadow-lg sticky-top">
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
     <div class="container">
      <div class="row">
	    <div class="col-md-4 order-md-2 mb-4">
	      <h4 class="d-flex justify-content-between align-items-center mb-3">
	        <span class="titulo">Your cart</span>
	      </h4>
	      <ul class="list-group mb-3" id="lista">
	      </ul>
	
	    </div>
	    <div class="pago col-md-8 order-md-1">
	      <form class="needs-validation" novalidate>                    
	        
	        <hr class="mb-4">
	
	        <h4 class="mb-3">Pago</h4>
	
	        <div class="d-block my-3">
	          <div class="custom-control custom-radio">
	            <input id="credit" name="paymentMethod" type="radio" class="custom-control-input" checked required>
	            <label class="custom-control-label" for="credit">Tarjeta de Credito</label>
	          </div>
	          <div class="custom-control custom-radio">
	            <input id="debit" name="paymentMethod" type="radio" class="custom-control-input" required>
	            <label class="custom-control-label" for="debit">Tarjeta de Debito</label>
	          </div>
	        </div>
	        <div class="row">
	          <div class="col-md-6 mb-3">
	            <label for="cc-name">Nombre en la tarjeta</label>
	            <input type="text" class="form-control" id="cc-name" placeholder="" required>
	            <small class="">Nombre completo en la tarjeta</small>
	            <div class="invalid-feedback">
	              El nombre en la tarjeta es necesario
	            </div>
	          </div>
	          <div class="col-md-6 mb-3">
	            <label for="cc-number">Numero Tarjeta</label>
	            <input type="text" class="form-control" id="cc-number" placeholder="" required>
	            <div class="invalid-feedback">
	              El numero de la tarjeta es necesario
	            </div>
	          </div>
	        </div>
	        <div class="row">
	          <div class="col-md-3 mb-3">
	            <label for="cc-expiration">Expiracion</label>
	            <input type="text" class="form-control" id="cc-expiration" placeholder="" required>
	            <div class="invalid-feedback">
	              La fecha de expiracion es necesaria
	            </div>
	          </div>
	          <div class="col-md-3 mb-3">
	            <label for="cc-cvv">CVV</label>
	            <input type="text" class="form-control" id="cc-cvv" placeholder="" required>
	            <div class="invalid-feedback">
	              Security code required
	            </div>
	          </div>
	        </div>
	        <hr class="mb-4">
	        <button class="btn btn-primary btn-lg btn-block" type="submit">Hacer compra</button>
	      </form>
	    </div>
	  </div>
     </div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="JS/venta.js"></script>
<%}%>
</body>
</html>