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
 	<h2><strong>2.2.2 CARACTER&Iacute;STICAS Y FUNCIONES DE LA ATENCI&Oacute;N</strong> 	</h2>
 	<p align="justify">Te invito a que des clic sobre la imagen para que observes las caracter&iacute;sticas m&aacute;s importantes de la atenci&oacute;n</p>
    <div>
      <div> </div>
    </div>
    <div align="center">
      <table width="80%" border="2" cellspacing="0" cellpadding="10">
        <tr>
          <td width="50%"><div id="evento1" style="display:none"><p><strong>Intensidad</strong><strong>: </strong></p>
            <p align="justify">Se refiere a la cantidad de atenci&oacute;n que prestamos a un objeto o tarea.</p>
            <p align="justify">Est&aacute; directamente relacionada con el nivel de alerta y vigilancia y no esconstante.</p></div></td>
          <td width="50%"><a href="#" onclick="mostrarOcultarTablas('evento1');" title="Haz clic sobre la imagen"><div align="center"><img src="Img/UNIDAD 2/pcb_un2img22.png" width="256" height="240" /></div></a></td>
          </tr>
        <tr>
          <td><div align="center"><a href="#" onclick="mostrarOcultarTablas('evento2');" title="Haz clic sobre la imagen"><img src="Img/UNIDAD 2/pcb_un2img23.jpg" width="252" height="200" /></a></div></td>
          
          <td><div id="evento2" style="display:none"><p><strong>Amplitud: </strong></p>
            <p align="justify">Se refiere tanto a la cantidad de informaci&oacute;n que se puede atender a la vez como al n&uacute;mero de tareas que se pueden realizar simult&aacute;neamente. Es limitada y depende de una serie de caracter&iacute;sticas como el tipo de informaci&oacute;n que se ha de atender, el nivel de dificultad de las tareas y el nivel de pr&aacute;ctica.</p></div></td>
          </tr>
        <tr>
          <td><div id="evento3" style="display:none"><p><strong>Selectividad</strong><strong>:</strong></p>
            <p align="justify">Se refiere al tipo de est&iacute;mulos o de tareas que se seleccionan. La selecci&oacute;n, realizada en parte por exigencias de la limitaci&oacute;n de la amplitud, se realizatanto a nivel cualitativo (tipo de est&iacute;mulos o de tareas) como cuantitativo (n&uacute;mero de est&iacute;mulos o de tareas).</p></div></td>
          
          <td><div align="center">&gt;<a href="#" onclick="mostrarOcultarTablas('evento3');" title="Haz clic sobre la imagen"><img src="Img/UNIDAD 2/pcb_un2img24.jpg" width="240" height="210" /></a></div></td>
          </tr>
        <tr>
          <td><div align="center">&gt;<a href="#" onclick="mostrarOcultarTablas('evento4');" title="Haz clic sobre la imagen"><img src="Img/UNIDAD 2/pcb_un2img25.JPG" width="252" height="171" /></a></div></td>
          <td><div id="evento4" style="display:none"><p><strong>Oscilamiento:</strong></p>
            <p align="justify">Se refiere al continuo cambio u oscilamiento que realiza la atenci&oacute;n cuando el sujeto tiene que atender diferentes tareas o procesar dos o m&aacute;s tipos de informaci&oacute;n al mismo tiempo.</p></div></td>
          </tr>
        <tr>
          <td><div id="evento5" style="display:none"><p><strong>Control:</strong> </p>
            <p align="justify">Para algunos autores como Tudela (1992), el control es una de las funciones m&aacute;s importantes de la atenci&oacute;n pues caracteriza la mayor&iacute;a de las actividades que responden a unos objetivos y requieren unas respuestas determinadas. Ruiz - Vargas (1993) describe diferentes modelos de control de la atenci&oacute;n y considera que la idea de control significa dirigir el pensamiento y la acci&oacute;n hacia una meta.</p></div></td>
            
          <td><div align="center"><a href="#" onclick="mostrarOcultarTablas('evento5');" title="Haz clic sobre la imagen"><img src="Img/UNIDAD 2/pcb_un2img26.jpg" width="240" height="187" /></a></div></td>
          </tr>
      </table>
    </div>
    <p>Algunas de estas caracter&iacute;sticas son la base de diferentes clasificaciones que se han hecho de la atenci&oacute;n.</p>
    <p><strong>Factores que intervienen en la atenci&oacute;n</strong></p>
    <p>Esta selecci&oacute;n de la informaci&oacute;n depender&aacute;, por un lado, de factores externos o ambientales, por otro, de factores propios del sujeto. </p>
