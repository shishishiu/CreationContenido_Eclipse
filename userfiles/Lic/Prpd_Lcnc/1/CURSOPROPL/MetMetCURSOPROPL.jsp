
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
 	<!-- InstanceBeginEditable name="Trabajo" --><p align="center" style="margin: 0in 0in 6pt; text-align: center;"><span style="line-height: 150%;"><b><font face="Gill Sans MT"><font size="3"><font color="#000000">METODOLOG&Iacute;A</font></font></font></b></span></p>

<p align="center" style="margin: 0in 0in 6pt; text-align: center;">&nbsp;</p>

<p style="margin: 0in 0in 6pt; text-align: justify;"><span style="line-height: 150%;"><font face="Gill Sans MT"><font size="3"><font color="#000000">El curso Proped&eacute;utico de Habilidades B&aacute;sicas del Modelo en L&iacute;nea para el ingreso a licenciatura que oferta al Universidad Digital del Estado de M&eacute;xico, tiene como principal objetivo seleccionar a los candidatos id&oacute;neos para estudiar bajo la modalidad en l&iacute;nea y a distancia, ya que se pretende que una vez concluido el curso, las personas interesadas en estudiar la Licenciatura, sean capaces de desarrollar sus actividades acad&eacute;micas de manera eficiente.</font></font></font></span></p>

<p style="margin: 0in 0in 6pt; text-align: justify;"><span style="line-height: 150%;"><font face="Gill Sans MT"><font size="3"><font color="#000000">En cada uno de los contenidos de las cuatro unidades tem&aacute;ticas del Curso Proped&eacute;utico de Habilidades B&aacute;sicas del Modelo en L&iacute;nea encontrar&aacute;s actividades de aprendizaje que tienen un valor para tu calificaci&oacute;n final, en la primer y segunda unidad encontraras 2 actividades de aprendizaje, en lo que respecta a la tercera y cuarta encontraras solamente una actividad de aprendizaje, lo que debes hacer es lo siguiente: una vez analizado y estudiado el tema o los temas debes de identificar qu&eacute; tipo de instrumento de evaluaci&oacute;n se te solicita, tambi&eacute;n llamado producto, el cual puede ser un ensayo, mapa mental, mapa conceptual etc&eacute;tera, posteriormente debes de revisar que aspectos a evaluar se consideran ya que el tiempo de entrega y la forma son determinantes para obtener el m&aacute;ximo de calificaci&oacute;n de cada actividad.</font></font></font></span></p>

<p style="margin: 0in 0in 6pt; text-align: justify;"><span style="line-height: 150%;"><font face="Gill Sans MT"><font size="3"><font color="#000000">De igual forma, se encuentra una actividad complementaria de cada unidad, que no tiene valor para la calificaci&oacute;n, sin embargo es necesaria su realizaci&oacute;n, por que refuerzan los temas estudiados. </font></font></font></span></p>

<p style="margin: 0in 0in 6pt; text-align: justify;"><span style="line-height: 150%;"><font face="Gill Sans MT"><font size="3"><font color="#000000">Se recomienda que realices todas las actividades complementarias y las de aprendizaje, ya que de ello depender&aacute; en gran medida que obtengas los conocimientos necesarios para un buen resultado, tanto en la actividad integradora como el examen final.</font></font></font></span></p>

<p style="margin: 0in 0in 6pt; text-align: justify;">&nbsp;</p>

<p style="margin: 0in 0in 6pt; text-align: justify;"><span style="line-height: 150%;"><font face="Gill Sans MT"><font size="3"><font color="#000000">Este curso tiene una duraci&oacute;n de 1 mes (4 semanas), durante las cuales se desarrollar&aacute;n 4 unidades tem&aacute;ticas, las que se distribuyen de la siguiente forma:</font></font></font></span></p>

<div align="center">
<table class="Table" style="border: 1pt solid windowtext; border-collapse: collapse;">
	<tbody>
		<tr style="height: 26.4pt;">
			<td style="background: rgb(155, 187, 89); border: 1pt solid windowtext;">
			<p align="center" style="margin: 0in 0in 6pt; padding: 0in 5.4pt; text-align: center;"><span style="line-height: 150%;"><span style="height: 26.4pt;"><b><span lang="ES-MX" style="font-size: 11pt;"><span style="color: white;"><span style="line-height: 150%;"><font face="Gill Sans MT">UNIDAD</font></span></span></span></b></span></span></p>
			</td>
			<td style="background: rgb(155, 187, 89); border-width: 1pt 1pt 1pt 0px; border-style: solid solid solid none; border-color: windowtext windowtext windowtext rgb(0, 0, 0);">
			<p align="center" style="margin: 0in 0in 6pt; padding: 0in 5.4pt; text-align: center;"><span style="line-height: 150%;"><span style="height: 26.4pt;"><b><span lang="ES-MX" style="font-size: 11pt;"><span style="color: white;"><span style="line-height: 150%;"><font face="Gill Sans MT">FECHA</font></span></span></span></b></span></span></p>
			</td>
		</tr>
		<tr style="height: 34.6pt;">
			<td style="border-width: 0px 1pt 1pt; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext;">
			<p style="margin: 0in 0in 6pt; padding: 0in 5.4pt;"><span style="line-height: 150%;"><span style="height: 34.6pt;"><span lang="ES-MX" style="font-size: 11pt;"><span style="line-height: 150%;"><font face="Gill Sans MT"><font color="#000000">1. Estrategias de Aprendizaje a Distancia</font></font></span></span></span></span></p>
			</td>
			<td style="border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0);">
			<p style="margin: 0in 0in 6pt; padding: 0in 5.4pt;">&nbsp;</p>
			</td>
		</tr>
		<tr style="height: 35.1pt;">
			<td style="border-width: 0px 1pt 1pt; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext;">
			<p style="margin: 0in 0in 6pt; padding: 0in 5.4pt;"><span style="line-height: 150%;"><span style="height: 35.1pt;"><span lang="ES-MX" style="font-size: 11pt;"><span style="color: black;"><span style="line-height: 150%;"><span style="font-family: &quot;Calibri&quot;,&quot;sans-serif&quot;;">2. Lectura y Redacci&oacute;n</span></span></span></span></span></span></p>
			</td>
			<td style="border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0);">
			<p style="margin: 0in 0in 6pt; padding: 0in 5.4pt;">&nbsp;</p>
			</td>
		</tr>
		<tr style="height: 34.85pt;">
			<td style="border-width: 0px 1pt 1pt; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext;">
			<p style="margin: 0in 0in 6pt; padding: 0in 5.4pt;"><span style="line-height: 150%;"><span style="height: 34.85pt;"><span lang="ES-MX" style="font-size: 11pt;"><span style="line-height: 150%;"><font face="Gill Sans MT"><font color="#000000">3. Administraci&oacute;n del Tiempo</font></font></span></span></span></span></p>
			</td>
			<td style="border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0);">
			<p style="margin: 0in 0in 6pt; padding: 0in 5.4pt;">&nbsp;</p>
			</td>
		</tr>
		<tr style="height: 34.5pt;">
			<td style="border-width: 0px 1pt 1pt; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext;">
			<p style="margin: 0in 0in 6pt; padding: 0in 5.4pt;"><span style="line-height: 150%;"><span style="height: 34.5pt;"><span lang="ES-MX" style="font-size: 11pt;"><span style="color: black;"><span style="line-height: 150%;"><span style="font-family: &quot;Calibri&quot;,&quot;sans-serif&quot;;">4. Modelo educativo de la UDEM</span></span></span></span></span></span></p>
			</td>
			<td style="border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0);">
			<p style="margin: 0in 0in 6pt; padding: 0in 5.4pt;">&nbsp;</p>
			</td>
		</tr>
	</tbody>
</table>
</div>

<p style="margin: 0in 0in 6pt; text-align: justify;">&nbsp;</p>

<p style="margin: 0in 0in 6pt; text-align: justify;">&nbsp;</p>

<p style="margin: 0in 0in 6pt; text-align: justify;"><span style="line-height: 150%;"><font face="Gill Sans MT"><font size="3"><font color="#000000">Para aprobar el curso debes cumplir con los siguientes requisitos:</font></font></font></span></p>

