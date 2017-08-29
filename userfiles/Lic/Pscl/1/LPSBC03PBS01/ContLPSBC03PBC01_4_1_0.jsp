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
<h1 align="center"><strong>UNIDAD 4. MEMORIA, MOTIVACI&Oacute;N Y EMOCI&Oacute;N</strong></h1>
<h1 align="center">&nbsp;</h1>
 	<div align="right">
 	  <table width="37%" border="0" cellspacing="10" cellpadding="10">
 	    <tr>
 	      <td><p align="center">&quot;Somos nuestra memoria, somos ese quim&eacute;rico museo de formas inconstantes, ese mont&oacute;n de espejos rotos&quot;.<br />
 	        </p>
 	        <p align="center">Jorge Luis Borges</p></td>
 	      </tr>
 	    </table>
 	</div>
 	<p align="center"><img src="Img/UNIDAD 4/pcb_un4img1.jpg" width="112" height="99" /></p>
 	<p align="justify">&nbsp;</p>
 	<p align="justify">En el siguiente esquema se representan los contenidos tem&aacute;ticos correspondientes a la tercera unidad tem&aacute;tica de Procesos Cognitivos I, cada uno de estos temas guardan&nbsp; relaci&oacute;n entre s&iacute;; Compa&ntilde;ero estudiante&hellip; sigue adelante y felicidades.</p>
 	<p align="justify">&nbsp;</p>
<h2 align="center"><strong>MAPA DE CONTENIDOS TEM&Aacute;TICOS UNIDAD 4</strong></h2>
<p align="center"><img src="Img/UNIDAD 4/pcb_un4img2.jpg" width="698" height="374" /></p>
<h2 align="center"><strong>INTRODUCCI&Oacute;N</strong><br />
</h2>
<p>El contenido tem&aacute;tico de la unidad 4 se fundamenta en la <strong>MEMORIA, MOTIVACI&Oacute;N Y EMOCI&Oacute;N.</strong><br />
  </p>
<p align="justify">En&nbsp; primer apartado se estudian los diferentes elementos de la memoria, cada uno de los cuales desempe&ntilde;a una tarea espec&iacute;fica, del mismo modo que las distintas marchas de un autom&oacute;vil realizan diferentes tareas. El primer objetivo es ofrecer una perspectiva general y de por qu&eacute; es importante para el estudio del aprendizaje. Se expondr&aacute; la memoria sensorial, el componente inicial de la memoria, que percibe, reconoce y asigna significado a los est&iacute;mulos que llegan. Despu&eacute;s examinaremos la memoria a corto&nbsp; y largo plazo.<br />
  </p>
<p align="justify">En segundo lugar hablaremos acerca de la <em>Piscolog&iacute;a de la motivaci&oacute;n</em> que es el <strong>estudio de las variables personales (internas) y situacionales (externas) </strong>que determinan y regulan la elecci&oacute;n de conductas, el inicio de &eacute;stas, y el esfuerzo y la persistencia en su ejecuci&oacute;n hasta que se alcanzan las metas que uno se ha propuesto y el proceso por el que atraviesa.<br />
  </p>
<p align="justify">En &uacute;ltimo lugar, pero no por ello menos importante, hablaremos de las emociones <strong>que es un estado afectivo </strong>que experimentamos, una <strong>reacci&oacute;n subjetiva al ambiente</strong> que viene acompa&ntilde;ada de cambios org&aacute;nicos (fisiol&oacute;gicos y endocrinos) de origen innato, influidos por la experiencia. Las emociones tienen una <strong>funci&oacute;n adaptativa</strong> de nuestro organismo a lo que nos rodea. Es un estado que sobreviene s&uacute;bita y bruscamente, en forma de crisis m&aacute;s o menos violentas y m&aacute;s o menos pasajeras.<br />
  </p>
<p align="justify">Como en las unidades anteriores, a lo largo de cada tema encontrar&aacute;s videos o presentaciones interactivas que tienen la finalidad de acrecentar el bagaje de conocimientos. <br />
  </p>
