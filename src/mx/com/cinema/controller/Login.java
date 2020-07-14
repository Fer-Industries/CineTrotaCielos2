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
		// TODO Auto-generated method stub
		ConnectionDB con = new ConnectionDB();
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
HttpSession sesion = request.getSession();
		
		UsuarioBean usuario = new UsuarioBean( request.getParameter("correo"), request.getParameter("contrase�a"));
		UsuarioCrud usuCrud = new UsuarioCrud();

		usuario = usuCrud.validar(usuario);
		
		if(usuario.getIdTarjeta() > 0) {
			sesion.setAttribute("usuario", usuario);
			request.getRequestDispatcher("principal.jsp").forward(request, response);
		}else {
			request.getRequestDispatcher("login.html").forward(request, response);
		}
	}

}