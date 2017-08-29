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
 	<h1 align="center"><strong>UNIDAD 3. &nbsp;PENSAMIENTO, LENGUAJE Y COMUNICACI&Oacute;N</strong></h1>
 	<div align="right">
 	  <table width="37%" border="0" cellspacing="10" cellpadding="10">
 	    <tr>
 	      <td><p align="right">&quot;El sabio no dice todo lo que piensa, <br />
 	        pero siempre piensa todo lo que dice&quot;
 	        </p>
 	        <p align="right">Arist&oacute;teles</p></td>
 	      </tr>
 	    </table>
 	</div>
 	<p align="center"><img src="Img/UNIDAD 3/pcb_un3img1.jpg" width="384" height="304" /></p>
 	<p align="justify">En el siguiente esquema se representan los contenidos tem&aacute;ticos correspondientes a la tercera unidad tem&aacute;tica de la unidad de aprendizaje Procesos Cognoscitivos I.</p>
<p align="justify">&nbsp;</p>
<h2 align="center"><strong>MAPA DE CONTENIDOS TEM&Aacute;TICOS UNIDAD 3</strong></h2>
<p align="center"><img src="Img/UNIDAD 3/pcb_un3img2.jpg" width="700" height="309" /></p>
<p align="center">&nbsp;</p>
<h2 align="center"><strong>INTRODUCCI&Oacute;N</strong><br />
</h2>
<p align="justify">El contenido tem&aacute;tico de la unidad 3 se fundamenta en los procesos cognitivos que son EL PENSAMIENTO, EL LENGUAJE Y LA COMUNICACI&Oacute;N, los cuales intervienen en el proceso de soluci&oacute;n de problemas y otros procesos intelectuales que nos sirven para expresarnos y comunicarnos con los dem&aacute;s y para comprender, planificar, razonar, solucionar; es decir, pensar.<br />
  </p>
<p align="justify">Al abordar la primer parte de esta unidad sobre &ldquo;PENSAMIENTO&rdquo;, vas a analizar las estructuras de pensamiento convergente y divergente, mismas que participan en el proceso de adquisici&oacute;n de conceptos, soluci&oacute;n de problemas y el descubrimiento de las relaciones entre los objetos o ideas.<br />
  </p>
<p align="justify">En cuanto al &ldquo;LENGUAJE&rdquo;, vas a comprender las diferencias entre lenguaje, lengua y habla y sus caracter&iacute;sticas m&aacute;s importantes, realizando un ejercicio de reforzamiento. Adem&aacute;s de que vas a descubrir el desarrollo del lenguaje mediante el an&aacute;lisis de un par de videos dispuestos para ello y las te&oacute;ricas que lo sustentan.<br />
  </p>
<p align="justify">Finalmente, en cuanto a la &ldquo;COMUNICACI&Oacute;N&rdquo;, &nbsp;vas a realizar un test&nbsp; de comunicaci&oacute;n con fines de auto diagn&oacute;stico, las respuestas y reflexiones las compartir&aacute;s en un foro de discusi&oacute;n con tus compa&ntilde;eros. Posteriormente revisar&aacute;s la terminolog&iacute;a relacionada con el proceso de comunicaci&oacute;n y sus modalidades.<br />
  </p>
<p align="justify">Como en las unidades anteriores, vas a desarrollar actividades adicionales y de aprendizaje con ayuda de material complementario que te permitir&aacute;n consolidar lo aprendido durante tu proceso de reflexi&oacute;n.<br />
  </p>
<p align="justify">A lo largo de cada tema encontrar&aacute;s videos o presentaciones interactivas que tienen la finalidad de acrecentar el bagaje de conocimientos. <br />
  </p>
