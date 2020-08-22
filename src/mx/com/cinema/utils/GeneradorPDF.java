package mx.com.cinema.utils;

import java.io.ByteArrayOutputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.util.List;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

import mx.com.cinema.entities.Boleto;

public class GeneradorPDF {
	
	public ByteArrayOutputStream generarPDF(List<Boleto> boletos) {
		Document documentoBoletos = new Document();
		//FileOutputStream ficheroPDF = null;;
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		try {
			// lo ideal sería que generes el archivo con un nombre que tenga un id, idTarjeta + fecha
			//ficheroPDF = new FileOutputStream("C:\\PdfTest\\boletos.pdf");
			PdfWriter.getInstance(documentoBoletos, baos);
			
			documentoBoletos.open();
			
			Paragraph titulo = new Paragraph("Información boletos \n\n",
						FontFactory.getFont("sans-serif",24,Font.BOLD,BaseColor.BLACK)
						);
			documentoBoletos.add(titulo);
			
			PdfPTable tabla = new PdfPTable(5);
			
			tabla.addCell("Sala");
			tabla.addCell("Nombre");
			tabla.addCell("Pelicula");
			tabla.addCell("Hora");
			tabla.addCell("Fecha");
			for(Boleto boleto: boletos) {
				tabla.addCell(boleto.getSala());
				tabla.addCell(boleto.getNombre());
				tabla.addCell(boleto.getPelicula());
				tabla.addCell(boleto.getHora());
				tabla.addCell(boleto.getFecha());
			}
			
			documentoBoletos.add(tabla);
			
			documentoBoletos.close();
		}catch(DocumentException de) {
			System.out.println(de.getMessage());
		}
		return baos;
	}
}

