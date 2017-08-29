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
 	<h2><strong>1.3.1 Representaci&oacute;n mental</strong></h2>
    <p align="justify">Se puede distinguir entre representaciones mentales anal&oacute;gicas y proposicionales. La imagen visual es la representaci&oacute;n anal&oacute;gica protot&iacute;pica, pero hay otras como las auditivas, olfativas o t&aacute;ctiles. El perfume de una rosa puede ser evocado a trav&eacute;s de una imagen olfativa, lo que significar&iacute;a que estar&iacute;a internamente representado por una imagen olfativa tambi&eacute;n en nuestras mentes. Las im&aacute;genes son representaciones mentales concretas, formas de &ldquo;ver&rdquo; las cosas, los fen&oacute;menos, a las que se recurre para recuperar y captar la esencia de las mismas, cuanto menos, los detalles que han resultado relevantes al individuo que las construye.<br />
      </p>
    <p align="justify">Seg&uacute;n Garnham y Oakhill (1994), la teor&iacute;a de los modelos mentales responde sobre la naturaleza del pensamiento, en virtud a la representaci&oacute;n que hacen las personas de una parte del mundo en un modelo mental que refleja su estructura; manipulando dicho modelo para reflejar los potenciales cambios en aquella parte de la realidad sobre la que est&aacute;n pensando. Prosiguen estos autores que, las situaciones familiares son m&aacute;s f&aacute;ciles de manipular que las extra&ntilde;as, pues las personas prefieren recuperar los modelos almacenados en la memoria que manipular un asunto en la memoria operativa (de corto plazo y m&aacute;s dificultoso) (Moreno, 1999).<br />
      </p>
    <p align="justify">Esto quiere decir que, el pensamiento de las personas opera en una racionalidad limitada (Simon, 1955) o con un sentido atribucional f&aacute;cil de recuperar, para ofertar respuestas a sus problemas. Entendemos, consecuentemente, que la representaci&oacute;n del mundo (o de parte de &eacute;l) que tienen las personas, se agrupa en una estructura de modelos que intenta responder y solucionar los problemas que, cotidianamente, se les plantean a los individuos. El mismo Wittgenstein, en su ya cl&aacute;sica obra //Tractatus Logico-Philos&oacute;phicus//, habla de la figura y lo figurado y especula con su pretensi&oacute;n l&oacute;gica acerca de si la figura representa lo figurado. Sin entrar a un debate m&aacute;s profundo, simplemente diremos que las personas tienden a pensar que sus representaciones sobre el mundo son, m&aacute;s o menos, ciertas y, que los pensamientos de ellas derivadas tienen una atribuci&oacute;n an&aacute;loga a la otorgada al modelo del que partieron.<br />
      </p>
    <p align="justify">C&oacute;mo se forman estos modelos mentales y cu&aacute;l es su desarrollo y evoluci&oacute;n a lo largo de la vida de las personas, es algo que hoy est&aacute; a&uacute;n en ciernes (v&eacute;ase la obra de J.W. Astington, 1.993, para profundizar en este tema). Lo que s&iacute; es cierto es que si les preguntas a esas personas sobre alg&uacute;n asunto, muestran una tendencia a responder (aunque sea &quot;no lo s&eacute;&quot;) y que, de alg&uacute;n modo, en esa respuesta se contiene una representaci&oacute;n sobre el asunto inquirido, o bien que no tiene representaci&oacute;n alguna en ese momento sobre el tema. Para lo que a continuaci&oacute;n sigue, interesa caer en la cuenta que un modelo mental es una forma de autorregulaci&oacute;n con respecto al entorno y, como se desprende, las personas calibran su interacci&oacute;n con vistas a generar esquemas organizativos (Piaget) que, a la postre, derivan en modelos de interpretaci&oacute;n del mundo circundante. &iquest;Por qu&eacute; ocurre esto? Sencillamente porque el mundo nos es dado; a priori, no es generado por nosotros. Ni tan siquiera el nacer es asunto de nuestra elecci&oacute;n. Gen&eacute;ticamente programados, pulsiones e instintos, buscan la supervivencia del individuo; sin embargo, un interaccionismo socio-cultural impresionante, nos aguarda para que el programa gen&eacute;tico se complemente con programas interactivos de diverso orden y nivel. El acceso a semejantes programas interactivos se realiza mediante estructuras cognitivas que los permeabilizan en orden a signos y s&iacute;mbolos que representan momentos, espacios y relaciones de la interacci&oacute;n.<br />
      </p>
    <p align="justify">Representar es presentar, en la mente, el mundo o la realidad. Sin embargo, representar no es la realidad misma (no podemos meter objetos en nuestro cerebro), sino una realidad transformada por los mecanismos perceptivos y cognitivos de quien representa. La integraci&oacute;n del sistema cognitivo, lo que hace es compilar las partes -la informaci&oacute;n por separado recibida y emitida- para formar una estructura que se ensamble operativa y adaptativamente a la realidad. La acci&oacute;n del sistema cognitivo es de conjunto: la percepci&oacute;n, la memoria, la motivaci&oacute;n, las emociones o lo que com&uacute;nmente llamamos inteligencia, funciona como un todo; program&aacute;ndose de forma conjunta para establecer una representaci&oacute;n lo suficientemente adaptativa para que permita al organismo sobrevivir. No se puede separar el pensamiento de los afectos, ni la percepci&oacute;n de la memoria. La representaci&oacute;n es lo que da esa visi&oacute;n de conjunto, es lo que interpreta al mundo y la posici&oacute;n del int&eacute;rprete en &eacute;l. El gui&oacute;n del universo no ha sido escrito por los seres humanos, por lo que nosotros interpretamos nuestro papel al igual que una planta, una piedra u otro ser vivo. Puesto que la mente no compila objetos ni hechos en s&iacute;, entendemos que utiliza representaciones de aquellos; esto es s&iacute;mbolos, figuras, signos o similares para ser manejados cognitivamente. Para entender que esas representaciones efectivamente son lo que representan, nosotros calibramos las mismas y ajustamos las partes para interaccionar con el medio (que a fin de cuentas es el que nos proporciona el sustento). M&aacute;s dicha calibraci&oacute;n no es perfecta. Est&aacute; sujeta a los umbrales perceptivos, a la accesibilidad de informaciones significativas, a que nuestra memoria retenga cuestiones vitales, a que nuestras operaciones mentales lleguen a sus prop&oacute;sitos y puede que hasta el azar tenga algo que ver con alguna cuesti&oacute;n suelta. Demasiados condicionantes como para que aspiremos a un ajuste perfecto entre los mecanismos cognitivos y la realidad que procesan. Estamos programados para realizar una calibraci&oacute;n, si bien, la forma de llevarla a cabo es una opci&oacute;n que pertenece al individuo.<br />
      </p>
    <p align="justify">En otro orden de ideas, es importante comentar que la memoria a largo y corto plazo son los medios conductores de toda representaci&oacute;n mental que tenemos en nuestra cotidianeidad.<br />
      </p>
    <p align="justify">En temas posteriores &nbsp;hablaremos m&aacute;s a fondo respecto a temas de memoria, percepci&oacute;n y aprendizaje, lo que nos ocupa rescatar para este tema es que la percepci&oacute;n consiste en asignar significado a los est&iacute;mulos que nos llegan; la atenci&oacute;n consiste en asignar recursos cognitivos a las tareas que hay que realizar.<br />
      </p>
    <p align="justify">La percepci&oacute;n comienza en los receptores sensoriales, cada uno de los cuatro sentidos posee un registro sensorial, pero la mayor parte de algunas investigaciones se han centrado en el registro visual (&iacute;cono) y en el auditivo (eco). Los registros sensoriales son dep&oacute;sitos donde se almacena durante un breve periodo de tiempo la informaci&oacute;n sin procesar. Permiten analizar los est&iacute;mulos que llegan al comienzo de la percepci&oacute;n.<br />
      </p>
    <p align="justify">En la percepci&oacute;n intervienen los procesos de reconocimiento de patrones, en los que la persona utiliza su conocimiento para tomar decisiones sobre el significado de los est&iacute;mulos. No est&aacute;n claros los mecanismos exactos del reconocimiento de patrones, pero muchos aspectos de la percepci&oacute;n se ajustan al empleo de prototipos, rasgos distintivos o descripciones estructurales (es all&iacute; donde entran las representaciones mentales). El conocimiento previo y el contexto influyen tanto en la percepci&oacute;n como en el reconocimiento de patrones.<br />
      </p>
    <p align="justify">La capacidad y duraci&oacute;n de la memoria a corto plazo, al igual que la memoria sensorial, son muy limitadas. Miller (1956) indic&oacute; que retenemos aproximadamente siete elementos de informaci&oacute;n a la vez en la memoria de trabajo, informaci&oacute;n que se olvida con rapidez debido a la interferencia, el desvanecimiento y su sustituci&oacute;n por otra nueva. <br />
      </p>
    <p align="justify">Las investigaciones de Stenberg (1975) indican que buscamos informaci&oacute;n en la memoria a corto plazo de forma consecutiva y exhaustiva. La transici&oacute;n de la memoria a corto plazo a la memoria de trabajo comprende un control ejecutivo central que coordina los sistemas dependientes&nbsp; que son responsables de retener la informaci&oacute;n verbal y espacial. Algunas evidencias indican que cada subsistema posee recursos &uacute;nicos que permiten a las personas repartir la carga de procesamiento de la informaci&oacute;n.</p>
