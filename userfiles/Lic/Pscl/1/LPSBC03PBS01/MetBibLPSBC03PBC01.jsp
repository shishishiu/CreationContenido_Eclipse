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
 	<h1 align="center"><strong>BIBLIOGRAF&Iacute;A</strong><strong> </strong></h1>
    <ol>
        <li>A&ntilde;a&ntilde;os, E. (1999). <em>Psicolog&iacute;a de      la atenci&oacute;n y de la percepci&oacute;n</em>. Espa&ntilde;a: Servei de Publicacions      Bellaterra. <br />
          <br />
        </li>
        <li>Ballesteros, S. (1995).&nbsp; <em>Procesos      psicol&oacute;gicos b&aacute;sicos. </em>Espa&ntilde;a<em>: </em>Universitas. <br />
          <br />
        </li>
        <li>Bechtel, W<em>. </em>(1991). <em>Filosof&iacute;a de la mente. Una panor&aacute;mica      para la ciencia cognitiva.</em> Espa&ntilde;a: Tecnos.<br />
          <br />
        </li>
        <li>Fern&aacute;ndez, J. (2002). <em>Procesos psicol&oacute;gicos b&aacute;sicos:      Psicolog&iacute;a general I.</em> Espa&ntilde;a:      Sanz y Torres.<br />
          <br />
        </li>
        <li>Fern&aacute;ndez-Abascal, E., Mart&iacute;n, M. y Dom&iacute;nguez, J. (2005). <em>Procesos      psicol&oacute;gicos</em>. Espa&ntilde;a: Pir&aacute;mide.<br />
          <br />
        </li>
        <li>Fodor, J. (1986).&nbsp; <em>La modularidad      de la mente</em>. Espa&ntilde;a: Morata.<br />
          <br />
        </li>
        <li>Fodor, J. (1986).&nbsp; <em>La modularidad      de la mente</em>. Espa&ntilde;a: Morata.<br />
          <br />
        </li>
        <li>Gross, R. (1992). <em>Psicolog&iacute;a. La ciencia de la mente y la conducta. </em>M&eacute;xico: Manual Moderno.<br />
          <br />
        </li>
        <li>Mayer, R. (1991). <em>El futuro de la psicolog&iacute;a cognitiva</em>.      Espa&ntilde;a: Alianza.<br />
          <br />
        </li>
        <li>Mayor, J., y Pinillos, J. (1990). <em>Tratado de psicolog&iacute;a general</em>.      Espa&ntilde;a: Alhambra Universidad.<br />
          <br />
        </li>
        <li>Mestre, J. y Palmero, F. (2004). <em>Procesos psicol&oacute;gicos b&aacute;sicos.      Una gu&iacute;a acad&eacute;mica para los estudios en psicopedagog&iacute;a, psicolog&iacute;a, y pedagog&iacute;a</em>.      Espa&ntilde;a: McGraw- Hill.<br />
          <br />
        </li>
        <li>Papalia, D. y &nbsp;Olds, S.      (1992). <em>Psicolog&iacute;a</em>. M&eacute;xico: McGraw-Hill. <strong></strong><br />
          <br />
        </li>
        <li>Puente, A. (1995). <em>Psicolog&iacute;a b&aacute;sica: Introducci&oacute;n al estudio      de la conducta humana</em>. Espa&ntilde;a: Pir&aacute;mide. <br />
          <br />
        </li>
        <li>Puente, A. (1998). <em>Cognici&oacute;n y aprendizaje</em>.      Espa&ntilde;a: Pir&aacute;mide. <br />
          <br />
        </li>
        <li>Rosel, F. (1999). <em>Definici&oacute;n de la psicolog&iacute;a y procesos      Psicol&oacute;gicos b&aacute;sicos</em>. Espa&ntilde;a: Uned.<br />
          <br />
        </li>
        <li>Torres, J., Tornay, F. y G&oacute;mez, E. (1998). <em>Procesos psicol&oacute;gicos      b&aacute;sicos</em>. Espa&ntilde;a, McGraw-Hill.<br />
          <br />
        </li>
        <li>Santiago J., Tornay F. y G&oacute;mez, E. (1999). <em>Procesos psicol&oacute;gicos      b&aacute;sicos</em>. Espa&ntilde;a: McGraw- Hill.<br />
          <br />
        </li>
        <li>Santiago, O. (2002). <em>Procesos psicol&oacute;gicos b&aacute;sicos</em>.      Espa&ntilde;a: Universidad de las Palmas de Gran Canaria.<br />
      </li>
    </ol>
<h2 align="center">BIBLIOGRAF&Iacute;A COMPLEMENTARIA</h2>
<ol start="1" type="1">
  <li>Crespo, A. (1997). <em>Psicolog&iacute;a general. Memoria, Pensamiento y lenguaje</em>. Espa&ntilde;a: Ram&oacute;n Areces.<br />
    <br />
  </li>
  <li>Crespo,&nbsp; A. (2002). <em>Cognici&oacute;n humana. Mente, ordenadores y neuronas. </em>Espa&ntilde;a:Ram&oacute;n Areces. <br />
    <br />
  </li>
  <li>Fern&aacute;ndez-Abascal, E., Jim&eacute;nez, M. y Mart&iacute;n, M. (2003). <em>Emoci&oacute;n y motivaci&oacute;n. La adaptaci&oacute;n humana</em>. Espa&ntilde;a: Ram&oacute;n Areces.<br />
    <br />
  </li>
  <li>Fern&aacute;ndez-Abascal, E. (1997). <em>Psicolog&iacute;a general. Motivaci&oacute;n y emoci&oacute;n.</em> Espa&ntilde;a: Ram&oacute;n Areces.<br />
    <br />
  </li>
  <li>Fern&aacute;ndez J. (1998). <em>Procesos b&aacute;sicos de psicolog&iacute;a general (I)</em>. Espa&ntilde;a: Sanz y Torres.<br />
    <br />
  </li>
  <li>Grzib, G. (2002). <em>Bases cognitivas y conductuales de la motivaci&oacute;n y emoci&oacute;n.</em> Espa&ntilde;a: Ram&oacute;n Areces.<br />
    <br />
  </li>
  <li>Grzib, G. y Briales, C. (1999). <em>Psicolog&iacute;a general.</em> Espa&ntilde;a: Centro de Estudios Ram&oacute;n Areces. <br />
    <br />
  </li>
  <li>Mayor, J. y Pinillos, J. (1992). <em>Tratado de psicolog&iacute;a general.</em> Espa&ntilde;a: Alhambra Universidad.<br />
    <br />
  </li>
  <li>Palmero, F. y Mestre, J.(2004). <em>Procesos psicol&oacute;gicos b&aacute;sicos.</em> Espa&ntilde;a: McGraw-Hill. Madrid.<br />
    <br />
  </li>
</ol> <table width="100%" border="0" height="100%">
      <tr>
        <td width="20%">&nbsp;</td>
        <td class="label_Conceptual">BIBLIOGRAF&Iacute;A</td>
        <td width="20%">&nbsp;</td>
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
