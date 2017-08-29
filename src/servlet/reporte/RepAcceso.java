package servlet.reporte;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.LogAcc;
import beans.Usuario;
import util.common.Common;
import util.conf.Configuracion;

/**
 * Servlet implementation class RepAcceso
 */
@WebServlet("/RepAcceso")
public class RepAcceso extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/** Nombre de la p�gina **/
	private final String NOMBRE_DE_PAGINA = "RepAcceso.jsp";
	/** Nombre del form de nivel **/
	private final String KEY_VARIABLE_EXIST_RESULTADO = "existResultado";
	/** Nombre del form del clave **/
	private final String KEY_VARIABLE_USUARIO = "usuario";
	/** Nombre del form del clave **/
	private final String KEY_VARIABLE_FECHA_ENTRADA_INICIAL = "fechaEntradaInicial";
	/** Nombre del form del clave **/
	private final String KEY_VARIABLE_FECHA_ENTRADA_TERMINAL = "fechaEntradaTerminal";
	/** Nombre del form del clave **/
	private final String KEY_VARIABLE_FECHA_SALIDA_INICIAL = "fechaSalidaInicial";
	/** Nombre del form del clave **/
	private final String KEY_VARIABLE_FECHA_SALIDA_TERMINAL = "fechaSalidaTerminal";
	/** Nombre del form del permiso **/
	private final String KEY_VARIABLE_PUEDE_MOSTRAR = "puedeMostrar";
	/** Nombre del form del permiso **/
	private final String KEY_VARIABLE_MESSAGE = "message";
	/** Nombre del form del permiso **/
	private final String KEY_VARIABLE_TOTAL = "total";
	/** Nombre del form del permiso **/
	private final String KEY_VARIABLE_LOGS_ACCESO = "logsAcceso";
	/** Usuario **/
	public Usuario usuario;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public RepAcceso() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = null;
		
    	try {
    		
    		usuario = new Usuario(request, response);
    		if(usuario.IsAutorizado()){
    			if(usuario.isAdministrador() || usuario.isAdministradorGeneral()){
    			
    	   			SetForm(request);
    	   			
    			}else{
   					request.setAttribute(KEY_VARIABLE_PUEDE_MOSTRAR, false);
   					request.setAttribute(KEY_VARIABLE_MESSAGE, Common.MENSAJE_ERROR_AUTENTIFICA);
    			}

    			Configuracion config = new Configuracion();
				rd = getServletConfig().getServletContext().getRequestDispatcher(
						config.getPathReporte() + NOMBRE_DE_PAGINA);
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

		try {
    	
			usuario = new Usuario(request, response, true);
    		if(usuario.IsAutorizado()){
 
    			if(usuario.isAdministrador() || usuario.isAdministradorGeneral()){
    				
    				Buscar(request);
    				
    			}else{
					Common.Error(Common.MENSAJE_ERROR_AUTENTIFICA);
					response.sendRedirect(getServletConfig().getServletContext().getContextPath() + Common.getErrorPage());
					return;
				}
					
				SetForm(request);
				
    			Configuracion config = new Configuracion();
				rd = getServletConfig().getServletContext().getRequestDispatcher(
						config.getPathReporte() + NOMBRE_DE_PAGINA);
			    rd.forward(request,response);		
    		}
    		
    	} catch (Exception e) {
			Common.Error(e);
			response.sendRedirect(getServletConfig().getServletContext().getContextPath() + Common.getErrorPage());
		}
		
	}

	private void Buscar(HttpServletRequest request) throws Exception {
		List<LogAcc> list = new ArrayList<LogAcc>();
		LogAcc bean = new LogAcc();
		
		bean.setFecLogInicial(request.getParameter(KEY_VARIABLE_FECHA_ENTRADA_INICIAL));
		bean.setFecLogTerminal(request.getParameter(KEY_VARIABLE_FECHA_ENTRADA_TERMINAL));
		bean.setUltLogActInicial(request.getParameter(KEY_VARIABLE_FECHA_SALIDA_INICIAL));
		bean.setUltLogActTerminal(request.getParameter(KEY_VARIABLE_FECHA_SALIDA_TERMINAL));
		bean.setCveUsu(request.getParameter(KEY_VARIABLE_USUARIO));
		
		list = bean.Buscar();
		request.setAttribute(KEY_VARIABLE_TOTAL, list.size());
		request.setAttribute(KEY_VARIABLE_LOGS_ACCESO, list);
		request.setAttribute(KEY_VARIABLE_EXIST_RESULTADO, list.size() > 0);
		
		
	}

	private void SetForm(HttpServletRequest request) {

		request.setAttribute(KEY_VARIABLE_PUEDE_MOSTRAR, true);
		String fechaEntradaInicial = request.getParameter(KEY_VARIABLE_FECHA_ENTRADA_INICIAL);
		request.setAttribute(KEY_VARIABLE_FECHA_ENTRADA_INICIAL, fechaEntradaInicial);
		String fechaEntradaTerminal = request.getParameter(KEY_VARIABLE_FECHA_ENTRADA_TERMINAL);
		request.setAttribute(KEY_VARIABLE_FECHA_ENTRADA_TERMINAL, fechaEntradaTerminal);

		String fechaSalidaInicial = request.getParameter(KEY_VARIABLE_FECHA_SALIDA_INICIAL);
		request.setAttribute(KEY_VARIABLE_FECHA_SALIDA_INICIAL, fechaSalidaInicial);
		String fechaSalidaTerminal = request.getParameter(KEY_VARIABLE_FECHA_SALIDA_TERMINAL);
		request.setAttribute(KEY_VARIABLE_FECHA_SALIDA_TERMINAL, fechaSalidaTerminal);
		
		
		String usuario = request.getParameter(KEY_VARIABLE_USUARIO);
		request.setAttribute(KEY_VARIABLE_USUARIO, usuario);

		
	}

}
