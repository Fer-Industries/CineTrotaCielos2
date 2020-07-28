package mx.com.cinema.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import mx.com.cinema.entities.BusquedaPeliculaBean;
import mx.com.cinema.model.FuncionesCrud;

/**
 * Servlet implementation class CupoSala
 */
@WebServlet("/CupoSala")
public class CupoSala extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CupoSala() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		int idFuncion = Integer.parseInt( request.getParameter("enviarInfo"));
		
		FuncionesCrud funciones = new FuncionesCrud();
		Gson gson = new Gson();	
		int disponible = funciones.getDispsala(idFuncion);
		
		String disponibilidad=gson.toJson(disponible);
		response.setContentType("text/plain");
		response.setCharacterEncoding("UTF-8");
		System.out.println(disponible);
		System.out.println(disponibilidad);
		response.getWriter().write(disponibilidad);
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
