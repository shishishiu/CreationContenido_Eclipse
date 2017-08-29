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
 	<h1 align="center"><strong>4.3 MOTIVACI&Oacute;N</strong><br />
      </h1>
 	<p align="justify">Te invito a que revises el siguiente video: <em><a href="http://youtu.be/NSc_nHP48LM" target="_blank"><strong>Motivaci&oacute;n Extraterrestres.</strong></a></em><strong><a href="http://youtu.be/NSc_nHP48LM"> (2008).</a></strong> Recuperado con fines did&aacute;cticos el 9 de  Marzo de 2015, de: http://www.youtube.com/watch?v=pQCFybFPnnY, te brinda un claro ejemplo de lo es motivaci&oacute;n, disfr&uacute;talo.</p>
 	<p align="justify"><strong>Para revisar el material indicado da clic en el siguiente enlace o bien, revisa la secci&oacute;n de Descargables en la plataforma</strong>.<br />
 	  </p>
<p align="justify">El concepto de <em>motivaci&oacute;n</em> incluye un conjunto de aspectos relacionados con el comportamiento humano. Se podr&iacute;an se&ntilde;alar tres cuestiones b&aacute;sicas ante una conducta determinada: &iquest;Cu&aacute;les son las razones o motivos? (<em>por qu&eacute; lo hacemos</em>) &iquest;Cu&aacute;l es el comportamiento elegido? (<em>qu&eacute; es lo que hacemos</em>) y &iquest;Cu&aacute;l es la meta que se quiere conseguir? (<em>para qu&eacute; lo hacemos</em>).</p>
<p align="justify">&nbsp;</p>
<table width="70%" align="center" border="0" cellspacing="0" cellpadding="15">
  <tr>
    <td width="115" align="right"><img src="Img/UNIDAD 4/Intentodegif.gif" alt="" width="157" height="144" /></td>
    <td width="407"><p align="justify"><strong>I</strong><strong>dea Relevante</strong></p>
      <p align="justify">Teniendo en cuenta estos tres aspectos es posible definir a la <em>Psicolog&iacute;a de la motivaci&oacute;n</em> como el <strong>estudio de las variables personales (internas) y situacionales (externas) </strong>que determinan y regular la elecci&oacute;n de conductas, el inicio de &eacute;stas, y el esfuerzo y la persistencia en su ejecuci&oacute;n hasta que se alcanzan las metas que uno se ha propuesto.</p></td>
  </tr>
</table>
<p align="justify">&nbsp;</p>

  <p align="justify">La motivaci&oacute;n depende de diferentes factores que llamaremos <em>variables motivacionales</em>. Algunas est&aacute;n relacionadas con necesidades de nuestro organismo, es decir, son variables motivacionales fisiol&oacute;gicas, como los <strong>impulsos</strong> o la <strong>activaci&oacute;n</strong> del sistema nervioso; otras tienen que ver con la informaci&oacute;n sobre&nbsp; nuestros propios deseos y las posibilidades de satisfacerlos. &Eacute;stas son las variables motivacionales cognitivas, entre las que se pueden se&ntilde;alar las <strong>expectativas</strong> y las <strong>metas u objetivos</strong>.</p>
  
  <p align="justify"><strong>a) <em>Los impulsos y la activaci&oacute;n</em></strong><br />
    </p>
  <p align="justify">Los impulsos son estados internos del organismo, que se experimentan subjetivamente como algo desagradable, o tambi&eacute;n como una necesidad que es necesario compensar, y que activa o energiza aquellos comportamientos que tienden a suprimirlos o satisfacerlos. El hambre, la sed, la excitaci&oacute;n sexual, son ejemplos cl&aacute;sicos de impulsos.<br />
    </p>
  <p align="justify">El concepto de activaci&oacute;n (<em>arousal</em>), est&aacute; muy vinculado al de impulso, y hace referencia a la intensidad de la actividad bioel&eacute;ctrica global del sistema nervioso.</p>

