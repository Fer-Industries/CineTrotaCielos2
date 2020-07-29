package mx.com.cinema.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import mx.com.cinema.entities.AsientosBean;
import mx.com.cinema.entities.FuncionesBean;
import mx.com.cinema.model.AsientosCrud;


/**
 * Servlet implementation class AsientosController
 */
@WebServlet("/AsientosController")
public class AsientosController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AsientosController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		AsientosCrud asientosCrud = new AsientosCrud();
		
		AsientosBean dispAsientos = new AsientosBean();
		
		dispAsientos.setListaAsientos(asientosCrud.getAsientos(1));
		
		Gson gson = new Gson();
		String jsonAsientos = gson.toJson(dispAsientos);
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(jsonAsientos);
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
				doGet(request, response);
	}

}