<p align="justify">Cada contenido tem&aacute;tico de esta unidad fue dise&ntilde;ado en apego a la nueva estrategia de ense&ntilde;anza-aprendizaje por competencias en la modalidad a distancia y caracterizado por el auto aprendizaje, es por ello que resulta necesario que&nbsp; sigas todas las instrucciones, dando seguimiento a tus actividades de aprendizaje, a la realizaci&oacute;n y entrega de tus proyectos, as&iacute; como a poner inter&eacute;s en las evaluaciones y asesor&iacute;as para que puedas alcanzar el &eacute;xito y cumplas tu meta ser un profesionista de &eacute;xito.</p>
<p align="center"><object height="267" width="200" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,28,0" id="widget_name"><param name="movie" value="http://vhss-d.oddcast.com/vhss_editors/voki_player.swf?doc=http://vhss-d.oddcast.com/php/vhss_editors/getvoki/chsm=19e8ba3011fa84bdbf310f52f4f4298f%26sc=11987450" /><param name="quality" value="high" /><param name="allowScriptAccess" value="always" /><param name="width" value="200" /><param name="height" value="267" /><param name="allowNetworking" value="all"/><param name="wmode" value="transparent" /><param name="allowFullScreen" value="true" /><embed height="267" width="200" src="http://vhss-d.oddcast.com/vhss_editors/voki_player.swf?doc=http%3A%2F%2Fvhss-d.oddcast.com%2Fphp%2Fvhss_editors%2Fgetvoki%2Fchsm=19e8ba3011fa84bdbf310f52f4f4298f%26sc=11987450" quality="high" allowscriptaccess="always" allownetworking="all" wmode="transparent" allowfullscreen="true" pluginspage="http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" name="widget_name"></embed></object></p>
<p align="center">
<object height="267" width="200" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,28,0" id="widget_name"><param name="movie" value="http://vhss-d.oddcast.com/vhss_editors/voki_player.swf?doc=http://vhss-d.oddcast.com/php/vhss_editors/getvoki/chsm=13de02893be785c3b9791303b2db978d%26sc=11987458" /><param name="quality" value="high" /><param name="allowScriptAccess" value="always" /><param name="width" value="200" /><param name="height" value="267" /><param name="allowNetworking" value="all"/><param name="wmode" value="transparent" /><param name="allowFullScreen" value="true" /><embed height="267" width="200" src="http://vhss-d.oddcast.com/vhss_editors/voki_player.swf?doc=http%3A%2F%2Fvhss-d.oddcast.com%2Fphp%2Fvhss_editors%2Fgetvoki%2Fchsm=13de02893be785c3b9791303b2db978d%26sc=11987458" quality="high" allowscriptaccess="always" allownetworking="all" wmode="transparent" allowfullscreen="true" pluginspage="http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" name="widget_name"></embed></object>

</p>
<p align="center">
<object height="267" width="200" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,28,0" id="widget_name"><param name="movie" value="http://vhss-d.oddcast.com/vhss_editors/voki_player.swf?doc=http://vhss-d.oddcast.com/php/vhss_editors/getvoki/chsm=19f2213bb6bde38181ac0de4f700fc19%26sc=11987467" /><param name="quality" value="high" /><param name="allowScriptAccess" value="always" /><param name="width" value="200" /><param name="height" value="267" /><param name="allowNetworking" value="all"/><param name="wmode" value="transparent" /><param name="allowFullScreen" value="true" /><embed height="267" width="200" src="http://vhss-d.oddcast.com/vhss_editors/voki_player.swf?doc=http%3A%2F%2Fvhss-d.oddcast.com%2Fphp%2Fvhss_editors%2Fgetvoki%2Fchsm=19f2213bb6bde38181ac0de4f700fc19%26sc=11987467" quality="high" allowscriptaccess="always" allownetworking="all" wmode="transparent" allowfullscreen="true" pluginspage="http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" name="widget_name"></embed></object>
</p>
<p><strong>COMPETENCIAS ESPEC&Iacute;FICAS</strong> <br />
  </p>
<p align="justify">El estudiante:<br />
  </p>
<p align="justify"><strong>Conocimientos: </strong>Reflexiona sobre los conceptos b&aacute;sicos de emoci&oacute;n, motivaci&oacute;n y memoria y su trascendencia dentro del&nbsp; proceso psicol&oacute;gico del desarrollo del ser humano. <br />
  </p>
<p align="justify"><strong>Habilidades: </strong>Explica la importancia de los conceptos en la adquisici&oacute;n de informaci&oacute;n mediante los sentidos, las experiencias y est&iacute;mulos, extrayendo la informaci&oacute;n m&aacute;s relevante sobre las emociones y ejemplificando estos procesos con casos reales para su f&aacute;cil comprensi&oacute;n.
  </p>
