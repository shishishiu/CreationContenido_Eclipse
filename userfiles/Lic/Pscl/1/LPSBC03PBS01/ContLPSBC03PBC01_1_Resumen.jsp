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
 	<h1 align="center"><strong>RESUMEN</strong></h1>
 	<p align="justify">Como te has dado cuenta, la psicolog&iacute;a es una ciencia que permite estudiar el comportamiento y los procesos mentales del ser humano. Hist&oacute;ricamente, la psicolog&iacute;a se ha dividido en varias &aacute;reas de estudio, no obstante, estas &aacute;reas est&aacute;n interrelacionadas.</p>
    <p align="justify">A lo largo de los 4 temas has aprendido a explicar el motivo por el cual la psicolog&iacute;a es considerada una ciencia, las corrientes te&oacute;ricas relevantes, los modelos de representaci&oacute;n mental para los acontecimientos cotidianos y algunas generalidades en cuanto a los procesos cognitivos b&aacute;sicos, en la figura que se muestra a continuaci&oacute;n identifica los conceptos generales aprendidos.
</p>
   <div align="center">
        <object id="FlashID" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="670" height="468">
          <param name="movie" value="Swf/ContLPSBC03PBC01_1_7.swf" />
          <param name="quality" value="high" />
          <param name="wmode" value="opaque" />
          <param name="swfversion" value="15.0.0.0" />
          <!-- Esta etiqueta param indica a los usuarios de Flash Player 6.0 r65 o posterior que descarguen la versión más reciente de Flash Player. Elimínela si no desea que los usuarios vean el mensaje. -->
          <param name="expressinstall" value="Scripts/expressInstall.swf" />
          <!-- La siguiente etiqueta object es para navegadores distintos de IE. Ocúltela a IE mediante IECC. -->
          <!--[if !IE]>-->
          <object type="application/x-shockwave-flash" data="Swf/ContLPSBC03PBC01_1_7.swf" width="670" height="468">
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
    <table width="55%" border="1" cellspacing="0" cellpadding="10" align="center">
      <tr>
        <th width="49%" bgcolor="#FED47A" scope="col"><p>UNIDAD</p></th>
        <th width="37%" bgcolor="#FED47A" scope="col"><p>ACTIVIDAD DE APRENDIZAJE</p></th>
        <th width="14%" bgcolor="#FED47A" scope="col"><p>VALOR</p></th>
      </tr>
      <tr>
        <td width="49%"><p align="center">1.1 Introducci&oacute;n a la Psicolog&iacute;a</p></td>
        <td><p align="center">Ensayo</p></td>
        <td><p align="center">2.5</p></td>
      </tr>
      <tr>
        <td><p align="center">1.2 Historia de la Psicolog&iacute;a</p></td>
        <td><p align="center">L&iacute;nea del tiempo</p></td>
        <td><p align="center">2.5</p></td>
      </tr>
      <tr>
        <td><p align="center">1.3 Modelos de Representaci&oacute;n Mental</p></td>
        <td><p align="center">Resumen</p></td>
        <td><p align="center">2.5</p></td>
      </tr>
      <tr>
        <td><p align="center">1.4 Procesos Cognoscitivos B&aacute;sicos</p></td>
        <td><p align="center">Resumen</p></td>
        <td><p align="center">2.5</p></td>
      </tr>
      <tr>
        <td><p align="center"><strong>TOTAL<br />
          UNIDAD 1</strong></p></td>
        <td><div align="center">
          <p><strong>ACTIVIDADES DE APRENDIZAJE</strong></p>
        </div></td>
        <td><div align="center">
          <p><strong>10%</strong></p>
        </div></td>
      </tr>
    </table>
    <p align="justify">&nbsp;</p>
    <p align="center"><strong>REFERENCIAS DE CONSULTA</strong></p>
    <ol>
      <li>Ballesteros, S.  (1995).&nbsp; <em>Procesos psicol&oacute;gicos b&aacute;sicos.</em> Espa&ntilde;a: Universitas. <br />
        <br />
      </li>
      <li>Ca&ntilde;as, J., Antol&iacute;, A.,  Barquier, P., Castillo, A., Fajardo, I., G&oacute;mez, P. y Salmer&oacute;n, L.&nbsp; (2002). <em><a href="../LPSBC03PBC01/Desc/pcb_un1des1.pdf" target="_blank"><strong>Representaci&oacute;n  mental de los conceptos,</strong> <strong>objetos y personas implicados en una tarea realizada  en una</strong></a></em> <strong><a href="../LPSBC03PBC01/Desc/"><em>interfaz.</em></a></strong><a href="../LPSBC03PBC01/Desc/"><em></em> </a>Recuperado el 23  de Noviembre de 2011, de: http://redalyc.uaemex.mx/redalyc/pdf/925/92561613.pdf<br />
        <br />
        <p><strong>Para revisar el material indicado da clic en el siguiente enlace o bien, revisa la secci&oacute;n de Descargables en la plataforma.</strong></p>
      </li>
      <li>Espert,  R. (2008). <em>Breve historia de la  psicolog&iacute;a.</em> Consultado el 30 de Noviembre de 2011, en:  <a href="http://www.dailymotion.com/video/x7vil2_breve-historia-de-la-psicologia_school#rel-page-9" target="_blank"><strong>http://www.dailymotion.com/video/x7vil2_breve-historia-de-la-psicologia_school#rel-page-9 </strong></a><br />
        <br />
        <p><strong>Para revisar el material indicado da clic en el siguiente enlace o bien, revisa la secci&oacute;n de Descargables en la plataforma.</strong></p>
      </li>
      <li>Fern&aacute;ndez<strong>,</strong> A. (2009). <em>La psicolog&iacute;a como ciencia.</em> Consultado el 30 de Noviembre de 2011,  en: <a href="http://www.slideshare.net/albertofilosofia/la-psicologia-como-ciencia-2391811" target="_blank"><strong>http://www.slideshare.net/albertofilosofia/la-psicologia-como-ciencia-2391811 </strong></a><br />
        <br />
        <p><strong>Para revisar el material indicado da clic en el siguiente enlace o bien, revisa la secci&oacute;n de Descargables en la plataforma.</strong></p>
      </li>
      <li>Mart&iacute;n,  F. y Mart&iacute;n, E. (2012).&nbsp; <em>Procesos metacognitivos. </em>Recuperado el  30 Noviembre de 2012, de:  <a href="http://www.profes.net/rep_documentos/Monograf/1PEI_ProcMetacognitivos_b.pdf" target="_blank"><strong>http://www.profes.net/rep_documentos/Monograf/1PEI_ProcMetacognitivos_b.pdf</strong></a><br />
        <br />
        <p><strong>Para revisar el material indicado da clic en el siguiente enlace o bien, revisa la secci&oacute;n de Descargables en la plataforma.</strong></p>
      </li>
      <li>Tijero, T. (2009). <em><a href="../LPSBC03PBC01/Desc/pcb_un1des2.pdf" target="_blank"><strong>Representaciones mentales: discusi&oacute;n cr&iacute;tica  del Modelo de situaci&oacute;n de Kintsch&acute;s.</strong></a></em> Recuperado el 23 de Noviembre de  2011, de: http://www.onomazein.net/19/tijero.pdf</li>
      </ol>
    <p><strong>Referencias de consulta sugeridas</strong></p>
    <ol>
      <li>Civera, C., Tortosa,  F. y Vera. J. (s/f). <em><a href="../LPSBC03PBC01/Desc/pcb_un1des3.pdf" target="_blank"><strong>Psicolog&iacute;a e  historia de la psicolog&iacute;a.</strong></a></em> Recuperado el 30 de Noviembre de 2011, de:  http://volivera.uprrp.edu/3046/cap2.pdf<br />
        <br />
        <p><strong>Para revisar el material indicado da clic en el siguiente enlace o bien, revisa la secci&oacute;n de Descargables en la plataforma.</strong></p>
      </li>
      <li>Del Buey, F., Mart&iacute;,  M., Camarero, F., y S&aacute;ez, S. (s/f). <em><a href="../LPSBC03PBC01/Desc/pcb_un1des4.pdf" target="_blank"><strong>Metacognici&oacute;n.&nbsp;</strong>&nbsp;</a> </em>Recuperado el 30 de Noviembre de 2011,  de:  https://www.u-cursos.cl/plataforma/2014/1/VA-01-0215/1/material_docente/previsualizar?id_material=858744<br />
        <br />
        <p><strong>Para revisar el material indicado da clic en el siguiente enlace o bien, revisa la secci&oacute;n de Descargables en la plataforma.</strong></p>
      </li>
      <li>Explainers.tv. (s/f). <em><a href="http://youtu.be/91xuLcxEqJ4" target="_blank"><strong>Teor&iacute;a de la percepci&oacute;n.</strong></a></em> Recuperado  con fines did&aacute;cticos el 05 de Marzo de 2015, de: https://vimeo.com/33500328<br />
        <br />
        <p><strong>Para revisar el material indicado da clic en el siguiente enlace o bien, revisa la secci&oacute;n de Descargables en la plataforma.</strong></p>
      </li>
      <li>History Chanel. (s/f).&nbsp; <em><a href="http://youtu.be/PRoUjUbryI8" target="_blank"><strong>Pareidolia. Cerebro y percepci&oacute;n de caras.</strong></a></em> Recuperado con fines did&aacute;cticos el 05 de Marzo de 2015, de:  https://www.youtube.com/watch?v=0Mqwp1WaH9o<br />
        <br />
        <p><strong>Para revisar el material indicado da clic en el siguiente enlace o bien, revisa la secci&oacute;n de Descargables en la plataforma.</strong></p>
      </li>
      <li>Orellana, O., Garc&iacute;a,  L., Pomalaya, R., Morocho, J., Elizalde, R., Sol&oacute;rzano, L., Rivera, J., Sotelo,  L., Salazar, M., Orellana, D. y Ch&aacute;vez, J. (2006). <em><a href="../LPSBC03PBC01/Desc/pcb_un1des7.pdf" target="_blank"><strong>Modelos mentales de la calidad universitaria en estudiantes  Sanmarquinos.</strong></a></em><a href="../LPSBC03PBC01/Desc/pcb_un1des7.pdf">&nbsp;</a>&nbsp; Recuperado el 30 de  Noviembre de 2011, de: file:///C:/Users/Alumno/Downloads/Dialnet-ModelosMentalesDeLaCalidadUniversitariaEnEstudiant-2337974%20(2).pdf<br />
        <br />
        <p><strong>Para revisar el material indicado da clic en el siguiente enlace o bien, revisa la secci&oacute;n de Descargables en la plataforma.</strong></p>
      </li>
      <li>Wikiaraujo. (s/f). <em><a href="../LPSBC03PBC01/Desc/pcb_un1des8.pdf" target="_blank"><strong>Psicolog&iacute;a como ciencia.</strong></a></em><strong><a href="../LPSBC03PBC01/Desc/pcb_un1des8.pdf">&nbsp;</a></strong> Recuperado el 30 de Noviembre de 2011, de: http://www.educa.madrid.org/web/ies.laserna.fuenlabrada/filosofia/psicologia/psicologia_ciencia.pdf<br />
        <br />
        <p><strong>Para revisar el material indicado da clic en el siguiente enlace o bien, revisa la secci&oacute;n de Descargables en la plataforma.</strong></p>
      </li>
      <li>V&aacute;zquez, E. (s/f). <em><a href="../LPSBC03PBC01/Desc/pcb_un1des9.pdf" target="_blank"><strong>L&iacute;nea del tiempo</strong></a></em><strong>.</strong> Recuperado el 05 de  Marzo de 2015, de: http://www.prepa9.unam.mx/historia/documentos/4.pdf<br />
        <br />
        <p><strong>Para revisar el material indicado da clic en el siguiente enlace o bien, revisa la secci&oacute;n de Descargables en la plataforma.</strong></p>
      </li>
    </ol><table width="100%" border="0" height="100%">
      <tr>
        <td width="20%"><div align="center"><a href= "ContLPSBC03PBC01_1_4_1.jsp" ><img src="Img/REGRESAR.png" width="99" height="32" /></a></div></td>
        <td class="label_Conceptual">RESUMEN</td>
        <td width="20%"> </td>
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
