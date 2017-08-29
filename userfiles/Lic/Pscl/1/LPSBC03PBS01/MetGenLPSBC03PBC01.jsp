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
 	<h1 align="center"><strong>METODOLOG&Iacute;A</strong> </h1>
 	<p align="justify">Una de las unidades de aprendizaje a estudiar para el primer semestre de la Licenciatura en Psicolog&iacute;a es Procesos Cognoscitivos I, la cual se encuentra en el n&uacute;cleo de formaci&oacute;n b&aacute;sico conceptual, a continuaci&oacute;n se describen brevemente las competencias que persigue:<br />
 	  </p>
 	<p><br />
 	  </p>
 	<p><strong>DESCRIPCI&Oacute;N GENERAL DE LA UNIDAD DE APRENDIZAJE</strong><br />
 	  </p>
 	<p align="justify">La Unidad de Aprendizaje de Procesos Cognoscitivos I est&aacute; conformada por cuatro unidades tem&aacute;ticas, en cada unidad encontrar&aacute;s una actividad de aprendizaje (en total suman cuatro) que poseen valor para la escala y forma&nbsp; parte de tu calificaci&oacute;n final, por tal motivo es importante que realices todas de forma puntual y con las caracter&iacute;sticas especificadas. Al t&eacute;rmino de cada unidad tem&aacute;tica deber&aacute;s resolver una actividad integradora con valor para la calificaci&oacute;n.<br />
 	  </p>
 	<p align="justify">Para tener &eacute;xito es importante seguir las instrucciones que a continuaci&oacute;n sugerimos:<br />
 	  </p>
    <blockquote>
      <blockquote>
        <p align="justify">1. Una vez analizado y estudiado el tema o los temas deber&aacute;s identificar qu&eacute; tipo de&nbsp; actividad o producto es necesario que desarrolles, estos pueden ser: ensayo, mapa mental, mapa conceptual, etc&eacute;tera.<br />
        </p>
        <p align="justify">2. Es importante que revises los aspectos que el asesor evaluar&aacute; en tu trabajo y que est&aacute;n descritos en la r&uacute;brica, porque se consideran elementos de forma y contenido, adem&aacute;s de puntualidad en la entrega, mismos que son determinantes para obtener el m&aacute;ximo de escala en cada actividad.<br />
        </p>
        <p align="justify">3.&nbsp; A lo largo de los contenidos encontrar&aacute;s dos actividades complementarias por unidad tem&aacute;tica que no tienen valor para la escala, sin embargo, es requisito que los realices porque refuerzan los temas vistos.<br />
        </p>
        <p align="justify">4. Se recomienda que efect&uacute;es todas las actividades de aprendizaje e integradora, ya que de ello depender&aacute; en gran medida que obtengas los conocimientos necesarios para&nbsp; un buen resultado.</p>
      </blockquote>
    </blockquote>
    <p align="justify">&nbsp;</p>
 	<h2 align="center"><strong>N&Uacute;CLEO DE FORMACI&Oacute;N</strong><br />
 	  </h2>
 	<p align="justify">Esta unidad de aprendizaje se encuentra en el N&uacute;cleo de formaci&oacute;n B&aacute;sico Conceptual, el cual comprende una formaci&oacute;n elemental y general, la cual proporciona al estudiante las bases contextuales, te&oacute;ricas y filos&oacute;ficas de su carrera. Es la formaci&oacute;n orientada a la obtenci&oacute;n de los fundamentos conceptuales de la profesi&oacute;n. En este n&uacute;cleo deben considerarse competencias b&aacute;sicas de car&aacute;cter general que dan sustento a su objeto de estudio. 	</p>
 	<p align="justify"><br />
 	  </p>
 	<h2 align="center"><strong>COMPETENCIAS A DESARROLLAR POR N&Uacute;CLEO DE FORMACI&Oacute;N</strong><br />
 	  </h2>
 	<p align="justify"><strong>N&uacute;cleo B&aacute;sico Conceptual: </strong>Comprende una formaci&oacute;n elemental y general, la cual proporciona al estudiante las bases contextuales, te&oacute;ricas y filos&oacute;ficas de su carrera. Es la formaci&oacute;n orientada a la obtenci&oacute;n de los fundamentos conceptuales de la profesi&oacute;n. En este n&uacute;cleo deben considerarse competencias b&aacute;sicas de car&aacute;cter general que dan sustento a su objeto de estudio.</p>
 	<p>Las competencias a desarrollar por el estudiante en este n&uacute;cleo de formaci&oacute;n se describen a continuaci&oacute;n:</p>
    <ul>
      <li>
        <p>Identifica el origen y los fundamentos de la psicolog&iacute;a para el an&aacute;lisis de sus implicaciones en contextos actuales.        </p></li>
      <li>Analiza los conocimientos te&oacute;ricos para propiciar la formaci&oacute;n de un pensamiento cr&iacute;tico en relaci&oacute;n a los fundamentos de la ciencia psicol&oacute;gica. <br />
