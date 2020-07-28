package mx.com.cinema.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import mx.com.cinema.entities.BusquedaPeliculaBean;
import mx.com.cinema.entities.CatalogosBean;
import mx.com.cinema.entities.FuncionesBean;
import mx.com.cinema.entities.MensajeJson;
import mx.com.cinema.model.AsientosCrud;
import mx.com.cinema.utils.GeneradorTarjeta;

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
		
		response.getWriter().write("Disponibilidad de asientos");
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String jsonAsiento = request.getParameter("obtenerInfo");
		System.out.println(jsonAsiento);
		Gson gson = new Gson();
		FuncionesBean asientos = gson.fromJson(jsonAsiento, FuncionesBean.class);
		
		AsientosCrud asientosDis = new AsientosCrud();
		
		int mensaje = asientosDis.mostrardispAsiento(asientos);
		MensajeJson message = new MensajeJson();
		if(mensaje == 1) {
			message.setCodigo(1);
			message.setMensaje("Asiento disponible");
		}else if(mensaje == 2) {
			message.setCodigo(2);
			message.setMensaje("Asiento ocupado");
		}
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		String respuesta = gson.toJson(message);
		response.getWriter().write(respuesta);
	}

}