<ul>
	<li style="margin: 0in 0in 6pt 0.5in; text-align: justify;"><span style="line-height: 150%;"><font color="#000000"><font face="Calibri"><font size="3">Haber presentado al menos el 50% de las actividades de aprendizaje y que estas tengan calificaci&oacute;n.</font></font></font></span></li>
	<li style="margin: 0in 0in 6pt 0.5in; text-align: justify;"><span style="line-height: 150%;"><font color="#000000"><font face="Calibri"><font size="3">Haber presentado todas las evaluaciones por tema.</font></font></font></span></li>
	<li style="margin: 0in 0in 6pt 0.5in; text-align: justify;"><span style="line-height: 150%;"><font color="#000000"><font face="Calibri"><font size="3">Es obligatorio presentar la evaluaci&oacute;n final.</font></font></font></span></li>
	<li style="margin: 0in 0in 6pt 0.5in; text-align: justify;"><span style="line-height: 150%;"><font color="#000000"><font face="Calibri"><font size="3">Obtener en la calificaci&oacute;n total m&iacute;nimo 6.0</font></font></font></span></li>
</ul>

<p style="margin: 0in 0in 6pt; text-align: justify;">&nbsp;</p>

<p style="margin: 0in 0in 6pt; text-align: justify;">&nbsp;</p>

<p style="margin: 0in 0in 6pt; text-align: justify;">&nbsp;</p>

<p style="margin: 0in 0in 6pt; text-align: justify;">&nbsp;</p>

<p style="margin: 0in 0in 6pt; text-align: justify;">&nbsp;</p>

<p style="margin: 0in 0in 6pt; text-align: justify;">&nbsp;</p>

<p style="margin: 0in 0in 6pt; text-align: justify;">&nbsp;</p>

<p align="center" style="margin: 0in 0in 6pt; text-align: center;"><span style="line-height: 150%;"><b><font face="Gill Sans MT"><font size="3"><font color="#000000">Sistema de evaluaci&oacute;n</font></font></font></b></span></p>

<p align="center" style="margin: 0in 0in 6pt; text-align: center;">&nbsp;</p>

<p style="margin: 0in 0in 6pt; text-align: justify;"><span style="line-height: 150%;"><font face="Gill Sans MT"><font size="3"><font color="#000000">La calificaci&oacute;n para el curso proped&eacute;utico se compone de la siguiente manera: realizar&aacute;s un examen final con un valor del 20% y pondr&aacute;s en pr&aacute;ctica lo aprendido mediante las actividades de aprendizaje por unidad que tendr&aacute;s que entregar a tu asesor ya que su valor es de 10% para por cada unidad, hasta lograr un 40% y entregar&aacute;s una actividad integradora cuyo valor es de 40%. Sumando los porcentajes anteriores corresponder&aacute; al 100% de la calificaci&oacute;n.</font></font></font></span></p>

<p style="margin: 0in 0in 6pt; text-align: justify;">&nbsp;</p>

<p style="margin: 0in 0in 6pt; text-align: justify;"><span style="line-height: 150%;"><font face="Gill Sans MT"><font size="3"><font color="#000000">En la siguiente tabla se muestran los porcentajes descritos</font></font></font></span></p>

<p style="margin: 0in 0in 6pt; text-align: justify;"><span style="line-height: 150%;"><font face="Gill Sans MT"><font size="3"><font color="#000000">Estas son las r&uacute;bricas o criterios que ser&aacute;n tomados en cada una de las actividades de aprendizaje.</font></font></font></span></p>

<p><br clear="all" style="page-break-before: always;" />
&nbsp;</p>

<p style="margin: 0in 0in 0pt; text-align: justify;"><span style="line-height: normal;"><b><font face="Gill Sans MT"><font size="3"><font color="#000000">ACTIVIDAD DE APRENDIZAJE 1.1, 2.1, 2.2, 3.1</font></font></font></b></span></p>

