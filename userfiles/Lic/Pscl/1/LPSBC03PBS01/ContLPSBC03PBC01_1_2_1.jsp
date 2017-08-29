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
 	<h2>1.2.1 <strong>Antecedentes y corrientes en la psicolog&iacute;a </strong>
 	  </h2>
 	
 	    <p align="justify">Hasta la d&eacute;cada de 1960 la psicolog&iacute;a estuvo imbuida de consideraciones de &iacute;ndole eminentemente pr&aacute;ctica; los psic&oacute;logos intentaron aplicar la psicolog&iacute;a en la escuela y en los negocios, interes&aacute;ndose muy poco por los procesos mentales y haciendo hincapi&eacute; exclusivamente en la conducta. Este movimiento, conocido como conductismo, fue en un primer momento liderado y divulgado por el psic&oacute;logo estadounidense John B. Watson.</p>
  
 	
    <div align="center">
        <object id="FlashID" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="670" height="459">
          <param name="movie" value="Swf/ContLPSBC03PBC01_1_2.swf" />
          <param name="quality" value="high" />
          <param name="wmode" value="opaque" />
          <param name="swfversion" value="15.0.0.0" />
          <!-- Esta etiqueta param indica a los usuarios de Flash Player 6.0 r65 o posterior que descarguen la versión más reciente de Flash Player. Elimínela si no desea que los usuarios vean el mensaje. -->
          <param name="expressinstall" value="Scripts/expressInstall.swf" />
          <!-- La siguiente etiqueta object es para navegadores distintos de IE. Ocúltela a IE mediante IECC. -->
          <!--[if !IE]>-->
          <object type="application/x-shockwave-flash" data="Swf/ContLPSBC03PBC01_1_2.swf" width="670" height="459">
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
<p align="justify">La psicolog&iacute;a actual todav&iacute;a mantiene muchos de los problemas que se plante&oacute; originalmente. Por ejemplo, ciertos psic&oacute;logos est&aacute;n interesados ante todo en la investigaci&oacute;n fisiol&oacute;gica, mientras que otros mantienen una orientaci&oacute;n cl&iacute;nica, y algunos, una minor&iacute;a, intentan desarrollar un enfoque m&aacute;s filos&oacute;fico. Aunque algunos psic&oacute;logos pragm&aacute;ticos insisten a&uacute;n en que la psicolog&iacute;a debe ocuparse s&oacute;lo de la conducta, olvid&aacute;ndose de los fen&oacute;menos ps&iacute;quicos internos (que deben incluso ser rechazados por ser inaccesible su estudio cient&iacute;fico), cada vez son m&aacute;s los psic&oacute;logos que est&aacute;n hoy de acuerdo en que la experiencia y la vida mental (los procesos ps&iacute;quicos internos) son un objeto v&aacute;lido de estudio para la psicolog&iacute;a cient&iacute;fica. Esta vuelta al estudio de los fen&oacute;menos ps&iacute;quicos internos, conocido como paradigma cognitivo, por oposici&oacute;n al paradigma conductista dominante en la psicolog&iacute;a acad&eacute;mica durante buena parte del siglo, comenz&oacute; a extenderse a mediados de la d&eacute;cada de los a&ntilde;os setenta.&nbsp;<br />
</p>
<p align="justify">Las corrientes en Psicolog&iacute;a permiten dar una explicaci&oacute;n a los fen&oacute;menos estudiados y a lo largo de la historia se pueden observar los avatares sufridos, en la tabla que se muestra a continuaci&oacute;n nos da una breve rese&ntilde;a de esos cambios:</p>
<p align="center"><strong>Tabla 1.</strong></p>
<div align="center">
  <table width="85%" border="1" cellspacing="0" cellpadding="10">
    <tr>
      <td><p align="center"><strong>Corrientes de la Psicolog&iacute;a</strong></p></td>
      </tr>
  </table>
  <table width="85%" border="1" cellspacing="0" cellpadding="10">
    <tr>
      <td width="18%" bgcolor="#FED47A"><div align="center">
        <p><strong>CORRIENTE</strong></p>
      </div></td>
      <td width="44%" bgcolor="#FED47A"><div align="center">
        <p><strong>FUNDAMENTO TE&Oacute;RICO</strong></p>
      </div></td>
      <td width="20%" bgcolor="#FED47A"><div align="center">
        <p><strong>FUNDADORES</strong></p>
      </div></td>
      <td width="18%" bgcolor="#FED47A"><div align="center">
        <p><strong>A&Ntilde;O</strong></p>
      </div></td>
    </tr>
    <tr>
      <td bgcolor="#FED47A"><a href="#" onclick="mostrarOcultarTablas('evento1');mostrarOcultarTablas('evento2');mostrarOcultarTablas('evento3');" title="Haz clic sobre el texto"><p align="center"><strong>Estructuralismo</strong></p></a></td>
      <td><div id="evento1" style="display:none"><p align="center">Busca estructuras de la mente (conciencia) por el m&eacute;todo de introspecci&oacute;n.</p></div></td>
      <td><div id="evento2" style="display:none"><p align="center">Titchener, Wundt</p></div></td>
      <td><div id="evento3" style="display:none"><p align="center">1979</p></div></td>
    </tr>
    <tr>
      <td bgcolor="#FED47A"><a href="#" onclick="mostrarOcultarTablas('evento4');mostrarOcultarTablas('evento5');mostrarOcultarTablas('evento6');" title="Haz clic sobre el texto"><p align="center"><strong>Funcionalismo</strong></p></a></td>
      <td><div id="evento4" style="display:none"><p align="center">Se preocupa por las funciones org&aacute;nicas.</p></div></td>
      <td><div id="evento5" style="display:none"><p align="center">William James</p></div></td>
      <td><div id="evento6" style="display:none"><p align="center">1896</p></div></td>
    </tr>
    <tr>
      <td bgcolor="#FED47A"><a href="#" onclick="mostrarOcultarTablas('evento7');mostrarOcultarTablas('evento8');mostrarOcultarTablas('evento9');" title="Haz clic sobre el texto"><p align="center"><strong>Asociacionismo</strong></p></a></td>
      <td><div id="evento7" style="display:none"><p align="center">Estudia los principios de la asociaci&oacute;n de ideas (o de palabras o de las conexiones estimulo- respuesta), analizando los hechos m&aacute;s complejos para llegar a los m&aacute;s simples como la v&iacute;a directa para lograr la comprensi&oacute;n.</p></div></td>
      <td><div id="evento8" style="display:none"><p align="center">Hermann Ebbinghaus, D. Hartley, A. Bain, Bown</p></div></td>
      <td><div id="evento9" style="display:none"><p align="center">1920</p></div></td>
    </tr>
    <tr>
      <td bgcolor="#FED47A"><a href="#" onclick="mostrarOcultarTablas('evento10');mostrarOcultarTablas('evento11');mostrarOcultarTablas('evento12');" title="Haz clic sobre el texto"><p align="center"><strong>Conductismo: <br />
        cl&aacute;sico y operante</strong></p></a></td>
      <td><div id="evento10" style="display:none"><p align="center">Estudia la conducta observable y medible, para posteriormente elaborar te&oacute;ricamente los resultados experimentales, formula sistemas, teor&iacute;as o modelos explicativos de la conducta. Est&iacute;mulo-Respuesta.</p></div></td>
      <td><div id="evento11" style="display:none"><p align="center">Cl&aacute;sico: Watson<br />
