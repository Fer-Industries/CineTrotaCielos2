package mx.com.cinema.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import mx.com.cinema.entities.VentaBoletosBean;
import mx.com.cinema.model.AsientosCrud;

/**
 * Servlet implementation class ApartarLugar
 */
@WebServlet("/ApartarLugar")
public class ApartarLugar extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ApartarLugar() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String opcion = request.getParameter("opcion");
		String infoAsientos =  request.getParameter("infoAsientos");
		Gson gson = new Gson();
		
		VentaBoletosBean infoApartado = gson.fromJson(infoAsientos, VentaBoletosBean.class);
		
		AsientosCrud asientos = new AsientosCrud();
		int correcto = 0;
		if(opcion.equals("1")) {
			correcto = asientos.apartarLugares(infoApartado.getIdFuncion(), infoApartado.getArregloAsientos());
		}else {
			correcto = asientos.desapartarLugares(infoApartado.getIdFuncion(), infoApartado.getArregloAsientos());
		}
		response.setContentType("text/plain");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(correcto+"");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
