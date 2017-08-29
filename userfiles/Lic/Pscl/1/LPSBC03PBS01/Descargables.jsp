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
 	<h1 align="center"><strong>DESCARGABLES <br />
 	</strong> 	</h1>
 	<h2 align="justify">PROCESOS COGNOSCITIVOS 1</h2>
 	<p align="justify"><a href="Desc/ProgCont LPSBC03PBS01.pdf" target="_blank"><strong>Contenido Imprimible</strong></a></p>
 	<h2 align="justify">PROGRAMA 	</h2>
 	<p align="justify"><a href="Desc/pcb_pro.pdf" target="_blank"><strong>Procesos Cognoscitivos I</strong></a></p>
 	<h2 align="justify">MESOGRAF&Iacute;A 	  </h2>
 	<p align="justify">D&iacute;az, A. (2009). <em><a href="Desc/pcb_cibdes1.pdf" target="_blank"><strong>Desarrollo  de habilidades adaptativas: autonom&iacute;a y vida diaria en adolescentes con  discapacidad intelectual.</strong></a></em> Recuperado el 8 de Mayo de 2012, de:  http://200.23.113.59/pdf/26180.pdf</p>
<p>Guti&eacute;rrez, M., P&eacute;rez, V. (2006). <em>Procesos psicol&oacute;gicos  b&aacute;sicos: Un an&aacute;lisis funcional</em>. Consultado el 15 de Marzo de 2011, en: <a href="http://goo.gl/RJhaXU" target="_blank"><strong>http://goo.gl/RJhaXU</strong></a></p>
 	<p>Mora, J. (1991<em>).</em><strong align="center"><em> <a href="Desc/pcb_cibdes2.pdf" target="_blank"><strong>La inteligencia como proceso  b&aacute;sico</strong></a></em><strong><a href="../Desc/">.</a></strong> </strong>Universidad de M&aacute;laga. Anales de Psicolog&iacute;a. Recuperado el 20 de Marzo  de 2011, de: http://www.um.es/analesps/v07/v07_1/04-07_1.pdf</p>
 	<p>Ordo&ntilde;ez, O. (2003). <strong align="center"><em><a href="Desc/pcb_cibdes3.pdf" target="_blank"><strong>Procesos psicol&oacute;gicos b&aacute;sicos,  Revisi&oacute;n de Estado del Arte del Conocimiento en Psicolog&iacute;a</strong></a></em><strong><a href="../Desc/">.</a></strong></strong>Publicada como  Documento de Trabajo. Publicaci&oacute;n de la&nbsp;&nbsp;  Pontificaci&oacute;n&nbsp; Universidad  Javeriana Cali. Recuperado el 20 de Marzo de 2011, de:  http://recursos.salonesvirtuales.com/assets/bloques//Full-text-Procesos-Psicol%C3%B3gicos-B%C3%A1sicos.pdf<strong align="center"><br />
 	  </strong></p>
