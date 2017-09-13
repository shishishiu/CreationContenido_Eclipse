package servlet.materia;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.MessageFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPRow;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

import beans.*;
import util.common.Common;
import util.conf.Configuracion;
import util.conf.PdfLiberarNewPage;
import util.conf.PdfNewPage;
import util.db.MySqlConnector;

/**
 * Servlet implementation class DescargarOPendiente
 */
@WebServlet("/DescargarOPendiente")
public class DescargarOPendiente extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/** Nombre de la página **/
	private final String NOMBRE_DE_PAGINA = "DescargarOPendiente.jsp";
	/** Nombre del form de materias **/
	private final String KEY_VARIABLE_MATERIA = "materia";
	/** Nombre del form de materias **/
	private final String KEY_VARIABLE_FECHA_SOLICITUD = "fechaSolicitud";
	/** Nombre del form del usuario **/
	private final String KEY_VARIABLE_USUARIO = "usuario";
	/** Nombre del form del permiso **/
	private final String KEY_VARIABLE_MESSAGE = "message";
	/** Nombre del form del permiso **/
	private final String KEY_VARIABLE_TIENE_AUTORIDAD = "tieneAutoridad";
	/** Nombre del form del permiso **/
	private final String KEY_VARIABLE_RADIO_DESCARGAR = "radioDescargar";
	/** Nombre del form del permiso **/
	private final String KEY_VARIABLE_RADIO_PENDIENTE = "radioPendiente";
	/** Nombre del form del permiso **/
	private final String KEY_VARIABLE_URL = "url";
	/** Nombre del form del permiso **/
	private final String KEY_VARIABLE_CARGO_LIBERACION = "cargoLiberacion";
	/** Nombre del form del permiso **/
	private final String KEY_VARIABLE_NOMBRE_LIBERACION = "nombreLiberacion";
	/** Nombre del form del permiso **/
	private final String KEY_VARIABLE_CARGO_FIRMA = "cargoFirma";
	/** Nombre del form del permiso **/
	private final String KEY_VARIABLE_PERSONA_FIRMA = "personaFirma";
	/** Nombre del form del cveMat **/
	private final String KEY_REQUEST_PARAM_CVE_MAT = "cveMat";
	/** Nombre del form **/
	private final String KEY_FORM_NOMBRE_LIBERACION = "nombreLiberacion";
	/** Nombre del form **/
	private final String KEY_FORM_CARGO_LIBERACION = "cargoLiberacion";
	/** Nombre del form **/
	private final String KEY_FORM_NOMBRE_FIRMA = "personaFirma";
	/** Nombre del form **/
	private final String KEY_FORM_CARGO_FIRMA = "cargoFirma";
	/** Nombre del form **/
	private final String KEY_FORM_FECHA_PRODUCCION = "fechaProduccion";
	/** Nombre del form **/
	private final String KEY_FORM_URL = "url";
	/** Nombre del form **/
	private final String KEY_FORM_NOTA2 = "nota2";
	/** Nombre del form **/
	private final String KEY_FORM_RESULTADO = "resultado";
	/** Nombre del form **/
	private final String KEY_FORM_HIDDEN_CVE_MAT = "hiddenCveMat";
	/** Nombre del param **/
	private final String KEY_TIPO_DESCARGAR_O_PENDIENTE = "1";
	/** Nombre del param **/
	private final String KEY_TIPO_PREVIEW2 = "4";

	/** Usuario **/
	public Usuario usuario;

	Configuracion config;

    /**
     * @see HttpServletHttpServlet()
     */
    public DescargarOPendiente() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = null;
		config = new Configuracion();
    	try {
    		
    		usuario = new Usuario(request, response);
    		if(usuario.IsAutorizado()) {
				if(usuario.getPerUsu() == Common.PERMISO_ADMINISTRADOR ||
						usuario.getPerUsu() == Common.PERMISO_ADMINISTRADOR_GENERAL){
	    			SetForm(request);
		    		
		    		} else{
		
		    			request.setAttribute(KEY_VARIABLE_TIENE_AUTORIDAD, false);
		    			request.setAttribute(KEY_VARIABLE_MESSAGE, Common.MENSAJE_ERROR_AUTENTIFICA);
		    		}

			rd = getServletConfig().getServletContext().getRequestDispatcher(
					config.getPathMateria() + NOMBRE_DE_PAGINA);
		    rd.forward(request,response);
    		}

    	} catch (Exception e) {
			Common.Error(e);
			response.sendRedirect(getServletConfig().getServletContext().getContextPath() + Common.getErrorPage());
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = null;	
		config = new Configuracion();
		try {
    	
			usuario = new Usuario(request, response);
    		if(usuario.IsAutorizado()){
				if(usuario.getPerUsu() == Common.PERMISO_ADMINISTRADOR || 
						usuario.getPerUsu() == Common.PERMISO_ADMINISTRADOR_GENERAL){
	 			
					String tipo = request.getParameter("hiddenTipo");

					if(tipo.equals(KEY_TIPO_DESCARGAR_O_PENDIENTE)){
						
						int resultado = Integer.parseInt(request.getParameter(KEY_FORM_RESULTADO));
						String cveMat = request.getParameter(KEY_FORM_HIDDEN_CVE_MAT);
						if(resultado == Common.ESTADO_DE_SOLICITUD_PENDIENTE){
							
							RegresarPendiente(request,cveMat, response);
							
						}else{
							
							Descargar(request, response);
							
						}
						
						return;
					}else if(tipo.equals(KEY_TIPO_PREVIEW2)){
						ImprimirPreview(2, request, response);
						return;
					}
					
					SetForm(request);
					
	    		} else{
	
	    			request.setAttribute(KEY_VARIABLE_TIENE_AUTORIDAD, false);
	    			request.setAttribute(KEY_VARIABLE_MESSAGE, Common.MENSAJE_ERROR_AUTENTIFICA);
	    		}

    		
				rd = getServletConfig().getServletContext().getRequestDispatcher(
						config.getPathMateria() + NOMBRE_DE_PAGINA);
			    rd.forward(request,response);
    		}    		
		    
    	} catch (Exception e) {
			Common.Error(e);
			response.sendRedirect(getServletConfig().getServletContext().getContextPath() + Common.getErrorPage());
		}
		
	}
	
	
	private void Descargar(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ZipOutputStream zipOutStream = null;
		ByteArrayOutputStream baos = null;
		try{
		
	        response.setHeader("Expires", "0");
	        response.setHeader("Content-Type", "charset=UTF-8");
	        response.setHeader("Content-disposition", "attachment; filename=\"oficios.zip\"");
	        response.setContentType("application/zip");

			zipOutStream = new ZipOutputStream(response.getOutputStream());

	        baos = ImprimirLiberacion(request);
			try {
		        ZipEntry entry = new ZipEntry("Liberacion.pdf");
		        zipOutStream.putNextEntry(entry);
		        zipOutStream.write(baos.toByteArray());

		        zipOutStream.closeEntry();
		        
		        
			}catch(Exception e){
				  throw e;
			
			}finally{
				baos.close();
			}
	        
			baos = ImprimirCambioInformacion(request);
			try {
		        ZipEntry entry = new ZipEntry("CambioDeInformacion.pdf");
		        zipOutStream.putNextEntry(entry);
		        zipOutStream.write(baos.toByteArray());

		        zipOutStream.closeEntry();
		        
			}catch(Exception e){
				  
			}finally{
				if(baos != null){
					baos.close();
				}
			}

            zipOutStream.finish();

		}catch(Exception e){
			throw e;
	    } finally {
	    	if(baos != null){
	    		baos.close();
	    	}
	        zipOutStream.close();
	    }

	}

	private void RegresarPendiente(HttpServletRequest request, String cveMat, HttpServletResponse response) throws Exception {
		Connection con = MySqlConnector.getConnection();
		try {
			con.setAutoCommit(false);
			
			MateriaSolicitud bean = new MateriaSolicitud();
			bean.setCveMat(cveMat);
			bean.setResultado(0);
			bean.setEstadoSolicitud(0);
			bean.setUsuarioSolicitud(usuario.getCveUsu());
			
			bean.Insertar(con);
			
			Common.InsertLogAct(request, con, usuario.getCveUsu(), 
					MessageFormat.format(Common.TEXTO_ACTION_LOG_REGRESAR_PENDIENTE,cveMat));
	
			
			con.commit();
			
			Common.MsgJson("success", Common.MENSAJE_TERMINAR_PROCESO, response);
			
		} catch (SQLException e) {
			if (con != null) {
				con.rollback();
			}			
			throw e;
		} finally{
			if (con != null) {
				con.setAutoCommit(true);
				con.close();
	        }			
		}
		
	}

	private void ImprimirPreview(int tipo, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ByteArrayOutputStream baos = null;
		
		try{
		
			if(tipo == 1){
				baos = ImprimirLiberacion(request);
			}else{
				baos = ImprimirCambioInformacion(request);				
			}

	        response.setHeader("Expires", "0");
	        response.setHeader("Content-Type", "charset=UTF-8");
	        response.setHeader("Content-disposition", "inline; filename=\"oficio.pdf\"");
	        response.setContentType("application/pdf");
	        
	        OutputStream os = response.getOutputStream();
	        os.write(baos.toByteArray());
	        os.flush();
	        os.close();

	        
		}catch(Exception e){
			throw e;
			
		}finally{
			if(baos != null){
				baos.close();				
			}
			
		}
		
	}

	private ByteArrayOutputStream ImprimirLiberacion(HttpServletRequest request) throws Exception {
		
		String cveMat = request.getParameter(KEY_FORM_HIDDEN_CVE_MAT);
		String url = request.getParameter(KEY_FORM_URL);
		String personaLiberacion = request.getParameter(KEY_FORM_NOMBRE_LIBERACION);
		String cargoLiberacion = request.getParameter(KEY_FORM_CARGO_LIBERACION);
		String personaFirma = request.getParameter(KEY_FORM_NOMBRE_FIRMA);
		String cargoFirma = request.getParameter(KEY_FORM_CARGO_FIRMA);
		
		String fechaProduccion = request.getParameter(KEY_FORM_FECHA_PRODUCCION);
				
		
		Materia bean = Materia.Buscar(cveMat);
		String spaceTab = "        ";

		Document document = new Document(PageSize.LETTER, 50,50,110,10);

        ByteArrayOutputStream baos = new ByteArrayOutputStream();

        try{
	       
            PdfWriter writer = PdfWriter.getInstance(document,baos );
            PdfLiberarNewPage event = new PdfLiberarNewPage();
	        writer.setPageEvent(event);
	        
	        document.open();
	        
	        //-----tabla de title
	        PdfPTable table = new PdfPTable(1);
	        table.setTotalWidth(document.getPageSize().getWidth() - 50);
	        table.setLockedWidth(true);
	        table.setHorizontalAlignment(Rectangle.ALIGN_CENTER);
	        
	        Font fontTitle  = FontFactory.getFont("Century Gothic", 12, Font.BOLD);
	        Font fontNormal  = FontFactory.getFont("Century Gothic", 10);
	        PdfPCell cell = new PdfPCell(new Phrase("Identificación del Proyecto", fontTitle));
	        cell.setHorizontalAlignment(Rectangle.ALIGN_CENTER);
	        cell.setBorder(Rectangle.NO_BORDER);
	        table.addCell(cell);
	        table.setSpacingAfter(20);
	        document.add(table);

	        //-----tabla de title
	        //-----tabla de fecha
	        table = new PdfPTable(4);
	        table.setTotalWidth(document.getPageSize().getWidth() - 50);
	        table.setLockedWidth(true);
	        cell = new PdfPCell(new Phrase("Fecha de Registro:", fontTitle));
	        cell.setHorizontalAlignment(Rectangle.ALIGN_LEFT);
	        table.addCell(cell);
	
			Date date = new Date();
			SimpleDateFormat sdf1 = new SimpleDateFormat("dd/MMM/yyyy");
	        cell = new PdfPCell(new Phrase(sdf1.format(date), fontNormal));
	        cell.setHorizontalAlignment(Rectangle.ALIGN_LEFT);
	        table.addCell(cell);
	        
	        cell = new PdfPCell(new Phrase("Hora de Registro:", fontTitle));
	        cell.setHorizontalAlignment(Rectangle.ALIGN_LEFT);
	        table.addCell(cell);
	        
	        date = new Date();
			sdf1 = new SimpleDateFormat("HH:mm:ss");
	        cell = new PdfPCell(new Phrase(sdf1.format(date) + " HRS.", fontNormal));
	        cell.setHorizontalAlignment(Rectangle.ALIGN_LEFT);
	        table.addCell(cell);
	        table.setSpacingAfter(30);
	        
	        document.add(table);
	        
	        //-----tabla de fecha
	        //-----tabla de contenido
	        table = new PdfPTable(1);
	        table.setTotalWidth(document.getPageSize().getWidth() - 50);
	        table.setLockedWidth(true);
	        
	          //-----row 1
	        Paragraph para = new Paragraph("El C. ", fontNormal);

	        
	        Chunk chunk = new Chunk(personaLiberacion, fontNormal);
	        chunk.setUnderline(0.5f, -2);
	        para.add(chunk);
	        
	        para.add(new Chunk(" "));

	        chunk = new Chunk(cargoLiberacion, fontNormal);
	        chunk.setUnderline(0.5f, -2);
	        para.add(chunk);

	        para.add(new Chunk(" , acepta la terminación y entrega contenidos ", fontNormal));

	        chunk = new Chunk(bean.getNomNivel() + " " + bean.getNomMat());
	        chunk.setUnderline(0.5f, -2);
	        para.add(chunk);
	        
	        para.add(new Chunk(" cumpliendo las siguientes cláusulas:" 
	        + Common.NEW_LINE + Common.NEW_LINE + spaceTab 
	        + "a) Los productos y soporte documental para la operación del sistema acordados y generados son:", fontNormal));
	        
	        cell = new PdfPCell();
	        cell.setBorder(PdfPCell.NO_BORDER);
	        cell.setPadding(5);
	        cell.addElement(para);
	        
	        table.addCell(cell);
	          //-----row 1
	          //-----row 2
	        
	        String menu = bean.getNomNivel() + " " + bean.getNomMat()
	        + Common.NEW_LINE + " Módulo " + bean.getModulo()
	        + Common.NEW_LINE + TrcnMat.CreaMenuPDF(bean, 0, 0);

	        PdfPTable innerTable = new PdfPTable(1);
	        PdfPCell innerCell = new PdfPCell(new Phrase(menu, fontNormal));
	        innerCell.setBorder(PdfPCell.NO_BORDER);
	        innerTable.addCell(innerCell);
	        
	        cell = new PdfPCell();
	        cell.setBorder(PdfPCell.NO_BORDER);
	        cell.setPadding(5);
	        cell.addElement(innerTable);
	        table.addCell(cell);
	        cell.addElement(innerTable);
	          //-----row 2

	          //-----row 3
	        cell = new PdfPCell(new Phrase(spaceTab + "b) Bajo las siguientes condiciones de entrega:", fontNormal));
	        cell.setBorder(PdfPCell.NO_BORDER);
	        cell.setPadding(5);
	        table.addCell(cell);
	          //-----row 3

	          //-----row 4
	        cell = new PdfPCell(new Phrase(spaceTab + spaceTab 
	        		+ "Se hace entrega de la siguientes contenidos:" 
	        		+ Common.NEW_LINE + spaceTab + spaceTab + spaceTab, fontNormal));
	        cell.setBorder(PdfPCell.NO_BORDER);
	        table.addCell(cell);

	        innerTable = new PdfPTable(1);
	        innerCell = new PdfPCell(new Phrase(menu, fontNormal));
	        innerCell.setBorder(PdfPCell.NO_BORDER);
	        innerTable.addCell(innerCell);
	        
	        cell = new PdfPCell();
	        cell.setBorder(PdfPCell.NO_BORDER);
	        cell.addElement(innerTable);
	        table.addCell(cell);
	        cell.addElement(innerTable);
	        
	        
	        para = new Paragraph(spaceTab + spaceTab 
	        		+ "Los módulos liberados satisfacen con los requerimientos de manera precisa, es flexible,"
	        		+ Common.NEW_LINE + spaceTab + spaceTab 
	        		+ "funcional y satisface las necesidades y se acepta la migración a producción."
	        		+ Common.NEW_LINE + Common.NEW_LINE, fontNormal);
	        
	        
	        para.add(new Chunk(spaceTab + spaceTab + 
	        		"Se pondrá en producción a partir del día "+ fechaProduccion + " del presente año en el siguiente servidor" 
	        		+ Common.NEW_LINE + spaceTab + spaceTab 
	        		+ "de producción alojado en la siguiente URL: "));

	        Font blue  = FontFactory.getFont("Century Gothic", 10, BaseColor.BLUE);
        	chunk = new Chunk(url, blue);
	        chunk.setUnderline(0.5f, -2);
	        para.add(chunk);
	        para.add(new Chunk(Common.NEW_LINE + Common.NEW_LINE));
	        

	        para.add(new Chunk(Common.NEW_LINE + Common.NEW_LINE));

	        
	        
	        cell = new PdfPCell();
	        cell.setBorder(PdfPCell.NO_BORDER);
	        cell.setPadding(5);
	        cell.addElement(para);
	        
	        table.addCell(cell);
	        table.setSpacingAfter(5);
	          //-----row 4
	        
	        document.add(table);
	        //-----tabla de contenido
	        
	        
	        float currentY = writer.getVerticalPosition(false);
	        if(currentY < 150.0){
	        	document.newPage();
	        }
        
	        	                
	        //-----tabla de firma
	        Font fontFirma  = FontFactory.getFont("Century Gothic", 9, Font.BOLD);
	        float[] columnWidths = {20, 1, 20};
	        PdfPTable tableFirma = new PdfPTable(columnWidths);
	        tableFirma.setTotalWidth(document.getPageSize().getWidth() - 50);
	        tableFirma.setLockedWidth(true);
	        
	        PdfPCell cellOne = new PdfPCell(new Phrase("Nombre y Firma", fontFirma));
	        PdfPCell cellTwo = new PdfPCell(new Phrase("Nombre y Firma", fontFirma));
	        PdfPCell cellBlank = new PdfPCell(new Phrase(""));
	        
	        cellOne.setBorder(Rectangle.NO_BORDER);
	        cellOne.setHorizontalAlignment(Rectangle.ALIGN_CENTER);
	        cellOne.setFixedHeight(80);
	        cellTwo.setBorder(Rectangle.NO_BORDER);
	        cellTwo.setHorizontalAlignment(Rectangle.ALIGN_CENTER);
	        cellBlank.setBorder(Rectangle.NO_BORDER);
	        
	        tableFirma.addCell(cellOne);
	        tableFirma.addCell(cellBlank);
	        tableFirma.addCell(cellTwo);
	
	        cellOne = new PdfPCell();
	        cellTwo = new PdfPCell();
	
	        cellOne.setBorder(Rectangle.NO_BORDER);
	        cellOne.setBorder(Rectangle.BOTTOM);
	        cellTwo.setBorder(Rectangle.NO_BORDER);
	        cellTwo.setBorder(Rectangle.BOTTOM);

	        tableFirma.addCell(cellOne);
	        tableFirma.addCell(cellBlank);
	        tableFirma.addCell(cellTwo);
	        
	        
	        PdfPCell cellOne2 = new PdfPCell(new Phrase(personaLiberacion.toUpperCase()
	        		+ Common.NEW_LINE + cargoLiberacion.toUpperCase(), fontFirma));
	        cellOne2.setBorder(Rectangle.NO_BORDER);
	        cellOne2.setHorizontalAlignment(Rectangle.ALIGN_CENTER);
	        tableFirma.addCell(cellOne2);
	
	        tableFirma.addCell(cellBlank);
	
	        PdfPCell cellTwo2 = new PdfPCell(new Phrase(personaFirma.toUpperCase()
	        		+ Common.NEW_LINE + cargoFirma.toUpperCase(), fontFirma));
	        cellTwo2.setBorder(Rectangle.NO_BORDER);
	        cellTwo2.setHorizontalAlignment(Rectangle.ALIGN_CENTER);
	        tableFirma.addCell(cellTwo2);
	
	        
	        document.add(tableFirma);
	        //-----tabla de firma
	

		}catch(Exception e){
			throw e;
	    } finally {
	    	document.close();
	    }

	        return baos;
	}

	private ByteArrayOutputStream ImprimirCambioInformacion(HttpServletRequest request) throws Exception {

		String cveMat = request.getParameter(KEY_FORM_HIDDEN_CVE_MAT);

		String personaLiberacion = request.getParameter(KEY_FORM_NOMBRE_LIBERACION);
		String cargoLiberacion = request.getParameter(KEY_FORM_CARGO_LIBERACION);
		String personaFirma = request.getParameter(KEY_FORM_NOMBRE_FIRMA);
		String cargoFirma = request.getParameter(KEY_FORM_CARGO_FIRMA);

		
		Materia bean = Materia.Buscar(cveMat);

      
		Document document = new Document(PageSize.LETTER, 50,50,160,50);

        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        PdfWriter writer = PdfWriter.getInstance(document,baos );

        PdfNewPage event = new PdfNewPage();
        writer.setPageEvent(event);

        document.open();	

        //-----tabla de fecha 
        PdfPTable table = new PdfPTable(2);
        table.setTotalWidth(document.getPageSize().getWidth() - 300);
        table.setLockedWidth(true);
        table.setHorizontalAlignment(Rectangle.ALIGN_RIGHT);
        PdfPCell cell = new PdfPCell(new Phrase("FECHA/HORA"));
        cell.setBackgroundColor(BaseColor.LIGHT_GRAY);
        cell.setHorizontalAlignment(Rectangle.ALIGN_CENTER);
        table.addCell(cell);

        cell = new PdfPCell(new Phrase("FOLIO"));
        cell.setBackgroundColor(BaseColor.LIGHT_GRAY);        
        cell.setHorizontalAlignment(Rectangle.ALIGN_CENTER);
        table.addCell(cell);

		Date date = new Date();
		SimpleDateFormat sdf1 = new SimpleDateFormat("dd/MM/yyyy HH:mm");
        cell = new PdfPCell(new Phrase(sdf1.format(date) + " HRS."));
        cell.setHorizontalAlignment(Rectangle.ALIGN_CENTER);
        table.addCell(cell);

        cell = new PdfPCell(new Phrase(""));
        cell.setHorizontalAlignment(Rectangle.ALIGN_CENTER);
        table.addCell(cell);

        document.add(table);
        //-----tabla de fecha

        //-----tabla de datos del area administrativa solicitante
        table = new PdfPTable(2);
        table.setTotalWidth(document.getPageSize().getWidth() - 80);
        table.setLockedWidth(true);
        table.setHorizontalAlignment(Rectangle.ALIGN_CENTER);
        table.setSpacingBefore(30);
        cell = new PdfPCell(new Phrase("DATOS DEL AREA ADMINISTRATIVA SOLICITANTE"));
        cell.setBackgroundColor(BaseColor.LIGHT_GRAY);
        cell.setHorizontalAlignment(Rectangle.ALIGN_CENTER);
        cell.setColspan(2);
        table.addCell(cell);
        
        cell = new PdfPCell(new Phrase("SOLICITA"));
        cell.setBackgroundColor(BaseColor.LIGHT_GRAY);
        cell.setHorizontalAlignment(Rectangle.ALIGN_CENTER);
        table.addCell(cell);
        cell = new PdfPCell(new Phrase("AUTORIZA"));
        cell.setBackgroundColor(BaseColor.LIGHT_GRAY);
        cell.setHorizontalAlignment(Rectangle.ALIGN_CENTER);
        table.addCell(cell);

//        cell = new PdfPCell(new Phrase("Nombre: " + personaLiberacion));
        cell = new PdfPCell(new Phrase(personaLiberacion.toUpperCase()));
        cell.setHorizontalAlignment(Rectangle.ALIGN_LEFT);
        table.addCell(cell);
//        cell = new PdfPCell(new Phrase("Nombre: " + personaFirma));
        cell = new PdfPCell(new Phrase(personaFirma.toUpperCase()));
        cell.setHorizontalAlignment(Rectangle.ALIGN_LEFT);
        table.addCell(cell);

//        cell = new PdfPCell(new Phrase("Cargo: "));
        cell = new PdfPCell(new Phrase(cargoLiberacion.toUpperCase()));
        cell.setHorizontalAlignment(Rectangle.ALIGN_LEFT);
        table.addCell(cell);
//        cell = new PdfPCell(new Phrase("Cargo: "));
        cell = new PdfPCell(new Phrase(cargoFirma.toUpperCase()));
        cell.setHorizontalAlignment(Rectangle.ALIGN_LEFT);
        table.addCell(cell);

//        cell = new PdfPCell(new Phrase("Área: "));
//        cell.setHorizontalAlignment(Rectangle.ALIGN_LEFT);
//        table.addCell(cell);
//        cell = new PdfPCell(new Phrase("Área: "));
//        cell.setHorizontalAlignment(Rectangle.ALIGN_LEFT);
//        table.addCell(cell);
        
        document.add(table);
        //-----tabla de datos del area administrativa solicitante
        
        //-----tabla de tipo de consulta/cambio
        table = new PdfPTable(3);
        table.setTotalWidth(document.getPageSize().getWidth() - 80);
        table.setLockedWidth(true);
        table.setHorizontalAlignment(Rectangle.ALIGN_CENTER);
        table.setSpacingBefore(20);
        cell = new PdfPCell(new Phrase("TIPO DE CONSULTA/CAMBIO"));
        cell.setBackgroundColor(BaseColor.LIGHT_GRAY);
        cell.setHorizontalAlignment(Rectangle.ALIGN_CENTER);
        cell.setColspan(3);
        table.addCell(cell);

        //innertable1
        PdfPTable innertable = CreateInnerTable();        
        innertable.addCell(" ");
        PdfPCell innercell = new PdfPCell(new Phrase("Configuración Hw/Sw"));
        innercell.setBorder(Rectangle.NO_BORDER);
        innertable.addCell(innercell);

        innercell = new PdfPCell(new Phrase("X"));
        innercell.setHorizontalAlignment(Rectangle.ALIGN_CENTER);
        innertable.addCell(innercell);
        
        innercell = new PdfPCell(new Phrase("Applicaciones"));
        innercell.setBorder(Rectangle.NO_BORDER);
        innertable.addCell(innercell);
        
        innercell = new PdfPCell(new Phrase(" "));
        innercell.setHorizontalAlignment(Rectangle.ALIGN_CENTER);
        innertable.addCell(innercell);

        innercell = new PdfPCell(new Phrase("Sitio WEB"));
        innercell.setBorder(Rectangle.NO_BORDER);
        innertable.addCell(innercell);

        cell = new PdfPCell();
        cell.setBorder(Rectangle.NO_BORDER);
        cell.setBorder(Rectangle.BOTTOM | Rectangle.LEFT);
        cell.addElement(innertable);
        table.addCell(cell);

        //innertable2
        innertable = CreateInnerTable();
        
        innertable.addCell(" ");
        innercell = new PdfPCell(new Phrase("Base de Datos"));
        innercell.setBorder(Rectangle.NO_BORDER);
        innertable.addCell(innercell);

        innertable.addCell(" ");
        innercell = new PdfPCell(new Phrase("Hardware"));
        innercell.setBorder(Rectangle.NO_BORDER);
        innertable.addCell(innercell);
        
        innercell = new PdfPCell(new Phrase("Especifique:"));
        innercell.setColspan(2);
        innercell.setBorder(Rectangle.NO_BORDER);
        innercell.setBorder(Rectangle.BOTTOM);
        innertable.addCell(innercell);

        cell = new PdfPCell();
        cell.addElement(innertable);
        cell.setBorder(Rectangle.NO_BORDER);
        cell.setBorder(Rectangle.BOTTOM);
        table.addCell(cell);
        
        //innertable3
        innertable = CreateInnerTable();
        
        innertable.addCell(" ");
        innercell = new PdfPCell(new Phrase("Telecomunicaciones"));
        innercell.setBorder(Rectangle.NO_BORDER);
        innertable.addCell(innercell);

        innertable.addCell(" ");
        innercell = new PdfPCell(new Phrase("Redes"));
        innercell.setBorder(Rectangle.NO_BORDER);
        innertable.addCell(innercell);
        
        cell = new PdfPCell();
        cell.addElement(innertable);
        cell.setBorder(Rectangle.NO_BORDER);
        cell.setBorder(Rectangle.BOTTOM | Rectangle.RIGHT);
        table.addCell(cell);

        document.add(table);

         //-----tabla de tipo de consulta/cambio

        
        //-----tabla de periodicidad
        table = new PdfPTable(3);
        table.setTotalWidth(document.getPageSize().getWidth() - 80);
        table.setLockedWidth(true);
        table.setHorizontalAlignment(Rectangle.ALIGN_CENTER);
        table.setSpacingBefore(20);
        cell = new PdfPCell(new Phrase("PERIODICIDAD"));
        cell.setBackgroundColor(BaseColor.LIGHT_GRAY);
        cell.setHorizontalAlignment(Rectangle.ALIGN_CENTER);
        cell.setColspan(3);
        table.addCell(cell);

        //innertable1
        innertable = CreateInnerTable();        
        innertable.addCell(" ");
        innercell = new PdfPCell(new Phrase("Días"));
        innercell.setBorder(Rectangle.NO_BORDER);
        innertable.addCell(innercell);

        innertable.addCell(" ");
        innercell = new PdfPCell(new Phrase("Años"));
        innercell.setBorder(Rectangle.NO_BORDER);
        innertable.addCell(innercell);
        
        cell = new PdfPCell();
        cell.setBorder(Rectangle.NO_BORDER);
        cell.setBorder(Rectangle.BOTTOM | Rectangle.LEFT);
        cell.addElement(innertable);
        table.addCell(cell);

        //innertable2
        innertable = CreateInnerTable();        
        innertable.addCell(" ");
        innercell = new PdfPCell(new Phrase("Semanas"));
        innercell.setBorder(Rectangle.NO_BORDER);
        innertable.addCell(innercell);

        innertable.addCell(" ");
        innercell = new PdfPCell(new Phrase("Indefinido"));
        innercell.setBorder(Rectangle.NO_BORDER);
        innertable.addCell(innercell);

        cell = new PdfPCell();
        cell.setBorder(Rectangle.NO_BORDER);
        cell.setBorder(Rectangle.BOTTOM);
        cell.addElement(innertable);
        table.addCell(cell);

        //innertable3
        innertable = CreateInnerTable();        
        innertable.addCell(" ");
        innercell = new PdfPCell(new Phrase("Meses"));
        innercell.setBorder(Rectangle.NO_BORDER);
        innertable.addCell(innercell);

        innercell = new PdfPCell(new Phrase("X"));
        innercell.setHorizontalAlignment(Rectangle.ALIGN_CENTER);
        innertable.addCell(innercell);

        innercell = new PdfPCell(new Phrase("N/A"));
        innercell.setBorder(Rectangle.NO_BORDER);
        innertable.addCell(innercell);

        cell = new PdfPCell();
        cell.setBorder(Rectangle.NO_BORDER);
        cell.setBorder(Rectangle.BOTTOM | Rectangle.RIGHT);
        cell.addElement(innertable);
        table.addCell(cell);

        document.add(table);

         //-----tabla de periodicidad


        //-----tabla de origen de la solicitud
        table = new PdfPTable(3);
        table.setTotalWidth(document.getPageSize().getWidth() - 80);
        table.setLockedWidth(true);
        table.setHorizontalAlignment(Rectangle.ALIGN_CENTER);
        table.setSpacingBefore(20);
        cell = new PdfPCell(new Phrase("ORIGEN DE LA SOLICITUD DE CONSULTA/CAMBIO"));
        cell.setBackgroundColor(BaseColor.LIGHT_GRAY);
        cell.setHorizontalAlignment(Rectangle.ALIGN_CENTER);
        cell.setColspan(3);
        table.addCell(cell);

        //innertable1
        innertable = CreateInnerTable();        
        innercell = new PdfPCell(new Phrase("X"));
        innercell.setHorizontalAlignment(Rectangle.ALIGN_CENTER);
        innertable.addCell(innercell);
        
        innercell = new PdfPCell(new Phrase("Mejora"));
        innercell.setBorder(Rectangle.NO_BORDER);
        innertable.addCell(innercell);

        innertable.addCell(" ");
        innercell = new PdfPCell(new Phrase("Otro"));
        innercell.setBorder(Rectangle.NO_BORDER);
        innertable.addCell(innercell);
        
        cell = new PdfPCell();
        cell.setBorder(Rectangle.NO_BORDER);
        cell.setBorder(Rectangle.BOTTOM | Rectangle.LEFT);
        cell.addElement(innertable);
        table.addCell(cell);

        //innertable2
        innertable = CreateInnerTable();        
        innertable.addCell(" ");
        innercell = new PdfPCell(new Phrase("Actualización"));
        innercell.setBorder(Rectangle.NO_BORDER);
        innertable.addCell(innercell);

        innertable.addCell(" ");
        innercell = new PdfPCell(new Phrase("Especifique:"));
        innercell.setColspan(2);
        innercell.setBorder(Rectangle.NO_BORDER);
        innercell.setBorder(Rectangle.BOTTOM);
        innertable.addCell(innercell);

        cell = new PdfPCell();
        cell.setBorder(Rectangle.NO_BORDER);
        cell.setBorder(Rectangle.BOTTOM);
        cell.addElement(innertable);
        table.addCell(cell);

        //innertable3
        innertable = CreateInnerTable();        
        innertable.addCell(" ");
        innercell = new PdfPCell(new Phrase("Falla"));
        innercell.setBorder(Rectangle.NO_BORDER);
        innertable.addCell(innercell);

        cell = new PdfPCell();
        cell.setBorder(Rectangle.NO_BORDER);
        cell.setBorder(Rectangle.BOTTOM | Rectangle.RIGHT);
        cell.addElement(innertable);
        table.addCell(cell);

        document.add(table);
         //-----tabla de origen de la solicitud

        //-----tabla de menu
        
        table = new PdfPTable(1);
        table.setTotalWidth(document.getPageSize().getWidth() - 80);
        table.setLockedWidth(true);
        table.setHorizontalAlignment(Rectangle.ALIGN_CENTER);
        table.setSpacingBefore(20);
        cell = new PdfPCell(new Phrase("LOS CONTENIDOS"));
        cell.setBackgroundColor(BaseColor.LIGHT_GRAY);
        cell.setHorizontalAlignment(Rectangle.ALIGN_CENTER);
        table.addCell(cell);
        
        cell = new PdfPCell(new Phrase(bean.getNomNivel() + "  " + bean.getNomMat() 
        + Common.NEW_LINE + " Modulo " + bean.getModulo()
        + Common.NEW_LINE + TrcnMat.CreaMenuPDF(bean, 0, 0)));
        cell.setBorder(Rectangle.LEFT | Rectangle.RIGHT);
        table.addCell(cell);

		PdfPRow row = table.getRow(table.size()-1);
		PdfPCell[] cellarray = row.getCells();
		cellarray[0].setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
		
//		row = table.getRow(table.size()-1);
//		cellarray = row.getCells();
//		cellarray[0].setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.TOP);
//		
		ArrayList<PdfPRow> rowArray = table.getRows();
//		row = table.getRow(rowArray.size()-1);
//		cellarray = row.getCells();
//		cellarray[0].setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);        
		    
		document.add(table);
        
        //-----tabla de menu

        //-----tabla de descripcion de consulta
        
        table = new PdfPTable(1);
        table.setTotalWidth(document.getPageSize().getWidth() - 80);
        table.setLockedWidth(true);
        table.setHorizontalAlignment(Rectangle.ALIGN_CENTER);
        table.setSpacingBefore(20);
        cell = new PdfPCell(new Phrase("DESCRIPCIÓN DE CONSULTA/CAMBIO"));
        cell.setBackgroundColor(BaseColor.LIGHT_GRAY);
        cell.setHorizontalAlignment(Rectangle.ALIGN_CENTER);
        table.addCell(cell);

        String nota2 = request.getParameter(KEY_FORM_NOTA2);
        
        while(nota2.indexOf(Common.NEW_LINE)>=0){

        	int i = nota2.indexOf(Common.NEW_LINE);
        	String str = nota2.substring(0,i);
        	nota2 = nota2.substring(i+1);
        	
        	cell = new PdfPCell(new Phrase(str));
        	cell.setBorder(Rectangle.LEFT | Rectangle.RIGHT);
    		table.addCell(cell);

        }
    	cell = new PdfPCell(new Phrase(nota2));
    	cell.setBorder(Rectangle.LEFT | Rectangle.RIGHT);
		table.addCell(cell);

        
		rowArray = table.getRows();
		row = table.getRow(rowArray.size()-1);
		cellarray = row.getCells();
		cellarray[0].setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);        
        
		document.add(table);
        //-----tabla de descripcion de consulta

        
        //-----tabla de firma
        float[] columnWidths = {20, 1, 20};
        PdfPTable tableFirma = new PdfPTable(columnWidths);
        tableFirma.setTotalWidth(document.getPageSize().getWidth() - 50);
        tableFirma.setLockedWidth(true);
        tableFirma.setSpacingBefore(30);
        
        PdfPCell cellOne = new PdfPCell(new Phrase("Nombre y Firma"));
        PdfPCell cellTwo = new PdfPCell(new Phrase("Nombre y Firma"));
        PdfPCell cellBlank = new PdfPCell(new Phrase(""));
        
        cellOne.setBorder(Rectangle.NO_BORDER);
        cellOne.setHorizontalAlignment(Rectangle.ALIGN_CENTER);
        cellOne.setFixedHeight(80);
        cellTwo.setBorder(Rectangle.NO_BORDER);
        cellTwo.setHorizontalAlignment(Rectangle.ALIGN_CENTER);
        cellBlank.setBorder(Rectangle.NO_BORDER);
        
        tableFirma.addCell(cellOne);
        tableFirma.addCell(cellBlank);
        tableFirma.addCell(cellTwo);

        cellOne = new PdfPCell();
        cellTwo = new PdfPCell();

        cellOne.setBorder(Rectangle.NO_BORDER);
        cellOne.setBorder(Rectangle.BOTTOM);
        cellTwo.setBorder(Rectangle.NO_BORDER);
        cellTwo.setBorder(Rectangle.BOTTOM);

        tableFirma.addCell(cellOne);
        tableFirma.addCell(cellBlank);
        tableFirma.addCell(cellTwo);
        

        String jefe1Nombre = config.getJefe1Nombre();
        if(jefe1Nombre == null || jefe1Nombre.equals("")){
        	jefe1Nombre = usuario.getNomCompletoUsu().toUpperCase();
        }

        PdfPCell cellOne2 = new PdfPCell(new Phrase(personaLiberacion.toUpperCase() + Common.NEW_LINE
        		+ cargoLiberacion.toUpperCase()));
        cellOne2.setBorder(Rectangle.NO_BORDER);
        cellOne2.setHorizontalAlignment(Rectangle.ALIGN_CENTER);
        tableFirma.addCell(cellOne2);

        tableFirma.addCell(cellBlank);

        PdfPCell cellTwo2 = new PdfPCell(new Phrase(personaFirma.toUpperCase() + Common.NEW_LINE
        		+ cargoFirma.toUpperCase()));
        cellTwo2.setBorder(Rectangle.NO_BORDER);
        cellTwo2.setHorizontalAlignment(Rectangle.ALIGN_CENTER);
        tableFirma.addCell(cellTwo2);

        
        document.add(tableFirma);
        //-----tabla de firma
 
        document.close();		
        
        return baos;
        
	}

	private PdfPTable CreateInnerTable() throws DocumentException {
        PdfPTable innertable = new PdfPTable(2);
        innertable.setTotalWidth(150);
        innertable.setWidths(new float[]{1,9});
        innertable.setLockedWidth(true);
		return innertable;
	}

	/**
	 * Set form de la pantalla
	 * @param request
	 * @throws Exception 
	 */
	private void SetForm(HttpServletRequest request) throws Exception {
		try {
	
   			request.setAttribute(KEY_VARIABLE_USUARIO, usuario);

			String cveMat = request.getParameter(KEY_REQUEST_PARAM_CVE_MAT);
			if(cveMat == null || cveMat.equals("")){
				cveMat = request.getParameter(KEY_FORM_HIDDEN_CVE_MAT);
			}
			
			Materia bean = Materia.Buscar(cveMat);
			
			request.setAttribute(KEY_VARIABLE_MATERIA, bean);
			
			Date date = new Date();
	        SimpleDateFormat sdf1 = new SimpleDateFormat("dd/MM/yyyy");

	        request.setAttribute(KEY_VARIABLE_FECHA_SOLICITUD, sdf1.format(date));
	
   			request.setAttribute(KEY_VARIABLE_TIENE_AUTORIDAD, true);

			request.setAttribute(KEY_VARIABLE_RADIO_DESCARGAR, 9);
			request.setAttribute(KEY_VARIABLE_RADIO_PENDIENTE, Common.ESTADO_DE_SOLICITUD_PENDIENTE);
			request.setAttribute(KEY_VARIABLE_URL, config.getPruebaUrl());
			
	        String jefe1Nombre = config.getJefe1Nombre();
	        if(jefe1Nombre == null || jefe1Nombre.equals("")){
	        	jefe1Nombre = usuario.getNomCompletoUsu();
	        }
			request.setAttribute(KEY_VARIABLE_NOMBRE_LIBERACION, jefe1Nombre);
			request.setAttribute(KEY_VARIABLE_CARGO_LIBERACION, config.getJefe1Departamento());
			request.setAttribute(KEY_VARIABLE_PERSONA_FIRMA, config.getJefe2Nombre());
			request.setAttribute(KEY_VARIABLE_CARGO_FIRMA, config.getJefe2Departamento());

			
		} catch (Exception e) {
			throw e;
		}
		
	}
	
}
