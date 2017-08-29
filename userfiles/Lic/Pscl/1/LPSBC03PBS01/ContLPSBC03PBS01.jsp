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
<h1 align="center"><strong>PRESENTACI&Oacute;N</strong></h1>
<h2 align="center"><strong>PROCESOS COGNOSCITIVOS I</strong></h2>
<p align="justify">La unidad de aprendizaje de Procesos Cognoscitivos I est&aacute; localizada dentro del n&uacute;cleo de formaci&oacute;n B&aacute;sico Conceptual, como parte de las unidades de aprendizaje obligatorias del plan de estudios de la UDEMex, la cual pretende desarrollar la competencia general de analizar y estudiar cient&iacute;ficamente los diversos procesos psicol&oacute;gicos de los organismos, con el prop&oacute;sito de obtener una visi&oacute;n general y completa del conjunto de funciones cerebrales que caracterizan a los mismos, especialmente al ser humano.<br />
  </p>
<p align="justify">Asimismo, se desarrollar&aacute;n competencias que ayudaran a dominar los conocimientos, habilidades, valores, actitudes que son indispensables&nbsp; para la comprensi&oacute;n de los procesos cognoscitivos b&aacute;sicos, lo cual es esencial para la aplicaci&oacute;n de conocimientos en la vida escolar y profesional del psic&oacute;logo.<br />
  </p>
<p align="justify">Es importante mencionar que dentro de las competencias que el alumno debe adquirir al cursar esta unidad de aprendizaje,&nbsp; adem&aacute;s de las mencionadas anteriormente, es el identificar los principales procesos psicol&oacute;gicos y cient&iacute;ficos vincul&aacute;ndolos con las &aacute;reas cl&iacute;nica, educativa, social y laboral que comprenden la psicolog&iacute;a, evitando la adquisici&oacute;n de conocimientos aislados y brindando las bases para el desarrollo de investigaci&oacute;n cient&iacute;fica. <br />
  </p>
<p align="justify">El estudiante identificar&aacute; y definir&aacute; conceptos b&aacute;sicos tales como percepci&oacute;n, atenci&oacute;n, aprendizaje, pensamiento, lenguaje, comunicaci&oacute;n, memoria, motivaci&oacute;n y emoci&oacute;n, para as&iacute; entender y adquirir los conocimientos que establezcan las bases de la conducta humana a trav&eacute;s del estudio de la unidad de aprendizaje, con el fin de tener una visi&oacute;n integradora del psiquismo humano.<br />
  </p>
<p>Como herramienta de consulta se presenta un glosario, una bibliograf&iacute;a complementaria y b&aacute;sica, as&iacute; como la mesograf&iacute;a, con la finalidad de hacer consultas bibliogr&aacute;ficas e investigaciones.</p>
<p>&nbsp;</p>
<p>A continuaci&oacute;n se presenta el mapa general del curso de Procesos Cognoscitivos I, el cual consta de cuatro unidades:</p>
<div></div>
    <h2 align="center">MAPA GENERAL DE CONTENIDOS</h2>
<p align="center">&nbsp;</p>
<p align="center"><img src="Img/INTRO/pcb_preimg1.jpg" width="685" height="528" /></p>
 	<p align="center"><strong>Figura 1. Mapa general del Curso de Procesos Cognoscitivos I</strong> <br />
 	  </p>
 	<p align="justify">&nbsp;</p>
 	<p align="justify">Esta unidad pretende generar en ti las siguientes competencias:</p>
    <div align="justify">
      <ul type="disc">
        <li>Identifica los principales      procesos b&aacute;sicos tomando como referencia la historia del desarrollo de la      psicolog&iacute;a para un aprendizaje a nivel cognitivo. <br />
          <br />
        </li>
        <li>Desarrolla tu pensamiento cr&iacute;tico      con la capacidad de indagar los procesos psicol&oacute;gicos b&aacute;sicos esenciales      para tu desarrollo en las &aacute;reas educativas. <br />
          <br />
        </li>
        <li>Describe las funciones de cada      proceso dentro del desarrollo del hombre, todo ello con el fin de lograr      un mejor entendimiento del proceso de ense&ntilde;anza y aprendizaje. <br />
          <br />
        </li>
        <li>Explica los problemas      fundamentales planteados en el estudio de los procesos psicol&oacute;gicos      b&aacute;sicos, encontrando vinculaci&oacute;n y aplicaci&oacute;n con otras unidades de      aprendizaje. <br />
          <br />
        </li>
        <li>Aplica los procesos psicol&oacute;gicos      b&aacute;sicos en los diferentes &aacute;mbitos de la vida cotidiana.</li>
      </ul>
    </div>
    <p align="justify">Antes de adentrarte en los contenidos de cada unidad, es muy importante que leas y revises constantemente el siguiente temario del curso con el objetivo de llevar un seguimiento ordenado de tu aprendizaje. El temario es el siguiente:</p>
    <p align="justify">&nbsp;</p>
    <h2 align="center"><strong>TEMARIO</strong><br />