<h2>UNIDAD 1</h2>
<p>Ca&ntilde;as, J., Antol&iacute;, A.,  Barquier, P., Castillo, A., Fajardo, I., G&oacute;mez, P. y Salmer&oacute;n, L.&nbsp; (2002). <em><a href="../LPSBC03PBC01/Desc/pcb_un1des1.pdf" target="_blank"><strong>Representaci&oacute;n  mental de los conceptos,</strong> <strong>objetos y personas implicados en una tarea realizada  en una</strong></a></em> <strong><a href="../LPSBC03PBC01/Desc/"><em>interfaz.</em></a></strong><a href="../LPSBC03PBC01/Desc/"><em></em></a>Recuperado el 23  de Noviembre de 2011, de: http://redalyc.uaemex.mx/redalyc/pdf/925/92561613.pdf</p>
<p>Espert,  R. (2008). <em>Breve historia de la  psicolog&iacute;a.</em> Consultado el 30 de Noviembre de 2011, en: <a href="http://www.dailymotion.com/video/x7vil2_breve-historia-de-la-psicologia_school#rel-page-9" target="_blank"><strong>http://www.dailymotion.com/video/x7vil2_breve-historia-de-la-psicologia_school#rel-page-9 </strong></a></p>
<p>Fern&aacute;ndez<strong>,</strong> A. (2009). <em>La psicolog&iacute;a como ciencia.</em> Consultado el 30 de Noviembre de 2011,  en: <a href="http://www.slideshare.net/albertofilosofia/la-psicologia-como-ciencia-2391811" target="_blank"><strong>http://www.slideshare.net/albertofilosofia/la-psicologia-como-ciencia-2391811 </strong></a></p>
<p>Mart&iacute;n,  F. y Mart&iacute;n, E. (2012).&nbsp; <em>Procesos metacognitivos. </em>Recuperado el  30 Noviembre de 2012, de: <a href="http://www.profes.net/rep_documentos/Monograf/1PEI_ProcMetacognitivos_b.pdf" target="_blank"><strong>http://www.profes.net/rep_documentos/Monograf/1PEI_ProcMetacognitivos_b.pdf</strong></a></p>
<p>Tijero, T. (2009). <em><a href="../LPSBC03PBC01/Desc/pcb_un1des2.pdf" target="_blank"><strong>Representaciones mentales: discusi&oacute;n cr&iacute;tica  del Modelo de situaci&oacute;n de Kintsch&acute;s.</strong></a></em> Recuperado el 23 de Noviembre de  2011, de: http://www.onomazein.net/19/tijero.pdf</p>
<p>Civera, C., Tortosa,  F. y Vera. J. (s/f). <em><a href="../LPSBC03PBC01/Desc/pcb_un1des3.pdf" target="_blank"><strong>Psicolog&iacute;a e  historia de la psicolog&iacute;a.</strong></a></em> Recuperado el 30 de Noviembre de 2011, de:  http://volivera.uprrp.edu/3046/cap2.pdf<br />
</p>
<p>Del Buey, F., Mart&iacute;,  M., Camarero, F., y S&aacute;ez, S. (s/f). <em><a href="../LPSBC03PBC01/Desc/pcb_un1des4.pdf" target="_blank"><strong>Metacognici&oacute;n.&nbsp;</strong>&nbsp;</a></em>Recuperado el 30 de Noviembre de 2011,  de:  https://www.u-cursos.cl/plataforma/2014/1/VA-01-0215/1/material_docente/previsualizar?id_material=858744</p>
<p>Explainers.tv. (s/f). <em><a href="http://youtu.be/91xuLcxEqJ4" target="_blank"><strong>Teor&iacute;a de la percepci&oacute;n.</strong></a></em> Recuperado  con fines did&aacute;cticos el 05 de Marzo de 2015, de: https://vimeo.com/33500328</p>
<p>History Chanel. (s/f).&nbsp; <em><a href="http://youtu.be/PRoUjUbryI8" target="_blank"><strong>Pareidolia. Cerebro y percepci&oacute;n de caras.</strong></a></em> Recuperado con fines did&aacute;cticos el 05 de Marzo de 2015, de:  https://www.youtube.com/watch?v=0Mqwp1WaH9o</p>
<p>Orellana, O., Garc&iacute;a,  L., Pomalaya, R., Morocho, J., Elizalde, R., Sol&oacute;rzano, L., Rivera, J., Sotelo,  L., Salazar, M., Orellana, D. y Ch&aacute;vez, J. (2006). <em><a href="../LPSBC03PBC01/Desc/pcb_un1des7.pdf" target="_blank"><strong>Modelos mentales de la calidad universitaria en estudiantes  Sanmarquinos.</strong></a></em><a href="../LPSBC03PBC01/Desc/pcb_un1des7.pdf">&nbsp;</a>&nbsp; Recuperado el 30 de  Noviembre de 2011, de: file:///C:/Users/Alumno/Downloads/Dialnet-ModelosMentalesDeLaCalidadUniversitariaEnEstudiant-2337974%20(2).pdf</p>
<p>Wikiaraujo. (s/f). <em><a href="../LPSBC03PBC01/Desc/pcb_un1des8.pdf" target="_blank"><strong>Psicolog&iacute;a como ciencia.</strong></a></em><strong><a href="../LPSBC03PBC01/Desc/pcb_un1des8.pdf">&nbsp;</a></strong> Recuperado el 30 de Noviembre de 2011, de: http://www.educa.madrid.org/web/ies.laserna.fuenlabrada/filosofia/psicologia/psicologia_ciencia.pdf</p>
<p>V&aacute;zquez, E. (s/f). <em><a href="../LPSBC03PBC01/Desc/pcb_un1des9.pdf" target="_blank"><strong>L&iacute;nea del tiempo</strong></a></em><strong>.</strong> Recuperado el 05 de  Marzo de 2015, de: http://www.prepa9.unam.mx/historia/documentos/4.pdf<br />
</p>
<h2>UNIDAD 2</h2>
<p><em><a href="http://youtu.be/jehHs2rhmvk" target="_blank"><strong>Thorndike  - Law of Effect.</strong></a></em> (s/f). Recuperado con fines did&aacute;cticos el 6 de Marzo de  2015, de: https://www.youtube.com/watch?v=Vk6H7Ukp6To&amp;NR=1</p>
<p>Saieed Hasnoo. (2011).&nbsp;<a href="http://youtu.be/xWPj4i1udrw" target="_blank"> <em><strong>BF Skinner's Operant Conditioning  Chamber.</strong></em></a>Recuperado con  fines did&aacute;cticos el 6 de Marzo de 2015, de: http://www.youtube.com/watch?v=SUwCgFSb6Nk&amp;feature=related </p>
<p>Universidad de  Alicante. (2007). <em><a href="Desc/pcb_un2des5.pdf" target="_blank"><strong>Sensaci&oacute;n, Percepci&oacute;n y  Atenci&oacute;n</strong>.</a></em>&nbsp; Recuperado el 15 de Abril  de 2011, de:  http://rua.ua.es/dspace/bitstream/10045/4298/2/TEMA%202_SENSACION,PERCEPCION,ATENCI%C3%93N.pdf</p>
<p>Oviedo, G. (2004). <em><a href="Desc/pcb_un2des6.pdf" target="_blank"><strong>La definici&oacute;n del concepto de percepci&oacute;n en  psicolog&iacute;a&nbsp; con base en la teor&iacute;a  Gestalt.</strong></a></em> Recuperado el 30 de Abril de 2011, de: file:///C:/Users/Alumno/Downloads/-data-Revista_No_18-10_Dossier8.pdf</p>
<p>Romero, A. y Jara, P.  (s/f).<a href="Desc/pcb_un2des7.pdf" target="_blank"> <em>I<strong>ntroducci&oacute;n: Concepto y marco  disciplinar del aprendizaje</strong>.</em></a>Recuperado el 5 de Marzo de 2015, de:  http://www.um.es/docencia/agustinr/ac/ac0506Cap1.pdf<br />
  </p>