y Pavlov        Operante: Skinner</p></div></td>
      <td><div id="evento12" style="display:none"><p align="center">1940</p></div></td>
    </tr>
    <tr>
      <td bgcolor="#FED47A"><a href="#" onclick="mostrarOcultarTablas('evento13');mostrarOcultarTablas('evento14');mostrarOcultarTablas('evento15');" title="Haz clic sobre el texto"><p align="center"><strong>Gestalt</strong></p></a></td>
      <td><div id="evento13" style="display:none"><p align="center">Conocida como la Psicolog&iacute;a de la forma, con tres caracter&iacute;sticas fundamentales: cierre, organizaci&oacute;n y relieve, a trav&eacute;s de la percepci&oacute;n simult&aacute;nea de todos sus elementos.</p></div></td>
      <td><div id="evento14" style="display:none"><p align="center">Kohle, Koffka Wentheimer, Metzenger, Mering</p></div></td>
      <td><div id="evento15" style="display:none"><p align="center">1890</p></div></td>
    </tr>
    <tr>
      <td bgcolor="#FED47A"><a href="#" onclick="mostrarOcultarTablas('evento16');mostrarOcultarTablas('evento17');mostrarOcultarTablas('evento18');" title="Haz clic sobre el texto"><p align="center"><strong>Psicoan&aacute;lisis</strong></p></a></td>
      <td><div id="evento16" style="display:none"><p align="center">M&eacute;todo creado principalmente para la investigaci&oacute;n y tratamiento de trastornos emocionales y mentales a partir de la revisi&oacute;n din&aacute;mica entre el ello, yo&nbsp; y super yo.</p></div></td>
      <td><div id="evento17" style="display:none"><p align="center">Sigmund Freud</p></div></td>
      <td><div id="evento18" style="display:none"><p align="center">1927</p></div></td>
    </tr>
    <tr>
      <td bgcolor="#FED47A"><a href="#" onclick="mostrarOcultarTablas('evento19');mostrarOcultarTablas('evento20');mostrarOcultarTablas('evento21');" title="Haz clic sobre el texto"><p align="center"><strong>Cognoscitivismo</strong></p></a></td>
      <td><div id="evento19" style="display:none"><p align="center">Adquisici&oacute;n, organizaci&oacute;n y representaci&oacute;n del pensamiento.</p></div></td>
      <td><div id="evento20" style="display:none"><p align="center">Miller, Bruner, <br />
        Chomsky, Piaget</p></div></td>
      <td><div id="evento21" style="display:none"><p align="center">1956</p></div></td>
    </tr>
    <tr>
      <td bgcolor="#FED47A"><a href="#" onclick="mostrarOcultarTablas('evento22');mostrarOcultarTablas('evento23');mostrarOcultarTablas('evento24');" title="Haz clic sobre el texto"><p align="center"><strong>Constructivismo</strong></p></a></td>
      <td><div id="evento22" style="display:none"><p align="center">Todo proceso de ense&ntilde;anza-aprendizaje activo, basado en la reflexi&oacute;n de las personas, de manera que el educando va construyendo mentalmente su entendimiento de la realidad.</p></div></td>
      <td><div id="evento23" style="display:none"><p align="center">Kelly, Vigotsky, <br />
        Ausubel, Bruner</p></div></td>
      <td><div id="evento24" style="display:none"><p align="center">&nbsp;</p></div></td>
    </tr>
    <tr>
      <td bgcolor="#FED47A"><a href="#" onclick="mostrarOcultarTablas('evento25');mostrarOcultarTablas('evento26');mostrarOcultarTablas('evento27');" title="Haz clic sobre el texto"><p align="center"><strong>An&aacute;lisis Transaccional</strong></p></a></td>
      <td><div id="evento25" style="display:none"><p align="center">M&eacute;todo para analizar nuestra manera de relacionarnos con los dem&aacute;s. Tres estados yoicos: padre, ni&ntilde;o, adulto.</p></div></td>
      <td><div id="evento26" style="display:none"><p align="center">Eric Berne</p></div></td>
      <td><div id="evento27" style="display:none"><p align="center">1920</p></div></td>
    </tr>
    <tr>
      <td bgcolor="#FED47A"><a href="#" onclick="mostrarOcultarTablas('evento28');mostrarOcultarTablas('evento29');mostrarOcultarTablas('evento30');" title="Haz clic sobre el texto"><p align="center"><strong>Teor&iacute;a General <br />
        de Sistemas</strong></p></a></td>
      <td><div id="evento28" style="display:none"><p align="center">Estudia la conducta por medio del comportamiento humano y los procesos mentales, enfocando los problemas psicol&oacute;gicos con una visi&oacute;n te&oacute;rica com&uacute;n.</p></div></td>
      <td><div id="evento29" style="display:none"><p align="center">Wiener entre otros</p></div></td>
      <td><div id="evento30" style="display:none"><p align="center">Finales del siglo XIX <br />
        y principios <br />
        del XX</p></div></td>
    </tr>
    <tr>
      <td bgcolor="#FED47A"><a href="#" onclick="mostrarOcultarTablas('evento31');mostrarOcultarTablas('evento32');mostrarOcultarTablas('evento33');" title="Haz clic sobre el texto"><p align="center"><strong>Psicolog&iacute;a Humanista</strong></p></a></td>
      <td><div id="evento31" style="display:none"><p align="center">Estudia el aprendizaje, su meta com&uacute;n es enfocar lo que significa el existir como ser humano, tambi&eacute;n llamada fenomenolog&iacute;a.</p></div></td>
      <td><div id="evento32" style="display:none"><p align="center">Carl Rogers, <br />
        Abraham Maslow</p></div></td>
      <td><div id="evento33" style="display:none"><p align="center">Principios <br />
        del siglo XX</p></div></td>
    </tr>
    <tr>
      <td bgcolor="#FED47A"><a href="#" onclick="mostrarOcultarTablas('evento34');mostrarOcultarTablas('evento35');mostrarOcultarTablas('evento36');" title="Haz clic sobre el texto"><p align="center"><strong>Socio - Hist&oacute;rico</strong></p></a></td>
      <td><div id="evento34" style="display:none"><p align="center">El objetivo es ver c&oacute;mo la influencia de la cultura, las influencias sociales modifican el estado de las funciones psicol&oacute;gicas b&aacute;sicas tales como la percepci&oacute;n, memoria, entre otros.</p></div></td>
      <td><div id="evento35" style="display:none"><p align="center">Vigotsky, Luria, Leontiev</p></div></td>
      <td><div id="evento36" style="display:none"><p align="center">Finales de<br />