<p align="justify">Cada contenido tem&aacute;tico de esta unidad fue dise&ntilde;ado en apego a la nueva estrategia de ense&ntilde;anza-aprendizaje por competencias en la modalidad a distancia y caracterizado por el auto aprendizaje, es por ello que resulta necesario que&nbsp; sigas todas las instrucciones, dando seguimiento a tus actividades de aprendizaje, a la realizaci&oacute;n y entrega de tus proyectos, as&iacute; como a poner inter&eacute;s en las evaluaciones y asesor&iacute;as para que puedas alcanzar el &eacute;xito y cumplas tu meta ser un profesionista de &eacute;xito.<br />
  <br />
</p>
<p align="center"><object height="267" width="200" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,28,0" id="widget_name"><param name="movie" value="http://vhss-d.oddcast.com/vhss_editors/voki_player.swf?doc=http://vhss-d.oddcast.com/php/vhss_editors/getvoki/chsm=13db794caefad95caa3f1de2bc22a1cc%26sc=11987422" /><param name="quality" value="high" /><param name="allowScriptAccess" value="always" /><param name="width" value="200" /><param name="height" value="267" /><param name="allowNetworking" value="all"/><param name="wmode" value="transparent" /><param name="allowFullScreen" value="true" /><embed height="267" width="200" src="http://vhss-d.oddcast.com/vhss_editors/voki_player.swf?doc=http%3A%2F%2Fvhss-d.oddcast.com%2Fphp%2Fvhss_editors%2Fgetvoki%2Fchsm=13db794caefad95caa3f1de2bc22a1cc%26sc=11987422" quality="high" allowscriptaccess="always" allownetworking="all" wmode="transparent" allowfullscreen="true" pluginspage="http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" name="widget_name"></embed></object>
  <br />
  <br />
  <br />
</p>
<p align="center">
<object height="267" width="200" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,28,0" id="widget_name"><param name="movie" value="http://vhss-d.oddcast.com/vhss_editors/voki_player.swf?doc=http://vhss-d.oddcast.com/php/vhss_editors/getvoki/chsm=acb237a34e5a1fe6add2cac2ef9f3c20%26sc=11987429" /><param name="quality" value="high" /><param name="allowScriptAccess" value="always" /><param name="width" value="200" /><param name="height" value="267" /><param name="allowNetworking" value="all"/><param name="wmode" value="transparent" /><param name="allowFullScreen" value="true" /><embed height="267" width="200" src="http://vhss-d.oddcast.com/vhss_editors/voki_player.swf?doc=http%3A%2F%2Fvhss-d.oddcast.com%2Fphp%2Fvhss_editors%2Fgetvoki%2Fchsm=acb237a34e5a1fe6add2cac2ef9f3c20%26sc=11987429" quality="high" allowscriptaccess="always" allownetworking="all" wmode="transparent" allowfullscreen="true" pluginspage="http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" name="widget_name"></embed></object>

</p>
<p align="center">
<object height="267" width="200" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,28,0" id="widget_name"><param name="movie" value="http://vhss-d.oddcast.com/vhss_editors/voki_player.swf?doc=http://vhss-d.oddcast.com/php/vhss_editors/getvoki/chsm=2af8c3d06e7be4b3264b1ebea006524a%26sc=11987438" /><param name="quality" value="high" /><param name="allowScriptAccess" value="always" /><param name="width" value="200" /><param name="height" value="267" /><param name="allowNetworking" value="all"/><param name="wmode" value="transparent" /><param name="allowFullScreen" value="true" /><embed height="267" width="200" src="http://vhss-d.oddcast.com/vhss_editors/voki_player.swf?doc=http%3A%2F%2Fvhss-d.oddcast.com%2Fphp%2Fvhss_editors%2Fgetvoki%2Fchsm=2af8c3d06e7be4b3264b1ebea006524a%26sc=11987438" quality="high" allowscriptaccess="always" allownetworking="all" wmode="transparent" allowfullscreen="true" pluginspage="http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" name="widget_name"></embed></object>
</p>
<p align="justify"><strong>COMPETENCIAS ESPEC&Iacute;FICAS</strong> <br />
  </p>
<p align="justify">El estudiante: <br />
    </p>