<p>Universidad de  Espa&ntilde;a. (2011)<a href="Desc/pcb_un2des8.pdf" target="_blank">. <em><strong>Percepci&oacute;n</strong>.</em></a>Recuperado el 15 de Diciembre de 2011,&nbsp;  de: http://www.um.es/docencia/pguardio/documentos/percepcion.pdf<br />
</p>
<h2>UNIDAD 3</h2>
<p>Itriago, P. (2007).<em> <a href="http://youtu.be/v3YGyIXnIg4" target="_blank"><strong>El Lenguaje: Tipos y funciones.</strong></a></em>Recuperado con fines did&aacute;cticos el  9 de Marzo de 2015, de: https://www.youtube.com/watch?v=vGThUpi898w</p>
<p>Universidad  de Buenos Aires. <a href="http://youtu.be/jdIb4s08AEg" target="_blank"><strong>(2008). <em>El Lenguaje (2da  parte): Adquisici&oacute;n del lenguaje.</em></strong><em></em></a> Recuperado con fines did&aacute;cticos el 9 de  Marzo de 2015, de:  http://www.youtube.com/watch?v=U-1RwMCzSq4&amp;feature=related</p>
<p>Universidad  de Buenos Aires. (2008). <em><a href="http://youtu.be/7S9YHgdjPfI" target="_blank"><strong>El Lenguaje  (3era parte): El camino hacia el lenguaje.</strong></a></em>Recuperado con fines did&aacute;cticos  el 9 de Marzo de 2015, de: http://www.youtube.com/watch?v=coi9erJhUgQ&amp;feature=related</p>
<p>Universidad de Buenos  Aires. <a href="http://youtu.be/8Pbu2OasQVY" target="_blank"><strong>(2008). <em>El Lenguaje (6ta parte):  C&oacute;mo ayudan los adultos</em>.</strong></a> Recuperado con fines did&aacute;cticos el 9 de Marzo de  2015, de: http://www.youtube.com/watch?v=0dn6-vqrFeI&amp;NR=1&amp;feature=endscreen</p>
<p>Universidad  de Buenos Aires. (2008).<a href="http://youtu.be/E8d5hhdTd08" target="_blank"> <em><strong>El Lenguaje (7ma  parte). Caracter&iacute;sticas Formatos. Conclusiones.</strong></em></a>Recuperado con fines  did&aacute;cticos el 9 de Marzo de 2015, de: http://www.youtube.com/watch?v=svOF1UYiLw8&amp;feature=related</p>
<p>PsicoActiva.com.  (1998). &iquest;Te comunicas bien? Consultado el 12 de Diciembre de 2012, en: <a href="http://www.psicoactiva.com/tests/test2.htm" target="_blank"><strong>http://www.psicoactiva.com/tests/test2.htm</strong></a></p>
<p>Emecad&oacute;s.  (2007). <em><a href="http://youtu.be/vZS9SuUyaWU" target="_blank"><strong>Viaje a trav&eacute;s de la comunicaci&oacute;n</strong></a></em><strong><a href="http://youtu.be/vZS9SuUyaWU">.</a></strong> Recuperado con fines did&aacute;cticos el 9 de Marzo de 2015, de: http://www.youtube.com/watch?v=nKofKgZD-60 </p>
<p>Morgan,  G. (2007). <em><a href="http://youtu.be/7oliqCgoHMo" target="_blank"><strong>Les Luthiers - Radio Tertulia  - Parte VI.</strong></a></em> Recuperado con fines did&aacute;cticos el 9 de Marzo de 2015, de: http://www.youtube.com/watch?v=MW9GxhBZVMQ </p>
<p>Cestero, A. (2006). <em><a href="../LPSBC03PBC01/Desc/pcb_un3des9.pdf" target="_blank"><strong>La comunicaci&oacute;n no verbal y el estudio de su  incidencia en fen&oacute;menos discursivos como la iron&iacute;a.</strong></a></em> Recuperado el 9 de  Marzo de 2015, de:  http://rua.ua.es/dspace/bitstream/10045/6074/1/ELUA_20_03.pdf</p>
<p>S&aacute;nchez, G. (2009). <em><a href="../LPSBC03PBC01/Desc/pcb_un3des10.pdf" target="_blank"><strong>La comunicaci&oacute;n no verbal.</strong></a></em>Recuperado el  9 de Marzo de 2015, de:&nbsp;&nbsp; http://www.marcoele.com/descargas/china/g.sanchez_comunicacionnoverbal.pdf</p>
<p>Alvarado, G., De  Jes&uacute;s, G. y Villalobos, J. (2012).<strong> <em><a href="http://youtu.be/dqaPY75qnfE" target="_blank">Proceso  de la comunicaci&oacute;n.</a></em></strong> Recuperado con fines did&aacute;cticos el 9 de Marzo de 2015,  de: http://www.youtube.com/watch?v=vWv33ZGubts</p>
<p>Bonilla, A. (2010). <em><a href="http://youtu.be/2KpShRFjQ24" target="_blank"><strong>Lenguaje del cuerpo. Episodio 1</strong></a></em><strong><a href="http://youtu.be/2KpShRFjQ24">.</a></strong>Recuperado con fines did&aacute;cticos el 9 de Marzo de 2015, de:  http://www.youtube.com/watch?v=xeMue_PHCJg</p>
<p><em><a href="http://youtu.be/9DHllT7otAM" target="_blank"><strong>Comunicaci&oacute;n No Verbal- Comunicaci&oacute;n en los Negocios.</strong></a></em> (s/f). Recuperado con fines did&aacute;cticos el 9 de  Marzo de 2015, de:  http://www.youtube.com/watch?v=BF1e9i5Dv6M&amp;feature=related</p>
<p><em><a href="http://youtu.be/s2hTjXHZLvw" target="_blank"><strong>La comunicaci&oacute;n no verbal en las pel&iacute;culas de  Charlie Chaplin.</strong></a></em><strong><a href="http://youtu.be/s2hTjXHZLvw">&nbsp;</a></strong> (s/f). Recuperado con fines did&aacute;cticos el 9  de Marzo de 2015, de: http://www.youtube.com/watch?v=FEb43BePDcU</p>
<p>Morgan, G. (2007).<strong> <em><a href="http://youtu.be/7oliqCgoHMo" target="_blank">Les Luthiers - Radio Tertulia - Parte VI</a></em><a href="http://youtu.be/7oliqCgoHMo">.</a></strong>Recuperado con fines did&aacute;cticos el 9 de Marzo de 2015, de:  http://www.youtube.com/watch?v=MW9GxhBZVMQ</p>
<p> Navarro, M. (2003). <em><a href="../LPSBC03PBC01/Desc/pcb_un3des15.pdf" target="_blank"><strong>Adquisici&oacute;n del lenguaje. El principio de la  comunicaci&oacute;n.</strong></a></em>Recuperado el 15 de Abril de 2011, de: http://cvc.cervantes.es/literatura/cauce/pdf/cauce26/cauce26_13.pdf<br />
  </p>
