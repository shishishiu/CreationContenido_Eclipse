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
 	<h1 align="center"><strong>UNIDAD 1: INTRODUCCI&Oacute;N A LOS PROCESOS COGNOSCITIVOS B&Aacute;SICOS</strong></h1>
 	<div align="right">
 	  <table width="65%" border="0" cellspacing="10" cellpadding="10">
 	    <tr>
 	      <td><p align="center">&quot;Nunca consideres el estudio como un deber, <br />
 	        sino como una oportunidad para penetrar <br />
 	        en el maravilloso mundo del saber.&rdquo;</p>
<p align="center">Einstein, Albert</p></td>
 	      </tr>
 	    </table>
 	</div>
    
 	
    
    <div align="center">
        <object id="FlashID" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="670" height="466">
          <param name="movie" value="Swf/ContLPSBC03PBC01_1_1.swf" />
          <param name="quality" value="high" />
          <param name="wmode" value="opaque" />
          <param name="swfversion" value="15.0.0.0" />
          <!-- Esta etiqueta param indica a los usuarios de Flash Player 6.0 r65 o posterior que descarguen la versión más reciente de Flash Player. Elimínela si no desea que los usuarios vean el mensaje. -->
          <param name="expressinstall" value="Scripts/expressInstall.swf" />
          <!-- La siguiente etiqueta object es para navegadores distintos de IE. Ocúltela a IE mediante IECC. -->
          <!--[if !IE]>-->
          <object type="application/x-shockwave-flash" data="Swf/ContLPSBC03PBC01_1_1.swf" width="670" height="466">
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
    
    
 	<p align="justify">En el siguiente esquema se representan los contenidos tem&aacute;ticos correspondientes a la primera unidad tem&aacute;tica de la unidad de aprendizaje Procesos Cognoscitivos I, cada uno de estos temas guardan relaci&oacute;n entre s&iacute;; compa&ntilde;ero estudiante&hellip; sigue adelante y felicidades.</p>
 	<p align="justify">&nbsp;</p>
    <h2 align="center"><strong>MAPA DE CONTENIDOS TEM&Aacute;TICOS UNIDAD 1</strong></h2>
<p align="center"><img src="Img/UNIDAD 1/pcb_un1img2.jpg" width="700" height="415" /></p>
<h2 align="center"><strong>INTRODUCCI&Oacute;N</strong><br />
</h2>
<p align="justify">El contenido tem&aacute;tico de la unidad 1 se fundamenta en los procesos cognoscitivos b&aacute;sicos que son todas aquellas operaciones y procesos involucrados en el procesamiento de la informaci&oacute;n, como son: la atenci&oacute;n, percepci&oacute;n, memoria, motivaci&oacute;n y sus respectivas bases te&oacute;ricas, teniendo en cuenta los avatares sufridos en los &uacute;ltimos a&ntilde;os y que han sido de gran aportaci&oacute;n para las ciencias del comportamiento.<br />
  </p>
<p align="justify">La Psicolog&iacute;a es el estudio cient&iacute;fico del comportamiento y de los procesos mentales, de ah&iacute; radica la importancia para su aprendizaje, &eacute;sta unidad tiene la intenci&oacute;n de que adquieras conocimientos, habilidades y actitudes y los pongas en pr&aacute;ctica.<br />
  </p>
<p align="justify">La Unidad 1 denominada Introducci&oacute;n a los Procesos Cognoscitivos B&aacute;sicos se encuentra subdividida por cuatro apartados, el primero es una Introducci&oacute;n a la Psicolog&iacute;a donde atenderemos la conceptualizaci&oacute;n de Psicolog&iacute;a y los avatares sufridos por &eacute;sta ciencia del comportamiento, te invito a que seas reflexivo en cuanto a los argumentos vertidos del porque es considerada como tal pese a opiniones contrarias por parte de la ciencias consideradas como exactas. <br />
  </p>
<p align="justify">En la segunda unidad podr&aacute;s identificar los antecedentes y diversas corrientes que articulan el objeto de estudio.<br />
  </p>
