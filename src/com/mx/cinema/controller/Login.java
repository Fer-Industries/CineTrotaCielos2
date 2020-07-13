package com.mx.cinema.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mx.cinema.entities.EmpleadoBean;
import com.mx.cinema.model.EmpleadoCrud;

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
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
HttpSession sesion = request.getSession();
		
		EmpleadoBean empleado = new EmpleadoBean( request.getParameter("name"), request.getParameter("contraseña"));
		EmpleadoCrud empCrud = new EmpleadoCrud();

		empleado = empCrud.validar(empleado);
		
		if(empleado.getIdEmpleado() > 0) {
			sesion.setAttribute("empleado", empleado);
			request.getRequestDispatcher("principal.jsp").forward(request, response);
		}else {
			request.getRequestDispatcher("login.html").forward(request, response);
		}
	}

}
