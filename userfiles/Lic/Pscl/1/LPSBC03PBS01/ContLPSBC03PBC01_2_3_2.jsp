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
 	<h2><strong>2.3.2 CONDICIONAMIENTO CL&Aacute;SICO </strong> 	</h2>
 	<p align="justify">Ahora que tienes claro que es el aprendizaje, vamos a revisar algunas teor&iacute;as relacionadas con la manera en que los seres humanos aprendemos, , espec&iacute;ficamente identificar&aacute;s los aportes de te&oacute;ricos como Pavlov, Skinner al estudio del aprendizaje.<br />
 	  </p>
 	<p align="justify">Despu&eacute;s de lo revisado en el video, el cuadro que se muestran a continuaci&oacute;n es un breve resumen de las concepciones te&oacute;ricas del condicionamiento cl&aacute;sico y operante.    </p>
 	<p align="center"><strong>Tabla 1. Concepciones del Condicionamiento cl&aacute;sico y operante</strong></p>
 	<div align="center">
 	  <table width="80%" border="1" cellspacing="0" cellpadding="15">
 	    <tr>
 	      <td bgcolor="#fed47a"><p align="justify">La psicolog&iacute;a estudia el cambio que se produce en el organismo como resultado de la experiencia, esto es, el aprendizaje. Gran parte de su investigaci&oacute;n se ha desarrollado utilizando animales de laboratorio. El enfoque conductista, el que m&aacute;s se ha ocupado de las formas elementales del aprendizaje, distingue dos tipos de condicionamiento: el condicionamiento cl&aacute;sico y el instrumental operante.</p></td>
 	      </tr>
 	    </table>
 	  </div>
 	<p align="center">&nbsp;</p>
 	<div align="center">
 	  <table width="80%" border="1" cellspacing="0" cellpadding="15">
 	    <tr>
 	      <td bgcolor="#fed47a"><p align="justify">El condicionamiento cl&aacute;sico tambi&eacute;n se conoce como condicionamiento Pavloviano en honor de su descubridor, el fil&oacute;sofo ruso Iv&aacute;n Pavlov. Este demostr&oacute; que si un hecho arbitrario, el sonido de la campana, precede regularmente a un hecho biol&oacute;gicamente relevante (la comida de un animal), la campana ser&aacute; una se&ntilde;al de comida, y el animal salivar&aacute; al escucharla, prepar&aacute;ndose para comer. La respuesta del animal ser&aacute;, por tanto, un reflejo condicionado al sonido de la campana</p></td>
 	      </tr>
 	    </table>
 	  <p>&nbsp;</p>
    </div>
 	<div align="center">
 	  <table width="80%" border="1" cellspacing="0" cellpadding="15">
 	    <tr>
 	      <td bgcolor="#fed47a"><p align="justify">El condicionamiento instrumental u operante que aplic&oacute; B.F. Skinner pone &eacute;nfasis en la conducta animal y en las consecuencias de sus acciones. En general si una acci&oacute;n le sigue una recompensa, un refuerzo positivo, la acci&oacute;n se repetir&aacute; cuando el animal se encuentre en la misma situaci&oacute;n. Por ejemplo, si un animal hambriento es recompensado con comida por girar a la derecha en un laberinto simple, tender&aacute; a girar de nuevo a la derecha cuando se encuentre en el laberinto. Si la recompensa cesa, aparecer&aacute;n otros tipos de comportamientos.</p></td>
 	      </tr>
 	    </table>
 	  <p>&nbsp;</p>
 	  <table width="80%" border="1" cellspacing="0" cellpadding="15">
 	    <tr>
 	      <td bgcolor="#fed47a"><p align="justify">Estos dos tipos de investigaci&oacute;n tratan de los aspectos m&aacute;s elementales de la experiencia del aprendizaje. En el condicionamiento cl&aacute;sico, la atenci&oacute;n recae en la importancia de la asociaci&oacute;n del est&iacute;mulo condicionado y del no condicionado; en el instrumental u operante, recae la utilizaci&oacute;n de refuerzos negativos o positivos par modificar la conducta. Dicho de otro modo, el primero se ocupa de qu&eacute; clase de fen&oacute;menos aparecen juntos en el proceso de aprendizaje, mientras que en el segundo trata de las consecuencias de las acciones.</p></td>
 	      </tr>
 	    </table>
 	  <p align="justify">&nbsp;</p>
 	  <p align="justify"><strong>Condicionamiento  Cl&aacute;sico o Pavloviano</strong></p>
    </div>
 	<p align="center"><img src="Img/UNIDAD 2/pcb_un2img31.jpg" width="244" height="207" /></p>
 	<p align="center">&nbsp;</p>
 
    <p align="justify">Corresponde al aprendizaje que se produce cuando una se&ntilde;al o est&iacute;mulo nuevo (E.N.= est&iacute;mulo neutro) se asocia repetidamente con una se&ntilde;al o est&iacute;mulo (E.I. = est&iacute;mulo incondicionado) que tiene la propiedad de provocar una respuesta refleja (R.I.= respuesta incondicionada), con lo que bajo ciertas condiciones, el E.N. adquiere la propiedad de provocar tambi&eacute;n una respuesta (R.C. = respuesta condicionada) similar a la incondicionada. De esa manera el E.N. se transforma en E.C.= est&iacute;mulo condicionado. </p>
    <p align="center"><img src="Img/UNIDAD 2/pcb_un2img31_1.gif" alt="" width="244" height="207" /></p>
    <p align="center">&nbsp;</p>
    <p align="justify">Iv&aacute;n P. Pavlov, fisi&oacute;logo e investigador ruso, Premio Nobel 1904, hac&iacute;a sonar una campanilla cada vez que introduc&iacute;a un trozo de carne en el hocico del perro. Observa que el perro comenzaba a salivar cada vez que escuchaba el sonido de la campanilla, a&uacute;n en ausencia del trozo de carne. La carne provoca salivaci&oacute;n, pero no as&iacute; la campanilla, que ser&iacute;a un est&iacute;mulo neutro para el efecto de salivar, salvo que se haya asociado repetidamente al est&iacute;mulo natural (o incondicionado).
 </p>
    <p align="center"><img src="Img/UNIDAD 2/pcb_un2img32.JPG" width="581" height="312" /></p>
    <p align="justify">En s&iacute;ntesis, el condicionamiento cl&aacute;sico consiste en la formaci&oacute;n de una asociaci&oacute;n que no exist&iacute;a previamente entre un est&iacute;mulo (inicialmente neutro y despu&eacute;s <em>condicionado </em>y una respuesta <em>condicionada</em> o aprendida a trav&eacute;s de la presentaci&oacute;n repetida del est&iacute;mulo neutro y el incondicionado (que provoca naturalmente la respuesta. </p>
<p align="center"><img src="Img/UNIDAD 2/pcb_un2img33.jpg" width="239" height="218" /></p>
<p><strong>Conceptos pavlovianos</strong></p>
<ul>
  <li>
    <div align="justify"><em>Condicionamiento demorado o condicionamiento de huella</em>: Tiene lugar cuando el E.C. (sonido despu&eacute;s de un condicionamiento) es presentado y retirado antes de que aparezca el E.I. (comida). Si el sonido es presentado mucho antes que la comida, el perro puede tener problemas para aprender.</div>
  </li>
</ul>
<div align="justify">
  <ul type="circle">
    <li><em>Proceso de extinci&oacute;n: </em>Se trata de la eliminaci&oacute;n de un refuerzo para un      comportamiento que ha sido reforzado anteriormente. Por ejemplo, hacer      sonar la campana y no darle comida hasta que el perro aprende que la      comida no le ser&aacute; presentada despu&eacute;s del sonido.<br />
      <br />
    </li>
    <li><em>Recuperaci&oacute;n espont&aacute;nea: </em>Se producecuando una respuesta condicionada ha sido extinguida y despu&eacute;s de unos      d&iacute;as se vuelve a tocar la campana y el perro saliva. Esto muestra que el      perro no ha olvidado el aprendizaje original, sino que ha sido inhibida la      respuesta aprendida.&nbsp; Es espont&aacute;nea      la respuesta porque no hay ensayos de condicionamiento.<br />
      <br />
    </li>
    <li><em>Generalizaci&oacute;n de est&iacute;mulo: </em>Tendencia a emitir la respuesta condicionada      (RC) ante est&iacute;mulos similares aunque no iguales al originalmente asociado      con el est&iacute;mulo incondicionado (E.I.), por ejemplo salivar ante el sonido      de un diapas&oacute;n, campanilla, timbre, etc.<br />
      <br />
    </li>
    <li><em>Neurosis experimental: </em>Primero se condiciona&nbsp; los perros a asociar un c&iacute;rculo con la      presentaci&oacute;n de la comida y una elipse con la no comida.&nbsp; Cuando ya lo han aprendido, se les      cambia las reglas y se le presentan indistintamente unos y otros.&nbsp; Los perros se confunden y empiezan a      mostrar conductas extra&ntilde;as como temor, mayor agresividad, etc.&nbsp; Esto permite una mayor comprensi&oacute;n de      las neurosis humanas en el sentido que son aprendidas.</li></ul></div>
<p>El condicionamiento cl&aacute;sico se usa mucho para tratar las fobias y los h&aacute;bitos indeseables o adicciones tales como por fumar y beber.</p>
<p align="center"><img src="Img/UNIDAD 2/pcb_un2img34.jpg" width="280" height="190" /></p>
<p>A manera de ejemplo, te invito a revisar la pel&iacute;cula <em>Naranja mec&aacute;nica,</em> del Director Stanley Kubrick (1962) donde podr&aacute;s encontrar una forma de aplicaci&oacute;n del conductismo. <a href="http://youtu.be/P-lW1QBQk_4" target="_blank"> <em><strong>Naranja  mec&aacute;nica</strong></em></a></p>
<p align="justify">Para recuperar la informaci&oacute;n revisada anteriormente, te invito a visitar la siguiente presentaci&oacute;n, es un resumen de la relaci&oacute;n del aprendizaje y el condicionamiento cl&aacute;sico: </p>
<p>Presentaci&oacute;n  tomada con fines did&aacute;cticos de Tecnolog&iacute;a m&eacute;dica (2009). <a href="http://www.slideshare.net/tmedicauss/concepto-de-aprendizaje" target="_blank"><strong>Da clic aqu&iacute;.</strong></a><a href="http://www.slideshare.net/tmedicauss/concepto-de-aprendizaje" target="_blank"><strong><br />
</strong></a></p>
<div>
  <div></div>
</div><table width="100%" border="0" height="100%">
      <tr>
        <td width="20%"><div align="center"><a href= "ContLPSBC03PBC01_2_3_1.jsp" ><img src="Img/REGRESAR.png" width="99" height="32" /></a></div></td>
        <td class="label_Conceptual"><p><strong>2.3 APRENDIZAJE</strong></p></td>
        <td width="20%"><div align="center"><a href= "ContLPSBC03PBC01_2_3_3.jsp" ><img src="Img/AVANZAR.png" width="99" height="32"/></a></div></td>
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
