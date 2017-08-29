<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.net.*" errorPage="" %>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="org.apache.commons.fileupload.*" errorPage="" %>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.util.*" errorPage="" %>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.io.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html ><!-- InstanceBegin template="/Templates/PlantContBachEduDis.dwt.jsp" codeOutsideHTMLIsLocked="false" -->
<head> 
	 <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" /> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
		<title>UDEM&eacute;x</title>
<link href='M_C/UDEM2.png' rel='shortcut icon' type='image/png'>
   
  <title>UDEM&eacute;x/ISCEEM</title>
<!-- InstanceBeginEditable name="doctitle" -->
<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<!-- InstanceEndEditable -->
<meta name="description" content="Contenidos de Plataformas UDEMEX" />
		<meta name="keywords" content="UDEMEX" />
		<meta name="author" content="UDEMEX - DESARROLLO Y PRODUCCION DE CONTENIDOS VIRTUALES" />
<link href='../../../../M_C/UDEM.png' rel='shortcut icon' type='image/png'>
		<link rel="stylesheet" type="text/css" href="../../../../css/default.css" />
		<link rel="stylesheet" type="text/css" href="../../../../css/component.css" />
        <link rel="stylesheet" type="text/css" href="../../../../css/componenteintro.css" />
		<script src="../../../../js/modernizr.custom.js"></script>
        
        <link type="text/css" rel="stylesheet" href="../../../../css/estilo2.css">
        <link type="text/css" rel="stylesheet" href="../../../../flechas/style.css">
        <link type="text/css" rel="stylesheet" href="../../../../style/style_UDEM.css"/> 
        <link type="text/css" rel="stylesheet" href="../../../../style/Animaciones.css"/>         
        <link rel="stylesheet" type="text/css" href="../../../../css/jquery.lightbox.css">
  <link rel="stylesheet" href="../../../../css/demo.css">       
         <script src="../../../../js/generica.js"> </script>
         <link type="text/css" href="../../../../css/zoomy.css" rel="stylesheet">
<script type="text/javascript" src="../../../../js/jquery.js"></script>
<script type="text/javascript" src="../../../../js/zoomy.min.js"></script>
<script type="text/javascript">
$(function () {
    $('.zoom').zoomy();
});
</script>
</head> 
    <%@ include  file ="../../../../Inc/var.txt"%>
    <%@ include  file ="../../../../Inc/ConForm.txt"%>  
   <jsp:useBean id="BeanGenerico"   scope="page"  class="generica.Generica"/>
   <jsp:useBean id="BeanNavegador"  scope="page" class="generica.Navegadores"/>
   <jsp:useBean id="BeanGenerico2"  scope="page" class="generica.menu"/> 
   <jsp:useBean id="BeanSeguridad"  scope="page" class="Seguridad.Validaciones"/>
   <jsp:useBean id="BeanMaterias"   scope="page" class="Materias.DatosMat"/>
   <jsp:useBean id="BeanMenuLic"    scope="page" class="generica.MenuLic"/>
 
     <script type="text/javascript">
			$(document).ready(function(){ 
			
			$(window).scroll(function(){
				if ($(this).scrollTop() > 50) {
					$('.scrollup').fadeIn();
				} else {
					$('.scrollup').fadeOut();
				}
			}); 
			
			$('.scrollup').click(function(){
				$("html, body").animate({ scrollTop: 0 }, 600);
				return false;
			});
 
		});
		</script>
	 
    

 <script src="../../../../js/jquery.min.js"></script>     
<BODY style="margin-top: 0; margin-right: 0; margin-bottom: 0; margin-left: 0" class="informationText" onLoad="javascript: history.go(1);" onUnload="javascript: history.go(1);">
 
   <div align="center">
      <%
            String ua=request.getHeader("User-Agent").toLowerCase();
			String navind=BeanNavegador.Tipo_Nav (ua);
			out.print( navind);            
    
/******   VARIOBLES GLOBALES    *************/
       HttpSession  sesion               = request.getSession(true); 
	   String       NomLooginUsuarios    = null; 
	   String       TipUsuPerCad         = null;
	   String       TipUsuPer            = (String )sesion.getValue("LicUDEM_TipLoginUsu");  
	   String       AreaPer              = (String )sesion.getValue("LicUDEM_AreaPer");
	   String       LoginUsuario         = (String )sesion.getValue("LicUDEM_Usuario");
	   String       NombreUsuario        = (String )sesion.getValue("LicUDEM_Nombre"); 
 	   String       MatPer               = (String )sesion.getValue("LicUDEM_MatPer"); 
	   String       CveMatPer            = (String )sesion.getValue("LicUDEM_CveMatPer");
	   String       DirPathCont          = (String )sesion.getValue("LicUDEM_DirPathCont");
       String       IdSession1           = ""+sesion.getId();
       String       IdSession2           = "";
	   int          PermisoUsuario       = 0; 
	   String       sSql                 = " ";
	 
  BeanSeguridad.Ini_Validaciones   (nomDriver, nomConection);  // INICIALIZACIÓN DE LAS VARIBLES DE SEGURIDAD
 
	if (BeanSeguridad.Verifica_Entrada ( IdSession1 , LoginUsuario) == -1 )
	{
        LoginUsuario=null;
	} 