<p align="center"><strong><img src="Img/UNIDAD 4/pcb_un4img19.jpg" width="68" height="89" /></strong></p>
<p align="justify">Un ejemplo de &ldquo;activaci&oacute;n&rdquo;: Nuria se ha levantado muy temprano para acabar de preparar el examen de ingl&eacute;s. Al principio estaba algo somnolienta (baja activaci&oacute;n). Se toma su dosis habitual de caf&eacute;, y al cabo de unos minutos se siente totalmente despierta (activaci&oacute;n adecuada) y rinde al m&aacute;ximo. Probablemente, si se hubiera tomado de golpe cuatro caf&eacute;s se sentir&iacute;a inquieta e incapaz de concentrarse (activaci&oacute;n extrema) y rendir&iacute;a poco.</p>
<p align="justify">Tanto la presencia de un impulso (necesidad org&aacute;nica de satisfacer una necesidad) como el grado de activaci&oacute;n de nuestro sistema nervioso, son factores o variables que pueden favorecer &ldquo;la elecci&oacute;n de determinadas conductas, iniciarlas y mantener su ejecuci&oacute;n hasta conseguir metas propuestas&rdquo;. En otras palabras, son variables <strong>fisiol&oacute;gicas</strong> de la &ldquo;motivaci&oacute;n&rdquo;.<br />
  </p>
<p align="justify"><strong>b) <em>Expectativas de eficacia y de resultados</em></strong><br />
  </p>
<p align="justify">A diferencia de los impulsos y de la activaci&oacute;n, las expectativas son variables no fisiol&oacute;gicas sino <strong>cognitivas</strong> (dependen de la informaci&oacute;n y de lo que pensemos sobre nuestras acciones, la capacidad que creamos tener para realizarlas y lo que esperemos obtener).</p>
<p align="center"><img src="Img/UNIDAD 4/pcb_un4img20.jpg" width="180" height="200" /></p>
<p align="justify">Las expectativas se pueden definir como anticipaciones cognitivas de nuestras capacidades para hacer algo, o bien, anticipaciones del resultado que puede obtenerse como efecto de nuestras acciones. A las primeras se les denomina <em>expectativas de eficacia</em> o tambi&eacute;n <em>auto-eficacia</em>, a las segundas <em>expectativas de resultados</em>.</p>
<p align="justify">Un ejemplo: Una persona que fumaba dos paquetes de cigarrillos diarios ha conseguido dejar el tabaco despu&eacute;s de participar en un programa de deshabituaci&oacute;n. La medida en que se ve a el mismo como capaz de mantenerse sin fumar en diferentes situaciones de riesgo constituyen su auto-eficacia; las consecuencias anticipadas positivas o negativas de mantenerse sin fumar constituyen sus expectativas de resultado.<br />
  </p>
<p align="justify">Se dice que las expectativas tanto de eficacia como de resultados son variables de la motivaci&oacute;n porque cuanto mayores sean estas expectativas tendremos una mayor activaci&oacute;n de nuestro organismo para iniciar una acci&oacute;n y m&aacute;s capaces seremos de mantener su ejecuci&oacute;n hasta conseguir las metas propuestas.</p>
<p align="justify">La combinaci&oacute;n en diferentes grados de estos dos tipos de expectativas puede tener diferentes efectos motivacionales y emocionales. Veamos el siguiente cuadro:</p>
<p align="center"><img src="Img/UNIDAD 4/pcb_un4img21.png" width="560" height="387" /></p>
<p><strong>c) <em>Las metas</em></strong><br />
  </p>
<p align="justify">Se define como meta al nivel de rendimiento o al tipo de consecuencia que una persona se propone alcanzar en la realizaci&oacute;n de una determinada conducta. A las metas tambi&eacute;n se les suele llamar objetivos o intenciones.<br />
  </p>
<p align="justify">De esta definici&oacute;n se desprende que las metas se pueden referir a la conducta (un determinado nivel de realizaci&oacute;n) o los resultados (unas determinadas consecuencias).<br />
  </p>
<p align="justify">Una gran cantidad de estudios emp&iacute;ricos han mostrado que la definici&oacute;n de metas u objetivos movilizan los esfuerzos y la persistencia, es decir, aumentan la motivaci&oacute;n y contribuyen a mejorar el rendimiento. Pero no todas las metas producen estos efectos motivacionales. Para que contribuyan a mejorar el rendimiento, las metas tienen que ser espec&iacute;ficas, dif&iacute;ciles (pero asequibles o alcanzables) y pr&oacute;ximas en el tiempo.<br />
</p>
<table  align="center" width="80%" border="1" cellspacing="0" cellpadding="15" bgcolor="#fed47a">
  <tr>
    <td><p align="justify">La ESPECIFICIDAD se refiere al grado de concreci&oacute;n con que se definen las metas. Una meta es espec&iacute;fica cuando se define con precisi&oacute;n, de manera que es f&aacute;cil saber si se cumplido o no (es f&aacute;cilmente evaluable). Este tipo de definici&oacute;n requiere concretar en t&eacute;rminos conductuales la tarea que se tiene que hacer y establecer unos plazos temporales para &eacute;sta. Para una persona obesa que sigue una dieta para perder peso, adelgazar un kilo a la semana es una meta espec&iacute;fica; en cambio, adelgazar un poco es una meta ambigua.</p></td>
  </tr>
