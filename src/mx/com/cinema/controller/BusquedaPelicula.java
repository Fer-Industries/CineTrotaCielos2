package mx.com.cinema.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import mx.com.cinema.entities.PeliculasBean;
import mx.com.cinema.model.PeliculasCrud;
/**
 * Servlet implementation class BusquedaPelicula
 */
@WebServlet("/BusquedaPelicula")
public class BusquedaPelicula extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BusquedaPelicula() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
				//response.getWriter().append("Served at: ").app-end(request.getContextPath());
				// estoy obteniendo el parametro de la peticion con el nombre persona
				/*String jsonPelicula= request.getParameter("ParametrosPel");	
				//if(request.getContentType()=="application/json"){}
				
				
				Gson gson = new Gson();
				/// es convertir el json recibido a una clase de Java 
				PeliculasBean busqueda = gson.fromJson(jsonPelicula, PeliculasBean.class);
				
				PeliculasCrud ordenCrud = new PeliculasCrud();
				
				int ordenGenerada = ordenCrud.generarOrden(orden);
				
				System.out.println(orden.toString());
				response.setContentType("text/plain");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write("" +ordenGenerada); */
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
