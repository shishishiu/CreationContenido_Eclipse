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
 	<h2><strong>2.1.1 TIPOS DE PERCEPCI&Oacute;N</strong></h2>
    <p align="justify">Los psic&oacute;logos de la Gestalt describieron una serie de principios de organizaci&oacute;n que seguimos los humanos para organizar nuestras sensaciones en percepciones.</p>
    <p>Te invitamos a que des clic en el siguiente enlace donde encontrar&aacute;s una presentaci&oacute;n&nbsp; que te dar&aacute; una visi&oacute;n global como introducci&oacute;n al tema <em>La Percepci&oacute;n</em> (Montalvo, C., Hern&aacute;ndez, A., Ibarra, Y. y Mart&iacute;nez, s/f): Cap&iacute;tulo #4. La percepci&oacute;n. En:<a href="http://www.slideshare.net/cecy8505/4-6-tipos-de-percepcin" target="_blank"><strong>http://www.slideshare.net/cecy8505/4-6-tipos-de-percepcin</strong></a> </p>
<p align="justify">A continuaci&oacute;n encontrar&aacute;s  los tipos de percepci&oacute;n: </p>
<div align="center">
  <object id="FlashID" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="670" height="376">
          <param name="movie" value="Swf/ContLPSBC03PBC01_2_1.swf" />
          <param name="quality" value="high" />
          <param name="wmode" value="opaque" />
          <param name="swfversion" value="15.0.0.0" />
          <!-- Esta etiqueta param indica a los usuarios de Flash Player 6.0 r65 o posterior que descarguen la versión más reciente de Flash Player. Elimínela si no desea que los usuarios vean el mensaje. -->
          <param name="expressinstall" value="Scripts/expressInstall.swf" />
          <!-- La siguiente etiqueta object es para navegadores distintos de IE. Ocúltela a IE mediante IECC. -->
          <!--[if !IE]>-->
          <object type="application/x-shockwave-flash" data="Swf/ContLPSBC03PBC01_2_1.swf" width="670" height="376">
            <!--<![endif]-->
            <param name="quality" value="high" />
            <param name="wmode" value="opaque" />
            <param name="swfversion" value="15.0.0.0" />
            <param name="expressinstall" value="Scripts/expressInstall.swf" />
            <!-- El navegador muestra el siguiente contenido alternativo para usuarios con Flash Player 6.0 o versiones anteriores. -->
            <div>
              <h4>El contenido de esta p&aacute;gina requiere una versi&oacute;n m&aacute;s reciente de Adobe Flash Player.</h4>
              <p><a href="http://www.adobe.com/go/getflashplayer"><img src="http://www.adobe.com/images/shared/download_buttons/get_flash_player.gif" alt="Obtener Adobe Flash Player" width="112" height="33" /></a></p>
            </div>
            <!--[if !IE]>-->
          </object>
          <!--<![endif]-->
        </object>
</div>
<div>
  <div> </div>
  </div>