</table><br/>
<table align="center" bgcolor="#fed47a" width="80%" border="1" cellspacing="0" cellpadding="15">
  <tr>
    <td><p align="justify">La DIFICULTAD de una meta para un sujeto particular no depende s&oacute;lo de las caracter&iacute;sticas intr&iacute;nsecas de esta, sino tambi&eacute;n de las habilidades (competencias) del sujeto en particular y, por tanto, no se puede definir prescindiendo de &eacute;stas. Teniendo en cuenta esta afirmaci&oacute;n, se puede decir que las metas m&aacute;s motivadoras son aquellas que representan un reto para el sujeto: son dif&iacute;ciles, pero &eacute;ste las percibe como asequibles. Adelgazar un kilo cada semana puede ser una meta dif&iacute;cil pero asequible; adelgazar diez quilos en una semana pr&aacute;cticamente imposible, y lo m&aacute;s probable es que produzca frustraci&oacute;n y des&aacute;nimo.</p></td>
  </tr>
</table><br/>
<table align="center" bgcolor="#fed47a" width="80%" border="1"  cellspacing="0" cellpadding="15">
  <tr>
    <td><p align="justify">La PROXIMIDAD en el tiempo de la meta ejerce una influencia m&aacute;s grande sobre la conducta que las metas a medio y largo plazo. Teniendo en cuenta que muchas de las metas que nos planteamos en la vida cotidiana son metas muy dif&iacute;ciles a medio y largo plazo (metas <em>distales</em>), una estrategia adecuada para conseguirlas puede consistir en planificar la actividad desglos&aacute;ndolas en sub-metas (<em>proximales</em>) que cumplan las caracter&iacute;sticas se&ntilde;aladas con anterioridad: espec&iacute;ficas, pr&oacute;ximas en el tiempo y que por el sujeto.</p></td>
  </tr>
</table>
<br />
<p align="justify">Adem&aacute;s de estas tres caracter&iacute;sticas se&ntilde;aladas, para conseguir la m&aacute;xima motivaci&oacute;n y el consecuente rendimiento se requiere, adem&aacute;s, otras dos condiciones importantes: que el sujeto tenga <strong>retroalimentaci&oacute;n</strong> (<em>feedback</em>) de su rendimiento y que tenga un alto grado de <strong>compromiso</strong> con las metas.</p>
<p align="justify">El compromiso se puede definir como el grado en el cual las metas se asumen como propias. Por esto, generalmente, las metas espont&aacute;neas comportan un grado m&aacute;s alto de compromiso que las metas inducidas externamente. El compromiso con estas &uacute;ltimas ser&aacute; mayor si se negocian que si se imponen, y si hay alg&uacute;n tipo de acuerdo/contrato expl&iacute;cito para cumplirlas.</p>
<p><strong><em>Clasificaci&oacute;n de motivos</em></strong></p>
<p><img src="Img/UNIDAD 4/pcb_un4img22.jpg" width="240" height="180" /></p>
<p align="justify">Las diferencias que hay entre el comportamiento de los humanos y del resto de los animales sugieren la existencia de diferencias en cuanto a los motivos o necesidades que inciden en la conducta. Algunos motivos estar&iacute;an compartidos por todas las especies animales incluida la humana, como por ejemplo, los fisiol&oacute;gicos como el hambre, la sed o el deseo sexual, pero las estrategias utilizadas para satisfacerlos podr&iacute;an ser muy diferentes. Por otra parte, el ser humano puede necesitar o desear &ldquo;cosas&rdquo; no vinculadas con la satisfacci&oacute;n de necesidades fisiol&oacute;gicas como por ejemplo, anhelar un reloj de una marca determinada o ser candidato en unas elecciones y desear ganarlas.</p>
<p align="justify">Los motivos suelen clasificarse en dos grandes categor&iacute;as: <strong>motivos primarios</strong> y <strong>motivos secundarios.</strong> Los motivos primarios son innatos o no aprendidos. Son, por lo tanto, biol&oacute;gicos, est&aacute;n determinados gen&eacute;ticamente y entran en funcionamiento desde el nacimiento. Est&aacute;n relacionados, principalmente, con la subsistencia o supervivencia del individuo y de la especie. A su vez, los motivos primarios pueden estar relacionados con las necesidades biol&oacute;gicas y con los motivos de adaptaci&oacute;n ambiental.<br />
  </p>
