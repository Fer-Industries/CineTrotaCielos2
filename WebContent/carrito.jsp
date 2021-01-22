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
<title>Carrito</title>

    <link rel="stylesheet" href="Css/carrito.css">
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
                <a class="nav-link buttonnav pl" href="Login.jsp">INICIAR SESIÓN <i class="fas fa-user-circle"></i></a>
                <a class="nav-link buttonnav pl2" href="Registro.jsp">REGISTRARME  <i class="fas fa-user-edit"></i></a>
          		<% }else{%>
          			<a class="nav-link buttonnav pl2" ><%=usuarioLogueado.getNombre() +" "+ usuarioLogueado.getaPaterno()%></a>
          		<%}%>
          </div>
         </div>
     </nav>
<% if(usuarioLogueado == null){%>
	<script>
	window.location.href = "Login.jsp";
	</script> 
<%}else{%>
	<br>
	
	<div class="container reb">
        <div class="row">
            <div class="col-lg-6 col-sm-12">

                <h4 class="d-flex justify-content-between align-items-center mb-3 letraBlanca">
                    <span class="text-muted">Tus productos</span>
                    <!-- <span class="badge bg-secondary rounded-pill" id="totalProd"></span>-->
                </h4>
                
                <div  class="letraNegra">
                    <ul class="list-group mb-3" id="productos">
                        
                        
                    </ul>
                </div>
            </div>

            <div class="col-lg-6 col-sm-12 pago">
                <h4 class="mb-3">Pago  (Por el momento es simulacion de cobro)</h4>
                <div class="my-3">
                    <div class="form-check">
                        <input id="credit" name="paymentMethod" type="radio" class="form-check-input" checked required>
                        <label class="form-check-label" for="credit">Tarjeta de credito</label>
                    </div>
                    <div class="form-check">
                        <input id="debit" name="paymentMethod" type="radio" class="form-check-input" required>
                        <label class="form-check-label" for="debit">Tarjeta de debito </label>
                    </div>
                </div>

                <div class="row gy-3">
                    <div class="col-md-6">
                        <label for="cc-name" class="form-label" id="mensajeNombre">Nombre de la tarjeta</label>
                        <input type="text" class="form-control" id="Name" placeholder="" required>
                        <small class="text-muted">Nombre completo como esta en la tarjeta</small>
                        <div class="invalid-feedback">
                            Nombre de la tarjeta requerido
                        </div>
                    </div>

                    <div class="col-md-6">
                        <label for="cc-number" class="form-label" id="mensajeNumero">Numero de tarjeta de credito</label>
                        <input type="text" class="form-control" id="cc-number" placeholder="" required>
                        <div class="invalid-feedback">
                            Numero de la tarjeta de credito requerido
                        </div>
                    </div>

                    <!-- <div class="col-md-3">
                        <label for="cc-expiration" class="form-label" id="mensajeVigencia">Valida hasta</label>
                        <input type="text" class="form-control" id="vigencia" placeholder="00-00" required>
                        <div class="invalid-feedback">
                            Fecha de expiracion requerida
                        </div>
                    </div>-->
                    
                    <div class="col-md-3">
                        <label for="cc-expiration" class="form-label" id="mensajeVigencia">Valida hasta</label>
                        <input type="text" class="form-control" id="vigencia" placeholder="Month" required>
                        <div class="invalid-feedback">
                            Mes de expiracion requerida
                        </div>
                    </div>
                    
                    <div class="col-md-3">
                        <label for="cc-expiration" class="form-label" id="mensajeVigencia1"></label>
                        <input type="text" class="form-control" id="vigencia1" placeholder="Year" required>
                        <div class="invalid-feedback">
                            Año de expiracion requerida
                        </div>
                    </div>

                    <div class="col-md-3">
                        <label for="cc-cvv" class="form-label" id="mensajeCvv">CVV</label>
                        <input type="text" class="form-control" id="cvv" placeholder="" required>
                        <div class="invalid-feedback">
                            código de seguridad requerido
                        </div>
                    </div>
                </div>

            	<div>
           			<button class="btn btn-primary max-w mb-2" id="pagar">Pagar</button>
            		
            	</div>
            
            </div>
        </div>
    </div>
<%}%>
	

<!-- JS PARA BOOTSTRAP -->	
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
<!-- JQUERY -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

<script src="JS/carrito.js"></script>
<!-- FONT-AWESOME -->
<!-- <script src="https://kit.fontawesome.com/af8d928238.js" crossorigin="anonymous"></script>-->
</body>
</html>