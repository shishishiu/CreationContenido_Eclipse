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
 	<h1 align="center"><strong>UNIDAD 2. </strong><strong>PERCEPCI&Oacute;N, ATENCI&Oacute;N Y APRENDIZAJE</strong> 	</h1>
 	<div align="right">
 	  <table width="45%" border="0" cellspacing="10" cellpadding="10">
 	    <tr>
 	      <td><p align="center">&quot;Todo lo que somos es el resultado<br />
de lo que hemos pensado, est&aacute; fundado <br />
en nuestros pensamientos y est&aacute; hecho <br />
de nuestros pensamientos&quot; 
 	        </p>
 	        <p align="center">Buda</p></td>
 	      </tr>
 	    </table>
 	</div>
 	<p align="center"><img src="Img/UNIDAD 2/pcb_un2img1.jpg" width="380" height="281" /></p>
 	<p align="justify">&nbsp;</p>
 	<p align="justify">En el siguiente esquema se representan los contenidos tem&aacute;ticos correspondientes a la segunda unidad tem&aacute;tica de la unidad de aprendizaje Procesos Cognoscitivos I, cada uno de estos temas guardan&nbsp; relaci&oacute;n entre s&iacute;, compa&ntilde;ero estudiante&hellip; sigue adelante y felicidades.</p>
<p align="justify">&nbsp;</p>
    <h2 align="center"><strong>MAPA DE CONTENIDOS TEM&Aacute;TICOS UNIDAD 2</strong></h2>
<p align="center"><img src="Img/UNIDAD 2/pcb_un2img2.jpg" width="700" height="309" /></p>
<h2 align="center"><strong>INTRODUCCI&Oacute;N</strong><br />
</h2>
<p align="justify">El contenido tem&aacute;tico de esta unidad describe y explica las generalidades de los procesos cognitivos de percepci&oacute;n, atenci&oacute;n y aprendizaje en relaci&oacute;n con los factores biol&oacute;gicos. Se exploran los tipos y etapas de la percepci&oacute;n, as&iacute; como sus leyes de acuerdo a la teor&iacute;a de la Gestalt. Se analizan algunas de las teor&iacute;as que explican la atenci&oacute;n y su funci&oacute;n en la vida cotidiana del ser humano. <br />
  </p>
<p align="justify">Asimismo, se revisan los tipos de aprendizaje y dos de sus principales corrientes: Condicionamiento cl&aacute;sico y operante. <br />
  </p>
<p align="justify">Durante el desarrollo de esta unidad vas a desarrollar actividades adicionales y de aprendizaje con ayuda de material complementario que te permitir&aacute;n consolidar lo aprendido durante tu proceso de reflexi&oacute;n.</p>
<p>A lo largo de cada tema encontrar&aacute;s videos o presentaciones interactivas que tienen la finalidad de acrecentar tu bagaje de conocimientos.<br />
</p>
<p align="justify">Cada contenido tem&aacute;tico de esta unidad fue dise&ntilde;ado en apego a la nueva estrategia de ense&ntilde;anza-aprendizaje por competencias en la modalidad a distancia y caracterizado por el auto aprendizaje, es por ello que resulta necesario que&nbsp; sigas todas las instrucciones, dando seguimiento a tus actividades de aprendizaje, a la realizaci&oacute;n y entrega de tus proyectos, as&iacute; como a poner inter&eacute;s en las evaluaciones y asesor&iacute;as para que puedas alcanzar el &eacute;xito y cumplas tu meta ser un profesionista de &eacute;xito.<br />
</p>
<p align="justify">En cada uno de los contenidos que se te presentan, es importante que apliques tus capacidades cognoscitivas como: pensamiento, conocimiento, comprensi&oacute;n, aplicaci&oacute;n, an&aacute;lisis, s&iacute;ntesis y evaluaci&oacute;n, para su m&aacute;ximo aprovechamiento.</p>
<div align="justify">
  <p>Es importante tomar en cuenta cada uno de los temas, porque te permitir&aacute; tener mejor entendimiento a lo largo de las unidades.  </p>
</div>
<p align="center">
  <object height="267" width="200" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,28,0" id="widget_name"><param name="movie" value="http://vhss-d.oddcast.com/vhss_editors/voki_player.swf?doc=http://vhss-d.oddcast.com/php/vhss_editors/getvoki/chsm=74cc27a371ff014ad2114ea3f297c091%26sc=11987387" /><param name="quality" value="high" /><param name="allowScriptAccess" value="always" /><param name="width" value="200" /><param name="height" value="267" /><param name="allowNetworking" value="all"/><param name="wmode" value="transparent" /><param name="allowFullScreen" value="true" /><embed height="267" width="200" src="http://vhss-d.oddcast.com/vhss_editors/voki_player.swf?doc=http%3A%2F%2Fvhss-d.oddcast.com%2Fphp%2Fvhss_editors%2Fgetvoki%2Fchsm=74cc27a371ff014ad2114ea3f297c091%26sc=11987387" quality="high" allowscriptaccess="always" allownetworking="all" wmode="transparent" allowfullscreen="true" pluginspage="http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" name="widget_name"></embed></object>
