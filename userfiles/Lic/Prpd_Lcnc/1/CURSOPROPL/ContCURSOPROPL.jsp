
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.net.*" errorPage="" %>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="org.apache.commons.fileupload.*" errorPage="" %>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.util.*" errorPage="" %>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.io.*" errorPage="" %>
<!doctype html>
<html><!-- InstanceBegin template="/Templates/PlantContBachEduDis.dwt.jsp" codeOutsideHTMLIsLocked="false" -->
<head>
<meta charset="ISO-8859-1">
<title>Universidad Digital del Estado de México</title>
<!-- InstanceBeginEditable name="doctitle" -->
<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<!-- InstanceEndEditable -->
<link href='../../../../M_C/UDEM2.png' rel='shortcut icon' type='image/png'>
	<script language="javascript1.2"  src="../../../../javascript/popcalendar.js" type="text/javascript"></script> 
    
   
  
<script>
function doit(cmd,target){
	document.generic.command.value=cmd;
	document.generic.target.value=target;
	document.generic.submit();
}
</script>
 <script>
function mostrarOcultarTablas(id){
mostrado=0;
elem = document.getElementById(id);
if(elem.style.display=='block')mostrado=1;
elem.style.display='none';
if(mostrado!=1)elem.style.display='block';
}
</script>

<link href="../../../../style/style_UDEM.css" rel="stylesheet" type="text/css">
</head>

<BODY style="margin-top: 0; margin-right: 0; margin-bottom: 0; margin-left: 0" class="informationText" onload="javascript: history.go(1);" onunload="javascript: history.go(1);">
 
<jsp:useBean id="BeanGenerico" scope="page" class="generica.Generica"/>
<jsp:useBean id="BeanMenuLic" scope="page" class="generica.MenuLic"/>
<jsp:useBean id="BeanSeguridad" scope="page" class="Seguridad.Validaciones"/>
<jsp:useBean id="BeanMaterias" scope="page" class="Materias.DatosMat"/>

	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">

	       <%@ include  file ="../../../../Inc/var.txt"%>
           <%@ include  file ="../../../../Inc/ConForm.txt"%>
<%
 // HttpSession sesion = request.getSession(false);
 
HttpSession sesion = request.getSession(true);
String NomLooginUsuarios = null;
String TipUsuPerCad       = null;
String   TipUsuPer        =null;
String   AreaPer          =null;
String LoginUsuario="111";
String NombreUsuario="Usuario";
String IdSession1 =""+sesion.getId();
String IdSession2 ="";
int PermisoUsuario=0;

 NombreUsuario        =(String )sesion.getValue("LicUDEM_Nombre");
 TipUsuPer            =(String )sesion.getValue("LicUDEM_TipLoginUsu");
 LoginUsuario         =(String )sesion.getValue("LicUDEM_Usuario");
 AreaPer              =(String )sesion.getValue("LicUDEM_AreaPer");
String MatPer         =(String )sesion.getValue("LicUDEM_MatPer");
String CveMatPer      =(String )sesion.getValue("LicUDEM_CveMatPer");
String sSql           = "";

 BeanSeguridad.Ini_Validaciones   (nomDriver, nomConection);
 BeanMaterias.Init_Validaciones   (nomDriver, nomConection,"","");
 BeanMaterias.Init_Materias(MatPer);

     
	if (BeanSeguridad.Verifica_Entrada ( IdSession1 , LoginUsuario) == -1 )
	{
        LoginUsuario=null;
	} 
	