<br />
        </li>
      <li>Define los conocimientos fundamentales referentes a la psicolog&iacute;a, su vigencia y estado del arte del conocimiento psicol&oacute;gico. <br />
        </li>
      <li>Genera un pensamiento cr&iacute;tico en el contexto te&oacute;rico y social de la psicolog&iacute;a. <br />
        <br />
        </li>
      <li>Integra reportes neuropsicol&oacute;gicos de ni&ntilde;os, adolescentes, adultos y adultos mayores.      </li>
      <li> Dise&ntilde;a y aplica programas de intervenci&oacute;n y prevenci&oacute;n en temas de salud p&uacute;blica.</li>
    </ul>
<p align="left"><br />
    </p>
    <h2 align="center"><strong>SISTEMA DE EVALUACI&Oacute;N</strong><br />
 	</h2>
 	<p>La calificaci&oacute;n final para la Unidad de Aprendizaje de Procesos Cognoscitivos I se va construyendo con tu desempe&ntilde;o de la siguiente manera:<br />
 	  a) Pondr&aacute;s en pr&aacute;ctica lo aprendido mediante las actividades de aprendizaje que tendr&aacute;s que entregar a tu asesor ya que su valor por cada unidad es de 10%, dado que son cuatro unidades tendr&aacute;s que lograr un 40%; b) aplicar&aacute;s las competencias adquiridas durante el desarrollo de la unidad de aprendizaje mediante la realizaci&oacute;n de una actividad integradora la cual tiene valor de 40%; c) para terminar, realizar&aacute;s un examen final con un valor del 20%, sumando los porcentajes anteriores corresponder&aacute; al 100% de la calificaci&oacute;n.</p>
<p align="center"><img src="Img/TABLAS/pcb_met.png" width="606" height="414" /></p>
<p>A continuaci&oacute;n se describen las r&uacute;bricas o criterios que ser&aacute;n tomados en cada una de las actividades de aprendizaje.</p>
<p><strong>ACTIVIDAD DE APRENDIZAJE 1.1</strong>, <strong>3.2, 4.1</strong></p>
<p align="center"><img src="Img/TABLAS/1.1,3.2,4.1.png" width="660" height="1059" /></p>
<p align="center">&nbsp;</p>
<p><strong>ACTIVIDAD DE APRENDIZAJE 1.2</strong></p>
<p align="center"><img src="Img/TABLAS/1.2.png" width="660" height="814" /></p>
<p><strong>ACTIVIDAD DE APRENDIZAJE 1.3, 1.4, 2.1, 3.1, 4.4</strong></p>
<p align="center"><img src="Img/TABLAS/1.3,1.4,2.1,3.1,4.4.png" width="660" height="706" /></p>
<p><strong>ACTIVIDAD DE APRENDIZAJE 2.2</strong></p>
<p align="center"><img src="Img/TABLAS/2.2.png" width="660" height="663" /></p>
<p><strong>ACTIVIDAD DE APRENDIZAJE 2.3, 3.3, 4.3</strong></p>
<p align="center"><img src="Img/TABLAS/2.3,3.3,4.3.png" width="660" height="687" /></p>
<p align="center">&nbsp;</p>
<p><strong>ACTIVIDAD DE APRENDIZAJE 2.4</strong></p>
<p align="center"><img src="Img/TABLAS/2.4.png" width="660" height="553" /></p>
<p><strong>ACTIVIDAD DE APRENDIZAJE 3.1</strong></p>
<p align="center"><img src="Img/TABLAS/3.1.png" width="660" height="780" /></p>
<p><strong>ACTIVIDAD DE APRENDIZAJE 3.4</strong></p>
<p align="center"><img src="Img/TABLAS/3.4.png" width="660" height="891" /></p>
<p><strong>ACTIVIDAD DE APRENDIZAJE 4.2</strong></p>
<p align="center"><strong><img src="Img/TABLAS/4.2.png" width="658" height="858" /></strong></p>
<p><strong>ACTIVIDAD INTEGRADORA</strong></p>
<p align="center"><img src="Img/TABLAS/actividad integradora.png" width="660" height="789" /></p>
<p align="justify">S&oacute;lo nos queda exhortarte&nbsp; a que inviertas todo tu esfuerzo, ya has dado un gran paso al decidir estudiar por nuestro sistema educativo a distancia; adelante, de tu empe&ntilde;o y dedicaci&oacute;n depender&aacute; tu &eacute;xito.</p>
<p align="justify"><br />
</p>	<table width="100%" border="0" height="100%">
      <tr>
        <td width="20%">&nbsp;</td>
        <td class="label_Conceptual">METODOLOG&Iacute;A</td>
        <td width="20%">&nbsp;</td>
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