<br />
<br />
</p>
<p align="center">
<object height="267" width="200" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,28,0" id="widget_name"><param name="movie" value="http://vhss-d.oddcast.com/vhss_editors/voki_player.swf?doc=http://vhss-d.oddcast.com/php/vhss_editors/getvoki/chsm=c6fcb7831cd1d3b78fb3098ac68c33a5%26sc=11987396" /><param name="quality" value="high" /><param name="allowScriptAccess" value="always" /><param name="width" value="200" /><param name="height" value="267" /><param name="allowNetworking" value="all"/><param name="wmode" value="transparent" /><param name="allowFullScreen" value="true" /><embed height="267" width="200" src="http://vhss-d.oddcast.com/vhss_editors/voki_player.swf?doc=http%3A%2F%2Fvhss-d.oddcast.com%2Fphp%2Fvhss_editors%2Fgetvoki%2Fchsm=c6fcb7831cd1d3b78fb3098ac68c33a5%26sc=11987396" quality="high" allowscriptaccess="always" allownetworking="all" wmode="transparent" allowfullscreen="true" pluginspage="http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" name="widget_name"></embed></object>

</p>
<p align="center">
<object height="267" width="200" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,28,0" id="widget_name"><param name="movie" value="http://vhss-d.oddcast.com/vhss_editors/voki_player.swf?doc=http://vhss-d.oddcast.com/php/vhss_editors/getvoki/chsm=94b3d9ccbf4f4e5a68489c571c98e933%26sc=11987409" /><param name="quality" value="high" /><param name="allowScriptAccess" value="always" /><param name="width" value="200" /><param name="height" value="267" /><param name="allowNetworking" value="all"/><param name="wmode" value="transparent" /><param name="allowFullScreen" value="true" /><embed height="267" width="200" src="http://vhss-d.oddcast.com/vhss_editors/voki_player.swf?doc=http%3A%2F%2Fvhss-d.oddcast.com%2Fphp%2Fvhss_editors%2Fgetvoki%2Fchsm=94b3d9ccbf4f4e5a68489c571c98e933%26sc=11987409" quality="high" allowscriptaccess="always" allownetworking="all" wmode="transparent" allowfullscreen="true" pluginspage="http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" name="widget_name"></embed></object>
</p>
<p align="justify"><strong>COMPETENCIAS ESPEC&Iacute;FICAS</strong> <br />
</p>
<p align="justify">El estudiante: <br />
  </p>
<p align="justify"><strong>Conocimientos: </strong>Distingue como principales procesos b&aacute;sicos a la percepci&oacute;n, atenci&oacute;n y aprendizaje, y los define como primordiales para el desarrollo neurobiol&oacute;gico de los seres humanos. <br />
  </p>
<p align="justify"><strong>Habilidades: </strong>Explica la interacci&oacute;n y &aacute;mbito de aplicaci&oacute;n entre los procesos mentales y las formas en c&oacute;mo se construyen los tipos de aprendizaje, mostrando la capacidad de realizar propuestas que conduzcan el desarrollo y mejoras psicoeducativas, manteniendo un alto profesionalismo.</p>
<div align="justify">
  <p><strong>Actitudes: </strong>Cr&iacute;tica los elementos b&aacute;sicos que le permiten distinguir&nbsp; las caracter&iacute;sticas particulares de cada proceso mental, as&iacute; como su forma de aplicaci&oacute;n en contextos determinados, reconociendo con ello las diferencias individuales bajo el C&oacute;digo &Eacute;tico del Psic&oacute;logo.
  </p>
</div>
<p>&nbsp;</p>
<h1 align="center"><strong>2.1 PERCEPCI&Oacute;N</strong>  </h1>
  <h1 align="center"><img src="Img/UNIDAD 2/pcb_un2img4.jpg" width="376" height="134" /></h1>
  <p>Te invito a realizar la siguiente prueba de percepci&oacute;n visual a trav&eacute;s de este video, espero lo disfrutes:<br />
