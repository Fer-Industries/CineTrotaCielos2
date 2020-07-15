package mx.com.cinema.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mx.com.cinema.entities.EmpleadoBean;
import mx.com.cinema.entities.UsuarioBean;
import mx.com.cinema.model.ConnectionDB;
import mx.com.cinema.model.EmpleadoCrud;
import mx.com.cinema.model.UsuarioCrud;
import java.util.regex.Pattern;
import java.util.regex.Matcher;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession sesion = request.getSession();
		
		UsuarioBean usuario = new UsuarioBean( request.getParameter("correo"), request.getParameter("contra"));
		UsuarioCrud usuCrud = new UsuarioCrud();

		usuario = usuCrud.validar(usuario);
		
		if(usuario.getIdTarjeta() > 0) {
			sesion.setAttribute("usuario", usuario);
			response.getWriter().write("1");
		}else {
			response.getWriter().write("0");
		}
	}

}
