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
 	<h2><strong>3.4.1 COMUNICACI&Oacute;N VERBAL</strong><strong> </strong></h2>
    <p>Escucha la siguiente grabaci&oacute;n, es un claro ejemplo de comunicaci&oacute;n verbal.<br />
      <br />
      <embed src="Aud/3_4_1.m4a" autostart = "False"  height="32" width="290" /></embed></embed>
      <br />
    </p>
    <p align="justify">Como pudiste escuchar, la transmisi&oacute;n de un partido de f&uacute;tbol por la radio, una conversaci&oacute;n telef&oacute;nica o las explicaciones que el profesor/a da a diario en la clase son ejemplos de <strong>comunicaci&oacute;n verbal u oral</strong>. El instrumento de la comunicaci&oacute;n oral es el <strong>habla</strong>, que se apoya en elementos como gestos, bajadas y subidas de la voz, risas, toses&hellip;e, incluso, silencios. <br />
</p>
    <p>Revisa  el siguiente video y reflexiona en el chat con tus compa&ntilde;eros sobre el proceso  de comunicaci&oacute;n que se presenta:<br />
      </p>
    <p align="center">Morgan,  G. (2007). <em><a href="http://youtu.be/7oliqCgoHMo" target="_blank"><strong>Les Luthiers - Radio Tertulia  - Parte VI.</strong></a></em> Recuperado con fines did&aacute;cticos el 9 de Marzo de 2015, de: http://www.youtube.com/watch?v=MW9GxhBZVMQ    </p>
    <p align="center"><strong>Para revisar el material indicado da clic en el siguiente enlace o bien, revisa la secci&oacute;n de Descargables en la plataforma.</strong></p>
    <h2><strong>3.4.2 COMUNICACI&Oacute;N NO VERBAL</strong><strong> </strong></h2>
    <table width="70%" align="center" border="0" cellspacing="0" cellpadding="15">
      <tr>
        <td width="115" align="right"><img src="Img/UNIDAD 3/Intentodegif.gif" width="157" height="144" /></td>
        <td width="407"><p align="justify"><strong>I</strong><strong>dea Relevante</strong></p>
          <p align="justify">La expresi&oacute;n <strong>&quot;comunicaci&oacute;n no verbal&quot;</strong>, alude a todos los signos y sistemas de signos no ling&uuml;isticos que comunican o se utilizan para comuniar.</p></td>
      </tr>
    </table>
    <p align="justify">Como puede apreciarse por su definici&oacute;n, se trata de un concepto extraordinariamente amplio, que incluye los h&aacute;bitos y las costumbres culturales y los denominados sistemas de comunicaci&oacute;n no verbal. La amplitud y complejidad del tema explican el lento desarrollo y la interdisciplinariedad que caracterizan su estudio.</p>
<p align="justify"><br />
  El conocimiento que hoy en d&iacute;a tenemos sobre comunicaci&oacute;n no verbal es relativamente escaso y muy fragmentario. Tanto es as&iacute; que, a comienzos del siglo XXI, a&uacute;n no contamos con una base te&oacute;rica s&oacute;lida que nos permita describir y explicar con propiedad y detalle qu&eacute; es la comunicaci&oacute;n no verbal, qu&eacute; sistemas la integran, cu&aacute;les son sus signos y c&oacute;mo funcionan, debido, fundamentalmente, a la dificultad metodol&oacute;gica que entra&ntilde;a su investigaci&oacute;n y a la poca y heterog&eacute;nea tradici&oacute;n que tiene su estudio (Serrano, Poyatos, 1981).<br />