<p align="justify"><strong>Conocimientos: </strong>Determina la importancia del pensamiento, lenguaje y comunicaci&oacute;n dentro de los procesos cognitivos, concibiendo a &eacute;stos como los encargados de capacitar a los seres humanos para realizar actividades motoras y sensitivas. <br />
      </p>
<p align="justify"><strong>Habilidades: </strong>Clasifica las caracter&iacute;sticas distintivas de cada proceso cognitivo para lograr su asimilaci&oacute;n, a partir de la detecci&oacute;n de la interacci&oacute;n e integraci&oacute;n entre los mismos procesos y la extracci&oacute;n de sus principales hallazgos. <br />
        </p>
<p align="justify"><strong>Actitudes: </strong>Es consciente de necesidades reales y valora la mejor forma de intervenci&oacute;n&nbsp; de los procesos cognitivos en situaciones determinadas dentro del &aacute;mbito personal, acad&eacute;mico, laboral, etc.        </p>
<p align="center">&nbsp;</p>
<p align="center"><img src="Img/UNIDAD 3/pcb_un3img4.jpg" width="220" height="221" /></p>
  <p align="center">&nbsp;</p>
  <p align="justify">A continuaci&oacute;n se dar&aacute; inicio a los contenidos de la tercera unidad, esperando que sean entendibles&hellip;suerte y a lograr los objetivos. Para ello, es importante tomar en cuenta cada uno de los temas para un mejor entendimiento a lo largo de las unidades y su relaci&oacute;n entre ellos.</p>
<p align="center">&nbsp;</p>
<h1 align="center"><strong>3.1 PENSAMIENTO</strong>  </h1>
  <h1 align="center"><img src="Img/UNIDAD 3/pcb_un3img5.jpg" width="400" height="230" /></h1>
  <p align="justify">El pensamiento es una capacidad exclusiva del ser humano; permite al individuo resolver problemas y razonar. Esta actividad intelectual compleja va a estar en estrecha relaci&oacute;n con otros procesos intelectuales como la percepci&oacute;n, memoria, atenci&oacute;n, lenguaje. La conexi&oacute;n directa del pensamiento con el lenguaje es evidente, ya que si pensamos en algo o alguien, por lo general utilizaremos un lenguaje interior para describir las caracter&iacute;sticas o situar el objeto en el contexto.</p>
  <p align="justify">Por tanto, el lenguaje no es s&oacute;lo el instrumento que nos sirve para expresarnos y comunicarnos con los dem&aacute;s sino tambi&eacute;n para comprender, planificar, razonar, solucionar; es decir, pensar. No siempre los pensamientos se presentan a partir de conceptos o del lenguaje, tambi&eacute;n podemos utilizar im&aacute;genes mentales; es posible tener representaciones mentales o pensamientos mediante palabras, im&aacute;genes u otros s&iacute;mbolos.</p>
  <p align="justify">Para que se d&eacute; la percepci&oacute;n se necesita de la presencia de las cosas; el pensamiento no, es decir, es representativa. Seg&uacute;n Pinillos, lo propio del pensamiento consiste en resolver problemas y razonar.</p>
  <p align="justify">Seg&uacute;n el tipo de problemas que se plantee, se utilizar&aacute; una clase de pensamiento u otro. El pensamiento puede ser: concreto; permite resolver problemas a trav&eacute;s de la manipulaci&oacute;n de los objetos, como, realizar un puzzle, cerrar la tapadera de un frasco, etc.</p>
  <p align="justify">El modo de solucionar los problemas puede responder tambi&eacute;n a otros tipos de pensamiento propuestos por J.P. Guilford: pensamiento convergente y pensamiento divergente:</p>
  <p align="center"><strong>Figura 1. Tipos de Pensamiento de acuerdo a J.P. Guilford</strong><br />
  </p>
  <div>
    <div></div>
  </div>
  <p align="center"><img src="Img/UNIDAD 3/pcb_un3img6.jpg" width="612" height="304" /></p>
  <p align="justify">Ambas son estructuras de pensamiento, en relaci&oacute;n al pensamiento creativo conduce al nacimiento de nuevas ideas. A continuaci&oacute;n aparecen algunas caracter&iacute;sticas del pensamiento creativo:<br />
    </p>
 <div align="center">
        <object id="FlashID" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="670" height="393">
          <param name="movie" value="Swf/ContLPSBC03PBC01_3_1.swf" />
          <param name="quality" value="high" />
          <param name="wmode" value="opaque" />
          <param name="swfversion" value="15.0.0.0" />
          <!-- Esta etiqueta param indica a los usuarios de Flash Player 6.0 r65 o posterior que descarguen la versión más reciente de Flash Player. Elimínela si no desea que los usuarios vean el mensaje. -->
          <param name="expressinstall" value="Scripts/expressInstall.swf" />
          <!-- La siguiente etiqueta object es para navegadores distintos de IE. Ocúltela a IE mediante IECC. -->
          <!--[if !IE]>-->
          <object type="application/x-shockwave-flash" data="Swf/ContLPSBC03PBC01_3_1.swf" width="670" height="393">
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
 <p>&nbsp;</p>
 <table width="70%" align="center" border="1" cellspacing="0" cellpadding="15">
   <tr>
     <td width="115" align="right"><img src="Img/UNIDAD 3/Intentodegif.gif" width="157" height="144" /></td>
     <td width="407"><p align="justify"><strong>I</strong><strong>dea Relevante</strong></p>
       <p align="justify">Dentro del pensamiento se menciona <strong>el razonamiento</strong> que es un <strong>pensamiento completo, consciente y controlado </strong>con una intensi&oacute;n y una orientaci&oacute;n apoyado en las leyes de la l&oacute;gica; as&iacute; &eacute;ste puede ser deductivo si a partir de unos principios o premisas se llega a una conclusi&oacute;n o se obtiene una consecuenncia llegamos a establecer los principios.</p></td>
   </tr>
 </table>
 <p align="justify">Esta capacidad supone el proceso de adquisici&oacute;n de conceptos y el descubrimiento de las relaciones entre los objetos o ideas. As&iacute; pues, se llega a un concepto al extraer las caracter&iacute;sticas comunes que comparten varios objetos. A partir de la abstracci&oacute;n podemos hacer una generalizaci&oacute;n y aplicar un determinado concepto a todos los objetos que tiene caracter&iacute;sticas iguales</p>
