package mx.com.cinema.controller;

import java.io.ByteArrayOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import mx.com.cinema.entities.AsientosBean;
import mx.com.cinema.entities.FuncionesBean;
import mx.com.cinema.entities.VentaBoletosBean;
import mx.com.cinema.model.AsientosCrud;
import mx.com.cinema.model.VentasCrud;
import mx.com.cinema.utils.GeneradorPDF;


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
		//descargar el PDF
		String parametrosVenta = request.getParameter("infoVenta");
		Gson gson = new Gson();			 
		VentaBoletosBean ventaBol  = gson.fromJson(parametrosVenta, VentaBoletosBean.class);
		
		response.setContentType("application/pdf;charset=UTF-8");
		System.out.println("header");
        response.addHeader("Content-Disposition", "inline; filename=" + "boletos.pdf");
        
        ServletOutputStream out = response.getOutputStream();
        VentasCrud ventas = new VentasCrud();
        GeneradorPDF generadorPdf = new GeneradorPDF();
        
        ByteArrayOutputStream baos = generadorPdf.generarPDF(ventas.getInfoBoleto(ventaBol.getIdFuncion(), ventaBol.getArregloAsientos()));
        baos.writeTo(out);
	}

}