<table class="Table" style="margin: auto auto auto -8.8pt; border: 1pt solid rgb(179, 204, 130); width: 104.9%; border-collapse: collapse;" width="104%">
	<tbody>
		<tr style="height: 20pt;">
			<td colspan="5" style="background: rgb(230, 238, 213); border: 1pt solid rgb(179, 204, 130); width: 100%;" width="100%">
			<p align="center" style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: center;"><span style="line-height: normal;"><span style="height: 20pt;"><font face="Gill Sans MT"><font color="#000000"><b><span lang="ES-MX" style="font-size: 10pt;">RESUMEN</span></b></font></font></span></span></p>
			</td>
		</tr>
		<tr style="height: 39.55pt;">
			<td style="background: rgb(205, 221, 172); border-width: 0px 1pt 1pt; border-style: none solid solid; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130); width: 19.42%;" width="19%">
			<p align="center" style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: center;"><span style="line-height: normal;"><span style="height: 39.55pt;"><b><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">ASPECTOS A EVALUAR</font></font></span></b></span></span></p>
			</td>
			<td style="background: rgb(205, 221, 172); border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130) rgb(0, 0, 0); width: 25.46%;" width="25%">
			<p align="center" style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: center;"><span style="line-height: normal;"><span style="height: 39.55pt;"><b><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">EFICIENTE</font></font></span></b></span></span></p>

			<p align="center" style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: center;"><span style="line-height: normal;"><span style="height: 39.55pt;"><b><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">(100%)</font></font></span></b></span></span></p>
			</td>
			<td style="background: rgb(205, 221, 172); border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130) rgb(0, 0, 0); width: 17.88%;" width="17%">
			<p align="center" style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: center;"><span style="line-height: normal;"><span style="height: 39.55pt;"><b><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">BUENO</font></font></span></b></span></span></p>

			<p align="center" style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: center;"><span style="line-height: normal;"><span style="height: 39.55pt;"><b><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">(75%)</font></font></span></b></span></span></p>
			</td>
			<td style="background: rgb(205, 221, 172); border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130) rgb(0, 0, 0); width: 17.86%;" width="17%">
			<p align="center" style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: center;"><span style="line-height: normal;"><span style="height: 39.55pt;"><b><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">REGULAR</font></font></span></b></span></span></p>

			<p align="center" style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: center;"><span style="line-height: normal;"><span style="height: 39.55pt;"><b><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">(50%)</font></font></span></b></span></span></p>
			</td>
			<td style="background: rgb(205, 221, 172); border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130) rgb(0, 0, 0); width: 19.38%;" width="19%">
			<p align="center" style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: center;"><span style="line-height: normal;"><span style="height: 39.55pt;"><b><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">CARECE</font></font></span></b></span></span></p>

			<p align="center" style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: center;"><span style="line-height: normal;"><span style="height: 39.55pt;"><b><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">(0%)</font></font></span></b></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="background: rgb(230, 238, 213); border-width: 0px 1pt 1pt; border-style: none solid solid; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130); width: 19.42%;" width="19%">
			<p align="center" style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: center;"><span style="line-height: normal;"><b><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">PUNTUALIDAD</font></font></span></b></span></p>

			<p align="center" style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: center;"><span style="line-height: normal;"><b><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">(10%)</font></font></span></b></span></p>
			</td>
			<td style="background: rgb(230, 238, 213); border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130) rgb(0, 0, 0); width: 25.46%;" width="25%">
			<p style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: justify;"><span style="line-height: normal;"><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">Se envi&oacute; en la fecha establecida en el calendario de entrega de actividades.</font></font></span></span></p>
			</td>
			<td style="background: rgb(230, 238, 213); border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130) rgb(0, 0, 0); width: 17.88%;" width="17%">
			<p style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: justify;"><span style="line-height: normal;"><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">Se envi&oacute; tres d&iacute;as despu&eacute;s de la fecha establecida.</font></font></span></span></p>
			</td>
			<td style="background: rgb(230, 238, 213); border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130) rgb(0, 0, 0); width: 17.86%;" width="17%">
			<p style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: justify;"><span style="line-height: normal;"><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">Se envi&oacute; cinco d&iacute;as despu&eacute;s de la fecha establecida.</font></font></span></span></p>
			</td>
			<td style="background: rgb(230, 238, 213); border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130) rgb(0, 0, 0); width: 19.38%;" width="19%">
			<p style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: justify;"><span style="line-height: normal;"><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">Se envi&oacute; seis d&iacute;as despu&eacute;s o m&aacute;s de la fecha establecida.</font></font></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="background: rgb(205, 221, 172); border-width: 0px 1pt 1pt; border-style: none solid solid; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130); width: 19.42%;" width="19%">
			<p align="center" style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: center;"><span style="line-height: normal;"><b><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">CONTENIDO</font></font></span></b></span></p>

			<p align="center" style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: center;"><span style="line-height: normal;"><b><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">(60%)</font></font></span></b></span></p>
			</td>
			<td style="background: rgb(205, 221, 172); border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130) rgb(0, 0, 0); width: 25.46%;" width="25%">
			<p style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: justify;"><span style="line-height: normal;"><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">Uso de informaci&oacute;n precisa y relevante del texto.</font></font></span></span></p>

			<p style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: justify;"><span style="line-height: normal;"><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">El resumen incluye la idea principal y los detalles m&aacute;s importantes del texto.</font></font></span></span></p>

			<p style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: justify;"><span style="line-height: normal;"><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">Es una versi&oacute;n concisa del texto.</font></font></span></span></p>

			<p style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: justify;"><span style="line-height: normal;"><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">Re&uacute;ne informaci&oacute;n del texto y la explica con sus propias palabras.</font></font></span></span></p>
			</td>
			<td style="background: rgb(205, 221, 172); border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130) rgb(0, 0, 0); width: 17.88%;" width="17%">
			<p style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: justify;"><span style="line-height: normal;"><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">Uso de informaci&oacute;n precisa del texto.</font></font></span></span></p>

			<p style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: justify;"><span style="line-height: normal;"><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">El resumen incluye generalmente la idea principal y los detalles m&aacute;s importantes del texto.</font></font></span></span></p>

			<p style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: justify;"><span style="line-height: normal;"><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">Es una versi&oacute;n concisa del texto.</font></font></span></span></p>

			<p style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: justify;"><span style="line-height: normal;"><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">Re&uacute;ne informaci&oacute;n y en su mayor&iacute;a la explica con sus propias palabras.</font></font></span></span></p>
			</td>
			<td style="background: rgb(205, 221, 172); border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130) rgb(0, 0, 0); width: 17.86%;" width="17%">
			<p style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: justify;"><span style="line-height: normal;"><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">Uso de informaci&oacute;n del texto. </font></font></span></span></p>

			<p style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: justify;"><span style="line-height: normal;"><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">El resumen incluye de alguna forma la idea principal y los detalles m&aacute;s importantes del texto.</font></font></span></span></p>

			<p style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: justify;"><span style="line-height: normal;"><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">Re&uacute;ne reducida informaci&oacute;n del texto y explica algo en sus propias palabras.</font></font></span></span></p>
			</td>
			<td style="background: rgb(205, 221, 172); border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130) rgb(0, 0, 0); width: 19.38%;" width="19%">
			<p style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: justify;"><span style="line-height: normal;"><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">Evit&oacute; el uso de la informaci&oacute;n del texto.</font></font></span></span></p>

			<p style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: justify;"><span style="line-height: normal;"><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">El resumen no presenta la idea principal y es copia del texto original.</font></font></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="background: rgb(230, 238, 213); border-width: 0px 1pt 1pt; border-style: none solid solid; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130); width: 19.42%;" width="19%">
			<p align="center" style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: center;"><span style="line-height: normal;"><b><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">ELEMENTOS DE COMUNICACI&Oacute;N Y FORMATO</font></font></span></b></span></p>

			<p align="center" style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: center;"><span style="line-height: normal;"><b><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">(30%)</font></font></span></b></span></p>
			</td>
			<td style="background: rgb(230, 238, 213); border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130) rgb(0, 0, 0); width: 25.46%;" width="25%">
			<p style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: justify;"><span style="line-height: normal;"><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">El texto est&aacute; organizado con fluidez y claridad.</font></font></span></span></p>

			<p style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: justify;"><span style="line-height: normal;"><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">Uso adecuado del lenguaje y ortograf&iacute;a.</font></font></span></span></p>

			<p style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: justify;"><span style="line-height: normal;"><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">Respeta el formato de presentaci&oacute;n:</font></font></span></span></p>

			<p style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: justify;"><span style="line-height: normal;"><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">Letra Arial 12 puntos.</font></font></span></span></p>

			<p style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: justify;"><span style="line-height: normal;"><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">Interlineado 1.5.</font></font></span></span></p>

			<p style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: justify;"><span style="line-height: normal;"><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">Texto Justificado.</font></font></span></span></p>

			<p style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: justify;"><span style="line-height: normal;"><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">Respete el formato de resumen.</font></font></span></span></p>

			<p style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: justify;"><span style="line-height: normal;"><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">Ortograf&iacute;a sin errores.</font></font></span></span></p>

			<p style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: justify;"><span style="line-height: normal;"><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">Extensi&oacute;n de una cuartilla m&aacute;s referencias en formato APA y car&aacute;tula.</font></font></span></span></p>
			</td>
			<td style="background: rgb(230, 238, 213); border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130) rgb(0, 0, 0); width: 17.88%;" width="17%">
			<p style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: justify;"><span style="line-height: normal;"><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">El texto est&aacute; organizado generalmente con claridad.</font></font></span></span></p>

			<p style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: justify;"><span style="line-height: normal;"><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">Uso adecuado con 2 &oacute; 3 errores ortogr&aacute;ficos.</font></font></span></span></p>

			<p style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: justify;"><span style="line-height: normal;"><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">Posee por lo menos 6 elementos de formato solicitados en la columna anterior.</font></font></span></span></p>
			</td>
			<td style="background: rgb(230, 238, 213); border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130) rgb(0, 0, 0); width: 17.86%;" width="17%">
			<p style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: justify;"><span style="line-height: normal;"><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">El texto est&aacute; relativamente organizado y es confuso.</font></font></span></span></p>

			<p style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: justify;"><span style="line-height: normal;"><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">Posee de 4 a 6 errores ortogr&aacute;ficos.</font></font></span></span></p>

			<p style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: justify;"><span style="line-height: normal;"><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">Posee por lo menos 4 elementos de formato solicitados en la columna <i>Eficiente 100%.</i></font></font></span></span></p>
			</td>
			<td style="background: rgb(230, 238, 213); border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130) rgb(0, 0, 0); width: 19.38%;" width="19%">
			<p style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: justify;"><span style="line-height: normal;"><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">El texto carece de organizaci&oacute;n y claridad.</font></font></span></span></p>

			<p style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: justify;"><span style="line-height: normal;"><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">La lectura resulta dif&iacute;cil debido a la cantidad de errores ortogr&aacute;ficos presentados.</font></font></span></span></p>

			<p style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: justify;"><span style="line-height: normal;"><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">Contiene menos de 3 elementos de formato solicitados en la columna <i>Eficiente 100%</i>.</font></font></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="background: rgb(205, 221, 172); border-width: 0px 1pt 1pt; border-style: none solid solid; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130); width: 19.42%;" width="19%">
			<p align="center" style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: center;"><span style="line-height: normal;"><b><span style="font-size: 10pt;"><span style="color: black;"><font face="Gill Sans MT">TOTAL</font></span></span></b></span></p>

			<p align="center" style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: center;"><span style="line-height: normal;"><b><span style="font-size: 10pt;"><span style="color: black;"><font face="Gill Sans MT">(100%)</font></span></span></b></span></p>
			</td>
			<td style="background: rgb(205, 221, 172); border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130) rgb(0, 0, 0); width: 25.46%;" width="25%">
			<p style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: justify;">&nbsp;</p>
			</td>
			<td style="background: rgb(205, 221, 172); border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130) rgb(0, 0, 0); width: 17.88%;" width="17%">
			<p style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: justify;">&nbsp;</p>
			</td>
			<td style="background: rgb(205, 221, 172); border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130) rgb(0, 0, 0); width: 17.86%;" width="17%">
			<p style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: justify;">&nbsp;</p>
			</td>
			<td style="background: rgb(205, 221, 172); border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130) rgb(0, 0, 0); width: 19.38%;" width="19%">
			<p style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: justify;">&nbsp;</p>
			</td>
		</tr>
	</tbody>
</table>

<p style="margin: 0in 0in 0pt; text-align: justify;">&nbsp;</p>

<p style="margin: 0in 0in 0pt; text-align: justify;">&nbsp;</p>

<p><br clear="all" style="page-break-before: always;" />
&nbsp;</p>

<p style="margin: 0in 0in 0pt; text-align: justify;"><span style="line-height: normal;"><b><font face="Gill Sans MT"><font size="3"><font color="#000000">ACTIVIDAD DE APRENDIZAJE 1.2</font></font></font></b></span></p>

<p style="margin: 0in 0in 0pt; text-align: justify;">&nbsp;</p>