los a&ntilde;os 50's</p></div></td>
    </tr>
    <tr>
      <td colspan="2" bgcolor="#FED47A"><p>Elaboraci&oacute;n: Cynthia L. Ramos Quezada</p></td>
      <td colspan="2" bgcolor="#FED47A"><p>Adecuaci&oacute;n: Lucia Brise&ntilde;o Tamayo</p></td>
    </tr>
  </table>
 <p align="justify">Es momento de  reforzar los aprendizajes logrados hasta el momento a gracias a la realizaci&oacute;n  de la actividad complementaria 1.2. Sigue adelante.</p>
<a href="SwfCont/ActComLPSBC03PBC01_1_2.swf" target="_blank"><h2 align="left">ACTIVIDAD  COMPLEMENTARIA 1.2</h2> </a>
  <p align="justify">La siguiente  presentaci&oacute;n tiene la finalidad de brindar un panorama general de la historia  de la psicolog&iacute;a y sus diversas concepciones te&oacute;ricas, da clic en las  flecha&nbsp;&nbsp; para continuar con todas las  diapositivas (Fern&aacute;ndez, A., 2009):</p>
</div>

<div style="width:425px" id="__ss_2391811"> <strong style="display:block;margin:12px 0 4px"><a href="http://www.slideshare.net/albertofilosofia/la-psicologia-como-ciencia-2391811" title="La psicologia como ciencia" target="_blank">La psicologia como ciencia</a></strong> <iframe src="http://www.slideshare.net/slideshow/embed_code/2391811" width="425" height="355" frameborder="0" marginwidth="0" marginheight="0" scrolling="no"></iframe> <div style="padding:5px 0 12px"> View more <a href="http://www.slideshare.net/" target="_blank">presentations</a> from <a href="http://www.slideshare.net/albertofilosofia" target="_blank">Alberto Fernández</a> </div> 
</div>

<p align="justify">Despu&eacute;s de haber realizado la actividad complementaria que te ayud&oacute;&nbsp; a repasar los contenidos, te invito a que realices la actividad de aprendizaje correspondiente.</p>
<a href="../../../../ActApart.jsp?unidad=1&amp;apartado=2">
 <h2>ACTIVIDAD DE APRENDIZAJE 1.2<br /></h2></a>
  </p>
<div>
  <div> </div>
</div><table width="100%" border="0" height="100%">
      <tr>
        <td width="20%"><div align="center"><a href= "ContLPSBC03PBC01_1_2_0.jsp" ><img src="Img/REGRESAR.png" width="99" height="32" /></a></div></td>
        <td class="label_Conceptual">1.2 <strong>HISTORIA DE LA PSICOLOG&Iacute;A</strong></td>
        <td width="20%"><div align="center"><a href= "ContLPSBC03PBC01_1_3_0.jsp" ><img src="Img/AVANZAR.png" width="99" height="32"/></a></div></td>
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
