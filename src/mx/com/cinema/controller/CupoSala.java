package mx.com.cinema.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import mx.com.cinema.entities.AsientosBean;
import mx.com.cinema.entities.BusquedaPeliculaBean;
import mx.com.cinema.model.AsientosCrud;
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
	 request = peticion
	 response = respuesta
	 */ 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// vamos a guardar la función que el usuario desea agendar boletos
		int idFuncion = Integer.parseInt( request.getParameter("enviarInfo")); // el nombre del parametro y lo que va a devolver sería el valor!!!
		System.out.println("yo soy en id funcion"+idFuncion);
		FuncionesCrud funciones = new FuncionesCrud();
		Gson gson = new Gson();	
		int disponible = funciones.getDispsala(idFuncion);
		String disponibilidad=gson.toJson(disponible);
		response.setContentType("text/plain"); 
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(disponibilidad);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idFuncion = Integer.parseInt( request.getParameter("enviarInfo"));
		
		AsientosCrud asientosCrud = new AsientosCrud();
		AsientosBean dispAsientos = new AsientosBean();
		
		dispAsientos.setListaAsientos(asientosCrud.getAsientos(idFuncion));
		
		Gson gson = new Gson();
		String jsonAsientos = gson.toJson(dispAsientos );
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(jsonAsientos);
		 
	}

}