<p align="justify">Los motivos secundarios son motivos adquiridos o aprendidos y se denominan tambi&eacute;n motivos sociales. Est&aacute;n determinados por el medio ambiente y por la cultura que impera en este medio, y tambi&eacute;n la interacci&oacute;n que los sujetos establecen con los miembros del grupo al cual pertenecen. A diferencia de los motivos primarios, los motivos sociales no tienen como objetivo satisfacer una necesidad fisiol&oacute;gica.</p>
<p align="justify">Por otra parte, los motivos sociales pueden ejercer una gran influencia y control sobre los motivos primarios. As&iacute;, por ejemplo, una persona puede beber o comer por motivos sociales (reuni&oacute;n de amigos) y no porque tenga hambre o sed. Asimismo, puede dejar de comer por un ideal &ndash;huelga de hambre&ndash; o, por el contrario, cuando tenemos hambre podemos comer un alimento u otro sin tener en cuenta su contenido cal&oacute;rico. En este mismo sentido, la conducta sexual no tiene siempre como objetivo la reproducci&oacute;n ni se limita al per&iacute;odo de celo de la hembra, sino m&aacute;s bien se convierte en una de las experiencias m&aacute;s gratificantes del ser humano.</p>
<p><strong><em>Pir&aacute;mide de Maslow: un ejemplo de clasificaci&oacute;n de la motivaci&oacute;n</em></strong><br />
  </p>
<p align="justify">De todas las clasificaciones que se han hecho sobre los motivos o necesidades, la que ha tenido m&aacute;s popularidad ha sido la clasificaci&oacute;n propuesta por Maslow. Es una taxonom&iacute;a reducida en la cual se propone una ordenaci&oacute;n o estructuraci&oacute;n jer&aacute;rquica de los motivos, conocida con el nombre de pir&aacute;mide motivacional de Maslow (1968).</p>
<p align="justify">Maslow fue un psic&oacute;logo humanista que se&ntilde;ala que el ser humano tiene la capacidad inherente de autorrealizaci&oacute;n que le conduce a desarrollar todas sus potencialidades (realizaci&oacute;n plena de la persona). Es esta tendencia a la autorrealizaci&oacute;n y crecimiento personal la que gobierna y organiza todas las dem&aacute;s necesidades. De esta manera, Maslow propuso una jerarqu&iacute;a de motivos o necesidades estructurados en diferentes niveles, donde relaciona motivos primarios y secundarios.</p>
<div align="center">
        <object id="FlashID" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="670" height="360">
          <param name="movie" value="Swf/ContLPSBC03PBC01_4_4.swf" />
          <param name="quality" value="high" />
          <param name="wmode" value="opaque" />
          <param name="swfversion" value="15.0.0.0" />
          <!-- Esta etiqueta param indica a los usuarios de Flash Player 6.0 r65 o posterior que descarguen la versión más reciente de Flash Player. Elimínela si no desea que los usuarios vean el mensaje. -->
          <param name="expressinstall" value="Scripts/expressInstall.swf" />
          <!-- La siguiente etiqueta object es para navegadores distintos de IE. Ocúltela a IE mediante IECC. -->
          <!--[if !IE]>-->
          <object type="application/x-shockwave-flash" data="Swf/ContLPSBC03PBC01_4_4.swf" width="670" height="360">
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
    
<p align="center">&nbsp;</p>
<table  align="center" width="80%" border="1"  cellspacing="0" cellpadding="15">
  <tr>
    <td bgcolor="#FFCC66"><p align="justify">1) Fisiol&oacute;gicas: necesarias para la supervivencia del individuo y de la especie. Son las primeras que aparecen en el desarrollo ontogen&eacute;tico del individuo. Estas necesidades m&aacute;s b&aacute;sicas tienen una fuerza mayor que las situadas en niveles superiores, ya que si no se satisfacen, el hombre muere.</p></td>
  </tr>
</table>
<br />
<table  align="center" width="80%" border="1" cellspacing="0" cellpadding="15">
  <tr>
    <td bgcolor="#FFCC66"><p align="justify">2) Seguridad: necesarias para garantizar la vida del individuo en su relaci&oacute;n con el ambiente. Seg&uacute;n Maslow, ciertos productos t&iacute;picamente humanos como la superstici&oacute;n, la religi&oacute;n o la ciencia, estar&iacute;an motivados en parte por esta necesidad.</p></td>
  </tr>