<p>SHVOONG.com. (s/f). <em>El concepto de lenguaje.</em> Consultado el  13 de Febrero de 2012, en: <a href="http://es.shvoong.com/social-sciences/1917720-el-concepto-lenguaje/#ixzz1g99EYffB" target="_blank"><strong>http://es.shvoong.com/social-sciences/1917720-el-concepto-lenguaje/#ixzz1g99EYffB</strong></a></p>
<p><em><a href="http://youtu.be/XLFfTjyLN2g" target="_blank"><strong>Sordo_Mimo_Signos</strong></a></em> (s/f). Recuperado con fines did&aacute;cticos el 9 de  Marzo de 2015, de: http://www.youtube.com/watch?v=L2YFaz8sUFI</p>
<p>www.profesorenlinea.cl.  (s/f). <em>Comunicaci&oacute;n.</em> Consultado el 12 de  Mayo de 2012, en: <a href="http://www.profesorenlinea.cl/castellano/Comunicacion.htm" target="_blank"><strong>http://www.profesorenlinea.cl/castellano/Comunicacion.htm</strong></a></p>
<p>Bluedorn, H. (1995). <em><a href="../LPSBC03PBC01/Desc/pcb_un3des16.pdf" target="_blank"><strong>Dos m&eacute;todos de razonamiento</strong></a></em><strong><a href="../LPSBC03PBC01/Desc/pcb_un3des9.pdf">.</a></strong>Recuperado  el 15 de&nbsp; Diciembre del 2011, de:&nbsp;  http://www.contra-mundum.org/castellano/bluedorn/Met_Razonamiento.pdf</p>
<p>D&aacute;vila, G. (2006). <em><a href="../LPSBC03PBC01/Desc/pcb_un3des17.pdf" target="_blank"><strong>El razonamiento inductivo y deductivo dentro  del proceso investigativo en ciencias experimentales y sociales.</strong></a></em> Recuperado  el 15 de&nbsp; Diciembre del 2011, de:  http://redalyc.uaemex.mx/pdf/761/76109911.pdf<br />
</p>
<h2>UNIDAD 4</h2>
<p>Ballesteros, S.  (1999). <em><a href="Desc/pcb_un4des3.pdf" target="_blank"><strong>Memoria Humana: Investigaci&oacute;n y  Teor&iacute;a</strong></a></em><strong><a href="../LPSBC03PBC01/Desc/">.</a></strong> Recuperado el 20 de Abril del 2011, de:&nbsp;<br />
http://www.psicothema.com/pdf/323.pdf</p>
<p><em><a href="http://youtu.be/VnLyGqXoMe0" target="_blank"><strong>a qu&iacute;mica de las emociones.</strong></a></em> (s/f). Recuperado con fines did&aacute;cticos el 9 de  Marzo de 2015, de:<br />
http://www.youtube.com/watch?v=ULT1F3vvzrU&amp;feature=related</p>
<p align="left"><em><a href="http://youtu.be/NSc_nHP48LM" target="_blank"><strong>Motivaci&oacute;n Extraterrestres.</strong></a></em> (2008). Recuperado con fines did&aacute;cticos el 9 de  Marzo de 2015, de:<br />
http://www.youtube.com/watch?v=pQCFybFPnnY</p>
<p align="left">Etchepareborda, M.  (2005). <em><a href="Desc/pcb_un4des4.pdf" target="_blank"><strong>Memoria de trabajo en los  procesos b&aacute;sicos del aprendizaje.</strong></a></em> Recuperado el 20 de Abril del 2011, de:<br />
http://www.lafun.com.ar/PDF/21-MT_en_los_procesos_de_48C50.pdf</p>
<p align="left">Ch&oacute;liz, M. (2005). <em><a href="Desc/pcb_un4des5.pdf" target="_blank"><strong>Psicolog&iacute;a de la emoci&oacute;n.</strong></a></em> Recuperado el  16 de Diciembre del 2011, de:<br />
http://www.uv.es/choliz/Proceso%20emocional.pdf</p>
<p align="left">D&iacute;az,  A. (2009). <em><a href="Desc/pcb_cibdes1.pdf" target="_blank"><strong>Desarrollo de habilidades  adaptativas: autonom&iacute;a y vida diaria en adolescentes con discapacidad  intelectual</strong>.</a></em> <br />
Recuperado el 8 de Mayo de 2012, de:  http://200.23.113.59/pdf/26180.pdf </p>
<table width="100%" border="0" height="100%">
      <tr>
        <td width="20%">&nbsp;</td>
        <td class="label_Conceptual">1.1 PLAT&Oacute;N</td>
        <td width="20%"><div align="center"><a href= "ContLPSBC01APC01_1_1_1.jsp" ><img src="Img/AVANZAR.png" width="99" height="32"/></a></div></td>
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
