package mx.com.cinema.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import mx.com.cinema.entities.MensajeJson;
import mx.com.cinema.entities.UsuarioBean;
import mx.com.cinema.model.RegistroCrud;
import mx.com.cinema.utils.GeneradorTarjeta;

/**
 * Servlet implementation class Registro
 */
@WebServlet("/Registro")
public class Registro extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Registro() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().write("Soy el registro#");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		String jsonUser = request.getParameter("usuarioNuevo");
		System.out.println(jsonUser);
		
		Gson gson = new Gson();
		
		UsuarioBean usuarioNuevo = new UsuarioBean(); 
		usuarioNuevo = gson.fromJson(jsonUser, UsuarioBean.class);
		
		RegistroCrud registros = new RegistroCrud();
		GeneradorTarjeta generador = new GeneradorTarjeta();
		boolean existente = true;
		long idTarjetaGenerado = 0;
		do {
			idTarjetaGenerado= generador.getNumTarjeta();
			
			existente = registros.checarId(idTarjetaGenerado);
		}while(existente == true);
		System.out.println("NUm tarjeta!!!" +idTarjetaGenerado);
		usuarioNuevo.setIdTarjeta(idTarjetaGenerado);
		
		int mensaje = registros.guardarUsuario(usuarioNuevo);
		MensajeJson message = new MensajeJson();
		if(mensaje == 3) {
			message.setCodigo(3);
			message.setMensaje("Registro exitoso");
		}else if(mensaje == 2) {
			message.setCodigo(2);
			message.setMensaje("Ya existe un usuario con ese correo");
		}else if(mensaje == 1) {
			message.setCodigo(1);
			message.setMensaje("Tu usuario esta dado baja");
		}
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		String respuesta = gson.toJson(message);
		response.getWriter().write(respuesta);
	}

}
