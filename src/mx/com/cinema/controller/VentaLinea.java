package mx.com.cinema.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import mx.com.cinema.model.DulceriaCrud;

/**
 * Servlet implementation class VentaLinea
 */
@WebServlet("/VentaLinea")
public class VentaLinea extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VentaLinea() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idVenta = request.getParameter("idVenta");
		DulceriaCrud dulceria = new DulceriaCrud(); 
		List<String> productosEntregar = dulceria.productosVentas(Integer.parseInt(idVenta));
		Gson gson = new Gson();
		String productos = gson.toJson(productosEntregar);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(productos); 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idVenta = request.getParameter("idVenta");
		DulceriaCrud dulceria = new DulceriaCrud();
		int codigo = 0;
		try {
			codigo = dulceria.ordenEntregada(Integer.parseInt(idVenta));
		}catch(Exception e) {
			codigo = -1;
		}
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(codigo+"");
	}

}