</h2>
<h3><strong>UNIDAD 1.</strong><strong> INTRODUCCI&Oacute;N A LOS PROCESOS COGNOSCITIVOS</strong> B&Aacute;SICOS</h3>
<p align="left">&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;1.1 Introducci&oacute;n a la psicolog&iacute;a<br />
  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 1.1.1 Conceptualizaci&oacute;n de la psicolog&iacute;a y generalidades<br />
  <br />
  <br />
  &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;1.2 Historia de la&nbsp; Psicolog&iacute;a <br />
  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  1.2.1 Antecedentes y corrientes en la Psicolog&iacute;a <br />
  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br />
  <br />
  &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;1.3 Modelos de Representaci&oacute;n Mental<br />
  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  1.3.1 Representaci&oacute;n mental<br />
  <br />
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1.4 Procesos Cognoscitivos B&aacute;sicos<br />
  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 1.4.1 Cognici&oacute;n
    <br />
</p>
<h3 align="left"><br />
  UNIDAD 2. <strong>PERCEPCI&Oacute;N, ATENCI&Oacute;N Y APRENDIZAJE&nbsp; </strong></h3>
<p>&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;2.1 Percepci&oacute;n<br />
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;       2.1.1 Tipos de percepci&oacute;n<br />
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp; 2.1.2 Etapas de la percepci&oacute;n<br />
  <br />
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2.2 Atenci&oacute;n<br />
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp; 2.2.1 Teor&iacute;as y Modelos de la atenci&oacute;n<br />
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp; 2.2.2 Caracter&iacute;sticas y funciones de la atenci&oacute;n
    <br />
  <br />
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2.3 Aprendizaje<br />
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp; 2.3.1 Tipos de aprendizaje<br />
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp; 2.3.2 Condicionamiento cl&aacute;sico<br />
  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;      2.3.3 Condicionamiento operante o instrumental 
    <br />
  <br />
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2.4 Aprendizaje y Disposiciones Innatas de Conducta <br />
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp; 2.4.1 Generalidades<br />
  <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
<h3>UNIDAD 3. <strong>PENSAMIENTO,&nbsp; LENGUAJE Y COMUNICACI&Oacute;N </strong></h3>
<p>&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;3.1 Pensamiento<br />
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;       3.1.1 Razonamiento inductivo<br />
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;       3.1.2 Razonamiento deductivo<br />
  <br />
  &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;3.2 Lenguaje<br />
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;       3.2.1 El desarrollo del lenguaje
    <br />
  <br />
  &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;3.3 Lenguaje como conjunto de operaciones<br />
  <br />
  &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;3.4 Comunicaci&oacute;n<br />
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;       3.4.1 Comunicaci&oacute;n verbal<br />
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp; 3.4.2 Comunicaci&oacute;n no verbal <br />
</p>
<h3>UNIDAD 4. <strong>MEMORIA, MOTIVACI&Oacute;N Y EMOCI&Oacute;N </strong></h3>
    <p>&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;4.1 Memoria<br />
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;       4.1.1 Componentes de la memoria <br />
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp; 4.1.2 Memoria sensorial <br />
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp; 4.1.3 Memoria a corto plazo<br />
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp; 4.1.4 Memoria a largo plazo (MLP)<br />
  <br />
      &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;4.2 Funciones de la Memoria<br />
      <br />
      &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;4.3 Motivaci&oacute;n<br />
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp; 4.3.1 Tipos de motivaci&oacute;n<br />
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp; 4.3.2 El proceso motivacional <br />
      <br />
      &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;4.4 Emoci&oacute;n<br />
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;       4.4.1 Emociones b&aacute;sicas<br />
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;       4.4.1 Tipos de emociones<br />
      <br />
    </p><table width="100%" border="0" height="100%" >
      <tr>
        <td width="20%">&nbsp;</td>
        <td class="label_Conceptual">INTRODUCCI&Oacute;N</td>
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