<p align="justify">Durante la tercer y cuarta unidad conocer&aacute;s los aportes de la Psicolog&iacute;a Cognitiva y los modelos de representaci&oacute;n mental que nos lleva a sentar las bases te&oacute;ricas de los procesos cognitivos b&aacute;sicos.<br />
  </p>
<p align="justify">Vas a desarrollar actividades adicionales y de aprendizaje con ayuda de material complementario que te permitir&aacute;n consolidar lo aprendido durante tu proceso de reflexi&oacute;n. <br />
  </p>
<p align="justify">A lo largo de cada tema encontrar&aacute;s videos o presentaciones interactivas que tienen la finalidad de acrecentar el bagaje de conocimientos. <br />
  Cada contenido tem&aacute;tico de esta unidad fue dise&ntilde;ado en apego a la nueva estrategia de ense&ntilde;anza-aprendizaje por competencias en la modalidad a distancia y caracterizado por el auto aprendizaje, es por ello que resulta necesario que &nbsp;sigas todas las instrucciones, dando seguimiento a tus actividades de aprendizaje, a la realizaci&oacute;n y entrega de tus proyectos, as&iacute; como a poner inter&eacute;s en las evaluaciones y asesor&iacute;as para que puedas alcanzar el &eacute;xito y cumplas tu meta ser un profesionista destacado.<br />
  </p>
<p align="justify">En cada uno de los contenidos que se te presentan es importante que apliques tus capacidades cognoscitivas como: pensamiento, conocimiento, comprensi&oacute;n, aplicaci&oacute;n, an&aacute;lisis, s&iacute;ntesis y evaluaci&oacute;n, para su m&aacute;ximo aprovechamiento.</p>
<div align="center"></div>
<p align="center">
  <object height="267" width="200" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,28,0" id="widget_name"><param name="movie" value="http://vhss-d.oddcast.com/vhss_editors/voki_player.swf?doc=http://vhss-d.oddcast.com/php/vhss_editors/getvoki/chsm=f81db050e37ca76ea81da166f8915687%26sc=11987349" /><param name="quality" value="high" /><param name="allowScriptAccess" value="always" /><param name="width" value="200" /><param name="height" value="267" /><param name="allowNetworking" value="all"/><param name="wmode" value="transparent" /><param name="allowFullScreen" value="true" /><embed height="267" width="200" src="http://vhss-d.oddcast.com/vhss_editors/voki_player.swf?doc=http%3A%2F%2Fvhss-d.oddcast.com%2Fphp%2Fvhss_editors%2Fgetvoki%2Fchsm=f81db050e37ca76ea81da166f8915687%26sc=11987349" quality="high" allowscriptaccess="always" allownetworking="all" wmode="transparent" allowfullscreen="true" pluginspage="http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" name="widget_name"></embed></object>
  
</p>
<div align="center">
  <p>
    <object height="267" width="200" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,28,0" id="widget_name2">
      <param name="movie" value="http://vhss-d.oddcast.com/vhss_editors/voki_player.swf?doc=http://vhss-d.oddcast.com/php/vhss_editors/getvoki/chsm=5c6b463d4fc113272d43b2f67a5d0923%26sc=11987370" />
      <param name="quality" value="high" />
      <param name="allowScriptAccess" value="always" />
      <param name="width" value="200" />
      <param name="height" value="267" />
      <param name="allowNetworking" value="all"/>
      <param name="wmode" value="transparent" />
      <param name="allowFullScreen" value="true" />
      <embed height="267" width="200" src="http://vhss-d.oddcast.com/vhss_editors/voki_player.swf?doc=http%3A%2F%2Fvhss-d.oddcast.com%2Fphp%2Fvhss_editors%2Fgetvoki%2Fchsm=5c6b463d4fc113272d43b2f67a5d0923%26sc=11987370" quality="high" allowscriptaccess="always" allownetworking="all" wmode="transparent" allowfullscreen="true" pluginspage="http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" name="widget_name"></embed>
    </object>
  </p>
</div>

