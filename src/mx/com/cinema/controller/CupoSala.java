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
	
		String idFun = request.getParameter("idFuncion");
		Gson gson = new Gson();
		
		int idFuncion = gson.fromJson(idFun, idFuncion);
		
		FuncionesCrud funciones = new FuncionesCrud();
		
		int disponible = funciones.getDispsala(idFuncion);
		
		response.setContentType("text/plain");
		response.setCharacterEncoding("UTF-8");
		System.out.println(disponible);
		response.getWriter().write(disponible);
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
