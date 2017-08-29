
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
 	<!-- InstanceBeginEditable name="Trabajo" --><p style="text-align: center;"><span style="font-size: 12pt;"><span style="line-height: 115%;"><span mt="" style="font-family:;"><strong><font color="#000000">UNIDAD 1. TEOR&Iacute;AS DEL CONOCIMIENTO</font></strong></span></span></span></p><p style="text-align: center;"><span style="font-size: 12pt;"><span style="line-height: 115%;"><span mt="" style="font-family:;"><strong><font color="#000000"><img alt="" src="Img/1/ContTEST_1_1_1.png" style="width: 500px; height: 239px;" /></font></strong></span></span></span></p><p style="text-align: center;"><span style="font-size: 12pt;"><span style="line-height: 115%;"><span mt="" style="font-family:;"><strong><font color="#000000"><img alt="" src="Img/1/ContTEST_1_1_2.png" style="width: 500px; height: 351px;" /></font></strong></span></span></span></p><p style="margin: 0in 0in 10pt; text-align: justify;"><font face="Gill Sans MT"><font size="3"><font color="#000000">En el siguiente esquema se representan los contenidos tem&aacute;ticos correspondientes a la primer unidad Epistemolog&iacute;a de la Psicolog&iacute;a; compa&ntilde;ero estudiante&hellip; sigue adelante y felicidades.</font></font></font></p><p align="center" style="margin: 0in 0in 10pt; text-align: center;">&nbsp;</p><p align="center" style="margin: 0in 0in 10pt; text-align: center;"><b><font face="Gill Sans MT"><font size="3"><font color="#000000">INTRODUCCI&Oacute;N</font></font></font></b></p><p style="margin: 0in 0in 10pt; text-align: justify;"><font face="Gill Sans MT"><font size="3"><font color="#000000">El contenido tem&aacute;tico de esta unidad I pretende lograr que el estudiante identifique los conceptos b&aacute;sicos de la epistemolog&iacute;a, que le servir&aacute;n como herramienta para adentrarse a las diferentes posturas que encierran a la Psicolog&iacute;a.</font></font></font></p><p style="margin: 0in 0in 10pt; text-align: justify;"><font face="Gill Sans MT"><font size="3"><font color="#000000">La unidad est&aacute; estructurada de tal forma, que poco a poco te vayas familiarizando con la tem&aacute;tica, adquiriendo la conceptualizaci&oacute;n necesaria para el manejo y la comprensi&oacute;n de los temas que se te presentar&aacute;n a lo largo de todo el programa</font></font></font></p><p style="margin: 0in 0in 10pt; text-align: justify;"><font face="Gill Sans MT"><font size="3"><font color="#000000">En la unidad I aprender&aacute;s los conceptos fundamentales que encierran a la epistemolog&iacute;a, mediante sus definiciones. Por otro lado identificar&aacute;s las aportaciones que han hecho grandes fil&oacute;sofos al desarrollo del conocimiento, as&iacute; como su origen a trav&eacute;s de dos grandes posturas el Racionalismo y el Empirismo. Por otro lado aprender&aacute;s conceptos como: Ciencia, Realidad y Conocimiento.</font></font></font></p><p style="margin: 0in 0in 10pt; text-align: justify;"><font face="Gill Sans MT"><font size="3"><font color="#000000">Se incluye adem&aacute;s la esencia del conocimiento que nos ayudar&aacute; a entender la relaci&oacute;n que existe entre el sujeto-objeto, a trav&eacute;s de dos corrientes filos&oacute;ficas, cada una defendiendo su postura acerca de la fuente del conocimiento. </font></font></font></p><p style="margin: 0in 0in 10pt; text-align: justify;"><font face="Gill Sans MT"><font size="3"><font color="#000000">Cada contenido tem&aacute;tico de esta unidad ha sido dise&ntilde;ado a la nueva estrategia de ense&ntilde;anza- aprendizaje por competencias, en donde por sus caracter&iacute;sticas de modalidad a distancia o virtual y caracterizado por el auto aprendizaje, es necesario que sigas todas las instrucciones, que des seguimiento a tus actividades de aprendizaje, a la realizaci&oacute;n y entrega de tus proyectos, as&iacute; como a poner inter&eacute;s en las evaluaciones y asesor&iacute;as para que puedas alcanzar el &eacute;xito y cumplas tu meta de obtener tu bachillerato general.</font></font></font></p><p style="margin: 0in 0in 10pt; text-align: justify;"><font face="Gill Sans MT"><font size="3"><font color="#000000">En cada uno de los contenidos que se te presentan, es importante que apliques tus capacidades cognoscitivas como: pensamiento, comprensi&oacute;n, aplicaci&oacute;n, an&aacute;lisis, s&iacute;ntesis y evaluaci&oacute;n, para su m&aacute;ximo aprovechamiento.</font></font></font></p><p style="margin: 0in 0in 10pt; text-align: justify;">&nbsp;</p><p style="margin: 0in 0in 10pt; text-align: justify;">&nbsp;</p><p style="margin: 0in 0in 10pt; text-align: justify;">&nbsp;</p><p align="center" style="margin: 0in 0in 0pt; text-align: center;"><span style="line-height: normal;"><b><font face="Gill Sans MT"><font size="3"><font color="#000000">V&Iacute;NCULACI&Oacute;N DID&Aacute;CTICA </font></font></font></b></span></p><p style="text-align: center;"><font size="3"><font color="#000000"><b><span lang="ES-MX" style="font-size: 12pt;"><span style="line-height: 115%;"><span mt="" style="font-family:;">CONTENIDO-COMPETENCIAS</span></span></span></b></font></font></p><p style="text-align: center;"><font size="3"><font color="#000000"><b><span lang="ES-MX" style="font-size: 12pt;"><span style="line-height: 115%;"><span mt="" style="font-family:;"><img alt="" src="Img/1/ContTEST_1_1_3.jpg" style="width: 500px; height: 376px;" /></span></span></span></b></font></font></p><p style="list-style-type: none;"><span style="tab-stops: 147.75pt;"><b><font face="Gill Sans MT"><font size="3"><font color="#000000">1.1</font></font></font></b><font color="#000000"><b><font face="Gill Sans MT"><font size="3">NOCIONES FUNDAMENTALES</font></font></b></font></span></p><p style="margin: 0in 0in 10pt; text-align: justify;"><span style="tab-stops: 147.75pt;"><font face="Gill Sans MT"><font size="3"><font color="#000000">Para el estudio de esta unidad de aprendizaje es necesario conocer los elementos b&aacute;sicos de la epistemolog&iacute;a que nos permitir&aacute;n entender los conceptos que encierran a la Psicolog&iacute;a.</font></font></font></span></p><p style="margin: 0in 0in 10pt;">&nbsp;</p><p style="margin: 0in 0in 10pt;"><span style="tab-stops: 147.75pt;"><b><font face="Gill Sans MT"><font size="3"><font color="#000000">1.1.1 EPISTEMOLOG&Iacute;A</font></font></font></b></span></p><p><font size="3"><font color="#000000"><span lang="ES-MX" style="font-size: 12pt;"><span style="line-height: 115%;"><span mt="" style="font-family:;">Bunge sugiere una definici&oacute;n general de epistemolog&iacute;a en los siguientes t&eacute;rminos: &ldquo;La epistemolog&iacute;a, o filosof&iacute;a de la ciencia, es la rama de la filosof&iacute;a que estudia la investigaci&oacute;n cient&iacute;fica y su producto, el conocimiento cient&iacute;fico&rdquo; (Bunge, 1982: 13).</span></span></span></font></font></p><p style="text-align: center;"><font size="3"><font color="#000000"><span lang="ES-MX" style="font-size: 12pt;"><span style="line-height: 115%;"><span mt="" style="font-family:;"><img alt="" src="Img/1/ContTEST_1_1_4.jpg" style="width: 320px; height: 401px;" /></span></span></span></font></font></p><p style="margin: 0in 0in 10pt; text-align: justify;"><span style="tab-stops: 147.75pt;"><font face="Gill Sans MT"><font size="3"><font color="#000000">Podemos mencionar, que desde los antiguos Griegos, se pensaba en la concepci&oacute;n de la epistemolog&iacute;a, esto en la filosof&iacute;a presocr&aacute;tica, Ari</font></font></font></span><span style="tab-stops: 147.75pt;"><font face="Gill Sans MT"><font size="3"><font color="#000000">st&oacute;teles y Plat&oacute;n. </font></font></font></span></p><p style="margin: 0in 0in 10pt; text-align: justify;"><span style="tab-stops: 147.75pt;"><font face="Gill Sans MT"><font size="3"><font color="#000000">Plat&oacute;n y Arist&oacute;teles demostraron inter&eacute;s en establecer los criterios adecuados para justificar la verdad del conocimiento humano. En ese sentido, es pertinente hacer una exposici&oacute;n de los argumentos ofrecidos por los fil&oacute;sofos de la antigua Grecia con el fin de conocer el origen de la preocupaci&oacute;n sistem&aacute;tica en relaci&oacute;n a la importancia que tiene el estudio de la justificaci&oacute;n de la verdad del conocimiento.</font></font></font></span></p><p><font color="#000000"><span lang="ES-MX" style="font-size: 12pt;"><span style="line-height: 115%;"><span mt="" style="font-family:;">La epistemolog&iacute;a, tradicionalmente se ha interesado en las cuestiones acerca de si las creencias sobre el mundo est&aacute;n </span></span></span><img alt="" src="Img/1/ContTEST_1_1_5.gif" style="width: 300px; height: 355px; float: right;" /></font></p><p><font color="#000000"><span lang="ES-MX" style="font-size: 12pt;"><span style="line-height: 115%;"><span mt="" style="font-family:;">argumentadas y confirmadas, o si las personas est&aacute;n permitidas para tener acceso a ellas, de esta manera los epistem&oacute;logos intentaron hallar m&eacute;todos adecuados de investigaci&oacute;n, descartando los procedimientos considerados irracionales. Ante esto, la epistemolog&iacute;a toma al m&eacute;todo cient&iacute;fico como un acercamiento a la realidad, tratando de explicar lo m&aacute;s simple hasta lo m&aacute;s complejo, el porqu&eacute; de las cosas, o al menos ese es su fin.</span></span></span> </font></p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p style="margin: 0in 0in 10pt; text-align: justify;"><span style="tab-stops: 147.75pt;"><b><font face="Gill Sans MT"><font size="3"><font color="#000000">1.1.2 CONOCIMIENTO </font></font></font></b></span></p><p style="margin: 0in 0in 10pt;"><span style="tab-stops: 147.75pt;"><font face="Gill Sans MT"><font size="3"><font color="#000000">Desde que el hombre tiene uso de raz&oacute;n ha intentado descubrir y dar explicaciones a todo aquello que pueda formar parte de nuestro mundo y esto es una b&uacute;squeda de conocimientos. </font></font></font></span></p><p style="margin: 0in 0in 10pt; text-align: justify;"><span style="tab-stops: 147.75pt;"><font face="Gill Sans MT"><font size="3"><font color="#000000">Los presocr&aacute;ticos estudiaron la naturaleza del conocimiento humano, con la &uacute;nica finalidad de diferenciarla de las percepciones procedentes de los sentidos. De esta manera intentaron responder preguntas b&aacute;sicas como: &iquest;Qu&eacute; distingue al conocimiento verdadero del conocimiento falso?</font></font></font></span></p><p style="margin: 0in 0in 10pt; text-align: justify;"><span style="tab-stops: 147.75pt;"><font face="Gill Sans MT"><font size="3"><font color="#000000">Estos pensadores llegaron a sus conclusiones a trav&eacute;s de la raz&oacute;n especulativa. Esto quiere decir que entre estos fil&oacute;sofos hubo una mutua opini&oacute;n de que el conocimiento est&aacute; vinculado con las actividades del pensamiento. Las ideas difundidas por algunas doctrinas inspiraron a Plat&oacute;n, Arist&oacute;teles y Kant a elaborar su teor&iacute;a sobre el conocimiento:</font></font></font></span></p><p><font color="#000000"><font size="3"><b><span lang="ES-MX" style="font-size: 12pt;"><span style="line-height: 115%;"><span mt="" style="font-family:;">PLAT&Oacute;N &ldquo;Conocimiento verdadero&rdquo;</span></span></span></b></font><span lang="ES-MX" style="font-size: 12pt;"><span style="line-height: 115%;"><span mt="" style="font-family:;">: Ser y conocer son cosas sucesivas, de tal manera que el conocer corresponde exactamente a los grados del ser, de acuerdo a estas relaciones establece 3 niveles </span></span></span></font><span lang="ES-MX" style="font-size: 12pt;"><span style="line-height: 115%;"><span mt="" style="font-family:;"><span style="color: rgb(0, 0, 0);">del </span><a><span style="color: rgb(0, 0, 0);">ser:</span></a></span></span></span></p><p>&nbsp;</p><table border="1" cellpadding="1" cellspacing="1" style="width: 700px;">	<tbody>		<tr>			<td><img alt="" src="Img/1/ContTEST_1_1_6.jpg" style="width: 182px; height: 142px;" /></td>			<td>			<p style="margin: 0in 0in 10pt; text-align: justify;"><strong><font face="Gill Sans MT"><font size="3"><font color="#000000">Relativo a los seres materiales y sensibles, en el que los sentidos son primordiales (Medina, N., 2007: 31).</font></font></font></strong></p>			</td>		</tr>		<tr>			<td><img alt="" src="Img/1/ContTEST_1_1_7.jpg" style="width: 187px; height: 136px;" /></td>			<td><span lang="ES-MX" style="font-size: 12pt;"><span style="line-height: 115%;"><span mt="" style="font-family:;"><strong><font color="#000000">Que versa sobre el concepto de n&uacute;mero y cantidad, en el que la imaginaci&oacute;n juega un rol importante (Medina, N., 2007:31).</font></strong></span></span></span></td>		</tr>		<tr>			<td><img alt="" src="Img/1/ContTEST_1_1_8.jpg" style="width: 187px; height: 125px;" /></td>			<td>			<p><font face="Gill Sans MT"><font size="3"><font color="#000000"><b>Trata de los seres carentes de toda materia y de toda cantidad, en el que el entendimiento es importante (Medina, N., 2007: 31), este conocimiento forma parte del mundo de las ideas, es por eso que carece de materia y cantidad ya que no pueden ser percibidas por lo sentidos, la raz&oacute;n, etc.</b></font></font></font></p>			</td>		</tr>	</tbody></table><p style="margin: 0in 0in 10pt; text-align: justify;"><span style="tab-stops: 147.75pt;"><font face="Gill Sans MT"><font size="3"><font color="#000000">Para Plat&oacute;n el conocimiento tiene un car&aacute;cter primordialmente ideal, que no ten&iacute;a nada que ver con la percepci&oacute;n, por lo tanto nada es digno de ser llamado conocimiento que se derive de los sentidos. El &uacute;nico conocimiento verdadero se refiere a los &ldquo;conceptos&rdquo;.</font></font></font></span></p><p style="margin: 0in 0in 10pt; text-align: justify;">&nbsp;</p><p style="margin: 0in 0in 10pt; text-align: justify;"><font face="Gill Sans MT"><font size="3"><font color="#000000"><b><span lang="ES-MX" style="line-height: 115%;">ARIST&Oacute;TELES &ldquo;Conocimiento Cient&iacute;fico&rdquo;: </span></b><span lang="ES-MX" style="line-height: 115%;">d</span>istingue 2 tipos de conocimiento:</font></font></font></p><ol start="5" style="list-style-type: lower-roman;">	<li style="margin: 0in 0in 0pt 0.5in; text-align: justify;"><font color="#000000"><font face="Gill Sans MT"><font size="3"><b>SENSITIVO:</b> Fuente de todos nuestros conocimientos, es verdadero, pero no cient&iacute;fico, ya que est&aacute; sujeto al movimiento y a la mutaci&oacute;n de las cosas, es decir; no distingue lo sustancial de lo accidental.</font></font></font></li>	<li style="margin: 0in 0in 10pt 0.5in; text-align: justify;" value="5"><font color="#000000"><font face="Gill Sans MT"><font size="3"><b>INTELECTIVO:</b> Es un medio para construir ciencia, ya que se pueden producir conceptos universales con los caracteres de fijeza, estabilidad y necesidad, y esto es lo que requiere el Conocimiento Cient&iacute;fico.</font></font></font></li></ol><p style="margin: 0in 0in 10pt 0.25in;"><b><font face="Gill Sans MT"><font size="3"><font color="#000000">CARACTER&Iacute;STICAS DEL CONOCIMIENTO CIENT&Iacute;FICO</font></font></font></b></p><ol>	<li style="margin: 0in 0in 0pt 21pt; text-align: justify;"><font color="#000000"><font face="Gill Sans MT"><font size="3">Es un conocimiento de la esencia de las cosas</font></font></font></li>	<li style="margin: 0in 0in 0pt 21pt; text-align: justify;"><font color="#000000"><font face="Gill Sans MT"><font size="3">Es un conocimiento de las cosas por sus causas: no basta saber que una cosa es, si no que hay que saber tambi&eacute;n qu&eacute; es y porque es. </font></font></font></li>	<li style="margin: 0in 0in 0pt 21pt; text-align: justify;"><font color="#000000"><font face="Gill Sans MT"><font size="3">Es un conocimiento necesario: el juicio necesario que es propio de la ciencia, consiste en saber que una cosa es as&iacute; y no puede ser de otra manera.</font></font></font></li>	<li style="margin: 0in 0in 10pt 21pt; text-align: justify;"><font color="#000000"><font face="Gill Sans MT"><font size="3">Es un conocimiento Universal: &ldquo;Universal&rdquo; no debe entenderse en el sentido abstracto, ni contrapuesto a lo particular y concreto, si no como un semejante a fijo, inmutable y necesario.</font></font></font></li></ol><p><font color="#000000"><font size="3"><b><span lang="ES-MX" style="font-size: 12pt;"><span style="line-height: 115%;"><span mt="" style="font-family:;">KANT &ldquo;EL CONOCIMIENTO CIENT&Iacute;FICO &ldquo;:</span></span></span></b></font><span lang="ES-MX" style="font-size: 12pt;"><span style="line-height: 115%;"><span mt="" style="font-family:;"> el &uacute;nico medio por el cual el conocimiento humano puede relacionarse inmediatamente con los objetos es la <b>intuici&oacute;n.</b> (Medina, N., 2007: 35). La capacidad de recibir representaciones de los objetos mediante la afecci&oacute;n por los mismos es la<b> sensibilidad.</b></span></span></span></font></p><p>&nbsp;</p><p><a href="ActCmp/ActCmpTEST_1_1_1.docx"><span style="color: rgb(255, 0, 0);"><span lang="ES-MX" style="font-size: 12pt;"><span style="line-height: 115%;"><span mt="" style="font-family:;"><b>ACTIVIDAD COMPLEMENTARIA 1.1</b></span></span></span></span></a></p><p>&nbsp;</p><p>&nbsp;</p><p style="margin: 0in 0in 10pt; text-align: justify;"><span style="tab-stops: 147.75pt;"><b><font face="Gill Sans MT"><font size="3"><font color="#000000">1.1.3 CIENCIA</font></font></font></b></span></p><p style="margin: 0in 0in 10pt; text-align: justify;"><span style="tab-stops: 147.75pt;"><font face="Gill Sans MT"><font size="3"><font color="#000000">&ldquo;La ciencia es el conjunto de conocimientos de validez universal que, como formas legales predicen el comportamiento de los objetos de la realidad&rdquo; (Wartofsky, M., 1986: 6).</font></font></font></span></p><p><font color="#000000"><span lang="ES-MX" style="font-size: 12pt;"><span style="line-height: 115%;"><span style="font-family: &quot;Gill Sans MT&quot;,&quot;sans-serif&quot;;">La ciencia se divide de acuerdo a su objeto de estudio en </span></span></span></font><span lang="ES-MX" style="font-size: 12pt;"><span style="line-height: 115%;"><span style="font-family: &quot;Gill Sans MT&quot;,&quot;sans-serif&quot;;"><a><span style="color: rgb(0, 0, 0);">formales y f&aacute;cticas</span></a></span></span></span></p><table border="1" cellpadding="1" cellspacing="1" style="width: 709px; height: 258px;">	<tbody>		<tr>			<td><span lang="ES-MX" style="font-size: 12pt;"><span style="line-height: 115%;"><span style="font-family: &quot;Gill Sans MT&quot;,&quot;sans-serif&quot;;"><img alt="" src="Img/1/ContTEST_1_1_9.jpg" style="width: 145px; height: 107px;" /></span></span></span></td>			<td>			<div class="O0" style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0.38in;"><span style="language: es;"><span style="font-size: 12pt;">&bull;</span><span style="font-size: 12pt;"><span style="color: black;"><span style="font-family: &quot;Gill Sans MT&quot;;"><span style="font-weight: bold;"><span style="language: es-MX;">Este tipo de ciencia se desarrolla siguiendo procedimientos deductivos. Los objetos de conocimiento de este tipo de ciencia son los &quot;ideales&quot;: numeros, relaciones matem&aacute;ticas y l&oacute;gicas y formas puras del razonamiento.</span></span></span></span></span></span></div>			</td>		</tr>		<tr>			<td><img alt="" src="Img/1/ContTEST_1_1_10.jpg" style="width: 146px; height: 124px;" /></td>			<td>			<div class="O0" style="text-align: justify; margin-top: 0pt; margin-bottom: 0pt; margin-left: 0.38in;"><span style="-ms-text-justify: inter-ideograph;"><span style="language: es;"><span style="font-size: 12pt;">&bull;</span><span style="font-size: 12pt;"><span style="color: black;"><span style="font-family: &quot;Gill Sans MT&quot;;"><span style="font-weight: bold;"><span style="language: es-MX;">Este tipo de ciencia se desarrolla siguiendo procedimientos Inductivos. Los objetos de conocimiento de este tipo de ciencia son los &quot;reales&quot;: la naturaleza (las cosas y los fenomenos) y la sociedad .</span></span></span></span></span></span></span></div>			</td>		</tr>	</tbody></table><p>&nbsp;</p><p><span lang="ES-MX" style="font-size: 12pt;"><span style="line-height: 115%;"><span style="font-family: &quot;Gill Sans MT&quot;,&quot;sans-serif&quot;;"><strong><font color="#000000">CARACTER&Iacute;STICAS DE LA CIENCIA</font></strong></span></span></span></p><p style="text-align: center;"><span lang="ES-MX" style="font-size: 12pt;"><span style="line-height: 115%;"><span style="font-family: &quot;Gill Sans MT&quot;,&quot;sans-serif&quot;;"><strong><font color="#000000"><img alt="" src="Img/1/ContTEST_1_1_11.png" style="width: 500px; height: 369px;" /></font></strong></span></span></span></p><ul>	<li style="margin: 0in 0in 0pt 0.5in; text-align: justify;"><font color="#000000"><font face="Gill Sans MT"><font size="3"><b>F&aacute;ctica: </b>Busca describir los hechos tal y como son, no para modificarlos sino para aproximarse.</font></font></font></li>	<li style="margin: 0in 0in 0pt 0.5in; text-align: justify;"><font color="#000000"><font face="Gill Sans MT"><font size="3"><b>Anal&iacute;tica: </b>Aborda los problemas uno a uno y trata de descomponer todo en elementos a fin de descubrir las causas responsables de los fen&oacute;menos, una vez analizados todos los elementos se reconstruye de acuerdo a las partes interconectadas.</font></font></font></li>	<li style="margin: 0in 0in 0pt 0.5in; text-align: justify;"><font color="#000000"><font face="Gill Sans MT"><font size="3"><b>Clara y Precisa</b>: Son necesarias, ya que nos ayudaran a evitar la vaguedad, debido a que los problemas deben formularse de manera clara y precisa.</font></font></font></li>	<li style="margin: 0in 0in 0pt 0.5in; text-align: justify;"><font color="#000000"><font face="Gill Sans MT"><font size="3"><b>Sistem&aacute;tica: </b>Forma en s&iacute; misma un sistema, es decir la ciencia no son elementos independientes que no se relacionan, sino un sistema conectado l&oacute;gicamente entre s&iacute;. </font></font></font></li>	<li style="margin: 0in 0in 0pt 0.5in; text-align: justify;"><font color="#000000"><font face="Gill Sans MT"><font size="3"><b>Explicativa: </b>Pretende explicar los hechos en t&eacute;rminos de leyes, no solo de explicaciones detalladas, explicando c&oacute;mo estos ocurren de una manera y no de otra.</font></font></font></li>	<li style="margin: 0in 0in 0pt 0.5in; text-align: justify;"><font color="#000000"><font face="Gill Sans MT"><font size="3"><b>Predictiva: </b>Trata de responder imaginando como pudo haber sido el pasado y como podr&aacute; ser el futuro, la predicci&oacute;n es una manera eficaz de poner a prueba la hip&oacute;tesis. </font></font></font></li>	<li style="margin: 0in 0in 0pt 0.5in; text-align: justify;"><font color="#000000"><font face="Gill Sans MT"><font size="3"><b>Met&oacute;dica: </b>Utiliza un determinado camino para lograr el conocimiento, es totalmente planificada.</font></font></font></li>	<li style="margin: 0in 0in 10pt 0.5in; text-align: justify;"><font color="#000000"><font face="Gill Sans MT"><font size="3"><b>Comunicable: </b>No es aislado, tiene una finalidad p&uacute;blica y expresable. Gracias a esta comunicaci&oacute;n se brinda la posibilidad que otras personas confirmen o refuten los resultados.</font></font></font></li></ul><p style="margin: 0in 0in 10pt; text-align: justify;">&nbsp;</p><p style="margin: 0in 0in 10pt; text-align: justify;"><span style="tab-stops: 147.75pt;"><b><font face="Gill Sans MT"><font color="#000000"><font size="3">1.1.4 REALIDAD</font></font></font></b></span></p><p style="margin: 0in 0in 10pt; text-align: justify;"><font face="Gill Sans MT"><font size="3"><font color="#000000">La palabra &ldquo;realidad&rdquo; proviene del lat&iacute;n &ldquo;res&rdquo;, &ldquo;cosa&rdquo; (</font><span lang="ES-MX" style="background: white;"><span style="color: rgb(51, 51, 51);">Krishnamurti</span></span><font color="#000000">, 2003:19). Los atomistas griegos cre&iacute;an que la realidad f&iacute;sica era por supuesto existente y formada por unidades peque&ntilde;as llamadas &aacute;tomos, por lo tanto las cosas y los animales compon&iacute;an a esta realidad y esta era comparable con los sentidos y la raz&oacute;n. De esta manera uno podr&iacute;a pensar que no existe alguna otra realidad fuera de este supuesto. </font></font></font></p><p style="margin: 0in 0in 10pt; text-align: justify;"><font face="Gill Sans MT"><font size="3"><font color="#000000">Sin embargo algunos fil&oacute;sofos afirmaron que exist&iacute;a otra realidad y esta comprend&iacute;a a los sue&ntilde;os, ideas, pensamientos, los n&uacute;meros, etc., todas aquellas que no se relacionaban con el mundo material. </font></font></font></p><p><font size="3"><font color="#000000"><span lang="ES-MX" style="font-size: 12pt;"><span style="line-height: 115%;"><span style="font-family: &quot;Gill Sans MT&quot;,&quot;sans-serif&quot;;">Con el tiempo lleg&oacute; la tercera realidad, el mundo espiritual, este no era material sin embargo tenia consistencia f&iacute;sica, (el para&iacute;so y el infierno).</span></span></span></font></font></p><p style="text-align: center;"><font size="3"><font color="#000000"><span lang="ES-MX" style="font-size: 12pt;"><span style="line-height: 115%;"><span style="font-family: &quot;Gill Sans MT&quot;,&quot;sans-serif&quot;;"><img alt="" src="Img/1/ContTEST_1_1_12.png" style="width: 500px; height: 335px;" /></span></span></span></font></font></p><p><a href="ACT/ActTEST_1_1_1.docx"><span style="color: rgb(255, 0, 0);"><strong><font size="3"><span lang="ES-MX" style="font-size: 12pt;"><span style="line-height: 115%;"><span style="font-family: &quot;Gill Sans MT&quot;,&quot;sans-serif&quot;;">ACTIVIDAD DE APRENDIZAJE 1.1</span></span></span></font></strong></span></a></p> 	 	 	
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
        <td class="label_Conceptual">1.1 NOCIONES FUNDAMENTALES</td>
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