<div align="center">
  <object height="267" width="200" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,28,0" id="widget_name">
    <param name="movie" value="http://vhss-d.oddcast.com/vhss_editors/voki_player.swf?doc=http://vhss-d.oddcast.com/php/vhss_editors/getvoki/chsm=1c51c0c07d6a845551efe515429986bf%26sc=11987381" /><param name="quality" value="high" /><param name="allowScriptAccess" value="always" /><param name="width" value="200" /><param name="height" value="267" /><param name="allowNetworking" value="all"/><param name="wmode" value="transparent" /><param name="allowFullScreen" value="true" />
    <embed height="267" width="200" src="http://vhss-d.oddcast.com/vhss_editors/voki_player.swf?doc=http%3A%2F%2Fvhss-d.oddcast.com%2Fphp%2Fvhss_editors%2Fgetvoki%2Fchsm=1c51c0c07d6a845551efe515429986bf%26sc=11987381" quality="high" allowscriptaccess="always" allownetworking="all" wmode="transparent" allowfullscreen="true" pluginspage="http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" name="widget_name">  </embed>
  </object>
</div>
<p align="center">&nbsp;</p>
<p align="justify"><strong>COMPETENCIAS ESPEC&Iacute;FICAS</strong> <br />
</p>
<p align="justify">El estudiante: <br />
</p>
<p align="justify"><strong>Conocimientos: </strong>Identifica los fundamentos te&oacute;rico-metodol&oacute;gicos de la psicolog&iacute;a cognitiva con base en el conocimiento de los antecedentes hist&oacute;ricos y los procesos psicol&oacute;gicos b&aacute;sicos, con el prop&oacute;sito de lograr la comprensi&oacute;n de la cognici&oacute;n&nbsp; humana. <br />
  </p>
<p align="justify"><strong>Habilidades: </strong>Distingue, analiza y aplica los conceptos m&aacute;s utilizados dentro de los procesos cognitivos en casos reales, adapt&aacute;ndose a diferentes situaciones para el manejo de problemas cognitivos. </p>
<div align="justify">
  <p><strong>Actitudes: </strong>Aplica los principios &eacute;ticos que gu&iacute;an el ejercicio profesional del psic&oacute;logo y es consciente de su responsabilidad social al emitir o exponer tem&aacute;ticas psicol&oacute;gicas ante un p&uacute;blico, en relaci&oacute;n al estudio&nbsp; de los&nbsp; procesos cognitivos b&aacute;sicos.
  </p>
</div>
<p align="center">&nbsp;</p>
<div align="center">
  <h1 align="center"><strong>1.1 INTRODUCCI&Oacute;N A LA PSICOLOG&Iacute;A</strong></h1>
</div>
<h2><strong>1.1.1 Conceptualizaci&oacute;n de la psicolog&iacute;a y generalidades</strong><strong> </strong><br />
</h2>
<p align="justify">La Psicolog&iacute;a es el estudio cient&iacute;fico del comportamiento y de los procesos mentales. El t&eacute;rmino psicolog&iacute;a proviene de las palabras griegas psyche (alma) y logos (estudio), as&iacute; se refer&iacute;a al estudio del alma, y m&aacute;s tarde al de la mente, la conciencia, la conducta; el hombre desde una metodolog&iacute;a positiva (Ballesteros y Garc&iacute;a, 1995).</p>
<p align="center"><img src="Img/UNIDAD 1/pcb_un1img5.jpg" width="260" height="364" /></p>
<p align="justify">Debido a lo anterior, se concibe a la Psicolog&iacute;a como la ciencia que estudia la conducta y la experiencia, esto es, la forma en que los seres humanos sienten, piensan, aprenden y conocen para adaptarse al medio que les rodea. La psicolog&iacute;a moderna se ha dedicado a recoger hechos sobre la conducta y la experiencia, organiz&aacute;ndolos sistem&aacute;ticamente y elaborando teor&iacute;as para su comprensi&oacute;n; estas teor&iacute;as ayudan a conocer, explicar el comportamiento de los seres humanos e interviniendo sobre las consecuencias en determinada conducta.<br />
  </p>