if (NombreUsuario !=null && TipUsuPer !=null && LoginUsuario !=null  )
{
    PermisoUsuario= Integer.parseInt(TipUsuPer);
	
	 BeanMaterias.Init_Validaciones   (nomDriver, nomConection,"","");
     BeanMaterias.Init_Materias(MatPer);
    // BeanMaterias.Init_Materias("GELD");
  
    /*** INICIALIZACION DE LAS VARIBLES QUE CONTIENEN LOS DATOS DE LAS MATERIAS   **/
  String imglogo       = BeanMaterias.getImglogo();
  String Baner         = BeanMaterias.getBaner();
  String fondoimg      = BeanMaterias.getFondoImg();
  String FONDMENU      = BeanMaterias.getFondoMenu();
  String FONDTablaMENU = BeanMaterias.getFondoTablaMenu(); 
  
   fondoimg = FONDMENU;
 %>
      
      
	 <style>
        picture {display: block; width: 100%; text-align: center;}
          </style>
      
  <table width="100%" border="0" cellpadding="0" cellspacing="0"  style="background:url(../../../../Img/Encabezados/Fondo_Ban.jpg);  ">
    <tr> 
      <td width="30%"   align="center" >  
        <img src="../../../../Img/Logos/Gobierno.png" alt="Gobierno del Estado de México" height="50">
        
        </td>
      <td></td>
      <td width="30%" align="center">
        
        <img src="../../../../Img/Logos/LogoUDEMex.png" alt="Plataforma Educativa y de Control Escolar de Licenciaturas" height="50">
        
       </td>
    </tr>
    <tr>
      <td align="center">   
      </td>
      </tr>
  </table>  
  <div class="fondoverde"  > 
        <picture>
          <source media="(min-width: 800px)"  srcset="<%=DirPayhGral+"Img/Encabezados/"+Baner+".png"%>">
          <source media="(min-width: 600px)"  srcset="<%=DirPayhGral+"Img/Encabezados/"+Baner+"2.png"%>">
          <source media="(min-width: 400px)"  srcset="<%=DirPayhGral+"Img/Encabezados/"+Baner+"3.png"%>">
          <source media="(min-width: 4px)"  srcset="<%=DirPayhGral+"Img/Encabezados/"+Baner+"4.png"%>">
          <!-- img tag for browsers that do not support picture element -->
          <img   src="<%=DirPayhGral+"Img/Encabezados/"+Baner+".png"%>" alt="Plataforma Educativa y de Control Escolar de la UDEMEX" height="120">
        </picture>
 </div>      
  
</div>
 

<%
if (navind.equals("Es movil"))
	{ 
%>


		<div class="container demo-4">	
                     
			<div class="column"> 
					<div id="dl-menu" class="dl-menuwrapper">
						<button class="dl-trigger"></button> 
						<ul class="dl-menu">	 
                              <li><a href='<%=DirPayhGral%>index.jsp'> Inicio</a>  </li> 
                                <%
 								BeanGenerico2.Init_Validaciones(nomDriver,nomConection2,nomConectionUser,nomConectionpassword);
								    if (MatPer != null )
									    {
 											%>
                                               <li><a href="#"> Contenido</a>
                                                   <% 												   													out.print(BeanGenerico2.Menu_movil(0,MatPer)); 													
													%>
                                              </li>
                                             <li><a href='<%=DirPayhGral%>Actividades.jsp'> Actividades</a>  </li>                                              
											<%
											 if (PermisoUsuario !=5 )
											   {   
											       out.print("<li><a href='"+DirPayhGral+"Evaluar.jsp'> Evaluar</a>  </li> ");
											   }
											   else
											  {   
											       out.print("<li><a href='"+DirPayhGral+"Evaluaciones.jsp'> Evaluar</a>  </li> ");
											   }
											 %>
                                             <li><a href='#'> Comunicaciones</a>
                                                 <ul class="dl-submenu">
                                                 <li><a href='<%=DirPayhGral%>Foro.jsp'> Foro</a>  </li>  
                                                 <li><a href='<%=DirPayhGral%>Correo.jsp'> Correo</a>  </li> 
                                             <%
											 if (PermisoUsuario !=5 )
											   { 
											    %> <li><a href='<%=DirPayhGral%>RDudas.jsp'> Dudas</a>  </li>   <%
                                               } 
											      else 
											   { %>
                                                   <li> <a href='<%=DirPayhGral%>Dudas.jsp'> Dudas</a>  </li> 
                                                   <li><a href='<%=DirPayhGral%>CuestionarioAlu.jsp'> Cuestionario</a>  </li> 	<%                                   	} 	%>
                                                </ul>
                                                </li>
                                           <%  
										}
										%> 
                </li>
                <li><a href="#"> Opciones </a>
                 <% 
				
				 out.print(BeanGenerico2.Menu_movil (0,DirPayhGral,TipUsuPer)); 
				
				 %>
                </li>
                <li><a href="<%=DirPayhGral%>CerrarC.jsp">Salir</a></li>
            </ul>
        </ul>
        </div><!-- /dl-menuwrapper -->
				</div>
			<!--</div>-->
		</div><!-- /container -->
               
		
		<script src="../../../../js/jquery.dlmenu.js"></script>
		<script>
			$(function() {
				$( '#dl-menu' ).dlmenu({
					animationClasses : { classin : 'dl-animate-in-5', classout : 'dl-animate-out-5' }
				});
			});
		</script>
        
         <%
	}
	else
	{
		%>
       
       <link rel="StyleSheet" type="text/css" href="../../../../style/menu.css">
<script language="JavaScript1.2" src="../../../../javascript/coolmenus4.js"></script>
<script language="JavaScript1.2" src="../../../../javascript/menu_init.js"></script>

<!--script language="JavaScript1.2" src="javascript/cm_addins.js"></script-->
<script>
// CREA EL MUENU HORIZONTAL 
<%
    BeanMenuLic.Init_Validaciones(nomDriver, nomConection,"","../../../../" );
 out.print(BeanMenuLic.MenuHorISS  (0,PermisoUsuario,MatPer));

 %>	  
//Leave this line - it constructs the menu
 oCMenu.construct();
</script>
       <%
	}
	%>        
        
         <div class="conte">     
            <section class="mainmio">
             <div class="centrar">     
             
            <table width="100%" border="0"  align="left" cellpadding="0" cellspacing="0">
             <tr>
                  <td align="center" width="40%" >
                        <table width="100%" border="0"  align="left" cellpadding="0" cellspacing="0">
                            <tr>
                                <td align="center" width="40%" >
                                    <a href="javascript:TodosdecreserFontSize();"  title="Alejar"> <img src="../../../../Img/Icos/A-.png" style="height:43px; width:41px"    alt="Alejar" /></a>
                                </td>
                                <td align="center" width="40%" >
                                      <a href="javascript:TodosincrementoFontSize();"  title="Acercar"><img src="../../../../Img/Icos/A+.png" style="height:43px; width:41px"   alt="Acercar" /></a>
                                  </td>   
                                   <td align="center">
                                   </td>

                               </tr>
                        </table>
                   </td>    
                  <td align="center">  
                        <table width="100%" border="0"  align="left" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td align="center" width="70%" >
                                        <%= BeanGenerico.FecHoy("1") + " " + ""%><br/>   
			                             <strong><%=NombreUsuario%></strong>  (<%=LoginUsuario%>)  
                                   </td>
                                    <td align="center" width="40%" >
                                    <td align="center">    </td>

                                 </tr>
                           </table> 
                    </td>

  </tr>
</table>   
  
<script src="../../../../js/jquery.lightbox.js"></script>

 <hr color="#FFFFFF"   size="1" style="clear: both;" />  
   <div  style="background:url(../Img/Fondos/Fondo.png); background-size:contain; 
   <%
if (!navind.equals("Es movil"))
	{ 
%>
   
    padding:inherit;  padding: 1px 20px;  <%
	}
%>">
 	<!-- InstanceBeginEditable name="Trabajo" -->
 	<h2><strong>2.2.1 TEOR&Iacute;AS Y MODELOS DE LA ATENCI&Oacute;N</strong> 	</h2>
 	<p align="justify">Las teor&iacute;as y modelos explicativos de la atenci&oacute;n m&aacute;s consolidados surgen a partir de la segunda mitad del siglo XX, tras la crisis del conductismo y el auge de la psicolog&iacute;a cognitiva. Para ver los modelos m&aacute;s sobresalientes coloca el mouse en cada &oacute;valo para observar la informaci&oacute;n. Los m&aacute;s sobresalientes son:</p>
 	<p align="center"><em>Da click sobre los &oacute;valos, para ver la informaci&oacute;n de cada modelo en la parte inferior de la imagen.</em></p>
    <div>
      <div></div>
    </div>

<script> 
function mostrarTablas(id){
mostrado=0;
elem = document.getElementById(id);
elem.style.display='block';
}

function OcultarTablas(id){
mostrado=0;
elem = document.getElementById(id);
elem.style.display='none';
}
</script>

<p align="center"><img src="Img/UNIDAD 2/pcb_un2img21.JPG" width="636" height="348" border="0" usemap="#Map" />
  <map name="Map" id="Map">
  
  <area shape="rect" coords="459,93,570,170" href="#" onclick="mostrarTablas('evento5');OcultarTablas('evento1');OcultarTablas('evento2');OcultarTablas('evento3');OcultarTablas('evento4');"  />
  
  <area shape="rect" coords="412,193,512,269" href="#" onclick="mostrarTablas('evento4');OcultarTablas('evento5');OcultarTablas('evento1');OcultarTablas('evento2');OcultarTablas('evento3');" />
  
  <area shape="rect" coords="247,244,366,320" href="#" onclick="mostrarTablas('evento3');OcultarTablas('evento1');OcultarTablas('evento2');OcultarTablas('evento4');OcultarTablas('evento5');"/>
  
  <area shape="rect" coords="110,171,229,247" href="#" onclick="mostrarTablas('evento2');OcultarTablas('evento1');OcultarTablas('evento3');OcultarTablas('evento4');OcultarTablas('evento5');"/>
    
    
    <area shape="rect" coords="37,74,135,151" href="#" onclick="mostrarTablas('evento1');OcultarTablas('evento2');OcultarTablas('evento3');OcultarTablas('evento4');OcultarTablas('evento5');" />
  </map>
</p>
<table width="80%" height="400" align="center" border="0" cellspacing="0" cellpadding="10">
  <tr>
    <td valign="top"><div id="evento1" style="display: none"><p><strong>Modelo de Broadbent o de filtro r&iacute;gido</strong></p>
      <p align="justify">Broadbent (1958) elabor&oacute; el primer modelo de filtro de la atenci&oacute;n seg&uacute;n el cual existe una estructura o filtro que regula la entrada de la informaci&oacute;n, seleccion&aacute;ndola en funci&oacute;n de las caracter&iacute;sticas sensoriales y no sem&aacute;nticas (<em>selecci&oacute;n temprana</em>; el filtro act&uacute;a, pues, en las primeras fases del procesamiento (selecci&oacute;n precategorial). Se considera un modelo r&iacute;gido ya que el filtro s&oacute;lo puede encargarse de un mensaje cada vez.</p></div>
      
      <div id="evento2" style="display: none"><p align="justify"><strong>Modelo de Treisman o de filtro atenuante</strong></p>
      <p align="justify">Seg&uacute;n Treisman (1960), el filtro selectivo de la informaci&oacute;n es flexible ya que act&uacute;asobre cada unidad de informaci&oacute;n de forma espec&iacute;fica, de modo que cada una de ellas recibe una atenuaci&oacute;n especial, en funci&oacute;n de su significado; as&iacute;, la informaci&oacute;n no atendida puede pasar tambi&eacute;n al canal central, si bien llegar&aacute; a &eacute;l de forma atenuada. Posteriormente Treisman (1969) admite un procesamiento paralelo (que se dar&iacute;a de forma inconsciente) de los mensajes no atendidos y generaliza el modelo haci&eacute;ndolo aplicable a todos los sentidos.</p></div>
      
      <div id="evento3" style="display: none"><p align="justify"><strong>Modelos de recursos atencionales</strong></p>
      <p align="justify">Se basan en la capacidad limitada de los mecanismos atencionales cuando el sujeto tiene que atender a m&aacute;s de una tarea y en la presunci&oacute;n de que los recursos de la atenci&oacute;n no est&aacute;n localizados en ninguna estructura, sino que se encuentran distribuidos en las diferentes estructuras y procesos en funci&oacute;n de la demanda atencional requerida.</p></div>
      
      <div id="evento4" style="display: none"><p align="justify"><strong>Modelo de Kahneman </strong></p>
      <p align="justify">El modelo de la atenci&oacute;n propuesto por Kahneman (1973) fue el primero y el mejor representante de los modelos basados en la capacidad limitada de la atenci&oacute;n. Para este autor, la capacidad del procesamiento est&aacute; determinada por la dificultad de la tarea atencional y por los recursos (esfuerzo) necesarios para llevarla acabo; estas variaciones en el esfuerzo se acompa&ntilde;an de variaciones fisiol&oacute;gicas, de forma que existe una estrecha relaci&oacute;n entre &eacute;ste y la propia capacidad limitada. Los elementos centrales del modelo son la pol&iacute;tica de asignaci&oacute;n y la evaluaci&oacute;n de las demandas sobre la capacidad limitada.</p></div>
      
      
      <div id="evento5" style="display: none"><p align="justify"><strong>Modelos de atenci&oacute;n visual</strong></p>
      <p align="justify">A partir de la d&eacute;cada de los ochenta, la mayor parte de los investigadores de la atenci&oacute;nse interesan m&aacute;s por la modalidad de atenci&oacute;n visual que por la auditiva, resaltandola importancia de las claves visuales en la ejecuci&oacute;n de diferentes tareas y dela localizaci&oacute;n espacial del est&iacute;mulo.</p>
      <p align="justify">Seg&uacute;n Mo&ntilde;ivas (1993), el an&aacute;lisis de la atenci&oacute;n o selecci&oacute;n visual revela que en la mayor parte de las tareas experimentales se han de diferenciar tres procesos: <em>el d&oacute;nde </em>(control de la fuente de estimulaci&oacute;n que ha de ser atendida), <em>el qu&eacute; </em>(control delos aspectos del est&iacute;mulo que son de importancia) y el <em>qu&eacute; hacer </em>(control de la reacci&oacute;nsi se decide responder).</p>
      <p align="justify">Rossell&oacute; (1997) diferencia dos tipos de atenci&oacute;n visual y en funci&oacute;n de esta divisi&oacute;n clasifica los modelos m&aacute;s representantes de cada una:</p>
      <p align="justify">Atenci&oacute;n focalizada. Los modelos aqu&iacute; considerados conceden una importancia prioritaria a la localizaci&oacute;n espacial del objeto y a las caracter&iacute;sticas de este &uacute;ltimo como determinantes de la atenci&oacute;n selectiva visual. Algunos de los modelos m&aacute;s representativos son los de Duncan (1984), las diferentes reconceptualizaciones, aunque con limitaciones, del modelo de integraci&oacute;n de las caracter&iacute;sticas (Treisman, 1988; Treisman y Sato, 1990, etc.), y los modelos de Madden (1992) y Henderson y MacQuistan (1993).</p>
      <p align="justify">Atenci&oacute;n dividida. La contribuci&oacute;n m&aacute;s destacada en el estudio de este tipo deatenci&oacute;n es el llamado modelo de <em>zoom </em>atencional (Eriksen y Yeh, 1985), que a&ntilde;ade a las evidencias de un proceso paralelo de la informaci&oacute;n visual, la de una distribuci&oacute;n de recursos atencionales. </p></div></td>
  </tr>
</table>
<p align="center"><br />
</p><table width="100%" border="0" height="100%">
      <tr>
        <td width="20%"><div align="center"><a href= "ContLPSBC03PBC01_2_2_0.jsp" ><img src="Img/REGRESAR.png" width="99" height="32" /></a></div></td>
        <td class="label_Conceptual"><p><strong>2.2 LA ATENCI&Oacute;N</strong></p></td>
        <td width="20%"><div align="center"><a href= "ContLPSBC03PBC01_2_2_2.jsp" ><img src="Img/AVANZAR.png" width="99" height="32"/></a></div></td>
      </tr>
    </table>
 	<!-- InstanceEndEditable -->
     	<!-- InstanceBeginEditable name="Titulos" -->
 	
    <!-- InstanceEndEditable -->	
	<script>
  // Initiate Lightbox
  $(function() {
	$('.gallery1 a').lightbox(); 
	 
  });
</script>
    </div>
  </div>
         </section>
                </div>
               <a href="#" class="scrollup">Scroll</a>
   
   
 
   
   
   
    <table width="95%"  bgcolor="#999999" align="center">
    <tr>
    <td align="center">
        <img src="<%=DirPayhGral+"Img/Pie/pie.png"%>" alt="Plataforma Educativa y de Control Escolar del  ISCEEM/UDEMEX" height="100">
        </td>
        </tr>
      </table>
    
    <div align="center"><span class="Estilo7">Ultima actualizaci&oacute;n:30 de Enero del 2017 </span></div>
    <%} 
else
{
response.sendRedirect(DirPayhGral+"Autentifica.jsp");
}
  %>
	</body>
<!-- InstanceEnd --></html>