<p align="center">&nbsp;</p>
<p align="center"><img src="Img/UNIDAD 2/pcb_un2img27.jpg" width="576" height="320" /></p>
<p>Dentro de <strong><em>los factores externos</em></strong>, intervienen:</p>
<div align="center">
  <table width="85%" border="1" cellspacing="5" cellpadding="10">
    <tr>
      <td bgcolor="#FED47A"><p align="justify">a) <strong>Las caracter&iacute;sticas de los est&iacute;mulos </strong>en funci&oacute;n de su intensidad: as&iacute;, nuestra atenci&oacute;n se dirige m&aacute;s f&aacute;cilmente hacia est&iacute;mulos m&aacute;s intensos; en los ni&ntilde;os peque&ntilde;os se observa su preferencia por objetos de colores vivos.</p></td>
      </tr>
    <tr>
      <td bgcolor="#FED47A"><p align="justify">b<strong>) L<em>a novedad </em></strong>supone tambi&eacute;n una de las caracter&iacute;sticas que determinan la atenci&oacute;n; de esta manera dejamos de atender a un objeto que se presenta permanentemente para fijar la atenci&oacute;n sobre otro que aparece como nuevo. Lo novedoso tiene m&aacute;s atracci&oacute;n.</p></td>
      </tr>
    <tr>
      <td bgcolor="#FED47A"><p align="justify">c) Otro aspecto implicado en el proceso de atenci&oacute;n es la coherencia o <strong>significaci&oacute;n del objeto</strong>, que atraer&aacute; m&aacute;s f&aacute;cilmente la atenci&oacute;n que si &eacute;sta es ambiguo o incoherente. Un ejemplo es la atracci&oacute;n que muestran los ni&ntilde;os por formas organizadas (dibujos que representan la figura humana), m&aacute;s que por formas desorganizadas; as&iacute;, se tiende a rechazar la informaci&oacute;n que nos comprende o que se considera poco relevante. </p></td>
      </tr>
    <tr>
      <td bgcolor="#FED47A"><p align="justify">d) Estas <strong>caracter&iacute;sticas de los objetos </strong>que resultan m&aacute;s atractivas han sido estudiadas y utilizadas por los publicistas, habi&eacute;ndose comprobado, por ejemplo, que la propaganda sobre objetos m&oacute;viles es m&aacute;s eficaz que sobre los objetos est&aacute;ticos. En los ni&ntilde;os se puede observar esta atracci&oacute;n por el movimiento de los objetos.</p></td>
      </tr>
    <tr>
      <td bgcolor="#FED47A"><p align="justify">e) <strong>El contraste entre est&iacute;mulos </strong>capta nuestra atenci&oacute;n que si no hay contraste.</p></td>
      </tr>
    <tr>
      <td bgcolor="#FED47A"><p align="justify">f) <strong>La posici&oacute;n de los objetos </strong>es determinante en la atenci&oacute;n; as&iacute; los elementos colocados en un mural en lazona superior izquierda son objeto de mayor atenci&oacute;n. Esto puede ser explicado, en la cultura occidental, porlos h&aacute;bitos de lectura. En los ni&ntilde;os menores de 6 a&ntilde;os se observa que la atenci&oacute;n se dirige fundamentalmente hacia los rostros humanos y en especial los ojos.</p></td>
      </tr>
  </table>
  <p align="justify">Dentro de los  factores internos intervienen:</p>
  <table width="85%" border="1" cellspacing="5" cellpadding="10">
    <tr>
      <td bgcolor="#FED47A"><p align="justify">a) Se observan en primer lugar <strong>las necesidades fisiol&oacute;gicas </strong>del sujeto: hambre, sue&ntilde;o, micci&oacute;n, cansancio, etc.; &eacute;stas tienen una fuerza considerable, a la hora de prestar atenci&oacute;n sobre otros est&iacute;mulos ambientales.</p></td>
    </tr>
    <tr>
      <td bgcolor="#FED47A"><p align="justify">b) <strong>Las caracter&iacute;sticas de desarrollo o maduraci&oacute;n </strong>del sujeto dar&aacute;n como resultado un grado de atenci&oacute;n mayor o menor; de esta forma cuanto m&aacute;s peque&ntilde;o son los ni&ntilde;os mantienen menos atenci&oacute;n y cambian con m&aacute;s facilidad al ser m&aacute;s influenciables por los factores ambientales. A medida que el ni&ntilde;o va creciendo se le puede pedir una mayor atenci&oacute;n sobre las cosas.</p></td>
    </tr>
    <tr>
      <td bgcolor="#FED47A"><p align="justify">c) <strong>Los intereses o motivaciones del sujeto </strong>van a decidir la selecci&oacute;n de objetivos a atender; as&iacute;, por ejemplo, las actividades que surgen espont&aacute;neamente y las actividades libremente elegidas suelen presentar mayor nivel de atenci&oacute;n. Los acontecimientos pr&oacute;ximos y de su entorno son los que tienen una mayor significaci&oacute;n para el ni&ntilde;o, y por tanto en los que va a estar m&aacute;s interesado, m&aacute;s atento. En el caso de los ni&ntilde;os, la presencia del adulto, con su animaci&oacute;n y refuerzo, ayuda a mantener la atenci&oacute;n sobre los objetos.</p></td>
    </tr>
    <tr>
      <td bgcolor="#FED47A"><p align="justify">d) A las <strong>actividades planteadas a modo de juego </strong>se presta a mayor atenci&oacute;n.</p></td>
    </tr>
    <tr>
      <td bgcolor="#FED47A"><p align="justify">e) Un factor determinante en la mayor o menor capacidad para mantener la atenci&oacute;n va a ser <strong>la adquisici&oacute;n del lenguaje</strong>, ya que &eacute;ste permite guiar un plan de acci&oacute;n y metas sucesivas para la consecuci&oacute;n de unos resultados, al principio, ser&aacute; el adulto por medio de una instrucci&oacute;n verbal sencilla quien gu&iacute;e la atenci&oacute;n del ni&ntilde;o, pero a partir del segundo o tercer a&ntilde;o, la indicaci&oacute;n del adulto ir&aacute; siendo sustituida por el propio lenguaje del ni&ntilde;o, que se convertir&aacute; en gu&iacute;a de la atenci&oacute;n.</p></td>
    </tr>

  </table>
  <p align="justify"><strong>Tipos de atenci&oacute;n</strong></p>