<table class="Table" style="border: 1pt solid rgb(179, 204, 130); width: 473.2pt; border-collapse: collapse;" width="631">
	<tbody>
		<tr style="height: 20pt;">
			<td colspan="5" style="background: rgb(230, 238, 213); border: 1pt solid rgb(179, 204, 130); width: 473.2pt;" width="631">
			<p align="center" style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: center;"><span style="line-height: normal;"><span style="height: 20pt;"><font face="Gill Sans MT"><font color="#000000"><b><span lang="ES-MX" style="font-size: 10pt;">CUADRO SIN&Oacute;PTICO</span></b></font></font></span></span></p>
			</td>
		</tr>
		<tr style="height: 39.55pt;">
			<td style="background: rgb(205, 221, 172); border-width: 0px 1pt 1pt; border-style: none solid solid; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130); width: 1.5in;" width="144">
			<p align="center" style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: center;"><span style="line-height: normal;"><span style="height: 39.55pt;"><b><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">ASPECTOS A EVALUAR</font></font></span></b></span></span></p>
			</td>
			<td style="background: rgb(205, 221, 172); border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130) rgb(0, 0, 0); width: 94.95pt;" width="127">
			<p align="center" style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: center;"><span style="line-height: normal;"><span style="height: 39.55pt;"><b><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">EFICIENTE</font></font></span></b></span></span></p>

			<p align="center" style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: center;"><span style="line-height: normal;"><span style="height: 39.55pt;"><b><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">(100%)</font></font></span></b></span></span></p>
			</td>
			<td style="background: rgb(205, 221, 172); border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130) rgb(0, 0, 0); width: 90.05pt;" width="120">
			<p align="center" style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: center;"><span style="line-height: normal;"><span style="height: 39.55pt;"><b><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">BUENO</font></font></span></b></span></span></p>

			<p align="center" style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: center;"><span style="line-height: normal;"><span style="height: 39.55pt;"><b><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">(75%)</font></font></span></b></span></span></p>
			</td>
			<td style="background: rgb(205, 221, 172); border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130) rgb(0, 0, 0); width: 90.1pt;" width="120">
			<p align="center" style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: center;"><span style="line-height: normal;"><span style="height: 39.55pt;"><b><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">REGULAR</font></font></span></b></span></span></p>

			<p align="center" style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: center;"><span style="line-height: normal;"><span style="height: 39.55pt;"><b><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">(50%)</font></font></span></b></span></span></p>
			</td>
			<td style="background: rgb(205, 221, 172); border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130) rgb(0, 0, 0); width: 90.1pt;" width="120">
			<p align="center" style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: center;"><span style="line-height: normal;"><span style="height: 39.55pt;"><b><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">CARECE</font></font></span></b></span></span></p>

			<p align="center" style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: center;"><span style="line-height: normal;"><span style="height: 39.55pt;"><b><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">(0%)</font></font></span></b></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="background: rgb(230, 238, 213); border-width: 0px 1pt 1pt; border-style: none solid solid; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130); width: 1.5in;" width="144">
			<p align="center" style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: center;"><span style="line-height: normal;"><b><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">PUNTUALIDAD</font></font></span></b></span></p>

			<p align="center" style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: center;"><span style="line-height: normal;"><b><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">(20%)</font></font></span></b></span></p>
			</td>
			<td style="background: rgb(230, 238, 213); border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130) rgb(0, 0, 0); width: 94.95pt;" width="127">
			<p style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: justify;"><span style="line-height: normal;"><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">Se envi&oacute; en la fecha establecida en el calendario de entrega de actividades.</font></font></span></span></p>
			</td>
			<td style="background: rgb(230, 238, 213); border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130) rgb(0, 0, 0); width: 90.05pt;" width="120">
			<p style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: justify;"><span style="line-height: normal;"><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">Se env&iacute;o tres d&iacute;as despu&eacute;s de la fecha establecida</font></font></span></span></p>
			</td>
			<td style="background: rgb(230, 238, 213); border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130) rgb(0, 0, 0); width: 90.1pt;" width="120">
			<p style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: justify;"><span style="line-height: normal;"><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">Se envi&oacute; cinco d&iacute;as despu&eacute;s de la fecha establecida.</font></font></span></span></p>
			</td>
			<td style="background: rgb(230, 238, 213); border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130) rgb(0, 0, 0); width: 90.1pt;" width="120">
			<p style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: justify;"><span style="line-height: normal;"><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">Se envi&oacute; seis d&iacute;as despu&eacute;s o m&aacute;s de la fecha establecida.</font></font></span></span></p>
			</td>
		</tr>
		<tr style="height: 93.5pt;">
			<td style="background: rgb(205, 221, 172); border-width: 0px 1pt 1pt; border-style: none solid solid; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130); width: 1.5in;" width="144">
			<p align="center" style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: center;"><span style="line-height: normal;"><span style="height: 93.5pt;"><font face="Gill Sans MT"><b><span style="font-size: 10pt;"><span style="color: black;">IDEAS Y CONTENIDO</span></span></b></font></span></span></p>

			<p align="center" style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: center;"><span style="line-height: normal;"><span style="height: 93.5pt;"><b><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">(40%)</font></font></span></b></span></span></p>
			</td>
			<td style="background: rgb(205, 221, 172); border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130) rgb(0, 0, 0); width: 94.95pt;" width="127">
			<p style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: justify;"><span style="line-height: normal;"><span style="height: 93.5pt;"><font face="Gill Sans MT"><span style="font-size: 10pt;"><span style="color: black;">Incluye el prop&oacute;sito del tema, definiciones claras y menciona ejemplos.</span></span></font></span></span></p>
			</td>
			<td style="background: rgb(205, 221, 172); border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130) rgb(0, 0, 0); width: 90.05pt;" width="120">
			<p style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: justify;"><span style="line-height: normal;"><span style="height: 93.5pt;"><font face="Gill Sans MT"><span style="font-size: 10pt;"><span style="color: black;">Incluye el prop&oacute;sito del tema, definiciones claras y menciona ejemplos.</span></span></font></span></span></p>
			</td>
			<td style="background: rgb(205, 221, 172); border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130) rgb(0, 0, 0); width: 90.1pt;" width="120">
			<p style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: justify;"><span style="line-height: normal;"><span style="height: 93.5pt;"><font face="Gill Sans MT"><span style="font-size: 10pt;"><span style="color: black;">S&oacute;lo incluye el prop&oacute;sito, las definiciones son confusas, con ejemplos escasos.</span></span></font></span></span></p>
			</td>
			<td style="background: rgb(205, 221, 172); border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130) rgb(0, 0, 0); width: 90.1pt;" width="120">
			<p style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: justify;"><span style="line-height: normal;"><span style="height: 93.5pt;"><span style="font-size: 10pt;"><span style="color: black;"><font face="Gill Sans MT">El prop&oacute;sito general del tema est&aacute; incompleto </font></span></span></span></span></p>

			<p style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: justify;"><span style="line-height: normal;"><span style="height: 93.5pt;"><span style="font-size: 10pt;"><span style="color: black;"><font face="Gill Sans MT">y confuso. Las definiciones no son claras y no mencionan ejemplo.</font></span></span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="background: rgb(230, 238, 213); border-width: 0px 1pt 1pt; border-style: none solid solid; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130); width: 1.5in;" width="144">
			<p align="center" style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: center;"><span style="line-height: normal;"><b><span style="font-size: 10pt;"><span style="color: black;"><font face="Gill Sans MT">ORTOGRAF&Iacute;A</font></span></span></b></span></p>

			<p align="center" style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: center;"><span style="line-height: normal;"><b><span style="font-size: 10pt;"><span style="color: black;"><font face="Gill Sans MT">(15%)</font></span></span></b></span></p>
			</td>
			<td style="background: rgb(230, 238, 213); border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130) rgb(0, 0, 0); width: 94.95pt;" width="127">
			<p style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: justify;"><span style="line-height: normal;"><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">No tiene errores ortogr&aacute;ficos, o de conjugaci&oacute;n de verbos y coherente estilo de redacci&oacute;n.</font></font></span></span></p>
			</td>
			<td style="background: rgb(230, 238, 213); border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130) rgb(0, 0, 0); width: 90.05pt;" width="120">
			<p style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: justify;"><span style="line-height: normal;"><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">Tiene dos errores ortogr&aacute;ficos o de conjugaci&oacute;n de verbos y coherente estilo de redacci&oacute;n.</font></font></span></span></p>
			</td>
			<td style="background: rgb(230, 238, 213); border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130) rgb(0, 0, 0); width: 90.1pt;" width="120">
			<p style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: justify;"><span style="line-height: normal;"><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">Tiene de tres a cinco errores ortogr&aacute;ficos y estilo de redacci&oacute;n no coherente.</font></font></span></span></p>
			</td>
			<td style="background: rgb(230, 238, 213); border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130) rgb(0, 0, 0); width: 90.1pt;" width="120">
			<p style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: justify;"><span style="line-height: normal;"><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">Tiene m&aacute;s de cinco errores ortogr&aacute;ficos y redacci&oacute;n no coherente.</font></font></span></span></p>
			</td>
		</tr>
		<tr style="height: 95.25pt;">
			<td style="background: rgb(205, 221, 172); border-width: 0px 1pt 1pt; border-style: none solid solid; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130); width: 1.5in;" width="144">
			<p align="center" style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: center;"><span style="line-height: normal;"><span style="height: 95.25pt;"><b><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">REPRESENTACI&Oacute;N GR&Aacute;FICA</font></font></span></b></span></span></p>

			<p align="center" style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: center;"><span style="line-height: normal;"><span style="height: 95.25pt;"><b><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">(20%)</font></font></span></b></span></span></p>
			</td>
			<td style="background: rgb(205, 221, 172); border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130) rgb(0, 0, 0); width: 94.95pt;" width="127">
			<p style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: justify;"><span style="line-height: normal;"><span style="height: 95.25pt;"><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">Todas las ideas (idea general, idea principal, idea complementaria) que se presentan tienen relaci&oacute;n directa con el tema, siendo claras y objetivas.</font></font></span></span></span></p>
			</td>
			<td style="background: rgb(205, 221, 172); border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130) rgb(0, 0, 0); width: 90.05pt;" width="120">
			<p style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: justify;"><span style="line-height: normal;"><span style="height: 95.25pt;"><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">Solo la idea general y la principal que se presentan tienen relaci&oacute;n directa con el tema, siendo claras y objetivas.</font></font></span></span></span></p>
			</td>
			<td style="background: rgb(205, 221, 172); border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130) rgb(0, 0, 0); width: 90.1pt;" width="120">
			<p style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: justify;"><span style="line-height: normal;"><span style="height: 95.25pt;"><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">Tanto la idea general como la principal tienen relaci&oacute;n con el tema, la idea complementaria aborda superficialmente el tema.</font></font></span></span></span></p>
			</td>
			<td style="background: rgb(205, 221, 172); border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130) rgb(0, 0, 0); width: 90.1pt;" width="120">
			<p style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: justify;"><span style="line-height: normal;"><span style="height: 95.25pt;"><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">Las ideas que se presentan tienen parcial o nula relaci&oacute;n con el tema.</font></font></span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="background: rgb(230, 238, 213); border-width: 0px 1pt 1pt; border-style: none solid solid; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130); width: 1.5in;" width="144">
			<p align="center" style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: center;"><span style="line-height: normal;"><b><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">USO DE REFERENTES BIBLIOGR&Aacute;FICOS</font></font></span></b></span></p>

			<p align="center" style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: center;"><span style="line-height: normal;"><b><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">(5%)</font></font></span></b></span></p>
			</td>
			<td style="background: rgb(230, 238, 213); border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130) rgb(0, 0, 0); width: 94.95pt;" width="127">
			<p style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: justify;"><span style="line-height: normal;"><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">Se incluyen al menos tres referencias bibliogr&aacute;ficas y dos mesogr&aacute;ficas.</font></font></span></span></p>
			</td>
			<td style="background: rgb(230, 238, 213); border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130) rgb(0, 0, 0); width: 90.05pt;" width="120">
			<p style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: justify;"><span style="line-height: normal;"><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">Se incluyen al menos dos referencias bibliogr&aacute;ficas y una mesogr&aacute;fica</font></font></span></span></p>
			</td>
			<td style="background: rgb(230, 238, 213); border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130) rgb(0, 0, 0); width: 90.1pt;" width="120">
			<p style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: justify;"><span style="line-height: normal;"><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">Se incluye al menos una referencia bibliogr&aacute;fica y una mesogr&aacute;fica</font></font></span></span></p>
			</td>
			<td style="background: rgb(230, 238, 213); border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130) rgb(0, 0, 0); width: 90.1pt;" width="120">
			<p style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: justify;"><span style="line-height: normal;"><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">No se incluyen referencias bibliogr&aacute;ficas ni mesogr&aacute;ficas</font></font></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="background: rgb(205, 221, 172); border-width: 0px 1pt 1pt; border-style: none solid solid; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130); width: 1.5in;" width="144">
			<p align="center" style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: center;"><span style="line-height: normal;"><b><span style="font-size: 10pt;"><span style="color: black;"><font face="Gill Sans MT">TOTAL</font></span></span></b></span></p>

			<p align="center" style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: center;"><span style="line-height: normal;"><b><span style="font-size: 10pt;"><span style="color: black;"><font face="Gill Sans MT">(100%)</font></span></span></b></span></p>
			</td>
			<td colspan="4" style="background: rgb(205, 221, 172); border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130) rgb(0, 0, 0); width: 365.2pt;" width="487">
			<p style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: justify;">&nbsp;</p>
			</td>
		</tr>
	</tbody>