<p align="justify">Ambos procesos de abstracci&oacute;n y generalizaci&oacute;n permiten crear conceptos y manejarlos mentalmente sin necesidad de la presencia inmediata del objeto, es decir, nos permite pensar.</p>
<p align="justify">El razonamiento del ni&ntilde;o en la etapa que nos ocupa es prel&oacute;gico, es decir, no es capaz de utilizar la deducci&oacute;n o la inducci&oacute;n, y la formula juicios a trav&eacute;s de la transducci&oacute;n; hace afirmaciones de implicaci&oacute;n.</p>
<p>&nbsp;</p>
<h2><strong>Evoluci&oacute;n del pensamiento</strong></h2>
<p align="justify">La manera de pensar de los individuos depende del tipo de tarea a la que se enfrentan y de las caracter&iacute;sticas individuales de los sujetos. Esta capacidad evoluciona con la edad.</p>
<p align="justify">El ni&ntilde;o peque&ntilde;o necesita en un principio de la ayuda del adulto para resolver sus problemas o necesidades (de alimentaci&oacute;n, higiene, etc.) llegado el momento, se dar&aacute; cuenta de las relaciones entre los objetos o sucesos y actuar&aacute; para encontrar soluciones; as&iacute; pues, ante una necesidad (el hombre), su llanto o grito intencionado y no reflejo, y posteriormente las palabras, atraer&aacute;n la atenci&oacute;n de su madre de forma que &eacute;sta le proporcione el alimento. &Eacute;ste es el <strong>pensamiento simple.</strong></p>
<p align="justify">Observamos c&oacute;mo el ni&ntilde;o ha podido establecer una relaci&oacute;n entre los elementos hambre-llanto-biber&oacute;n que le permite resolver su problema de hambre; es decir, ha planteado un sistema de actuaci&oacute;n para lograr un fin.</p>
<p align="justify">Esta forma de <strong>pensar</strong> muy elemental se va haciendo m&aacute;s <strong>compleja;</strong> y si, bien al principio requiere la ayuda de los dem&aacute;s, su maduraci&oacute;n motora le va a permitir actuar &eacute;l mismo sobre los objetos. As&iacute;, por ejemplo, si quiere coger un juguete que esta encima de un mueble pensar&aacute; la soluci&oacute;n, que consistir&aacute; en acercar una silla y subirse a ella para llegar al objeto.</p>
<p align="justify">Su <strong>pensamiento</strong> es de tipo <strong>concreto</strong> y exige una acci&oacute;n directa sobre los objetos. M&aacute;s tarde, al aparecer el lenguaje, &eacute;ste va a poder sustituir a la acci&oacute;n, de forma que el ni&ntilde;o ya puede resolver situaciones mentalmente y establecer previamente el plan de actuaci&oacute;n, valorando la conveniencia y eficacia de las posibles respuestas.</p>
<p align="justify">Aparece el <strong>pensamiento prel&oacute;gico</strong> hacia los 2 a&ntilde;os, aunque antes ya ha empezado a establecer relaciones de causa-efecto a partir de sus peque&ntilde;as experiencias, como accionar el interruptor que enciende la luz, empujar la pelota para provocar su movimiento, etc. Los 7 a&ntilde;os marcan un punto decisivo en el desarrollo intelectual del ni&ntilde;o. Comienza a <strong>pensar l&oacute;gicamente</strong>, resolver problemas mediante el razonamiento, y a ser realista en las observaciones del mundo.<strong> </strong></p>
<p align="center"><img src="Img/UNIDAD 3/pcb_un3img8.jpg" width="468" height="208" /></p>
<p align="justify">El razonamiento, por otro lado, es pensamiento completo, consciente y controlado con una intenci&oacute;n y una orientaci&oacute;n apoyado en las leyes de la l&oacute;gica. &nbsp;Posterior a las etapas ya descritas surge el<strong> razonamiento deductivo e inductivo, </strong>que es<strong> </strong>el <em>proceso mental mediante el que se llega a una conclusi&oacute;n sobre un caso concreto a partir de principios generales o informaciones disponibles</em>, se infieren leyes que regulan series de fen&oacute;menos observables, o se encuentran semejanzas y diferencias entre conceptos cada vez m&aacute;s complejos. El razonamiento l&oacute;gico o formal es entonces&nbsp; la capacidad de partir de ciertas proposiciones o ideas previamente conocidas, tambi&eacute;n llamadas premisas y llegar a una proposici&oacute;n nueva (conclusi&oacute;n) antes no conocida de modo expl&iacute;cito.</p>
<p align="justify">Ejemplo: Con base en mis conocimientos previos clasifico los alimentos por verduras, carnes, pescados, fruta&nbsp; para tener un mejor orden (conclusi&oacute;n). </p>
<p align="justify">Los razonamientos pueden ser v&aacute;lidos (correctos) o no v&aacute;lidos (incorrectos). En este sentido, cuando una premisa es considerada verdadera con base en las evidencias, necesariamente la conclusi&oacute;n deber&aacute; ser verdadera.&nbsp; Del razonamiento l&oacute;gico se desprenden (Herrera, M., 2009):</p>
<p align="center"><img src="Img/UNIDAD 3/pcb_un3img9.jpg" width="75" height="114" /><br />
</p>
<div>
  <div></div>
</div><table width="100%" border="0" height="100%">
      <tr>
        <td width="20%">&nbsp;</td>
        <td class="label_Conceptual"><p><strong>3.1 PENSAMIENTO</strong></p></td>
        <td width="20%"><div align="center"><a href= "ContLPSBC03PBC01_3_1_1.jsp" ><img src="Img/AVANZAR.png" width="99" height="32"/></a></div></td>
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