<p align="justify">El ni&ntilde;o peque&ntilde;o est&aacute; determinado, al igual que en otras &aacute;reas del desarrollo por procesos autom&aacute;ticos e involuntarios. Durante el proceso de maduraci&oacute;n, pasar&aacute; de manejar una atenci&oacute;n involuntaria o dependiente a una atenci&oacute;n voluntaria guiada en funci&oacute;n de sus intereses. Para que este proceso se d&eacute; es necesaria la intervenci&oacute;n del adulto, que har&aacute; que fije su atenci&oacute;n sobre determinados objetos: mira este sonajero. El principio, la atenci&oacute;n es involuntaria en el ni&ntilde;o, depende de la acci&oacute;n exterior del otro y, como dice Luria, el aspecto organizativo de la atenci&oacute;n est&aacute; repartido entre dos personas. Esta es la primera etapa en el proceso de la formaci&oacute;n de la atenci&oacute;n voluntaria. Posteriormente, el ni&ntilde;o, al ir dominando el lenguaje va ser capaz dese&ntilde;alar y nombrar los objetos por s&iacute; mismo, es decir, trasladar su atenci&oacute;n de modo independiente; ahora escuando se puede hablar de atenci&oacute;n voluntaria. Pero el desarrollo de la atenci&oacute;n no termina aqu&iacute;. El ni&ntilde;o ir&aacute; consiguiendo una capacidad selectiva mejor a medida que vaya creciendo, aumentar&aacute; la capacidad o volumen de atenci&oacute;n, y as&iacute; podr&aacute; mantenerse durante m&aacute;s tiempo en una actividad que cuando era m&aacute;s peque&ntilde;o. Podr&aacute; atender a situaciones m&aacute;s complejas, m&aacute;s abstractas, cuando anteriormente s&oacute;lo pod&iacute;a mantener su atenci&oacute;n sobre situaciones concretas.</p>
  <p align="justify">El cuadro que se presenta a continuaci&oacute;n pretende ejemplificar los tipos de atenci&oacute;n estudiados:<br />
    <br />
  </p>
  <p align="center"><strong>Cuadro 1. Tipos de atenci&oacute;n y situaciones representativas</strong></p>
</div>
<p align="center"><img src="Img/UNIDAD 2/pcb_un2img28.jpg" width="630" height="393" /></p>
<p>&nbsp;</p>
<p><strong>Referencia:</strong> Departamento de Psicolog&iacute;a de la salud:<br />
  <strong>http://rua.ua.es/dspace/bitstream/10045/4298/2/TEMA%202_SENSACION,PERCEPCION,ATENCI%C3%93N.pdf</strong></p>
<p align="justify">Es momento de  reforzar los aprendizajes logrados hasta el momento a gracias a la realizaci&oacute;n  de la actividad complementaria 2.2. Sigue adelante</p>
<a href="SwfCont/ActComLPSBC03PBC01_2_2.swf" target="_blank"><h2>ACTIVIDAD  COMPLEMENTARIA 2.2</h2></a>
<p>Despu&eacute;s de haber  realizado la actividad complementaria que te ayud&oacute;&nbsp; a repasar los contenidos, te invitamos a que  realices la actividad de aprendizaje correspondiente.</p>

<a href="../../../../ActApart.jsp?unidad=2&amp;apartado=2">
 <h2>ACTIVIDAD DE APRENDIZAJE 2.2<br /></h2></a>
  </p><table width="100%" border="0" height="100%">
      <tr>
        <td width="20%"><div align="center"><a href= "ContLPSBC03PBC01_2_2_1.jsp" ><img src="Img/REGRESAR.png" width="99" height="32" /></a></div></td>
        <td class="label_Conceptual"><p><strong>2.2 LA ATENCI&Oacute;N</strong></p></td>
        <td width="20%"><div align="center"><a href= "ContLPSBC03PBC01_2_3_0.jsp" ><img src="Img/AVANZAR.png" width="99" height="32"/></a></div></td>
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
