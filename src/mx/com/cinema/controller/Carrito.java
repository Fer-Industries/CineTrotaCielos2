package mx.com.cinema.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import mx.com.cinema.entities.CarritoBean;
import mx.com.cinema.entities.InfoCarrito;
import mx.com.cinema.entities.UsuarioBean;
import mx.com.cinema.model.DulceriaCrud;
import mx.com.cinema.utils.EnvioCorreo;

@WebServlet("/Carrito")
public class Carrito extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Carrito() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		UsuarioBean usuarioLogueado = (UsuarioBean) request.getSession().getAttribute("usuario");
		System.out.println(usuarioLogueado.toString());
		String carrito = request.getParameter("carrito");
		System.out.println(carrito);
		GsonBuilder gsonBuilder = new GsonBuilder();
		Gson gson = gsonBuilder.create();
		InfoCarrito[] productos = gson.fromJson(carrito, InfoCarrito[].class);
		DulceriaCrud dulceriaCrud = new DulceriaCrud();
		int idVenta = dulceriaCrud.realizarVenta(productos,usuarioLogueado.getIdTarjeta());
		if(idVenta > 0) {
			EnvioCorreo envioCorreo = new EnvioCorreo();
			boolean enviado = envioCorreo.sendEmail(usuarioLogueado.getCorreo(), idVenta);
			System.out.println(enviado);
		}
		response.getWriter().write(""+idVenta);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