<p align="justify">Algunos cuestionan si la psicolog&iacute;a es o no una ciencia, argumentando que&nbsp; su objeto de estudio es excesivamente amplio y dif&iacute;cil de someter a estricta comprobaci&oacute;n emp&iacute;rica, por la naturaleza introspectiva y no observable de muchos de los fen&oacute;menos por ella estudiados (ej.: el pensamiento, la inteligencia, la motivaci&oacute;n, las actitudes, etc&eacute;tera). En un sentido amplio, s&iacute; se puede afirmar que la psicolog&iacute;a reviste un car&aacute;cter cient&iacute;fico, pues a pesar de las limitaciones de su objeto de estudio los psic&oacute;logos intentan descubrir orden en la conducta, los pensamientos y los motivos de los seres humanos; dan cuenta de sus ideas y resultados en publicaciones y revistas, en un esfuerzo por hacer de dicho orden algo colectivo y p&uacute;blico; sometiendo sus teor&iacute;as a la comprobaci&oacute;n experimental, en definitiva, utilizan en sus investigaciones&nbsp; el m&eacute;todo cient&iacute;fico o experimental (Ortego, s/f).<br />
</p>
<p align="justify">De esta manera se aplican los m&eacute;todos experimentales al estudio del hombre; un estudio cient&iacute;fico implica el uso de herramientas tales como: la observaci&oacute;n, la descripci&oacute;n y la investigaci&oacute;n experimental para reunir informaci&oacute;n y posteriormente organizarla.<br />
  </p>
<p align="justify">Hist&oacute;ricamente, la psicolog&iacute;a se ha dividido en varias &aacute;reas de estudio. No obstante, estas &aacute;reas est&aacute;n interrelacionadas. La psicolog&iacute;a fisiol&oacute;gica, por ejemplo, estudia el funcionamiento del cerebro y del sistema nervioso, mientras que la psicolog&iacute;a experimental aplica t&eacute;cnicas de laboratorio para estudiar, por ejemplo, la percepci&oacute;n o la memoria.</p>
<p>Da clic en la imagen y lee lo que se indica:</p>
<p align="center"><img src="Img/UNIDAD 1/pcb_un1img6.jpg" width="410" height="405" /></p>
<p align="justify">&nbsp;</p>
<p align="justify">Las &aacute;reas de la psicolog&iacute;a pueden tambi&eacute;n describirse en t&eacute;rminos de &aacute;reas de aplicaci&oacute;n como son: Psicolog&iacute;a social, Educativa, Organizacional y Cl&iacute;nica y &eacute;stas a su vez en &aacute;reas de especializaci&oacute;n, pero recuerda, la Psicolog&iacute;a es una sola ciencia, te invito a que a lo largo del semestre, con la ayuda de tu asesor, encuentres el camino correcto para tu desempe&ntilde;o.</p>
<p align="justify">Es momento de reforzar los aprendizajes logrados hasta el momento a gracias a la realizaci&oacute;n de la actividad complementaria 1.1. Sigue adelante.</p>

<a href="SwfCont/ActComLPSBC03PBC01_1_1.swf" target="_blank"><h2>ACTIVIDAD  COMPLEMENTARIA 1.1</h2> </a>


<p align="justify">Despu&eacute;s de haber realizado la actividad complementaria que te ayud&oacute;&nbsp; a repasar los contenidos, te invito a que realices la actividad de aprendizaje correspondiente.</p>


<a href="../../../../ActApart.jsp?unidad=1&amp;apartado=1">
<h2>ACTIVIDAD DE APRENDIZAJE 1.1<br /></h2></a>
  <table width="100%" border="0" height="100%">
      <tr>
        <td width="20%">&nbsp;</td>
        <td class="label_Conceptual">1.1 INTRODUCCI&Oacute;N A LA PSICOLOG&Iacute;A</td>
        <td width="20%"><div align="center"><a href= "ContLPSBC03PBC01_1_2_0.jsp" ><img src="Img/AVANZAR.png" width="99" height="32"/></a></div></td>
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