<p align="justify"><strong>Actitudes:</strong> Es consciente de su participaci&oacute;n en los procesos de&nbsp; motivaci&oacute;n y emoci&oacute;n, por lo que orienta sus decisiones profesionales tomando en cuenta los aspectos &eacute;ticos y valores personales para contribuir con su aportaci&oacute;n a beneficios en la salud de los seres humanos.</p>
<p align="justify">&nbsp;</p>
<h1 align="center"><strong>4.1 MEMORIA</strong></h1>
<p align="justify">La memoria siempre ha fascinado a los seres humanos. Sin embargo, su estudio cient&iacute;fico es reciente, ya que comenz&oacute; hace poco m&aacute;s de un siglo, con el trabajo del pionero Hermann Ebbinghaus que se public&oacute; en 1885. La genialidad de Ebbinghaus consisti&oacute; en reducir el estudio de la memoria a su forma m&aacute;s elemental; a saber, listas de s&iacute;labas sin sentido (p.ej. FOH, TAF).<br />
  </p>
  <p align="justify">Las teor&iacute;as de la memoria que se basaban en la memorizaci&oacute;n y extrapolar los principios b&aacute;sicos de la conducta simple a la compleja han sido sustituidas por otras que describen procesos cognitivos complejos y significativos (Brunning, 2002).<br />
    </p>
  <p align="justify">Por tanto, la memoria es un mecanismo de grabaci&oacute;n, archivo y clasificaci&oacute;n de informaci&oacute;n, haciendo posible su recuperaci&oacute;n posterior. En sentido estricto se puede identificar con la capacidad de grabaci&oacute;n, pero ya se sabe que tan importante es esa grabaci&oacute;n como el contenido y estructura de la informaci&oacute;n. Un aspecto interesante es que la memoria funciona mucho m&aacute;s eficazmente cuando algo se aprende en un ambiente agradable y relajado. Se sabe que la memoria es selectiva y que se recuerda mucho mejor las cosas agradables y apenas se recuerdan los malos ratos, acentu&aacute;ndose este efecto cuanto m&aacute;s antiguos son los recuerdos.<br />
    </p>
  <p align="justify">La <strong>memoria</strong> es una funci&oacute;n del cerebro y, a la vez, un fen&oacute;meno cognitivo &nbsp;que permite al organismo codificar, almacenar y recuperar informaci&oacute;n.Surge como resultado de las conexiones sin&aacute;pticas repetitivas entre las neuronas, lo que crea redes neuronales (la llamada <em>potenciaci&oacute;n a largo plazo</em>).<br />
    </p>
  <p align="justify">La memoria permite retener experiencias pasadas y, seg&uacute;n el alcance temporal, se clasifica convencionalmente en: <em>memoria a corto plazo</em> (consecuencia de la simple excitaci&oacute;n de la sinapsis para reforzarla o sensibilizarla transitoriamente), <em>memoria a mediano plazo</em> y <em>memoria a largo plazo</em> (consecuencia de un reforzamiento permanente de la sinapsis gracias a la activaci&oacute;n de ciertos genes y a la s&iacute;ntesis de las prote&iacute;nas correspondientes). El hipocampo es la parte del cerebro relacionada a la memoria y aprendizaje.</p>
  <table width="70%" align="center" border="0" cellspacing="0" cellpadding="15">
    <tr>
      <td width="115" align="right"><img src="Img/UNIDAD 4/Intentodegif.gif" alt="" width="157" height="144" /></td>
      <td width="407"><p align="justify"><strong>I</strong><strong>dea Relevante</strong></p>
        <p align="justify"><strong>Memoria:</strong> Es un conjunto de sistemas de retenci&oacute;n o recuperaci&oacute;n de informaci&oacute;n, es un proceso psicol&oacute;gico que sirve para almacenar informaci&oacute;n codificada. Dicha informaci&oacute;n puede ser recuperada, unas veces de forma voluntaria y consciente y otras de manera involuntaria (Ballesteros, 1999).</p></td>
    </tr>
  </table>

<p><strong>Actividad previa</strong><br />
  </p>
<p>Da clic en la siguiente liga y realiza los ejercicios all&iacute; presentados, posteriormente comenta en el foro tus resultados:</p>
<em>CogniFit. Entrenador personal.</em> (2001). Consultado con fines did&aacute;cticos el 9 de Marzo de 2015, en: <a href="http://www.cognifitpersonalcoach.com/cognifit.php">http://www.cognifitpersonalcoach.com/cognifit.php</a>
<p align="justify"><br />
</p>
<div>
  <div></div>
</div><table width="100%" border="0" height="100%">
      <tr>
        <td width="20%">&nbsp;</td>
        <td class="label_Conceptual"><p><strong>4.1 MEMORIA</strong></p></td>
        <td width="20%"><div align="center"><a href= "ContLPSBC03PBC01_4_1_1.jsp" ><img src="Img/AVANZAR.png" width="99" height="32"/></a></div></td>
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