</table>

<p style="margin: 0in 0in 0pt; text-align: justify;">&nbsp;</p>

<p style="margin: 0in 0in 0pt; text-align: justify;">&nbsp;</p>

<p><br clear="all" style="page-break-before: always;" />
&nbsp;</p>

<p style="margin: 0in 0in 0pt; text-align: justify;"><span style="line-height: normal;"><b><font face="Gill Sans MT"><font size="3"><font color="#000000">ACTIVIDAD DE APRENDIZAJE 4.1</font></font></font></b></span></p>

<table class="Table" style="margin: auto auto auto -22.95pt; border: 1pt solid rgb(179, 204, 130); border-collapse: collapse;" width="671">
	<tbody>
		<tr style="height: 20pt;">
			<td colspan="5" style="background: rgb(230, 238, 213); border: 1pt solid rgb(179, 204, 130); width: 503.25pt;" width="671">
			<p align="center" style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: center;"><span style="line-height: normal;"><span style="height: 20pt;"><b><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">FOROS DE DISCUSI&Oacute;N</font></font></span></b></span></span></p>
			</td>
		</tr>
		<tr style="height: 39.55pt;">
			<td style="background: rgb(205, 221, 172); border-width: 0px 1pt 1pt; border-style: none solid solid; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130); width: 120.5pt;" width="161">
			<p align="center" style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: center;"><span style="line-height: normal;"><span style="height: 39.55pt;"><b><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">ASPECTOS A EVALUAR</font></font></span></b></span></span></p>
			</td>
			<td style="background: rgb(205, 221, 172); border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130) rgb(0, 0, 0); width: 111.2pt;" width="148">
			<p align="center" style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: center;"><span style="line-height: normal;"><span style="height: 39.55pt;"><b><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">EFICIENTE</font></font></span></b></span></span></p>

			<p align="center" style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: center;"><span style="line-height: normal;"><span style="height: 39.55pt;"><b><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">(100%)</font></font></span></b></span></span></p>
			</td>
			<td style="background: rgb(205, 221, 172); border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130) rgb(0, 0, 0); width: 88.55pt;" width="118">
			<p align="center" style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: center;"><span style="line-height: normal;"><span style="height: 39.55pt;"><b><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">BUENO</font></font></span></b></span></span></p>

			<p align="center" style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: center;"><span style="line-height: normal;"><span style="height: 39.55pt;"><b><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">(75%)</font></font></span></b></span></span></p>
			</td>
			<td style="background: rgb(205, 221, 172); border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130) rgb(0, 0, 0); width: 97.95pt;" width="131">
			<p align="center" style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: center;"><span style="line-height: normal;"><span style="height: 39.55pt;"><b><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">REGULAR</font></font></span></b></span></span></p>

			<p align="center" style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: center;"><span style="line-height: normal;"><span style="height: 39.55pt;"><b><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">(50%)</font></font></span></b></span></span></p>
			</td>
			<td style="background: rgb(205, 221, 172); border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130) rgb(0, 0, 0); width: 85.05pt;" width="113">
			<p align="center" style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: center;"><span style="line-height: normal;"><span style="height: 39.55pt;"><b><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">CARECE</font></font></span></b></span></span></p>

			<p align="center" style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: center;"><span style="line-height: normal;"><span style="height: 39.55pt;"><b><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">(0%)</font></font></span></b></span></span></p>
			</td>
		</tr>
		<tr style="height: 73.6pt;">
			<td style="background: rgb(230, 238, 213); border-width: 0px 1pt 1pt; border-style: none solid solid; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130); width: 120.5pt;" width="161">
			<p align="center" style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: center;"><span style="line-height: normal;"><span style="height: 73.6pt;"><b><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">PUNTUALIDAD</font></font></span></b></span></span></p>

			<p align="center" style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: center;"><span style="line-height: normal;"><span style="height: 73.6pt;"><b><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">(20%)</font></font></span></b></span></span></p>
			</td>
			<td style="background: rgb(230, 238, 213); border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130) rgb(0, 0, 0); width: 111.2pt;" width="148">
			<p style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: justify;"><span style="line-height: normal;"><span style="height: 73.6pt;"><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">La participaci&oacute;n se hizo en la fecha establecida en el calendario de entrega de actividades.</font></font></span></span></span></p>
			</td>
			<td style="background: rgb(230, 238, 213); border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130) rgb(0, 0, 0); width: 88.55pt;" width="118">
			<p style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: justify;"><span style="line-height: normal;"><span style="height: 73.6pt;"><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">La participaci&oacute;n se hizo tres d&iacute;as despu&eacute;s de la fecha establecida.</font></font></span></span></span></p>
			</td>
			<td style="background: rgb(230, 238, 213); border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130) rgb(0, 0, 0); width: 97.95pt;" width="131">
			<p style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: justify;"><span style="line-height: normal;"><span style="height: 73.6pt;"><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">La participaci&oacute;n se hizo cinco d&iacute;as despu&eacute;s de la fecha establecida.</font></font></span></span></span></p>
			</td>
			<td style="background: rgb(230, 238, 213); border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130) rgb(0, 0, 0); width: 85.05pt;" width="113">
			<p style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: justify;"><span style="line-height: normal;"><span style="height: 73.6pt;"><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">La participaci&oacute;n se hizo seis d&iacute;as despu&eacute;s o m&aacute;s de la fecha establecida.</font></font></span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="background: rgb(205, 221, 172); border-width: 0px 1pt 1pt; border-style: none solid solid; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130); width: 120.5pt;" width="161">
			<p align="center" style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: center;"><span style="line-height: normal;"><font face="Gill Sans MT"><font color="#000000"><b><span style="font-size: 10pt;">EXPRESI&Oacute;N ESCRITA</span></b></font></font></span></p>

			<p align="center" style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: center;"><span style="line-height: normal;"><b><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">(20%)</font></font></span></b></span></p>
			</td>
			<td style="background: rgb(205, 221, 172); border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130) rgb(0, 0, 0); width: 111.2pt;" width="148">
			<p style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: justify;"><span style="line-height: normal;"><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">La descripci&oacute;n de la participaci&oacute;n tiene ideas l&oacute;gicas ordenadas y precisas, no presenta ning&uacute;n error ortogr&aacute;fico. </font></font></span></span></p>
			</td>
			<td style="background: rgb(205, 221, 172); border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130) rgb(0, 0, 0); width: 88.55pt;" width="118">
			<p style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: justify;"><span style="line-height: normal;"><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">La descripci&oacute;n de la participaci&oacute;n tiene ideas l&oacute;gicas ordenadas y precisas presenta tres errores ortogr&aacute;ficos.</font></font></span></span></p>
			</td>
			<td style="background: rgb(205, 221, 172); border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130) rgb(0, 0, 0); width: 97.95pt;" width="131">
			<p style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: justify;"><span style="line-height: normal;"><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">La descripci&oacute;n de la participaci&oacute;n tiene ideas l&oacute;gicas presenta hasta 5 errores ortogr&aacute;ficos. </font></font></span></span></p>
			</td>
			<td style="background: rgb(205, 221, 172); border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130) rgb(0, 0, 0); width: 85.05pt;" width="113">
			<p style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: justify;"><span style="line-height: normal;"><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">La descripci&oacute;n de la participaci&oacute;n tiene ideas l&oacute;gicas presenta m&aacute;s de 5 errores ortogr&aacute;ficos. </font></font></span></span></p>
			</td>
		</tr>
		<tr style="height: 113.4pt;">
			<td style="background: rgb(230, 238, 213); border-width: 0px 1pt 1pt; border-style: none solid solid; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130); width: 120.5pt;" width="161">
			<p align="center" style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: center;"><span style="line-height: normal;"><span style="height: 113.4pt;"><b><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">FUNDAMENTACI&Oacute;N</font></font></span></b></span></span></p>

			<p align="center" style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: center;"><span style="line-height: normal;"><span style="height: 113.4pt;"><b><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">(30%)</font></font></span></b></span></span></p>
			</td>
			<td style="background: rgb(230, 238, 213); border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130) rgb(0, 0, 0); width: 111.2pt;" width="148">
			<p style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: justify;"><span style="line-height: normal;"><span style="height: 113.4pt;"><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">Las contribuciones son de propia iniciativa, de acuerdo con lecturas previas del tema, emplea referentes te&oacute;ricos para respaldar sus ideas.</font></font></span></span></span></p>
			</td>
			<td style="background: rgb(230, 238, 213); border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130) rgb(0, 0, 0); width: 88.55pt;" width="118">
			<p style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: justify;"><span style="line-height: normal;"><span style="height: 113.4pt;"><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">Las contribuciones son de propia iniciativa, pero tienen reducida relaci&oacute;n con lecturas previas del tema, emplea referentes te&oacute;ricos para respaldar sus ideas.</font></font></span></span></span></p>
			</td>
			<td style="background: rgb(230, 238, 213); border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130) rgb(0, 0, 0); width: 97.95pt;" width="131">
			<p style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: justify;"><span style="line-height: normal;"><span style="height: 113.4pt;"><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">Las contribuciones son de propia iniciativa, tienen relativa relaci&oacute;n con el tema, no emplea referentes te&oacute;ricos para respaldar sus ideas.</font></font></span></span></span></p>
			</td>
			<td style="background: rgb(230, 238, 213); border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130) rgb(0, 0, 0); width: 85.05pt;" width="113">
			<p style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: justify;"><span style="line-height: normal;"><span style="height: 113.4pt;"><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">Su participaci&oacute;n es escasa, ofrece puntos de vista cortos y superficiales. No emplea referentes te&oacute;ricos para respaldar sus ideas.</font></font></span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="background: rgb(205, 221, 172); border-width: 0px 1pt 1pt; border-style: none solid solid; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130); width: 120.5pt;" width="161">
			<p align="center" class="Default" style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: center;"><b><span style="font-size: 10pt;"><span style="font-family: &quot;Gill Sans MT&quot;,&quot;sans-serif&quot;;"><font color="#000000">RESPETO DE LOS PUNTOS DE VISTA DE OTROS</font></span></span></b></p>

			<p align="center" class="Default" style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: center;"><b><span style="font-size: 10pt;"><span style="font-family: &quot;Gill Sans MT&quot;,&quot;sans-serif&quot;;"><font color="#000000">(20%)</font></span></span></b></p>
			</td>
			<td style="background: rgb(205, 221, 172); border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130) rgb(0, 0, 0); width: 111.2pt;" width="148">
			<p style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: justify;"><span style="line-height: normal;"><font face="Gill Sans MT"><font color="#000000"><span style="font-size: 10pt;">Guarda respeto por las opiniones de sus compa&ntilde;eros y aporta ideas que complementan las participaciones de los integrantes.</span></font></font></span></p>
			</td>
			<td style="background: rgb(205, 221, 172); border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130) rgb(0, 0, 0); width: 88.55pt;" width="118">
			<p style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: justify;"><span style="line-height: normal;"><font face="Gill Sans MT"><font color="#000000"><span style="font-size: 10pt;">Guarda respeto por las opiniones de sus compa&ntilde;eros, no aporta ideas a las otras participaciones.</span></font></font></span></p>
			</td>
			<td style="background: rgb(205, 221, 172); border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130) rgb(0, 0, 0); width: 97.95pt;" width="131">
			<p style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: justify;"><span style="line-height: normal;"><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">No guarda respeto por las opiniones de sus compa&ntilde;eros, aporta ideas que complementen las otras participaciones.</font></font></span></span></p>
			</td>
			<td style="background: rgb(205, 221, 172); border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130) rgb(0, 0, 0); width: 85.05pt;" width="113">
			<p style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: justify;"><span style="line-height: normal;"><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">No guarda respeto por las opiniones de los dem&aacute;s.</font></font></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="background: rgb(230, 238, 213); border-width: 0px 1pt 1pt; border-style: none solid solid; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130); width: 120.5pt;" width="161">
			<p align="center" style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: center;"><span style="line-height: normal;"><b><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">CONSTANCIA EN LA PARTICIPACI&Oacute;N</font></font></span></b></span></p>

			<p align="center" style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: center;"><span style="line-height: normal;"><b><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">(10%)</font></font></span></b></span></p>
			</td>
			<td style="background: rgb(230, 238, 213); border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130) rgb(0, 0, 0); width: 111.2pt;" width="148">
			<p style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: justify;"><span style="line-height: normal;"><font face="Gill Sans MT"><font color="#000000"><span style="font-size: 10pt;">Ingresa al foro al menos 3 veces durante el tiempo que se encuentre abierto, lee los mensajes de sus compa&ntilde;eros. Se mantiene al d&iacute;a con las discusiones.</span></font></font></span></p>
			</td>
			<td style="background: rgb(230, 238, 213); border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130) rgb(0, 0, 0); width: 88.55pt;" width="118">
			<p style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: justify;"><span style="line-height: normal;"><font face="Gill Sans MT"><font color="#000000"><span style="font-size: 10pt;">Ingresa al foro al menos 2 veces durante el tiempo que se encuentre abierto, lee los mensajes de sus compa&ntilde;eros. Se mantiene al d&iacute;a con las discusiones.</span></font></font></span></p>
			</td>
			<td style="background: rgb(230, 238, 213); border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130) rgb(0, 0, 0); width: 97.95pt;" width="131">
			<p style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: justify;"><span style="line-height: normal;"><font face="Gill Sans MT"><font color="#000000"><span style="font-size: 10pt;">Ingresa al foro al menos 1 vez durante el tiempo que se encuentre abierto, lee los mensajes de sus compa&ntilde;eros. </span></font></font></span></p>
			</td>
			<td style="background: rgb(230, 238, 213); border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130) rgb(0, 0, 0); width: 85.05pt;" width="113">
			<p style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: justify;"><span style="line-height: normal;"><font face="Gill Sans MT"><font color="#000000"><span style="font-size: 10pt;">Ingresa al foro al menos 1 vez durante el tiempo que se encuentre abierto, solo registra su participaci&oacute;n.</span></font></font></span></p>
			</td>
		</tr>
		<tr>
			<td style="background: rgb(205, 221, 172); border-width: 0px 1pt 1pt; border-style: none solid solid; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130); width: 120.5pt;" width="161">
			<p align="center" style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: center;"><span style="line-height: normal;"><b><span style="font-size: 10pt;"><span style="color: black;"><font face="Gill Sans MT">TOTAL</font></span></span></b></span></p>

			<p align="center" style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: center;"><span style="line-height: normal;"><b><span style="font-size: 10pt;"><span style="color: black;"><font face="Gill Sans MT">(100%)</font></span></span></b></span></p>
			</td>
			<td colspan="4" style="background: rgb(205, 221, 172); border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130) rgb(0, 0, 0); width: 382.75pt;" width="510">
			<p style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: justify;">&nbsp;</p>
			</td>
		</tr>
	</tbody>
