package mx.com.cinema.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import mx.com.cinema.entities.BusquedaPeliculaBean;
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
			String jsonPelicula= request.getParameter("enviarInfo");	
			System.out.println(jsonPelicula);
			Gson gson = new Gson();			 
			BusquedaPeliculaBean busqueda = gson.fromJson(jsonPelicula, BusquedaPeliculaBean.class);
			PeliculasCrud peliculas =new PeliculasCrud();
			List<BusquedaPeliculaBean> listaEstrenos = peliculas.busqueda(busqueda);
			String jsonPeliculas=gson.toJson(listaEstrenos);
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(jsonPeliculas);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