</p>
  <p align="center">Transporte de Londres. (s/f). <em>Test de percepci&oacute;n</em>. Recuperado con fines did&aacute;cticos el 6 de Marzo de 2015, de: <strong><a href="http://youtu.be/poZcOdPZwbw" target="_blank">http://www.youtube.com/watch?v=sOZ71QscGJY</a></strong><br />
  </p>
  <p align="center"><strong>Para revisar el material da clic en el enlace que se indica.</strong></p>
  <p align="justify">La percepci&oacute;n, es un proceso de la actividad humana que tiene una funci&oacute;n primordialmente adaptiva y se inscribe en el conjunto de los llamados procesos cognitivos, al decir que es un proceso se quiere dar a entender el car&aacute;cter din&aacute;mico de la actividad perceptiva frente a otras concepciones est&aacute;ticas que entienden la percepci&oacute;n como una reacci&oacute;n puramente pasiva de la informaci&oacute;n exterior entrante, es decir, un simple registro de datos. La percepci&oacute;n es una actividad que el organismo realiza para extraer del medio ambiente la informaci&oacute;n que necesita para su funcionamiento normal, el sujeto que percibe es el auto de su propia experiencia.</p>
  <p align="justify">Hay dos clases de pruebas que ilustran el car&aacute;cter activo de la percepci&oacute;n. La <strong>primera</strong> es de car&aacute;cter fisiol&oacute;gico. De las investigaciones realizadas por Hubel y Wiesel se sabe que los mecanismos sensoriales y perceptuales responden selectivamente a diferentes aspectos del mundo f&iacute;sico y juegan un papel importante en la modulaci&oacute;n y modificaci&oacute;n del mensaje, en lugar de comportarse pasivamente como lo hacen los hilos telef&oacute;nicos que se limitan a trasmitir la informaci&oacute;n recibida.</p>
<div>
  <div></div>
</div>
<p align="justify">La segunda prueba proviene de la existencia de figuras ambiguas. La ambig&uuml;edad de la figura demuestra que la configuraci&oacute;n final del contenido depende del propio observador y no de los datos estimuladores.</p>
<p align="justify">La <strong>segunda</strong> caracter&iacute;stica de la percepci&oacute;n, deriva de la definici&oacute;n que d&aacute;bamos m&aacute;s arriba, es que tiene una funci&oacute;n meramente adaptativa. Esto quiere decir que la percepci&oacute;n no es un proceso ornamental, sino absolutamente necesario para que el organismo pueda adaptarse al medio en el que tiene que hacer frente a las m&uacute;ltiples problem&aacute;ticas exigidas de la vida. Ahora bien, para adaptarse al medio, necesita conocerlo, y la forma de conocerlo es extraer informaci&oacute;n del inmenso conjunto de energ&iacute;as que estimulan los sentidos.</p>
<p align="justify">Aunque son muchos los est&iacute;mulos que llaman a la puerta de los sentidos y estimulan los &oacute;rganos receptores, no todos tienen valor informativo, en realidad, s&oacute;lo los est&iacute;mulos que provocan alg&uacute;n tipo de conducta reactiva o adoptiva tiene trascendencia vital para el sujeto. Esto pone de relieve otra cualidad de la percepci&oacute;n humana, que es un proceso selectivo.</p>
<p align="justify">Dec&iacute;amos que la percepci&oacute;n consist&iacute;a en un proceso de extracci&oacute;n de la informaci&oacute;n para facilitar la adaptaci&oacute;n el organismo al ambiente. Ahora bien, este proceso de extraer informaci&oacute;n se realiza de forma diferente en los animales y el hombre. En los animales existen unos programas precept&uacute;ales radicalmente encajados en la estructura corporal que codifican la informaci&oacute;n de una forma r&iacute;gida y estable. Son programas heredados y dif&iacute;cilmente modificables por la experiencia o el aprendizaje. Sin embargo, en los seres humanos, estos programas precept&uacute;ales son m&aacute;s susceptibles de modificaci&oacute;n.</p>
<p align="justify">En el ni&ntilde;o, por ejemplo, los esquemas precept&uacute;ales funcionan todav&iacute;a de una manera r&iacute;gida y preestablecida pero, a medida que el ni&ntilde;o se desarrolla, la experiencia va modificando los programas perceptivos y &eacute;stos se van haciendo cada vez m&aacute;s flexibles y complejos, para servir a funciones tambi&eacute;n m&aacute;s complejas de la actividad humana, como puede ser la contemplaci&oacute;n de una obra de arte o escuchar una composici&oacute;n musical.<br />
  <br />
</p>
<div>
  <div></div>
</div><table width="100%" border="0" height="100%">
      <tr>
        <td width="20%">&nbsp;</td>
        <td class="label_Conceptual"><p><strong>2.1 PERCEPCI&Oacute;N</strong></p></td>
        <td width="20%"><div align="center"><a href= "ContLPSBC03PBC01_2_1_1.jsp" ><img src="Img/AVANZAR.png" width="99" height="32"/></a></div></td>
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