if (NombreUsuario !=null && TipUsuPer !=null && LoginUsuario !=null  )
{
  PermisoUsuario= Integer.parseInt(TipUsuPer);
   BeanMenuLic.Init_Validaciones(nomDriver, nomConection,"","../../../../" );
      
  String imglogo       = BeanMaterias.getImglogo();
  String Baner         = BeanMaterias.getBaner();
  String fondoimg      = BeanMaterias.getFondoImg();
  String FONDMENU      = BeanMaterias.getFondoMenu();
  String FONDTablaMENU = BeanMaterias.getFondoTablaMenu(); 
 
   fondoimg = FONDMENU;
 %>
 
 <table width="100%"  class="fondosup">
 <tr><td>
	<table width="800" border="0" align="center" cellpadding="0" cellspacing="0"  >
	  <tr>
	    <td   colspan="3"  height="42" >&nbsp;</td>
      </tr>
	  <tr>
	    <td width="74"   rowspan="2" >&nbsp;</td>
	   <td width="639"       rowspan="2" valign="bottom" height="83" > 
	      <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="background-image:url(../../../../Logos/<%=Baner%>.png);
	 background-size:639px 83px; "    class="Baner" height="100%" >
	        <tr>
	         <td height="30%"> <div align="center"   > <br><%=NombreUsuario + " (" + LoginUsuario + ")" + ""%> &nbsp; &nbsp; &nbsp; <%= BeanGenerico.FecHoy(1) + " " + ""%> </div></td>
	          </tr>
	        <tr>
	         <td  >  </td>
	          </tr>
          </table>
        
        </td>
	    <td width="85"   rowspan="2" valign="bottom"><img src="../../../../M_C/<%=imglogo%>.png" width="85" height="83"></td>
      </tr>
	  <tr>
	    <td width="2"   height="50"  > 
	       </td>
      </tr>
	  <tr>
	    <td   colspan="3" height="27"  valign="top">
        
        
        </td>
      </tr>
</table>
</td></tr></table>
 <link rel="stylesheet" type="text/css" href="../../../../style/menu.css">
<script language="javascript1.2" src="../../../../javascript/coolmenus4.js" type="text/javascript"></script>
<script language="javascript1.2" src="../../../../javascript/menu_init.js" type="text/javascript"></script>

<!--script language="JavaScript1.2" src="javascript/cm_addins.js"></script-->
<script>

<!-- TemplateBeginEditable name="MenusG" -->	
   
	<!-- TemplateEndEditable -->	
<%
 out.print(BeanMenuLic.MenuHor  (0,PermisoUsuario,MatPer));
 	%>	  
//Leave this line - it constructs the menu
oCMenu.construct();
</script> 
<!-- END MENU CODE -->

<table width="800"  border="0" align="center">
<Tr><td  >
<table width="800"  border="0" align="center">
  <tr>
   
    <td valign="top" >
	 <div style="overflow: auto; width: 100%; height: 460px;" id="divscroll">
 	<!-- InstanceBeginEditable name="Trabajo" --><p style="margin: 0in 0in 10pt; text-align: justify;"><span lang="ES-MX" style="color: black;"><font face="Gill Sans MT"><font size="3">Hoy en d&iacute;a, aprender a trav&eacute;s de Internet no es sin&oacute;nimo de soledad ni de aislamiento; gracias a las Tecnolog&iacute;as de la Informaci&oacute;n y la Comunicaci&oacute;n (TIC), la distancia ha dejado de ser un impedimento para la interacci&oacute;n, comunicaci&oacute;n y aprendizaje con otros alumnos y con tus maestros.</font></font></span></p>

<p style="margin: 0in 0in 10pt; text-align: justify;"><span lang="ES-MX" style="color: black;"><font face="Gill Sans MT"><font size="3">Ahora tienes la oportunidad de aprender desde cualquier lugar y a cualquier hora del d&iacute;a, siempre y cuando puedas acceder a una computadora y conectarte a Internet. Esto implica al mismo tiempo una gran responsabilidad para ti, ya que deber&aacute;s organizarte de tal forma que, estudies y cumplas con las actividades del curso en los tiempos y formas determinados. </font></font></span></p>

<p style="margin: 0in 0in 10pt; text-align: justify;"><span lang="ES-MX" style="color: black;"><font face="Gill Sans MT"><font size="3">Ahora bien, &iquest;qu&eacute; implica aprender a distancia?, &iquest;cu&aacute;les son las habilidades, estrategias y responsabilidades que como alumno debes adquirir para aprender en esta modalidad?, &iquest;cu&aacute;l es el rol de tu asesor y qu&eacute; puedes esperar de su labor?, &iquest;qu&eacute; recursos did&aacute;cticos, metodol&oacute;gicos y tecnol&oacute;gicos tienes a tu disposici&oacute;n para adquirir los nuevos conocimientos?, &iquest;c&oacute;mo aprender colaborando con el grupo?, &iquest;c&oacute;mo evaluar tu aprendizaje? Las respuestas a todas estas preguntas las ir&aacute;s construyendo a lo largo de este curso.</font></font></span></p>

<p style="margin: 0in 0in 10pt; text-align: justify;"><span lang="ES-MX" style="color: black;"><font face="Gill Sans MT"><font size="3">Este curso est&aacute; dise&ntilde;ado para que puedas navegar por el sitio, acceder a las lecturas, realizar los ejercicios y actividades de aprendizaje, comunicarte con tu asesor, tu tutor y dem&aacute;s compa&ntilde;eros de manera clara y sencilla. </font></font></span></p>

<p style="margin: 0in 0in 10pt; text-align: justify;"><span lang="ES-MX" style="color: black;"><font face="Gill Sans MT"><font size="3">En este curso encontrar&aacute;s dos tipos de actividades de aprendizaje, algunas las evaluar&aacute; y retroalimentar&aacute; tu asesor, y otras est&aacute;n dise&ntilde;adas para que puedas realizar una autoevaluaci&oacute;n, estas son calificadas autom&aacute;ticamente por la plataforma y te indicar&aacute; si tus respuestas son correctas. Tu aprendizaje y evaluaci&oacute;n ser&aacute;n continuos, por ello es fundamental que realices todas las actividades de aprendizaje.</font></font></span></p>

<p style="margin: 0in 0in 10pt; text-align: justify;"><span lang="ES-MX" style="color: black;"><font face="Gill Sans MT"><font size="3">Este curso tiene cuatro unidades. En la primera unidad estudiaras las estrategias de aprendizaje que te permitir&aacute;n regular tu propio proceso de aprendizaje y que adem&aacute;s facilitaran tu trayectoria por la licenciatura. En la segunda revisaras las estrategias para reconocer y abordar los tipos de texto m&aacute;s comunes. En la tercera retomaras estrategias para administrar el tiempo y autorregular tu propio aprendizaje en funci&oacute;n de tus necesidades. Para finalizar en la unidad cuatro conocer&aacute;s el Modelo Educativo de la Universidad Digital del Estado de M&eacute;xico, en donde podr&aacute;s disipar cualquier duda sobre la din&aacute;mica de estudio de licenciatura, conociendo la modalidad a distancia y el rol de los estudiantes y asesores dentro de la misma.</font></font></span></p>

<p style="margin: 0in 0in 10pt; text-align: justify;"><span lang="ES-MX" style="color: black;"><font face="Gill Sans MT"><font size="3">Te damos la m&aacute;s cordial bienvenida al curso proped&eacute;utico para ingreso a Licenciatura y te deseamos mucho &eacute;xito. </font></font></span></p>

<p style="margin: 0in 0in 10pt; text-align: justify;"><img alt="" src="Img/Int/ContCURSOPROPL_2.png" style="width: 500px; height: 394px;" /></p>

<p style="margin: 0in 0in 10pt; text-align: justify;">&nbsp;</p>

<p style="margin: 0in 0in 10pt; text-align: justify;">&nbsp;</p>

<p style="margin: 0in 0in 10pt; text-align: justify;">&nbsp;</p>

<p style="margin: 0in 0in 10pt; text-align: justify;"><u><strong><span style="line-height: normal;"><font face="Gill Sans MT"><font color="#000000"><font size="3">Temario</font></font></font></span></strong></u></p>

<p style="margin: 0in 0in 10pt; text-align: justify;">&nbsp;</p>

<p style="margin: 0in 0in 10pt; text-align: justify;"><span style="line-height: normal;"><font face="Gill Sans MT"><font color="#000000"><font size="3">UNIDAD 1. ESTRATEGIAS DE APRENDIZAJE DEL MODELO EN L&Iacute;NEA</font></font></font></span></p>

<p style="list-style-type: none;">1.1 <span style="line-height: normal;"><font face="Gill Sans MT"><font size="3">&iquest;Qu&eacute; son las estrategias de aprendizaje?</font></font></span></p>

<p style="list-style-type: none;">1.2 <span lang="ES-MX" style="font-size: 12pt;"><span style="line-height: 115%;"><span style="font-family: &quot;Gill Sans MT&quot;,&quot;sans-serif&quot;;"><font color="#000000">Clasificaci&oacute;n y funciones de las estrategias de aprendizaje</font></span></span></span></p>

<p style="list-style-type: none;"><span style="line-height: normal;"><font face="Gill Sans MT"><font size="3">1.3 Existen diversos tipos de texto</font></font></span></p>

<p style="list-style-type: none;"><span style="line-height: normal;"><font face="Gill Sans MT"><font size="3">&nbsp;&nbsp;&nbsp; 1.3.1 Texto narrativo</font></font></span></p>

<p style="list-style-type: none;"><span style="line-height: normal;"><font face="Gill Sans MT"><font size="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1.3.1.1 </font></font></span><span lang="ES-MX" style="font-size: 12pt;"><span style="line-height: 115%;"><span style="font-family: &quot;Gill Sans MT&quot;,&quot;sans-serif&quot;;"><font color="#000000">Resumen</font></span></span></span></p>

<p style="list-style-type: none;"><span lang="ES-MX" style="font-size: 12pt;"><span style="line-height: 115%;"><span style="font-family: &quot;Gill Sans MT&quot;,&quot;sans-serif&quot;;"><font color="#000000">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1.3.1.2 L&iacute;neas de tiempo</font></span></span></span></p>

<p style="list-style-type: none;"><span lang="ES-MX" style="font-size: 12pt;"><span style="line-height: 115%;"><span style="font-family: &quot;Gill Sans MT&quot;,&quot;sans-serif&quot;;"><font color="#000000">&nbsp;&nbsp;&nbsp; 1.3.2 Texto expositivo declarativo</font></span></span></span></p>

<p style="list-style-type: none;"><span lang="ES-MX" style="font-size: 12pt;"><span style="line-height: 115%;"><span style="font-family: &quot;Gill Sans MT&quot;,&quot;sans-serif&quot;;"><font color="#000000">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1.3.2.1 </font></span></span></span><span style="line-height: normal;"><font face="Gill Sans MT"><font size="3">Cuadro sin&oacute;ptico</font></font></span></p>

<p style="list-style-type: none;"><span style="line-height: normal;"><font face="Gill Sans MT"><font size="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1.3.2.2 </font></font></span><span style="line-height: normal;"><font face="Gill Sans MT"><font size="3">Mapa conceptual</font></font></span></p>

<p style="list-style-type: none;"><span style="line-height: normal;"><font face="Gill Sans MT"><font size="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1.3.2.3 </font></font></span><span style="line-height: normal;"><font face="Gill Sans MT"><font size="3">Diagrama de flujo</font></font></span></p>

<p style="list-style-type: none;"><span style="line-height: normal;"><font face="Gill Sans MT"><font size="3">1.4 </font></font></span><span style="line-height: normal;"><font face="Gill Sans MT"><font size="3">&iquest;Qu&eacute; es la autorregulaci&oacute;n?</font></font></span></p>

<p style="list-style-type: none;"><span style="line-height: normal;"><font face="Gill Sans MT"><font size="3">&nbsp;&nbsp;&nbsp; 1.4.1 </font></font></span><span style="line-height: normal;"><font face="Gill Sans MT"><font size="3">Planeaci&oacute;n</font></font></span></p>

<p style="list-style-type: none;"><span style="line-height: normal;"><font face="Gill Sans MT"><font size="3">&nbsp;&nbsp;&nbsp; 1.4.2 </font></font></span><span style="line-height: normal;"><font face="Gill Sans MT"><font size="3">Supervisi&oacute;n</font></font></span></p>

<p style="list-style-type: none;"><span style="line-height: normal;"><font face="Gill Sans MT"><font size="3">&nbsp;&nbsp;&nbsp; 1.4.3 A</font></font></span><span style="line-height: normal;"><font face="Gill Sans MT"><font size="3">utoevaluaci&oacute;n</font></font></span></p>

<p style="margin: 0in 0in 0pt 1in;">&nbsp;</p>

<p style="margin: 0in 0in 0pt;"><span style="line-height: normal;"><font face="Gill Sans MT"><font color="#000000"><font size="3">UNIDAD 2. LECTURA Y REDACCI&Oacute;N</font></font></font></span></p>

<p style="margin: 0in 0in 0pt;"><span style="line-height: normal;"><font face="Gill Sans MT"><font color="#000000"><font size="3">2.1 Redacci&oacute;n</font></font></font></span></p>

<p style="margin: 0in 0in 0pt;"><span style="line-height: normal;"><font face="Gill Sans MT"><font color="#000000"><font size="3">&nbsp;&nbsp;&nbsp; </font></font></font></span><span style="line-height: normal;"><font face="Gill Sans MT"><font size="3">2.1.1 &iquest;C&oacute;mo redactar un escrito?</font></font></span></p>

<p style="margin: 0in 0in 0pt;"><span style="line-height: normal;"><font face="Gill Sans MT"><font size="3">&nbsp;&nbsp;&nbsp; </font></font></span><span style="line-height: normal;"><font face="Gill Sans MT"><font size="3">2.1.2 P&aacute;rrafo</font></font></span></p>

<p style="margin: 0in 0in 0pt; text-align: justify;"><span style="line-height: normal;"><font face="Gill Sans MT"><font color="#000000"><font size="3">2.2 Lectura</font></font></font></span></p>

<p style="margin: 0in 0in 0pt; text-align: justify;"><span style="line-height: normal;"><font face="Gill Sans MT"><font color="#000000"><font size="3">&nbsp;&nbsp;&nbsp; 2.2.1Prelectura</font></font></font></span></p>

<p style="margin: 0in 0in 0pt; text-align: justify;"><span style="line-height: normal;"><font face="Gill Sans MT"><font color="#000000"><font size="3">&nbsp;&nbsp;&nbsp; 2.2.2 Durante la Lectura</font></font></font></span></p>

<p style="margin: 0in 0in 0pt; text-align: justify;"><span style="line-height: normal;"><font face="Gill Sans MT"><font color="#000000"><font size="3">&nbsp;&nbsp;&nbsp; 2.2.3 Despu&eacute;s de la Lectura </font></font></font></span></p>

<p style="margin: 0in 0in 0pt; text-align: justify;"><span style="line-height: normal;"><font face="Gill Sans MT"><font color="#000000"><font size="3">&nbsp;&nbsp;&nbsp; 2.2.4 La Par&aacute;frasis </font></font></font></span></p>

<p style="margin: 0in 0in 0pt; text-align: justify;">&nbsp;</p>

<p style="margin: 0in 0in 0pt;"><font face="Gill Sans MT"><font color="#000000"><font size="3">UNIDAD 3. ADMINISTRACI&Oacute;N DEL TIEMPO</font></font></font></p>

<p style="margin: 0in 0in 0pt;"><span style="line-height: normal;"><font face="Gill Sans MT"><font color="#000000"><font size="3">3.1 &iquest;Qu&eacute; es el tiempo?</font></font></font></span></p>

<p style="margin: 0in 0in 0pt;"><span style="line-height: normal;"><font face="Gill Sans MT"><font color="#000000"><font size="3">3.2 La Administraci&oacute;n del Tiempo</font></font></font></span></p>

<p style="margin: 0in 0in 0pt;"><span style="line-height: normal;"><font face="Gill Sans MT"><font color="#000000"><font size="3">3.3 Tiempo de Calidad</font></font></font></span></p>

<p style="margin: 0in 0in 0pt;"><span style="line-height: normal;"><font face="Gill Sans MT"><font color="#000000"><font size="3">3.4 Desperdiciadores del Tiempo</font></font></font></span></p>

<p style="margin: 0in 0in 0pt;">&nbsp;</p>

<p style="margin: 0in 0in 0pt;"><span style="line-height: normal;"><font face="Gill Sans MT"><font color="#000000"><font size="3">UNIDAD 4. MODELO EDUCATIVO DE LA UDEM</font></font></font></span></p>

<p style="margin: 0in 0in 0pt;"><span style="line-height: normal;"><font face="Gill Sans MT"><font size="3">4.1 Apoyos Educativos en la Web</font></font></span></p>

<p style="margin: 0in 0in 0pt;"><span style="line-height: normal;"><font face="Gill Sans MT"><font size="3">4.2 Medios de Comunicaci&oacute;n y Herramientas de Trabajo Colaborativo</font></font></span></p>

<p style="margin: 0in 0in 0pt;"><span style="line-height: normal;"><font face="Gill Sans MT"><font size="3">4.3 Modelo Curricular Flexible</font></font></span></p>

<p style="margin: 0in 0in 0pt;"><span style="line-height: normal;"><font face="Gill Sans MT"><font size="3">4.4 Proceso de ense&ntilde;anza-aprendizaje</font></font></span></p>

<p style="margin: 0in 0in 0pt;"><span style="line-height: normal;"><font face="Gill Sans MT"><font size="3">4.5 Perfil de asesores</font></font></span></p>

<p style="margin: 0in 0in 0pt;"><span style="line-height: normal;"><font face="Gill Sans MT"><font size="3">4.6 Objetivo General del Plan de Estudio</font></font></span></p>

<p>&nbsp;</p>

 	<!-- InstanceEndEditable -->	
 </div>
  <table width="100%"   border="1" cellpadding="1">
      <tr>
        <td > 
  <div style="overflow: auto; width: 100%; height: 52px;" id="divscroll2">
 	<!-- InstanceBeginEditable name="Titulos" -->
 	<table width="100%" border="0" height="100%" >
      <tr>
        <td width="20%">&nbsp;</td>
        <td class="label_Conceptual">Introducción</td>
        <td width="20%">&nbsp;</td>
      </tr>
    </table>
    <!-- InstanceEndEditable -->	
 </div></td></tr></table>
</td>
 
  </tr>
</table>
</td></Tr>
</table>
<!-- Begin Footer Nav -->
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" bordercolor="red" bgcolor="#FFFFFF" 
 
 class="fondoInf" >
  <tr>
    <td>
<table width="800" border="0" align="center" cellpadding="0" cellspacing="0" bordercolor="red"   >
  <tr>
    <td colspan="5" height="67"><div align="center"><img src="../../../../Img/ImgGral/Gral/pleca_abajo.png" width="800" height="75" border="0" usemap="#Creditos"></div></td>
  </tr>
  <tr>
    <td colspan="5" height="17"  ><div align="center"><span class="Estilo7">Esta p&aacute;gina esta dise&ntilde;ada para verse mejor en una resoluci&oacute;n de 800 x 600 &oacute; superior Internet Explorer 5.0 &oacute; superior&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Ultima actualizaci&oacute;n: 25 de Junio del 2016 </span></div>
       </td>
  </tr>
</table>
</td></tr></table>
<%} 
else
{
response.sendRedirect("../../../../Autentifica.jsp");
}
  %>
  
<map name="Creditos" id="Creditos">
  <area shape="rect" coords="279,13,330,22" href="#" title="Diseñador: Departamento de Desarrollo y Producción de contenidos Virtuales">
  <area shape="rect" coords="350,13,399,24" href="#" title="Desarrollo: Juan Antonio Hernández Mendiola">
</map>
</body>
<!-- InstanceEnd --></html>