</table>

<p><br clear="all" style="page-break-before: always;" />
&nbsp;</p>

<p style="margin: 0in 0in 0pt; text-align: justify;">&nbsp;</p>

<p style="margin: 0in 0in 0pt; text-align: justify;"><span style="line-height: normal;"><b><font face="Gill Sans MT"><font size="3"><font color="#000000">ACTIVIDAD INTEGRADORA</font></font></font></b></span></p>

<table class="Table" style="margin: auto auto auto -8.8pt; border: 1pt solid rgb(179, 204, 130); border-collapse: collapse;" width="643">
	<tbody>
		<tr style="height: 20pt;">
			<td colspan="5" style="background: rgb(230, 238, 213); border: 1pt solid rgb(179, 204, 130); width: 482pt;" width="643">&nbsp;
			<p align="center" style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: center;"><span style="line-height: normal;"><span style="height: 20pt;"><font face="Gill Sans MT"><font color="#000000"><b><span style="font-size: 10pt;">ESTUDIO DE CASOS</span></b></font></font></span></span></p>
			</td>
		</tr>
		<tr style="height: 28.9pt;">
			<td style="background: rgb(205, 221, 172); border-width: 0px 1pt 1pt; border-style: none solid solid; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130); width: 113.45pt;" width="151">
			<p align="center" style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: center;"><span style="line-height: normal;"><span style="height: 28.9pt;"><b><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">ASPECTOS A EVALUAR</font></font></span></b></span></span></p>
			</td>
			<td style="background: rgb(205, 221, 172); border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130) rgb(0, 0, 0); width: 99.2pt;" width="132">
			<p align="center" style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: center;"><span style="line-height: normal;"><span style="height: 28.9pt;"><b><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">EFICIENTE</font></font></span></b></span></span></p>

			<p align="center" style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: center;"><span style="line-height: normal;"><span style="height: 28.9pt;"><b><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">(100%)</font></font></span></b></span></span></p>
			</td>
			<td style="background: rgb(205, 221, 172); border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130) rgb(0, 0, 0); width: 99.25pt;" width="132">
			<p align="center" style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: center;"><span style="line-height: normal;"><span style="height: 28.9pt;"><b><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">BUENO</font></font></span></b></span></span></p>

			<p align="center" style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: center;"><span style="line-height: normal;"><span style="height: 28.9pt;"><b><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">(75%)</font></font></span></b></span></span></p>
			</td>
			<td style="background: rgb(205, 221, 172); border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130) rgb(0, 0, 0); width: 92.15pt;" width="123">
			<p align="center" style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: center;"><span style="line-height: normal;"><span style="height: 28.9pt;"><b><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">REGULAR</font></font></span></b></span></span></p>

			<p align="center" style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: center;"><span style="line-height: normal;"><span style="height: 28.9pt;"><b><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">(50%)</font></font></span></b></span></span></p>
			</td>
			<td style="background: rgb(205, 221, 172); border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130) rgb(0, 0, 0); width: 77.95pt;" width="104">
			<p align="center" style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: center;"><span style="line-height: normal;"><span style="height: 28.9pt;"><b><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">CARECE</font></font></span></b></span></span></p>

			<p align="center" style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: center;"><span style="line-height: normal;"><span style="height: 28.9pt;"><b><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">(0%)</font></font></span></b></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="background: rgb(230, 238, 213); border-width: 0px 1pt 1pt; border-style: none solid solid; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130); width: 113.45pt;" width="151">
			<p align="center" style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: center;"><span style="line-height: normal;"><b><span lang="ES-MX" style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">PUNTUALIDAD</font></font></span></b></span></p>

			<p align="center" style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: center;"><span style="line-height: normal;"><font face="Gill Sans MT"><font color="#000000"><b><span lang="ES-MX" style="font-size: 10pt;">(10%)</span></b></font></font></span></p>
			</td>
			<td style="background: rgb(230, 238, 213); border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130) rgb(0, 0, 0); width: 99.2pt;" width="132">
			<p style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: justify;"><span style="line-height: normal;"><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">Se envi&oacute; en la fecha establecida en el calendario de entrega de actividades.</font></font></span></span></p>
			</td>
			<td style="background: rgb(230, 238, 213); border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130) rgb(0, 0, 0); width: 99.25pt;" width="132">
			<p style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: justify;"><span style="line-height: normal;"><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">Se env&iacute;o tres d&iacute;as despu&eacute;s de la fecha establecida</font></font></span></span></p>
			</td>
			<td style="background: rgb(230, 238, 213); border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130) rgb(0, 0, 0); width: 92.15pt;" width="123">
			<p style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: justify;"><span style="line-height: normal;"><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">Se envi&oacute; cinco d&iacute;as despu&eacute;s de la fecha establecida.</font></font></span></span></p>
			</td>
			<td style="background: rgb(230, 238, 213); border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130) rgb(0, 0, 0); width: 77.95pt;" width="104">
			<p style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: justify;"><span style="line-height: normal;"><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">Se envi&oacute; seis d&iacute;as despu&eacute;s o m&aacute;s de la fecha establecida.</font></font></span></span></p>
			</td>
		</tr>
		<tr style="height: 148.15pt;">
			<td style="background: rgb(205, 221, 172); border-width: 0px 1pt 1pt; border-style: none solid solid; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130); width: 113.45pt;" width="151">
			<p align="center" style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: center;"><span style="line-height: normal;"><span style="height: 148.15pt;"><b><span style="font-size: 10pt;"><span style="color: black;"><font face="Gill Sans MT">PRESENTACI&Oacute;N</font></span></span></b></span></span></p>

			<p align="center" style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: center;"><span style="line-height: normal;"><span style="height: 148.15pt;"><b><span lang="ES-MX" style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">(20%)</font></font></span></b></span></span></p>
			</td>
			<td style="background: rgb(205, 221, 172); border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130) rgb(0, 0, 0); width: 99.2pt;" width="132">
			<p style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: justify;"><span style="line-height: normal;"><span style="height: 148.15pt;"><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">El documento tiene todos los siguientes aspectos: car&aacute;tula, formato solicitado por el asesor (como tama&ntilde;o de la hoja, tipo y tama&ntilde;o de letra, texto justificado), sin errores ortogr&aacute;ficos.</font></font></span></span></span></p>
			</td>
			<td style="background: rgb(205, 221, 172); border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130) rgb(0, 0, 0); width: 99.25pt;" width="132">
			<p style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: justify;"><span style="line-height: normal;"><span style="height: 148.15pt;"><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">El documento tiene los siguientes aspectos: car&aacute;tula, formato solicitado por el asesor (como tama&ntilde;o de la hoja tipo y tama&ntilde;o de letra, texto justificado), presenta tres errores ortogr&aacute;ficos. </font></font></span></span></span></p>
			</td>
			<td style="background: rgb(205, 221, 172); border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130) rgb(0, 0, 0); width: 92.15pt;" width="123">
			<p style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: justify;"><span style="line-height: normal;"><span style="height: 148.15pt;"><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">El documento tiene los siguientes aspectos: formato solicitado por el asesor (como tama&ntilde;o de la hoja, tipo y tama&ntilde;o de letra, texto justificado), presenta cinco errores ortogr&aacute;ficos.</font></font></span></span></span></p>
			</td>
			<td style="background: rgb(205, 221, 172); border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130) rgb(0, 0, 0); width: 77.95pt;" width="104">
			<p style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: justify;"><span style="line-height: normal;"><span style="height: 148.15pt;"><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">El documento tiene los siguientes aspectos: car&aacute;tula, presenta m&aacute;s de cinco errores ortogr&aacute;ficos.</font></font></span></span></span></p>
			</td>
		</tr>
		<tr style="height: 89.6pt;">
			<td style="background: rgb(230, 238, 213); border-width: 0px 1pt 1pt; border-style: none solid solid; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130); width: 113.45pt;" width="151">
			<p align="center" style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: center;"><span style="line-height: normal;"><span style="height: 89.6pt;"><b><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">PLANTEAMIENTO DE ALTERNATIVAS DE SOLUCI&Oacute;N</font></font></span></b></span></span></p>

			<p align="center" style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: center;"><span style="line-height: normal;"><span style="height: 89.6pt;"><b><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">(30%)</font></font></span></b></span></span></p>
			</td>
			<td style="background: rgb(230, 238, 213); border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130) rgb(0, 0, 0); width: 99.2pt;" width="132">
			<p style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: justify;"><span style="line-height: normal;"><span style="height: 89.6pt;"><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">Se establece una idea central dentro del contexto y propone al menos 2 alternativas de soluci&oacute;n en forma clara del problema abordado.</font></font></span></span></span></p>
			</td>
			<td style="background: rgb(230, 238, 213); border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130) rgb(0, 0, 0); width: 99.25pt;" width="132">
			<p style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: justify;"><span style="line-height: normal;"><span style="height: 89.6pt;"><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">Se establece una idea central y una alternativa de soluci&oacute;n al problema abordado.</font></font></span></span></span></p>
			</td>
			<td style="background: rgb(230, 238, 213); border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130) rgb(0, 0, 0); width: 92.15pt;" width="123">
			<p style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: justify;"><span style="line-height: normal;"><span style="height: 89.6pt;"><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">La propuesta de alternativas de soluci&oacute;n son relativamente claras pero ayudan a la soluci&oacute;n del problema abordado. </font></font></span></span></span></p>
			</td>
			<td style="background: rgb(230, 238, 213); border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130) rgb(0, 0, 0); width: 77.95pt;" width="104">
			<p style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: justify;"><span style="line-height: normal;"><span style="height: 89.6pt;"><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">No se hace propuesta de alternativas de soluci&oacute;n.</font></font></span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="background: rgb(205, 221, 172); border-width: 0px 1pt 1pt; border-style: none solid solid; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130); width: 113.45pt;" width="151">
			<p align="center" style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: center;"><span style="line-height: normal;"><b><span lang="ES-MX" style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">CALIDAD NARRATIVA</font></font></span></b></span></p>

			<p align="center" style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: center;"><span style="line-height: normal;"><b><span lang="ES-MX" style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">(30%)</font></font></span></b></span></p>
			</td>
			<td style="background: rgb(205, 221, 172); border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130) rgb(0, 0, 0); width: 99.2pt;" width="132">
			<p style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: justify;"><span style="line-height: normal;"><font face="Gill Sans MT"><span lang="ES-MX" style="font-size: 10pt;"><span style="color: black;">El an&aacute;lisis del caso demuestra completo entendimiento y dominio de an&aacute;lisis, y resalta puntos importantes del tema tratado.</span></span></font></span></p>
			</td>
			<td style="background: rgb(205, 221, 172); border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130) rgb(0, 0, 0); width: 99.25pt;" width="132">
			<p style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: justify;"><span style="line-height: normal;"><font face="Gill Sans MT"><span lang="ES-MX" style="font-size: 10pt;"><span style="color: black;">El an&aacute;lisis del caso demuestra entendimiento y resalta puntos importantes del tema tratado.</span></span></font></span></p>
			</td>
			<td style="background: rgb(205, 221, 172); border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130) rgb(0, 0, 0); width: 92.15pt;" width="123">
			<p style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: justify;"><span style="line-height: normal;"><font face="Gill Sans MT"><span lang="ES-MX" style="font-size: 10pt;"><span style="color: black;">El an&aacute;lisis del caso demuestra </span></span><span style="font-size: 10pt;"><span style="color: black;">entendimiento superficial del tema tratado.</span></span></font></span></p>
			</td>
			<td style="background: rgb(205, 221, 172); border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130) rgb(0, 0, 0); width: 77.95pt;" width="104">
			<p style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: justify;"><span style="line-height: normal;"><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">El an&aacute;lisis del caso demuestra nulo entendimiento del tema tratado.</font></font></span></span></p>
			</td>
		</tr>
		<tr style="height: 57.35pt;">
			<td style="background: rgb(230, 238, 213); border-width: 0px 1pt 1pt; border-style: none solid solid; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130); width: 113.45pt;" width="151">
			<p align="center" style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: center;"><span style="line-height: normal;"><span style="height: 57.35pt;"><b><span lang="ES-MX" style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">USO DE REFERENTES BIBLIOGR&Aacute;FICOS</font></font></span></b></span></span></p>

			<p align="center" style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: center;"><span style="line-height: normal;"><span style="height: 57.35pt;"><font face="Gill Sans MT"><font color="#000000"><b><span lang="ES-MX" style="font-size: 10pt;">(10%)</span></b></font></font></span></span></p>
			</td>
			<td style="background: rgb(230, 238, 213); border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130) rgb(0, 0, 0); width: 99.2pt;" width="132">
			<p style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: justify;"><span style="line-height: normal;"><span style="height: 57.35pt;"><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">Se incluyen al menos tres referencias bibliogr&aacute;ficas y dos mesogr&aacute;ficas.</font></font></span></span></span></p>
			</td>
			<td style="background: rgb(230, 238, 213); border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130) rgb(0, 0, 0); width: 99.25pt;" width="132">
			<p style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: justify;"><span style="line-height: normal;"><span style="height: 57.35pt;"><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">Se incluyen al menos dos referencias bibliogr&aacute;ficas y una mesogr&aacute;fica</font></font></span></span></span></p>
			</td>
			<td style="background: rgb(230, 238, 213); border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130) rgb(0, 0, 0); width: 92.15pt;" width="123">
			<p style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: justify;"><span style="line-height: normal;"><span style="height: 57.35pt;"><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">Se incluye al menos una referencia bibliogr&aacute;fica </font></font></span></span></span></p>
			</td>
			<td style="background: rgb(230, 238, 213); border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130) rgb(0, 0, 0); width: 77.95pt;" width="104">
			<p style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: justify;"><span style="line-height: normal;"><span style="height: 57.35pt;"><span style="font-size: 10pt;"><font face="Gill Sans MT"><font color="#000000">No se incluyen referencias bibliogr&aacute;ficas ni mesogr&aacute;ficas</font></font></span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="background: rgb(205, 221, 172); border-width: 0px 1pt 1pt; border-style: none solid solid; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130); width: 113.45pt;" width="151">
			<p align="center" style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: center;"><span style="line-height: normal;"><b><span style="font-size: 10pt;"><span style="color: black;"><font face="Gill Sans MT">TOTAL</font></span></span></b></span></p>

			<p align="center" style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: center;"><span style="line-height: normal;"><b><span style="font-size: 10pt;"><span style="color: black;"><font face="Gill Sans MT">(100%)</font></span></span></b></span></p>
			</td>
			<td colspan="4" style="background: rgb(205, 221, 172); border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) rgb(179, 204, 130) rgb(179, 204, 130) rgb(0, 0, 0); width: 368.55pt;" width="491">
			<p style="margin: 0in 0in 0pt; padding: 0in 5.4pt; text-align: justify;">&nbsp;</p>
			</td>
		</tr>
	</tbody>
</table>

<p style="margin: 0in 0in 0pt; text-align: justify;">&nbsp;</p>

<p style="margin: 0in 0in 0pt; text-align: justify;"><span style="line-height: normal;"><font face="Gill Sans MT"><font size="3"><font color="#000000">S&oacute;lo nos queda exhortarte a que le pongas todas las ganas, ya has dado un gran paso que te hayas decidido por nuestro sistema educativo a distancia; adelante, de tu empe&ntilde;o y dedicaci&oacute;n depender&aacute; tu &eacute;xito.</font></font></font></span></p>

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
        <td class="label_Conceptual">METODOLOGÍA</td>
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