<p align="justify">Hasta el momento se ha observado que el conocimiento del mundo que poseen las personas influye profundamente en ellas. Hemos analizado que la memoria a largo plazo almacena el conocimiento, el siguiente esquema ayuda a situar la informaci&oacute;n en la memoria a largo plazo, proceso que suele denominar codificaci&oacute;n. Como cabr&iacute;a esperar, la codificaci&oacute;n ejerce una importante influencia en otros procesos cognitivos, como el almacenamiento y la recuperaci&oacute;n, de momento nos centraremos en las estrategias que nos ayudan a codificar la informaci&oacute;n.
    </p>
<p align="center"><img src="Img/UNIDAD 1/pcb_un1img14.jpg" width="656" height="492" /></p>
<p align="justify">Proceso que consiste en situar la informaci&oacute;n en la memoria a largo plazo, misma que ejerce una importante influencia en otros procesos cognitivos, como el almacenamiento (c&oacute;mo guarda la informaci&oacute;n en la memoria) y la recuperaci&oacute;n (c&oacute;mo se recupera la informaci&oacute;n de la memoria). De momento nos centraremos en las estrategias que nos ayudan a codificar la informaci&oacute;n.</p>
<table width="25%" border="1" bgcolor="#fed47a" cellspacing="0" cellpadding="10">
  <tr>
    <td><a href="#" onclick="mostrarOcultarTablas('evento1');" title="Haz clic sobre la imagen"><p><strong>1. Informaci&oacute;n simple</strong></p></a></td>
  </tr>