</p>
<p align="justify">Existe tambi&eacute;n la comunicaci&oacute;n <strong>interindividual o intergrupal</strong>, la cual se basa en las relaciones entre las personas o grupos de personas.</p>
<p align="justify">Si deseas profundizar m&aacute;s en el tema te invito a que revises los siguientes documentos<strong> dando clic en los enlaces que se indican, o bien, revisando la secci&oacute;n de Descargables en la plataforma.</strong></p>
<ol>
  <li>Cestero, A. (2006). <em><a href="../LPSBC03PBC01/Desc/pcb_un3des9.pdf" target="_blank"><strong>La comunicaci&oacute;n no verbal y el estudio de su  incidencia en fen&oacute;menos discursivos como la iron&iacute;a.</strong></a></em> Recuperado el 9 de  Marzo de 2015, de:  http://rua.ua.es/dspace/bitstream/10045/6074/1/ELUA_20_03.pdf<br />
    <br />
  </li>
  <li>S&aacute;nchez, G. (2009). <em><a href="../LPSBC03PBC01/Desc/pcb_un3des10.pdf" target="_blank"><strong>La comunicaci&oacute;n no verbal.</strong></a></em>Recuperado el  9 de Marzo de 2015, de:&nbsp;&nbsp; http://www.marcoele.com/descargas/china/g.sanchez_comunicacionnoverbal.pdf</li>
  </ol>
<p align="justify">A continuaci&oacute;n encontrar&aacute;s algunos videos de apoyo para comprender la comunicaci&oacute;n no verbal. <strong>Para revisar el material da clic en los enlaces que se indican:</strong></p>
<ol>
  <li><strong><em><a href="http://youtu.be/s2hTjXHZLvw" target="_blank">La comunicaci&oacute;n no verbal en las pel&iacute;culas de  Charlie Chaplin.</a></em>&nbsp; </strong>(s/f). Recuperado con fines did&aacute;cticos el 9  de Marzo de 2015, de: http://www.youtube.com/watch?v=FEb43BePDcU<strong><br />
    <br />
    </strong></li>
  <li><strong><a href="http://youtu.be/2KpShRFjQ24" target="_blank">Bonilla, A. (2010). <em>Lenguaje del cuerpo. Episodio 1</em>.</a></strong>Recuperado con fines did&aacute;cticos el 9 de Marzo de 2015, de: http://www.youtube.com/watch?v=xeMue_PHCJg<strong><br />
    <br />
    </strong></li>
  <li><strong><em><a href="http://youtu.be/9DHllT7otAM" target="_blank">Comunicaci&oacute;n No Verbal- Comunicaci&oacute;n en los  Negocios</a>.</em></strong> (s/f). Recuperado con  fines did&aacute;cticos el 9 de Marzo de 2015, de:  http://www.youtube.com/watch?v=BF1e9i5Dv6M&amp;feature=related<strong><br />
    <br />
    </strong></li>
  <li><em><a href="http://youtu.be/XLFfTjyLN2g" target="_blank"><strong>Sordo_Mimo_Signos</strong></a></em><strong><a href="http://youtu.be/XLFfTjyLN2g">. (s/f).</a></strong> Recuperado con fines did&aacute;cticos el 9 de  Marzo de 2015, de: http://www.youtube.com/watch?v=L2YFaz8sUFI</li>
  </ol>
<p align="justify"><a href="SwfCont/ContLPSBC03PBC01_3_2.swf" target="_blank"></a>Hemos llegado al  t&eacute;rmino de la unidad n&uacute;mero 3. Es momento de reforzar los aprendizajes logrados  hasta el momento a gracias a la realizaci&oacute;n de la actividad complementaria 3.2.&nbsp; </p>
<a href="SwfCont/ActComLPSBC03PBC01_3_2.swf" target="_blank"><h2>ACTIVIDAD  COMPLEMENTARIA 3.2</h2>
</a>
<p align="justify">Despu&eacute;s de haber  realizado la actividad complementaria que te ayud&oacute; a repasar los contenidos, te  invitamos a que realices la actividad de aprendizaje correspondiente.</p>

<a href="../../../../ActApart.jsp?unidad=3&amp;apartado=4">
 <h2>ACTIVIDAD DE APRENDIZAJE 3.4<br /></h2></a>
  </p>	<table width="100%" border="0" height="100%">
      <tr>
        <td width="20%"><div align="center"><a href= "ContLPSBC03PBC01_3_4_0.jsp" ><img src="Img/REGRESAR.png" width="99" height="32" /></a></div></td>
        <td class="label_Conceptual"><p><strong>3.4 COMUNICACI&Oacute;N</strong></p></td>
        <td width="20%"><div align="center"><a href= "ContLPSBC03PBC01_3_Resumen.jsp" ><img src="Img/AVANZAR.png" width="99" height="32"/></a></div></td>
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
