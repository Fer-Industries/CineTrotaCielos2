package mx.com.cinema.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import mx.com.cinema.entities.InfoCarrito;
import mx.com.cinema.entities.EmpleadoBean;
import mx.com.cinema.model.DulceriaCrud;

/**
 * Servlet implementation class CarritoEmpleado
 */
@WebServlet("/CarritoEmpleado")
public class CarritoEmpleado extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CarritoEmpleado() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		EmpleadoBean empleadoLogueado = (EmpleadoBean) request.getSession().getAttribute("empleado");
		System.out.println(empleadoLogueado.toString());
		String carrito = request.getParameter("carrito");
		String idCliente = request.getParameter("idTarjeta");
		System.out.println(carrito);
		GsonBuilder gsonBuilder = new GsonBuilder();
		Gson gson = gsonBuilder.create();
		InfoCarrito[] productos = gson.fromJson(carrito, InfoCarrito[].class);
		DulceriaCrud dulceriaCrud = new DulceriaCrud();
		int idVenta = dulceriaCrud.realizarVentaEmpleado(productos,Integer.parseInt(empleadoLogueado.getIdEmpleado()),idCliente);
		response.getWriter().write(""+idVenta);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