</table>
<p>&nbsp;</p>
<div id="evento1" style="display:none"><p align="justify">El  modo de procesar la informaci&oacute;n que hay que recordar influye en lo bien que la  recordamos. En concreto la manera en que repasamos la informaci&oacute;n influye en la  calidad del recuerdo (Bruning, 2002).</p>
<p align="justify">Para examinar con m&aacute;s detalle el repaso, se  tomar&aacute; como ejemplo a dos alumnas de sexto curso que est&aacute;n preparando una  prueba&nbsp; de deletreo.&nbsp; Para lo que nos proponemos, debemos suponer  que las dos ni&ntilde;as&nbsp; tienen la misma  capacidad, excepto por el modo en que repasan las palabras que deben deletrear.</p>
<p>&nbsp;</p>
<div align="center">
  <table width="76%" border="1" cellspacing="0" cellpadding="10">
    <tr>
      <td width="50%" bgcolor="#fed47a" cellspacing="0" cellpadding="10"><p align="center"><strong>Susana</strong></p></td>
      <td width="50%" bgcolor="#fed47a" cellspacing="0" cellpadding="10"><p align="center"><strong>Perlita</strong></p></td>
      </tr>
    <tr>
      <td><p align="justify">Comienza al principio de la lista, lee la primera palabra y la deletrea para s&iacute;, una y otra vez (&laquo;familiar - f, a, m,i...&raquo;). Lo hace seis veces con cada una de las veinticinco palabras de la lista.</p></td>
      <td><p align="justify">Tambi&eacute;n comienza leyendo la primera palabra, pero repasa la informaci&oacute;n de modo distinto, dividiendo las palabras en palabras m&aacute;s cortas y en s&iacute;labas que ya sabe deletrear ( &laquo;familiar-fam,i,liar&raquo;, esto es, &laquo;fam&raquo; [familia],  &laquo;i&raquo;[yo], &laquo;liar&raquo; [mentiroso], tambi&eacute;n repasa seis veces cada palabra de la lista.</p></td>
      </tr>
  </table>
</div>
<div>
  <div>
        <p align="justify">Si pasamos a ambas a una prueba de deletreo despu&eacute;s de que hayan acabado de estudiar las palabras, es muy probable que perlita obtenga una mejor calificaci&oacute;n que Susana, la raz&oacute;n de la diferencia es evidente, aunque no est&eacute; clara para las alumnas de sexto: la manera en que se ha repasado la informaci&oacute;n influye en su recuerdo.<br />
          </p>
        <p align="justify">Normalmente, el repaso que Susana realiza se denomina <em>repaso de mantenimiento</em> (Craik, 1979) y consiste en reciclar directamente la informaci&oacute;n para mantenerla activa en la memoria a corto plazo, por ejemplo, haber repetido un n&uacute;mero de tel&eacute;fono para s&iacute; hasta haberlo marcado , que estuviera comunicando y haber tenido que volver a buscarlo dos minutos despu&eacute;s para volver a llamar.<br />
          </p>
        <p align="justify">El <em>repaso de elaboraci&oacute;n</em> se opone al de mantenimiento, es toda forma de repaso en que la informaci&oacute;n que hay que recordar se relaciona con otra.</p>
          </div>
  </div></div>
<table width="25%" border="1" bgcolor="#fed47a" cellspacing="0" cellpadding="10">
  <tr>
        <td><a href="#" onclick="mostrarOcultarTablas('evento2');" title="Haz clic sobre la imagen"><p><strong>1.1 Mediaci&oacute;n</strong></p></a></td>
      </tr>
  </table>
  
   <p>&nbsp;</p>
   <div id="evento2" style="display:none"> <p>Una de las estrategias de codificaci&oacute;n m&aacute;s sencillas en que se emplea la elaboraci&oacute;n es la mediaci&oacute;n, que consiste en ligar un elemento dif&iacute;cil de recordar a algo m&aacute;s significativo.</p></div>
   
    <table width="25%" border="1" bgcolor="#fed47a" cellspacing="0" cellpadding="10">
      <tr>
        <td><a href="#" onclick="mostrarOcultarTablas('evento3');" title="Haz clic sobre la imagen"><p><strong>1.2 Im&aacute;genes</strong></p></a></td>
      </tr>
    </table>
    <p>&nbsp;</p>
    <div id="evento3" style="display:none"><p align="justify">El empleo de im&aacute;genes constituye un importante complemento de la codificaci&oacute;n verbal, las im&aacute;genes suelen producir un mayor rendimiento de la memoria (Clark y Paivio, 1991). No obstante, hay que hacer algunas salvedades al hablar de los efectos facilitadores de las im&aacute;genes. La primera es el valor de la imagen del material que hay que aprender. Por ejemplo, la palabra coche provoca una imagen con mucha m&aacute;s facilidad que la palabra verdad. Del mismo modo turbante provoca con facilidad una imagen clara, cosa que no sucede con libertad.<br />
  </p>
    <p align="justify">Las palabras que provocan im&aacute;genes con facilidad tienden a recordarse mejor que las que no lo hacen, incluso cuando no hay instrucciones de utilizar im&aacute;genes (Paivio, 1986). Cuando se instruye a los sujetos para que lo hagan, la diferencia es a&uacute;n m&aacute;s pronunciada. La utilizaci&oacute;n de im&aacute;genes mejora incluso el recuerdo de s&iacute;labas sin sentido.</p></div>
    
    <table width="25%" border="1" bgcolor="#fed47a" cellspacing="0" cellpadding="10">
      <tr>
        <td><a href="#" onclick="mostrarOcultarTablas('evento4');" title="Haz clic sobre la imagen"><p><strong>1.3 Mnemotecnias</strong></p></a></td>
      </tr>
    </table>
    <p>&nbsp;</p>
    <div id="evento4" style="display:none"><p align="justify">Las mnemotecnias son estrategias memor&iacute;sticas que ayudan a recordar la informaci&oacute;n. Normalmente consiste en emparejar la informaci&oacute;n que hay que aprender con informaci&oacute;n bien aprendida para recordarla mejor.<br />
  </p>
<p align="justify">Entre las mnemotecnias se hallan el empleo de rimas (treinta d&iacute;as trae septiembre, con abril, junio y noviembre), gestos (en f&iacute;sica,&nbsp; &ldquo;la regla de la mano derecha es una mnemotecnia para determinar el flujo de un campo magn&eacute;tico en torno a&nbsp; una corriente, y la posici&oacute;n de los dedos alrededor del conductor muestra la direcci&oacute;n del campo magn&eacute;tico&rdquo;) e im&aacute;genes.</p></div>

<table width="25%" border="1" bgcolor="#fed47a" cellspacing="0" cellpadding="10">
  <tr>
    <td><a href="#" onclick="mostrarOcultarTablas('evento5');" title="Haz clic sobre la imagen"><p><strong>2. Informaci&oacute;n Compleja</strong></p></a></td>
  </tr>
</table>

<p>&nbsp;</p>
<div id="evento5" style="display:none"><p align="justify">Aprender informaci&oacute;n compleja es un proceso de construcci&oacute;n. El aprendiz eficaz emplea de diversas formas lo que sabe para organizar y enriquecer la informaci&oacute;n nueva y sumarlo a ella.</p></div>

<table width="30%" border="1" bgcolor="#fed47a" cellspacing="0" cellpadding="10">
  <tr>
    <td><a href="#" onclick="mostrarOcultarTablas('evento6');" title="Haz clic sobre la imagen"><p><strong>2.1 Organizadores previos</strong></p></a></td>
  </tr>
</table>

<p>&nbsp;</p>
<div id="evento6" style="display:none"><p align="justify">Los organizadores previos son formas de representaci&oacute;n donde se muestran las perspectivas generales de la informaci&oacute;n nueva que se ofrece al espectador antes de present&aacute;rsela. Ausubel (1960,1968), que concibi&oacute; los organizadores previos para utilizarlos con material de lectura, sosten&iacute;a que es m&aacute;s f&aacute;cil aprender informaci&oacute;n nueva cuando se relaciona con informaci&oacute;n bien organizada que ya existe en la memoria. <br />
</p>
<p align="justify">Desde el punto de vista de Ausubel, los organizadores previos ofrecen al alumno una especie de &ldquo;andamiaje&rdquo; con el cual relaciona el material m&aacute;s detallado.<br />
</p>
<p align="justify">Los organizadores deben resultar familiares al alumno y aprenderse bien. Adem&aacute;s de contener un ejemplo y ser concretos, familiares y estar bien aprendidos, los organizadores previos pueden adoptar muchas formas: discusiones, breves segmentos de un texto, diagramas esquem&aacute;ticos, dibujos, etc.</p></div>

<table width="30%" border="1" bgcolor="#fed47a" cellspacing="0" cellpadding="10">
  <tr>
    <td><a href="#" onclick="mostrarOcultarTablas('evento7');" title="Haz clic sobre la imagen"><p><strong>2.2 Activaci&oacute;n de esquemas</strong></p></a></td>
  </tr>
</table>

<p>&nbsp;</p>
<div id="evento7" style="display:none"><p align="justify">La activaci&oacute;n de esquemas (Pearsons, 1984) es otro enfoque que hace hincapi&eacute; en relacionar la informaci&oacute;n nueva con conocimiento previo del alumno, como medio de mejorar el aprendizaje. La activaci&oacute;n de esquemas se refiere a diversos m&eacute;todos concebidos para activar esquemas relevantes antes de una actividad de aprendizaje.<br />
</p>
<p align="justify">La idea subyace a la activaci&oacute;n de esquemas es que los alumnos de cualquier edad poseen conocimiento relevante con el que relacionar informaci&oacute;n nueva.<br />
  </p>
<p align="justify">La activaci&oacute;n de esquema es un procedimiento general para mejorar la codificaci&oacute;n de la informaci&oacute;n nueva. Implica que los alumnos describan ejemplos de su experiencia, realicen experimentos, revisen el aprendizaje anterior o empleen el contexto en el que se presenta el material nuevo.<br />
  </p>
<p align="justify">En general se considera activaci&oacute;n de esquemas todo procedimiento de ense&ntilde;anza que ayude a los alumnos a tender puentes conceptuales entre lo que ya saben&nbsp; y lo que deben aprender.</p></div>

<table width="25%" border="1" bgcolor="#fed47a" cellspacing="0" cellpadding="10">
  <tr>
    <td><a href="#" onclick="mostrarOcultarTablas('evento8');" title="Haz clic sobre la imagen"><p><strong>2.3 Atenci&oacute;n selectiva</strong></p></a></td>
  </tr>
</table>
<p>&nbsp;</p>
<div id="evento8" style="display:none"><p align="justify">Responder a preguntas de un texto, antes, durante y despu&eacute;s de la lectura, mejora mucho la comprensi&oacute;n de la informaci&oacute;n relacionada con las preguntas. La comprensi&oacute;n mejora mucho porque los lectores centran la atenci&oacute;n de modo selectivo en la informaci&oacute;n relevante para las preguntas. Una consecuencia interesante de esta estrategia es que los alumnos aprenden m&aacute;s sin dedicar m&aacute;s tiempo- tal vez dedic&aacute;ndole menos- a la tarea, lo que se produce porque suelen aumentar la intensidad de la atenci&oacute;n al leer informaci&oacute;n relacionada con las preguntas. Esto es as&iacute; sobre todo cuando las preguntas aparecen antes de la lectura o durante la misma.</p></div>

<table width="30%" border="1" bgcolor="#fed47a" cellspacing="0" cellpadding="10">
  <tr>
    <td><a href="#" onclick="mostrarOcultarTablas('evento9');" title="Haz clic sobre la imagen"><p><strong>2.4 Niveles de procesamiento</strong></p></a></td>
  </tr>
</table>
<p>&nbsp;</p>
<div id="evento9" style="display:none"><p align="justify">La perspectiva de los niveles de procesamiento considera que el recuerdo de la informaci&oacute;n nueva es consecuencia de los an&aacute;lisis perceptivos y cognitivo de la informaci&oacute;n que el aprendiz realiza.<br />
  </p>
<p align="justify">Por una parte, si la base sem&aacute;ntica o el significado de la informaci&oacute;n nueva es el centro del procesamiento, la informaci&oacute;n se almacena en un c&oacute;digo de memoria sem&aacute;ntica&nbsp; y se recuerda bien; por otra si s&oacute;lo se analizan sus aspectos superficiales y poco profundos, se recuerda peor. </p>
<p align="justify">En t&eacute;rminos de Craik y Lockhart, el recuerdo depende de la profundidad del procesamiento.<br />
  </p>
<p align="justify">El procesamiento profundo es el que se centra en el significado, el procesamiento superficial es el que lo hace en aspectos superficiales del material nuevo.<br />
  </p>
<p align="justify">Para finalizar, las representaciones proposicionales son &ldquo;tipo-lenguaje&rdquo;, pero un lenguaje de la mente, no consciente, que se podr&iacute;a llamar &ldquo;mentales&rdquo;.</p></div>

<table width="30%"border="1" bgcolor="#fed47a" cellspacing="0" cellpadding="10">
  <tr>
    <td><a href="#" onclick="mostrarOcultarTablas('evento10');" title="Haz clic sobre la imagen"><p><strong>2.5 Procesos metacognitivos</strong></p></a></td>
  </tr>
</table>
<div id="evento10" style="display:none"><p align="justify">La metacognici&oacute;n se refiere al conocimiento del conocimiento, el pensamiento sobre el pensamiento, y se trata de procesos autorregulatorios del funcionamiento de procesos cognitivos m&aacute;s espec&iacute;ficos. Tienen una importancia capital en el aprendizaje. Son los sistemas de alerta y de consciencia que han de acompa&ntilde;ar a toda labor intelectual.<br />
  </p>
<p align="justify">Se trata de procesos cognitivos inferidos cuando el sujeto &ldquo;se da cuenta&rdquo; s&uacute;bitamente de la soluci&oacute;n correcta, o de la falta de comprensi&oacute;n que le somete a releer de nuevo el texto, o de la sensaci&oacute;n de falta de planificaci&oacute;n de la tarea que le propone a s&iacute; mismo la utilizaci&oacute;n de procedimientos paso a paso, o de la toma de contacto con la realidad cuando pensamientos distractores nos sit&uacute;an fuera de la tarea, o cuando el resultado de nuestro trabajo no sacia los objetivos propuestos y nos preparamos de nuevo a la tarea empleando otros m&eacute;todos, o tambi&eacute;n cuando dichos objetivos s&iacute; se ven alcanzados y nos invade una sensaci&oacute;n agradable &nbsp;de la misi&oacute;n cumplida.<br />
  </p>
<p align="justify">Los procesos cognitivos que operan sobre el pensamiento, es decir metacognitivos, pueden llegar tambi&eacute;n a ser autom&aacute;ticos o no conscientes por raz&oacute;n de la experiencia en el campo que desarrollemos. Podremos hablar entonces de componentes ejecutivos (procesos metacognitivos generales y espec&iacute;ficos) y no ejecutivos (procesos cognitivos); y ambos en funci&oacute;n del tipo de elaboraci&oacute;n intelectual que estemos desarrollando en cada tarea (de tipo local o de tipo global). Todo el control pasa de los componentes ejecutivos al sistema cognitivo; y toda la informaci&oacute;n pasa del sistema cognitivo a los componentes ejecutivos que la analizan.<br />
  </p>
<p align="justify">Por &uacute;ltimo, los conocimientos previos que poseemos en determinado campo ser&aacute;n utilizados como base de conocimientos locales por los procesos metacognitivos espec&iacute;ficos; y los conocimientos generales acerca del mundo y la realidad ser&aacute;n utilizados por los procesos metacognitivos generales para conseguir el &uacute;ltimo objetivo del aprendizaje, su transferencia a nuevos campos y su poder para modificar los esquemas de realidad que poseemos.<br />
  </p>
<p align="justify">Las estrategias metacognitivas pretenden la mejora del funcionamiento de los procesos metacognitivos generales de <strong>AUTOCONOCIMIENTO </strong>y <strong>AUTOCONTROL </strong>del sujeto en las tareas de aprendizaje.<br />
  </p>
<p align="justify">Las estrategias  metacognitivas generales se refieren a las variables de los procesos  mencionados como son las<strong> estrategias de  conocimiento del sujeto, de la tarea y de la estrategia</strong>; as&iacute; como las <strong>estrategias de control referidas a la  planificaci&oacute;n</strong>, <strong>supervisi&oacute;n y  evaluaci&oacute;n</strong> de los procesos cognitivos presentes en los aprendizajes  (Mart&iacute;n, F. y Mart&iacute;n, E., 2012).</p>
<p align="justify">Te invitamos a  resolver la actividad de aprendizaje 1.3, la cual forma parte de tu  calificaci&oacute;n. Mucho &eacute;xito.</p></div>

<a href="../../../../ActApart.jsp?unidad=1&amp;apartado=3">
 <h2>ACTIVIDAD DE APRENDIZAJE 1.3<br /></h2></a>
  </p>
</p>
<div> </div><table width="100%" border="0" height="100%">
      <tr>
        <td width="20%"><div align="center"><a href= "ContLPSBC03PBC01_1_3_0.jsp" ><img src="Img/REGRESAR.png" width="99" height="32" /></a></div></td>
        <td class="label_Conceptual">1.3 MODELOS DE REPRESENTACI&Oacute;N MENTAL</td>
        <td width="20%"><div align="center"><a href= "ContLPSBC03PBC01_1_4_0.jsp" ><img src="Img/AVANZAR.png" width="99" height="32"/></a></div></td>
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
