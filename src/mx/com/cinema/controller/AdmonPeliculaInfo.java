package mx.com.cinema.controller;
//Este servlet sirve para para traer el catalogo de peliculas e insertar una pelicula
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
 * Servlet implementation class AdmonPeliculaInfo
 */
@WebServlet("/AdmonPeliculaInfo")
public class AdmonPeliculaInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdmonPeliculaInfo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PeliculasCrud cat_peliculas = new PeliculasCrud();
		Gson gson = new Gson();
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(gson.toJson(cat_peliculas.getPeliculas()));
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String pelicula =request.getParameter("pelicula");
		System.out.println(pelicula);
		Gson gson = new Gson();
		PeliculasBean newpelicula = gson.fromJson(pelicula,PeliculasBean.class);
		PeliculasCrud insertarPelicula = new PeliculasCrud();
		 
		int bandera = insertarPelicula.agregarPelicula(newpelicula);
		System.out.println("soy la bandera"+bandera);
		response.setContentType("text/plain");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(bandera+"");

	}

}
