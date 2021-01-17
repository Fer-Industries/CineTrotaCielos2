package mx.com.cinema.controller;

import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mx.com.cinema.entities.EmpleadoBean;
import mx.com.cinema.model.EmpleadoCrud;

/**
 * Servlet implementation class Login_emp
 */
@WebServlet("/Login_emp")
public class Login_emp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login_emp() {
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
		String    id =  request.getParameter("id");
		System.out.print("estoy en servlet el id que recibo es"+id);
		EmpleadoBean empleado = new EmpleadoBean(id, request.getParameter("contra"));
		System.out.print("estoy en servlet la contaseña que recibo es"+request.getParameter("contra"));
		EmpleadoCrud empCrud = new EmpleadoCrud();
		EmpleadoBean empleadoL =new EmpleadoBean(); 
		empleadoL = empCrud.validar(empleado);	
		System.out.println("El empleado es:");
		System.out.println(empleado.toString());
		System.out.println(empleado.getIdEmpleado());
		if(empleadoL.getIdEmpleado() != null) {
			sesion.setAttribute("empleado", empleadoL);
			response.getWriter().write("1");
		}else {
			response.getWriter().write("0");
		}
	}

}