</table>
<br />
<table  align="center" width="80%" border="1"  cellspacing="0" cellpadding="15">
  <tr>
    <td bgcolor="#FFCC66"><p>3) Afiliaci&oacute;n: tambi&eacute;n denominadas de afecto o de pertenencia. Necesidad de pertenecer a grupos sociales y ser estimados (aceptar y ser aceptado por grupos de referencia: pareja, familia, amigos, sociedad).</p></td>
  </tr>
</table>
<br />
<table  align="center" width="80%" border="1"  cellspacing="0" cellpadding="15">
  <tr>
    <td bgcolor="#FFCC66"><p align="justify">4) Reconocimiento y autoestima. Necesidades orientadas&nbsp; socialmente, como el deseo de una relaci&oacute;n &iacute;ntima con otra persona o ser aceptado como miembro de un grupo organizado. Las necesidades de estima pueden subdividirse en dos clases: 1) las que se refieren al amor propio, y; y 2) las que se refieren al respeto de otros; reputaci&oacute;n, condici&oacute;n, &eacute;xito social, fama, gloria y otras parecidas.</p></td>
  </tr>
</table>
<br />
<table  align="center" width="80%" border="1" cellspacing="0" cellpadding="15">
  <tr>
    <td bgcolor="#FFCC66"><p>5) Autorrealizaci&oacute;n. Incluye la necesidad de llegar a ser lo que uno pretende, desarrollar las potencialidades propias seg&uacute;n un plan establecido previamente o la realizaci&oacute;n de un proyecto vital.</p></td>
  </tr>
</table>
<p><strong><em>Conflictos motivacionales</em></strong><br />
</p>
<p align="justify">Por <em>conflicto emocional</em> se entiende, en general, la existencia de dos (o m&aacute;s) respuestas o tendencias de acci&oacute;n de la misma intensidad, pero incompatibles entre s&iacute;. La situaci&oacute;n conflictiva genera una tensi&oacute;n que se caracteriza por la vacilaci&oacute;n, la incerteza, la fatiga, la ausencia temporal de respuesta o el bloqueo.<br />
</p>
<p align="justify">Ejemplos de conflictos emocionales: Mar&iacute;a Jos&eacute; ha aprobado la selectividad y tiene que decidir que carrera quiere estudiar; la que le gusta (magisterio) tiene poca salida profesional, y la que sus padres quieren que haga (econ&oacute;micas) es m&aacute;s rendible, pero a ella no le gusta. Juan tiene que decidir si sale esta noche con Ana o con Luisa; las dos chicas le gustan. Lu&iacute;s tiene que elegir entre pasar el fin de semana con sus amigos en la playa o ayudar a sus padres en el negocio familiar, mientras que Antonio, tiene que optar por hacer la limpieza de su casa o, por el contrario, ir al cine a ver una pel&iacute;cula del su director preferido.</p>
<p align="justify">Las situaciones anteriores implican alg&uacute;n tipo de decisi&oacute;n que la persona tiene que tomar. Tiene que escoger necesariamente una de las dos alternativas y no puede quedarse con las dos. El hecho de tener que decidir entre dos opciones genera, en la mayor&iacute;a de los casos, lo que se denomina <em>conflicto motivacional</em>.
</p>
<p align="center"><img src="Img/UNIDAD 4/pcb_un4img24.jpg" width="203" height="248" /></p>
<p><strong>La frustraci&oacute;n</strong><br />
  </p>
<p align="justify">La frustraci&oacute;n se puede definir como el estado emocional que se genera cuando un comportamiento motivado se encuentra bloqueado por alg&uacute;n obst&aacute;culo. La persona no puede conseguir o acceder a sus objetivos deseados, lo cual le genera un estado emocional negativo. En otras palabras, cuando no podemos tener lo que queremos porque hay alg&uacute;n impedimento, se experimenta una vivencia emocional desagradable, que va desde la confusi&oacute;n, la tensi&oacute;n o inquietud, hasta el enfado e incluso la agresi&oacute;n, y en &uacute;ltima instancia la desorganizaci&oacute;n de la conducta.</p>
<p align="center"><img src="Img/UNIDAD 4/pcb_un4img25.jpg" width="76" height="90" /></p>
<p><strong><br />
</strong> </p><table width="100%" border="0" height="100%">
      <tr>
        <td width="20%"><div align="center"><a href= "ContLPSBC03PBC01_4_2_0.jsp" ><img src="Img/REGRESAR.png" width="99" height="32" /></a></div></td>
        <td class="label_Conceptual"><strong>4.3 MOTIVACI&Oacute;N</strong></td>
        <td width="20%"><div align="center"><a href= "ContLPSBC03PBC01_4_3_1.jsp" ><img src="Img/AVANZAR.png" width="99" height="32"/></a></div></td>
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
