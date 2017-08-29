
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
 	<!-- InstanceBeginEditable name="Trabajo" --><p align="center" style="margin: 6.25pt 0in 6.25pt 0.5in; text-align: center;"><b><font face="Gill Sans MT"><font size="3">EPISTEMOLOG&Iacute;A DE LA PSICOLOG&Iacute;A</font></font></b></p><p align="center" style="margin: 6.25pt 0in 6.25pt 0.5in; text-align: center;">&nbsp;</p><p align="center" style="margin: 6.25pt 0in 6.25pt 0.5in; text-align: center;"><font face="Gill Sans MT"><font size="3"><b>PRESENTACI&Oacute;N</b></font></font></p><p style="margin: 0in 0in 10pt; text-align: justify;"><font face="Gill Sans MT"><font size="3"><font color="#000000">La unidad de aprendizaje de Epistemolog&iacute;a de la Psicolog&iacute;a forma parte del Plan de Estudios de la Licenciatura en Psicolog&iacute;a de la Universidad Digital del Estado de M&eacute;xico, la cual est&aacute; insertada en el primer cuatrimestre de dicha carrera. </font></font></font></p><p style="margin: 0in 0in 10pt; text-align: justify;"><font face="Gill Sans MT"><font size="3"><font color="#000000">El contenido del programa aporta elementos te&oacute;ricos y herramientas conceptuales, encaminados al an&aacute;lisis de la realidad desde sus diferentes posturas epistemol&oacute;gicas, para que el alumno tenga la posibilidad de comprender a la Psicolog&iacute;a como un campo espec&iacute;fico de ciencia. </font></font></font></p><p style="margin: 0in 0in 10pt; text-align: justify;"><font face="Gill Sans MT"><font size="3"><font color="#000000">Es una asignatura te&oacute;rica que busca introducir al alumno en los fundamentos, posturas y principios existentes para la inteligibilidad del conocimiento cient&iacute;fico, y de lo real; la realidad puede entenderse a partir de diferentes visones, de ah&iacute; nace la multiplicidad de disciplinas, ciencias y diferentes posturas epistemol&oacute;gicas. </font></font></font></p><p style="margin: 0in 0in 10pt; text-align: justify;"><font face="Gill Sans MT"><font size="3"><font color="#000000">En las ciencias sociales existen tres posturas claramente diferenciadas; la postura emp&iacute;rico-anal&iacute;tica, la fenomenol&oacute;gica-hermen&eacute;utica-ling&uuml;&iacute;stica y la dial&eacute;ctica o cr&iacute;tico-hermen&eacute;utica. Cada una de estas posturas posee una manera propia de concebir la realidad social y por tanto tienen caracter&iacute;sticas filos&oacute;ficas, epistemol&oacute;gicas y metodol&oacute;gicas particulares, cuyo conocimiento le puede proporcionar al Psic&oacute;logo herramientas de diverso orden para su acercamiento a la realidad. Dentro de la postura emp&iacute;rico-anal&iacute;tica se pretende inferir sobre leyes universales, que posibilitan controlar y predecir la din&aacute;mica social.</font></font></font></p><p style="margin: 0in 0in 10pt; text-align: justify;"><font face="Gill Sans MT"><font size="3"><font color="#000000">Hacer referencia a la postura fenomenol&oacute;gica-hermen&eacute;utica, implica tomar en consideraci&oacute;n todas aquellas concepciones que centran la mirada en la comprensi&oacute;n de la cotidianidad y del mundo intersubjetivo de los individuos, dado que se parte de la base &ldquo;de que todo en la realidad no es medible&rdquo;, de ah&iacute; la necesidad de asumir una nueva actitud ante el estudio de los fen&oacute;menos sociales, los cuales requieren de una mirada m&aacute;s de car&aacute;cter comprensivo e interpretativo. </font></font></font></p><p style="margin: 0in 0in 10pt; text-align: justify;"><font face="Gill Sans MT"><font size="3"><font color="#000000">Por su parte la postura Dial&eacute;ctica o cr&iacute;tico-hermen&eacute;utica, considera algo m&aacute;s all&aacute; que la cuantificaci&oacute;n y el control o la interpretaci&oacute;n, se basa en una mirada cr&iacute;tica y transformadora. Es as&iacute; que alumno adquirir&aacute; una visi&oacute;n integral de los m&eacute;todos de investigaci&oacute;n en las ciencias sociales, y, particularmente, en la psicolog&iacute;a.</font></font></font></p><p style="margin: 0in 0in 10pt; text-align: justify;"><font face="Gill Sans MT"><font size="3"><font color="#000000">Como herramienta de consulta se presenta un glosario, una bibliograf&iacute;a b&aacute;sica y complementaria, as&iacute; como la mesograf&iacute;a, con la finalidad de hacer consultas bibliogr&aacute;ficas e investigaciones.</font></font></font></p><p><font size="3"><font color="#000000"><span lang="ES-MX" style="font-size: 12pt;"><span style="line-height: 115%;"><span style="font-family: &quot;Gill Sans MT&quot;,&quot;sans-serif&quot;;">A continuaci&oacute;n se presenta el mapa general del curso de Epistemolog&iacute;a de la Psicolog&iacute;a, el cual consta de cuatro unidades:</span></span></span></font></font></p><p style="text-align: center;"><font size="3"><font color="#000000"><span lang="ES-MX" style="font-size: 12pt;"><span style="line-height: 115%;"><span style="font-family: &quot;Gill Sans MT&quot;,&quot;sans-serif&quot;;"><img alt="" src="Img/Int/ContTEST_2.jpg" style="width: 500px; height: 375px;" /></span></span></span></font></font></p><p style="margin: 0in 0in 10pt;"><font face="Gill Sans MT"><font size="3"><font color="#000000">Esta unidad de aprendizaje pretende generar en ti las siguientes competencias:</font></font></font></p><p style="margin: 0in 0in 10pt;"><font face="Gill Sans MT"><font size="3"><font color="#000000"><b>El estudiante: </b></font></font></font></p><ul>	<li style="margin: 0in 0in 10pt 0.5in; text-align: justify;"><span style="tab-stops: list .5in;"><font color="#000000"><font face="Gill Sans MT"><font size="3">Identifica y diferencia el conocimiento general del conocimiento cient&iacute;fico, considerando sus aplicaciones y sus problem&aacute;ticas.</font></font></font></span></li>	<li style="margin: 0in 0in 10pt 0.5in; text-align: justify;"><span style="tab-stops: list .5in;"><font color="#000000"><font face="Gill Sans MT"><font size="3">Describe las principales corrientes filos&oacute;ficas, as&iacute; como sus conceptos de realidad y conocimiento dentro del &aacute;mbito de la epistemolog&iacute;a.</font></font></font></span></li></ul><ul>	<li style="margin: 0in 0in 10pt 0.5in; text-align: justify;"><span style="tab-stops: list .5in;"><font color="#000000"><font face="Gill Sans MT"><font size="3">Identifica las diferentes posturas epistemol&oacute;gicas que han orientado la generaci&oacute;n del conocimiento acerca de la realidad, que le permite fundamentar el conocimiento de su realidad educativa.</font></font></font></span></li></ul><ul>	<li style="margin: 0in 0in 10pt 0.5in; text-align: justify;"><span style="tab-stops: list .5in;"><font color="#000000"><font face="Gill Sans MT"><font size="3">Analiza cr&iacute;ticamente las distintas corrientes, distinguiendo los supuestos epistemol&oacute;gicos que conforman la base de las diversas producciones.</font></font></font></span></li></ul><ul>	<li style="margin: 0in 0in 10pt 0.5in; text-align: justify;"><span style="tab-stops: list .5in;"><font color="#000000"><font face="Gill Sans MT"><font size="3">Explica los problemas epistemol&oacute;gicos fundamentales en el campo de la Psicolog&iacute;a.</font></font></font></span></li>	<li style="margin: 0in 0in 10pt 0.5in; text-align: justify;"><span style="tab-stops: list .5in;"><font color="#000000"><font face="Gill Sans MT"><font size="3">Analiza y eval&uacute;a la importancia de la epistemolog&iacute;a en su formaci&oacute;n profesional como Psic&oacute;logo. </font></font></font></span></li></ul><p style="margin: 0in 0in 10pt; text-align: justify;"><font face="Gill Sans MT"><font color="#000000"><font size="3">Antes de adentrarte en los contenidos de cada unidad, es muy importante que leas y revises constantemente el siguiente temario del curso con el objetivo de llevar un seguimiento ordenado de tu aprendizaje. El temario es el siguiente:</font></font></font></p><p style="margin: 0in 0in 10pt; text-align: justify;">&nbsp;</p><p style="margin: 0in 0in 10pt;"><font face="Gill Sans MT"><font color="#000000"><font size="3"><b>TEMARIO. EPISTEMOLOG&Iacute;A DE LA PSICOLOGIA </b></font></font></font></p><p style="margin: 0in 0in 10pt;"><font face="Gill Sans MT"><font color="#000000"><font size="3"><b>UNIDAD 1.</b><b> </b><b>TEOR&Iacute;AS DEL CONOCIMIENTO</b></font></font></font></p><p style="margin: 0in 0in 0pt; text-align: justify;"><span style="line-height: normal;"><span style="vertical-align: baseline;"><font face="Gill Sans MT"><font size="3"><span lang="ES-MX" style="color: black;">1.1 Nociones fundamentales</span></font></font></span></span></p><p style="margin: 0in 0in 0pt; text-align: justify;"><span style="line-height: normal;"><span style="vertical-align: baseline;"><font face="Gill Sans MT"><font size="3"><span lang="ES-MX" style="color: black;">1.1.1 Epistemolog&iacute;a</span></font></font></span></span></p><p style="margin: 0in 0in 0pt; text-align: justify;"><span style="line-height: normal;"><span style="vertical-align: baseline;"><font face="Gill Sans MT"><font size="3"><span lang="ES-MX" style="color: black;">1.1.2 Conocimiento</span></font></font></span></span></p><p style="margin: 0in 0in 0pt; text-align: justify;"><span style="line-height: normal;"><span style="vertical-align: baseline;"><font face="Gill Sans MT"><font size="3"><span lang="ES-MX" style="color: black;">1.1.3 Ciencia</span></font></font></span></span></p><p style="margin: 0in 0in 0pt; text-align: justify;"><span style="line-height: normal;"><span style="vertical-align: baseline;"><font face="Gill Sans MT"><font size="3"><span lang="ES-MX" style="color: black;">1.1.4 Realidad</span></font></font></span></span></p><p style="margin: 0in 0in 0pt; text-align: justify;">&nbsp;</p><p style="margin: 0in 0in 0pt; text-align: justify;"><span style="line-height: normal;"><span style="vertical-align: baseline;"><font face="Gill Sans MT"><font size="3"><span lang="ES-MX" style="color: black;">1.2 El Origen del conocimiento</span></font></font></span></span></p><p style="margin: 0in 0in 0pt; text-align: justify;"><span style="line-height: normal;"><span style="vertical-align: baseline;"><font face="Gill Sans MT"><font size="3"><span lang="ES-MX" style="color: black;">1.2.1 Racionalismo</span></font></font></span></span></p><p style="margin: 0in 0in 10pt;"><font face="Gill Sans MT"><font size="3"><span lang="ES-MX" style="color: black;">1.2.2 Empirismo</span></font></font></p><p style="margin: 0in 0in 0pt; text-align: justify;"><span style="line-height: normal;"><span style="vertical-align: baseline;"><font face="Gill Sans MT"><font size="3"><span lang="ES-MX" style="color: black;">1.3 La Esencia del conocimiento</span></font></font></span></span></p><p style="margin: 0in 0in 0pt; text-align: justify;"><span style="line-height: normal;"><span style="vertical-align: baseline;"><font face="Gill Sans MT"><font size="3"><span lang="ES-MX" style="color: black;">1.3.1 Realismo</span></font></font></span></span></p><p style="margin: 0in 0in 0pt; text-align: justify;"><span style="line-height: normal;"><span style="vertical-align: baseline;"><font face="Gill Sans MT"><font size="3"><span lang="ES-MX" style="color: black;">1.3.2 Idealismo</span></font></font></span></span></p><p style="margin: 0in 0in 0pt; text-align: justify;">&nbsp;</p><p style="margin: 0in 0in 0pt; text-align: justify;"><span style="line-height: normal;"><span style="vertical-align: baseline;"><font face="Gill Sans MT"><font size="3"><span lang="ES-MX" style="color: black;">1.4 Materialismo</span></font></font></span></span></p><p style="margin: 0in 0in 0pt; text-align: justify;"><span style="line-height: normal;"><span style="vertical-align: baseline;"><font face="Gill Sans MT"><font size="3"><span lang="ES-MX" style="color: black;">1.4.1 Materialismo Dial&eacute;ctico</span></font></font></span></span></p><p style="margin: 0in 0in 10pt;"><font face="Gill Sans MT"><font size="3"><span lang="ES-MX" style="color: black;">1.4.2 Materialismo Hist&oacute;rico</span></font></font></p><p style="margin: 0in 0in 10pt;"><b><font face="Gill Sans MT"><font color="#000000"><font size="3">UNIDAD 2. POSTURA EMP&Iacute;RICO-ANAL&Iacute;TICA</font></font></font></b></p><p style="margin: 0in 0in 0pt; text-align: justify;"><span style="line-height: normal;"><span style="vertical-align: baseline;"><font face="Gill Sans MT"><font size="3"><span style="color: black;">2.1 Antecedentes de la postura emp&iacute;rico-anal&iacute;tica</span></font></font></span></span></p><p style="margin: 0in 0in 0pt; text-align: justify;"><span style="line-height: normal;"><span style="vertical-align: baseline;"><font face="Gill Sans MT"><font size="3"><span style="color: black;">2.1.1 Positivismo</span></font></font></span></span></p><p style="margin: 0in 0in 0pt; text-align: justify;"><span style="line-height: normal;"><span style="vertical-align: baseline;"><font face="Gill Sans MT"><font size="3"><span style="color: black;">2.1.2 Neopositivismo</span></font></font></span></span></p><p style="margin: 0in 0in 0pt; text-align: justify;">&nbsp;</p><p style="margin: 0in 0in 0pt; text-align: justify;"><span style="line-height: normal;"><span style="vertical-align: baseline;"><font face="Gill Sans MT"><font size="3"><span style="color: black;">2.2 Representantes de la postura emp&iacute;rico-anal&iacute;tica</span></font></font></span></span></p><p style="margin: 0in 0in 0pt; text-align: justify;"><span style="line-height: normal;"><span style="vertical-align: baseline;"><font face="Gill Sans MT"><font size="3"><span lang="EN-US" style="color: black;">2.2.1 Comte</span></font></font></span></span></p><p style="margin: 0in 0in 0pt; text-align: justify;"><span style="line-height: normal;"><span style="vertical-align: baseline;"><font face="Gill Sans MT"><font size="3"><span lang="EN-US" style="color: black;">2.2.2 Emilio Durkheim</span></font></font></span></span></p><p style="margin: 0in 0in 0pt; text-align: justify;"><span style="line-height: normal;"><span style="vertical-align: baseline;"><font face="Gill Sans MT"><font size="3"><span lang="EN-US" style="color: black;">2.2.3 K. Popper</span></font></font></span></span></p><p style="margin: 0in 0in 0pt; text-align: justify;"><span style="line-height: normal;"><span style="vertical-align: baseline;"><font face="Gill Sans MT"><font size="3"><span lang="EN-US" style="color: black;">2.2.4 P. Lorenzen </span></font></font></span></span></p><p style="margin: 0in 0in 0pt; text-align: justify;"><span style="line-height: normal;"><span style="vertical-align: baseline;"><font face="Gill Sans MT"><font size="3"><span lang="EN-US" style="color: black;">2.2.5 Piaget </span></font></font></span></span></p><p style="margin: 0in 0in 0pt; text-align: justify;"><span style="line-height: normal;"><span style="vertical-align: baseline;"><font face="Gill Sans MT"><font size="3"><span lang="EN-US" style="color: black;">2.2.6 Stegmuller </span></font></font></span></span></p><p style="margin: 0in 0in 0pt; text-align: justify;">&nbsp;</p><p style="margin: 0in 0in 0pt; text-align: justify;"><span style="line-height: normal;"><span style="vertical-align: baseline;"><font face="Gill Sans MT"><font size="3"><span style="color: black;">2.3 Caracter&iacute;sticas epistemol&oacute;gicas de la postura </span></font></font></span></span></p><p style="margin: 0in 0in 0pt; text-align: justify;"><span style="line-height: normal;"><span style="vertical-align: baseline;"><font face="Gill Sans MT"><font size="3"><span style="color: black;">2.3.1 Verificaci&oacute;n emp&iacute;rica</span></font></font></span></span></p><p style="margin: 0in 0in 0pt; text-align: justify;"><span style="line-height: normal;"><span style="vertical-align: baseline;"><span style="color: black;"><font face="Gill Sans MT"><font size="3">2.3.2 Muestreo</font></font></span></span></span></p><p style="margin: 0in 0in 0pt; text-align: justify;">&nbsp;</p><p style="margin: 0in 0in 0pt; text-align: justify;"><span style="line-height: normal;"><span style="vertical-align: baseline;"><font face="Gill Sans MT"><font size="3"><span style="color: black;">2.4 Pasos fundamentales del m&eacute;todo emp&iacute;rico-anal&iacute;tico </span></font></font></span></span></p><p style="margin: 0in 0in 0pt; text-align: justify;"><span style="line-height: normal;"><span style="vertical-align: baseline;"><font face="Gill Sans MT"><font size="3"><span style="color: black;">2.4.1 De tipo convencional</span></font></font></span></span></p><p style="margin: 0in 0in 10pt;"><font face="Gill Sans MT"><font size="3"><span style="color: black;">2.4.2 Formulaci&oacute;n de Neil J. Salkind</span></font></font></p><p style="margin: 0in 0in 10pt;"><b><font face="Gill Sans MT"><font color="#000000"><font size="3">UNIDAD 3. POSTURA FENOMENOL&Oacute;GICO-HERMEN&Eacute;UTICA-LING&Uuml;&Iacute;STICA </font></font></font></b></p><p style="margin: 0in 0in 0pt; text-align: justify;"><span style="line-height: normal;"><span style="vertical-align: baseline;"><font face="Gill Sans MT"><font size="3"><span lang="ES-MX" style="color: black;">3.1 Antecedentes de la postura fenomenol&oacute;gico-hermen&eacute;utica-ling&uuml;&iacute;stica </span></font></font></span></span></p><p style="margin: 0in 0in 0pt; text-align: justify;"><span style="line-height: normal;"><span style="vertical-align: baseline;"><font face="Gill Sans MT"><font size="3"><span lang="ES-MX" style="color: black;">3.1.1 Sentido y comprensi&oacute;n</span></font></font></span></span></p><p style="margin: 0in 0in 0pt; text-align: justify;"><span style="line-height: normal;"><span style="vertical-align: baseline;"><font face="Gill Sans MT"><font size="3"><span lang="ES-MX" style="color: black;">3.1.2 Lenguaje, experiencia hermen&eacute;utica</span></font></font></span></span></p><p style="margin: 0in 0in 0pt; text-align: justify;"><span style="line-height: normal;"><span style="vertical-align: baseline;"><font face="Gill Sans MT"><font size="3"><span lang="ES-MX" style="color: black;">3.1.3 Filosof&iacute;a del lenguaje</span></font></font></span></span></p><p style="margin: 0in 0in 0pt; text-align: justify;"><span style="line-height: normal;"><span style="vertical-align: baseline;"><font face="Gill Sans MT"><font size="3"><span lang="ES-MX" style="color: black;">3.1.4 Intencionalidad</span></font></font></span></span></p><p style="margin: 0in 0in 0pt; text-align: justify;"><span style="line-height: normal;"><span style="vertical-align: baseline;"><font face="Gill Sans MT"><font size="3"><span lang="ES-MX" style="color: black;">3.1.5 Explicaci&oacute;n teol&oacute;gica</span></font></font></span></span></p><p style="margin: 0in 0in 0pt; text-align: justify;">&nbsp;</p><p style="margin: 0in 0in 0pt; text-align: justify;"><span style="line-height: normal;"><span style="vertical-align: baseline;"><font face="Gill Sans MT"><font size="3"><span lang="ES-MX" style="color: black;">3.2 Representantes de la postura fenomenol&oacute;gica-hermen&eacute;utica-ling&uuml;&iacute;stica</span></font></font></span></span></p><p style="margin: 0in 0in 0pt; text-align: justify;"><span style="line-height: normal;"><span style="vertical-align: baseline;"><font face="Gill Sans MT"><font size="3"><span lang="EN-US" style="color: black;">3.2.1 Dilthey </span></font></font></span></span></p><p style="margin: 0in 0in 0pt; text-align: justify;"><span style="line-height: normal;"><span style="vertical-align: baseline;"><font face="Gill Sans MT"><font size="3"><span lang="EN-US" style="color: black;">3.2.2 Ranke </span></font></font></span></span></p><p style="margin: 0in 0in 0pt; text-align: justify;"><span style="line-height: normal;"><span style="vertical-align: baseline;"><font face="Gill Sans MT"><font size="3"><span lang="EN-US" style="color: black;">3.2.3 Windelband </span></font></font></span></span></p><p style="margin: 0in 0in 0pt; text-align: justify;"><span style="line-height: normal;"><span style="vertical-align: baseline;"><font face="Gill Sans MT"><font size="3"><span lang="EN-US" style="color: black;">3.2.4 Rickert </span></font></font></span></span></p><p style="margin: 0in 0in 0pt; text-align: justify;"><span style="line-height: normal;"><span style="vertical-align: baseline;"><font face="Gill Sans MT"><font size="3"><span lang="EN-US" style="color: black;">3.2.5 M. Weber</span></font></font></span></span></p><p style="margin: 0in 0in 0pt; text-align: justify;"><span style="line-height: normal;"><span style="vertical-align: baseline;"><font face="Gill Sans MT"><font size="3"><span lang="ES-MX" style="color: black;">3.2.6 A. Schutz</span></font></font></span></span></p><p style="margin: 0in 0in 0pt; text-align: justify;"><span style="line-height: normal;"><span style="vertical-align: baseline;"><font face="Gill Sans MT"><font size="3"><span lang="ES-MX" style="color: black;">3.2.7 H.G.Gadamer </span></font></font></span></span></p><p style="margin: 0in 0in 0pt; text-align: justify;">&nbsp;</p><p style="margin: 0in 0in 0pt; text-align: justify;"><span style="line-height: normal;"><span style="vertical-align: baseline;"><font face="Gill Sans MT"><font size="3"><span lang="ES-MX" style="color: black;">3.3 Principales caracter&iacute;sticas epistemol&oacute;gicas de la postura fenomenol&oacute;gica-hermen&eacute;utica-ling&uuml;&iacute;stica</span></font></font></span></span></p><p style="margin: 0in 0in 0pt; text-align: justify;"><span style="line-height: normal;"><span style="vertical-align: baseline;"><font face="Gill Sans MT"><font size="3"><span lang="ES-MX" style="color: black;">3.3.1 La conciencia en la fenomenolog&iacute;a</span></font></font></span></span></p><p style="margin: 0in 0in 0pt; text-align: justify;">&nbsp;</p><p style="margin: 0in 0in 0pt; text-align: justify;"><span style="line-height: normal;"><span style="vertical-align: baseline;"><font face="Gill Sans MT"><font size="3"><span lang="ES-MX" style="color: black;">3.4 Metodolog&iacute;a de la investigaci&oacute;n de la postura fenomenol&oacute;gica-hermen&eacute;utica-ling&uuml;&iacute;stica</span></font></font></span></span></p><p style="margin: 0in 0in 0pt; text-align: justify;"><span style="line-height: normal;"><span style="vertical-align: baseline;"><font face="Gill Sans MT"><font size="3"><span lang="ES-MX" style="color: black;">3.4.1 Metodolog&iacute;a comprensiva</span></font></font></span></span></p><p style="margin: 0in 0in 0pt; text-align: justify;"><span style="line-height: normal;"><span style="vertical-align: baseline;"><font face="Gill Sans MT"><font size="3"><span lang="ES-MX" style="color: black;">3.4.2 Metodolog&iacute;a interpretativa</span> </font></font></span></span></p><p style="margin: 0in 0in 10pt;">&nbsp;</p><p style="margin: 0in 0in 10pt;">&nbsp;</p><p style="margin: 0in 0in 10pt;"><b><font face="Gill Sans MT"><font color="#000000"><font size="3">UNIDAD 4. POSTURA DIAL&Eacute;CTICA O CRITICO-HERMEN&Eacute;UTICA </font></font></font></b></p><p style="margin: 0in 0in 0pt; text-align: justify;"><span style="line-height: normal;"><span style="vertical-align: baseline;"><font face="Gill Sans MT"><font size="3"><span style="color: black;">4.1 Antecedentes de la postura dial&eacute;ctica o cr&iacute;tica-hermen&eacute;utica</span></font></font></span></span></p><p style="margin: 0in 0in 0pt; text-align: justify;"><span style="line-height: normal;"><span style="vertical-align: baseline;"><font face="Gill Sans MT"><font size="3"><span style="color: black;">4.1.1 Tensi&oacute;n</span></font></font></span></span></p><p style="margin: 0in 0in 0pt; text-align: justify;"><span style="line-height: normal;"><span style="vertical-align: baseline;"><font face="Gill Sans MT"><font size="3"><span style="color: black;">4.1.2 Sociedad emancipada</span></font></font></span></span></p><p style="margin: 0in 0in 0pt; text-align: justify;"><span style="line-height: normal;"><span style="vertical-align: baseline;"><font face="Gill Sans MT"><font size="3"><span style="color: black;">4.1.3 Escuela de Frankfurt</span></font></font></span></span></p><p style="margin: 0in 0in 10pt;">&nbsp;</p><p style="margin: 0in 0in 0pt; text-align: justify;"><span style="line-height: normal;"><span style="vertical-align: baseline;"><font face="Gill Sans MT"><font size="3"><span style="color: black;">4.2 Representantes de la postura dial&eacute;ctica o critico-hermen&eacute;utica</span></font></font></span></span></p><p style="margin: 0in 0in 0pt; text-align: justify;"><span style="line-height: normal;"><span style="vertical-align: baseline;"><font face="Gill Sans MT"><font size="3"><span style="color: black;">4.2.1 Marx</span></font></font></span></span></p><p style="margin: 0in 0in 0pt; text-align: justify;"><span style="line-height: normal;"><span style="vertical-align: baseline;"><font face="Gill Sans MT"><font size="3"><span style="color: black;">4.2.2 Adorno</span></font></font></span></span></p><p style="margin: 0in 0in 0pt; text-align: justify;"><span style="line-height: normal;"><span style="vertical-align: baseline;"><font face="Gill Sans MT"><font size="3"><span style="color: black;">4.2.3 Korsch </span></font></font></span></span></p><p style="margin: 0in 0in 0pt; text-align: justify;"><span style="line-height: normal;"><span style="vertical-align: baseline;"><font face="Gill Sans MT"><font size="3"><span style="color: black;">4.2.4 Luckas </span></font></font></span></span></p><p style="margin: 0in 0in 0pt; text-align: justify;"><span style="line-height: normal;"><span style="vertical-align: baseline;"><font face="Gill Sans MT"><font size="3"><span style="color: black;">4.2.5 Habermas </span></font></font></span></span></p><p style="margin: 0in 0in 0pt; text-align: justify;"><span style="line-height: normal;"><span style="vertical-align: baseline;"><font face="Gill Sans MT"><font size="3"><span style="color: black;">4.2.6 Apel </span></font></font></span></span></p><p style="margin: 0in 0in 0pt; text-align: justify;">&nbsp;</p><p style="margin: 0in 0in 0pt; text-align: justify;"><span style="line-height: normal;"><span style="vertical-align: baseline;"><font face="Gill Sans MT"><font size="3"><span style="color: black;">4.3 </span><span lang="ES-MX" style="color: black;">Principales caracter&iacute;sticas epistemol&oacute;gicas de la postura dial&eacute;ctica o critica-hermen&eacute;utica</span></font></font></span></span></p><p style="margin: 0in 0in 0pt; text-align: justify;">&nbsp;</p><p style="margin: 0in 0in 0pt; text-align: justify;"><span style="line-height: normal;"><span style="vertical-align: baseline;"><font face="Gill Sans MT"><font size="3"><span style="color: black;">4.4 Metodolog&iacute;a de la investigaci&oacute;n de la postura d</span><span lang="ES-MX" style="color: black;">ial&eacute;ctica o critica-hermen&eacute;utica</span></font></font></span></span></p><p style="margin: 0in 0in 0pt; text-align: justify;"><span style="line-height: normal;"><span style="vertical-align: baseline;"><font face="Gill Sans MT"><font size="3"><span lang="ES-MX" style="color: black;">4.4.1 Medici&oacute;n dial&eacute;ctica</span></font></font></span></span></p><p style="margin: 0in 0in 0pt; text-align: justify;"><span style="line-height: normal;"><span style="vertical-align: baseline;"><font face="Gill Sans MT"><font size="3"><span lang="ES-MX" style="color: black;">4.2.2 Explicaci&oacute;n causal </span></font></font></span></span></p> 	 	 	 	
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
