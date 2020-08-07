package mx.com.cinema.controller;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import mx.com.cinema.entities.UsuarioBean;
import mx.com.cinema.entities.VentaBoletosBean;
import mx.com.cinema.model.VentasCrud;

/**
 * Servlet implementation class Ventas_ticket
 */
@WebServlet("/Ventas_ticket")
public class Ventas_ticket extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Ventas_ticket() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String parametrosVenta = request.getParameter("infoVenta");	
		System.out.println(parametrosVenta);
		Gson gson = new Gson();			 
		VentaBoletosBean ventaBol  = gson.fromJson(parametrosVenta, VentaBoletosBean.class);
		//new VentaBoletosBean();		//
		//ventaBol.setDia(5);
		//ventaBol.setIdFuncion(1);
		//ventaBol.setNumeroAsientos(3);
		//int arregloo[] = {1,2};
		VentaBoletosBean infor = new VentaBoletosBean(); 
		VentasCrud vendiendo = new VentasCrud();
		infor =   vendiendo.getInfoVenta(ventaBol);
		String jsonInfoVenta=gson.toJson(infor);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(jsonInfoVenta); 
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String parametrosVenta = request.getParameter("infoVenta");	
		System.out.println(parametrosVenta);
		
		Gson gson = new Gson();			 
		VentaBoletosBean ventaBol  = gson.fromJson(parametrosVenta, VentaBoletosBean.class);
		//new VentaBoletosBean();		//gson.fromJson(parametrosVenta, VentaBoletosBean.class);
		//ventaBol.setDia(5);
		//ventaBol.setIdFuncion(1);
		//ventaBol.setNumeroAsientos(3);
		//int arregloo[] = {1,2};
		//ventaBol.setArregloAsientos(arregloo);
		UsuarioBean usuarioLogueado = (UsuarioBean) request.getSession().getAttribute("usuario");
		System.out.println( usuarioLogueado);
		VentasCrud vendiendo = new VentasCrud();
		int salida =   vendiendo.generarTicket(ventaBol,usuarioLogueado);
		System.out.println("Desde el servlet "+ salida);
		String jsonInfoVenta=gson.toJson(salida);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(jsonInfoVenta);
	}

}