<p align="center"><img src="Img/UNIDAD 2/pcb_un2img6.jpg" width="516" height="403" /></p>
<p align="center">&nbsp;</p>
<p><strong>La percepci&oacute;n de la forma: se divide en figura-fondo y agrupaci&oacute;n </strong></p>
<ol>
  <li><p align="justify"><strong>Figura y fondo.</strong> Debemos percibir de manera independiente un objeto&nbsp; (est&iacute;mulo que nos interesa) del fondo (lo que le rodea). La relaci&oacute;n entre figura-fondo es reversible (el fondo puede convertirse en la figura y la figura en el fondo), a&uacute;n as&iacute;, organizamos los est&iacute;mulos en la figura que nos permite contrastar con un fondo. El hecho de poder intercambiar figura-fondo es una prueba de la existencia de distintas percepciones frente a un est&iacute;mulo.</p>
    <div align="center"><br />
      <br />
      <br />
      <img src="Img/UNIDAD 2/pcb_un2img7.jpg" width="173" height="201" /><br />
      <br />
      <br />
      <br />
    </div>
  </li>
  <li>
    <div align="justify"><strong>Agrupaci&oacute;n. </strong>Una vez separada la figura del fondo, debemos organizar nuestra figura en formas que tengan sentido. De forma autom&aacute;tica e instant&aacute;nea se procesan algunas caracter&iacute;sticas fundamentales: color, movimiento, contraste entre las luces y las sombras (Treisman, 1987). 
      </div>
    <p align="justify">&iquest;Qu&eacute; reglas sigue nuestra mente para dar forma y orden a estas sensaciones elementales? </p>
    <div align="justify">
      <ul>
        <li>
          <strong>Principio de proximidad.</strong> Agrupamos las figuras que est&aacute;n m&aacute;s pr&oacute;ximas. Los elementos y figuras que est&aacute;n m&aacute;s pr&oacute;ximos tienden a verse como una unidad y a aislarse de otros. Las figuras o los puntos que est&aacute;n m&aacute;s pr&oacute;ximos se re&uacute;nen en unidades aunque todos sean iguales.
          </li>
        
        <div align="center">
          <p><img src="Img/UNIDAD 2/pcb_un2img8.jpg" width="227" height="225" />    <img src="Img/UNIDAD 2/pcb_un2img9.jpg" width="227" height="225" /></p>
          <p>&nbsp;</p>
          </div>
        
        <li><strong>Principio de semejanza.</strong> Agrupamos las figuras que son similares. Los elementos similares tienden a agruparse y a diferenciarse de otros y eso incluso puede dominar sobre la proximidad, con independencia de la distancia. Las figuras semejantes&nbsp; tienden a ser vistas conjuntamente. <br />
          </li>
        
        <div align="center">
          <p><img src="Img/UNIDAD 2/pcb_un2img10.jpg" width="367" height="163" /> <img src="Img/UNIDAD 2/pcb_un2img11.jpg" width="233" height="216" />
            
            </p>
          <p>&nbsp;</p>
          </div>
        <li><strong>Principio de continuidad.</strong> Percibimos mejor los trazos continuos que los discontinuos. Los est&iacute;mulos que tienen continuidad con otros. Como todos los puntos parecen tender a la misma direcci&oacute;n, se responde a ellos como configuraci&oacute;n.</li>
        
        
        <div align="center"><img src="Img/UNIDAD 2/pcb_un2img12.jpg" width="492" height="304" /></div>
        
        <li><strong>Principio de completamiento de figuras.</strong> Si una figura est&aacute; incompleta el perceptor la completa en su mente. </li>
        </ul>
      <p align="center"><img src="Img/UNIDAD 2/pcb_un2img13.jpg" width="554" height="187" /></p>
      <ul>
        <li><strong>Principio de cierre.</strong> Tendemos a llenar los espacios en blanco para crear un objeto completo y unido. </li>
        </ul>
      <p align="center"><img src="Img/UNIDAD 2/pcb_un2img14.jpg" width="193" height="155" /></p>
      </div>
  </li>
  </ol>
<p>&nbsp;</p>
<p>&nbsp;</p>
<table width="25%" border="0" cellspacing="10" cellpadding="10">
  <tr>
    <td bgcolor="#FED47A"><p align="center"><strong>MOVIMIENTO</strong></p></td>
  </tr>
</table>
<p align="justify"><strong>La percepci&oacute;n del movimiento: </strong>El cerebro calcula el movimiento en funci&oacute;n del supuesto de que los objetos que se alejan disminuyen de tama&ntilde;o y que los que se acercan aumentan el tama&ntilde;o.</p>
<p align="justify">El cerebro interpreta como movimiento continuo una serie de im&aacute;genes que se presenten de manera continuada y a elevada velocidad. Dicho fen&oacute;meno se denomina: movimiento estrobosc&oacute;pico.</p>
<p align="justify">De igual modo cuando dos luces est&aacute;ticas y adyacentes se encienden y se apagan sucesivamente, percibimos una &uacute;nica luz que se mueve de un lado a otro; en este caso el fen&oacute;meno que lo explica se denomina fen&oacute;meno Phi.</p>
<p align="center"><img src="Img/UNIDAD 2/pcb_un2img15.jpg" width="225" height="224" /></p>
<table width="25%" border="0" cellspacing="10" cellpadding="10">
  <tr>
    <td bgcolor="#FED47A"><p align="center"><strong>DEL TIEMPO</strong></p></td>
  </tr>
</table>
<p>Existe la teor&iacute;a de que cualquier persona percibe el tiempo en relaci&oacute;n a procesos corporales, como las ondas cerebrales, el ritmo cardiaco.</p>
<p align="center"><img src="Img/UNIDAD 2/pcb_un2img16.jpg" width="225" height="224" /></p>
<table width="25%" border="0" cellspacing="10" cellpadding="10">
  <tr>
    <td bgcolor="#FED47A"><p align="center"><strong>SOCIAL</strong></p></td>
  </tr>
</table>
<p>Cuando conoces a una persona, percibes su f&iacute;sico, su comportamiento y a partir de &eacute;stos desarrollas conclusiones y atribuciones.</p>
<p align="center"><img src="Img/UNIDAD 2/pcb_un2img17.jpg" width="252" height="200" /></p>

<br /><table width="100%" border="0" height="100%">
      <tr>
        <td width="20%"><div align="center"><a href= "ContLPSBC03PBC01_2_1_0.jsp" ><img src="Img/REGRESAR.png" width="99" height="32" /></a></div></td>
        <td class="label_Conceptual"><strong>2.1 PERCEPCI&Oacute;N</strong></td>
        <td width="20%"><div align="center"><a href= "ContLPSBC03PBC01_2_1_2.jsp" ><img src="Img/AVANZAR.png" width="99" height="32"/></a></div></td>
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
