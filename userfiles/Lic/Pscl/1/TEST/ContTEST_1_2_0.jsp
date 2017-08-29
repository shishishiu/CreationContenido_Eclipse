
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
 	<!-- InstanceBeginEditable name="Trabajo" --><script>function funcToggle(id){elem = document.getElementById(id);if(elem.style.display=='block'){elem.style.display='none';} else {elem.style.display='block';}}</script><p style="margin: 0in 0in 10pt;"><b><font face="Gill Sans MT"><font size="3"><font color="#000000">1.2 EL ORIGEN DEL CONOCIMIENTO</font></font></font></b></p><p style="margin: 0in 0in 10pt; text-align: justify;"><font face="Gill Sans MT"><font size="3"><font color="#000000">La preocupaci&oacute;n por conocer la verdad de las cosas y de todo lo que nos rodea fue determinante para que grandes fil&oacute;sofos demostraran inter&eacute;s en establecer criterios y posturas que justificaran el verdadero conocimiento.</font></font></font></p><p style="margin: 0in 0in 10pt; text-align: justify;"><font face="Gill Sans MT"><font size="3"><font color="#000000">Para explicar el origen del conocimiento se destacan dos posturas, estas son: El Racionalismo y El Empirismo.</font></font></font></p><p style="margin: 0in 0in 10pt; text-align: justify;">&nbsp;</p><p style="margin: 0in 0in 10pt; text-align: justify;"><b><font face="Gill Sans MT"><font size="3"><font color="#000000">1.2.1 RACIONALISMO</font></font></font></b></p><p style="margin: 0in 0in 10pt; text-align: justify;"><font face="Gill Sans MT"><font size="3"><font color="#000000">El racionalismo proviene del lat&iacute;n ratio, que significa raz&oacute;n, el cual afirma que es posible conocer la realidad mediante el pensamiento puro. Esta corriente se caracteriza por lo real y la explicaci&oacute;n de la ciencia en t&eacute;rminos l&oacute;gicos y en donde el conocimiento s&oacute;lo puede ser llamado como tal cuando tiene l&oacute;gica y validez universal, de tal manera que el m&eacute;todo cient&iacute;fico dar&aacute; lugar a un camino racional.</font></font></font></p><p style="margin: 0in 0in 10pt; text-align: justify;"><font face="Gill Sans MT"><font size="3"><font color="#000000">El racionalismo, entonces, es totalmente la <b>raz&oacute;n</b>, ya que esta puede decir que una cosa es como es y no puede ser de otra manera; adem&aacute;s de que tiene la capacidad de obtener por s&iacute; misma, mediante la deducci&oacute;n a partir de la ideas innatas, otros conocimientos, a el nombre de estos conceptos se le llaman juicios sint&eacute;ticos, que por tener su origen en la raz&oacute;n son conocimientos a pripori; la expresi&oacute;n a priori significa en lat&iacute;n previo a, y se utiliza para distinguir al conocimiento que es independiente de la experiencia.</font></font></font></p><p style="margin: 0in 0in 10pt; text-align: justify;"><font face="Gill Sans MT"><font size="3"><font color="#000000">La historia del racionalismo se remonta con Plat&oacute;n, ya que &eacute;l se encuentra convencido de que todo verdadero saber o conocimiento se distingue porque se vuelve propenso a la l&oacute;gica y a la validez universal, y considera que el verdadero saber no puede ser alcanzado a trav&eacute;s de los sentidos, lo que conseguimos a trav&eacute;s de ellos es s&oacute;lo la doxa, u opini&oacute;n. </font></font></font></p><p><br clear="all" style="page-break-before: always;" />&nbsp;</p><p style="margin: 0in 0in 10pt;">&nbsp;</p><p><font size="3"><font color="#000000"><span lang="ES-MX" style="font-size: 12pt;"><span style="line-height: 115%;"><span mt="" style="font-family:;">DESTACADOS REPRESENTANTES DEL RACIONALISMO</span></span></span></font></font></p><table border="1" cellpadding="1" cellspacing="1" style="width: 500px;">	<tbody>		<tr>			<td onclick="funcToggle('elem1')" style="width: 100px;"><img alt="" src="Img/1/ContTEST_1_2_13.jpg" style="width: 100px; height: 102px;" /></td>			<td style="width: 400px;">			<div id="elem1" style="display: none;"><span style="color: rgb(0, 0, 0);"><span style="language: es;"><span style="font-family: Calibri;"><span style="language: es-MX;">PIENSO LUEGO EXISTO&rdquo;. Adopt&oacute; el m&eacute;todo de la duda en todas las cosas, de esta manera &eacute;l pod&iacute;a construir la certeza ante la duda.</span></span></span></span></div>			</td>		</tr>	</tbody></table><table border="1" cellpadding="1" cellspacing="1" style="width: 500px;">	<tbody>		<tr>			<td onclick="funcToggle('elem2')" style="width: 100px;"><img alt="" src="Img/1/ContTEST_1_2_14.jpg" style="width: 100px; height: 105px;" /></td>			<td>			<div id="elem2" style="display: none;"><span style="color: rgb(0, 0, 0);"><span style="-ms-text-justify: inter-ideograph;"><span style="language: es;"><span style="font-family: Calibri;"><span style="language: es-MX;">Todas las cosas dependen de lo divino, ya que la naturaleza quiere llegar a la verdad a trav&eacute;s de conocimientos racionales.</span></span></span></span></span></div>			</td>		</tr>	</tbody></table><table border="1" cellpadding="1" cellspacing="1" style="width: 500px;">	<tbody>		<tr>			<td onclick="funcToggle('elem3')" style="width: 100px;"><span style="color: rgb(0, 0, 0);"><img alt="" src="Img/1/ContTEST_1_2_15.jpg" style="width: 100px; height: 97px;" /></span></td>			<td>			<div id="elem3" style="display: none;"><span style="color: rgb(0, 0, 0);"><span style="-ms-text-justify: inter-ideograph;"><span style="language: es;"><span style="font-family: Calibri;"><span style="language: es-MX;">Las verdades no pueden llegar de la experiencia, al contrario las verdades se fundan en el principio de la raz&oacute;n. Nada sucede y ocurre sin que haya una causa o raz&oacute;n predeterminada.</span></span></span></span></span></div>			</td>		</tr>	</tbody></table><p>&nbsp;</p><p>&nbsp;</p><p style="margin: 0in 0in 10pt; text-align: justify;"><b><font face="Gill Sans MT"><font size="3"><font color="#000000">1.2.2 EMPIRISMO</font></font></font></b></p><p style="margin: 0in 0in 10pt; text-align: justify;"><font face="Gill Sans MT"><font size="3"><font color="#000000">El empirismo, proviene del griego em&eacute;ira que significa experiencia. El empirismo establece que todo conocimiento est&aacute; basado en la experiencia, de tal forma que se puede considerar opuesto al racionalismo. Es una corriente filos&oacute;fica que surge en Inglaterra en el siglo XVII y se extiende hasta el siglo XVIII.</font></font></font></p><p style="margin: 0in 0in 10pt; text-align: justify;"><font face="Gill Sans MT"><font size="3"><font color="#000000">Esta corriente filos&oacute;fica afirma que el sujeto es la fuente del conocimiento, es decir, para conocer el mundo se debe partir del propio sujeto y no de la realidad en s&iacute;, la experiencia del sujeto se basa en la percepci&oacute;n de los objetos sensibles externos, las cosas. De esta manera se entiende que la mente no trae consigo ideas innatas, si no que es como una &ldquo;tabla rasa&rdquo;, una mente vac&iacute;a que se llena con la experiencia y el aprendizaje. </font></font></font></p><p style="margin: 0in 0in 10pt; text-align: justify;">&nbsp;</p><p><a><v:group coordorigin="1478,2843" coordsize="8396,4170" id="Group_x0020_53" o:gfxdata="UEsDBBQABgAIAAAAIQC2gziS/gAAAOEBAAATAAAAW0NvbnRlbnRfVHlwZXNdLnhtbJSRQU7DMBBF90jcwfIWJU67QAgl6YK0S0CoHGBkTxKLZGx5TGhvj5O2G0SRWNoz/78nu9wcxkFMGNg6quQqL6RA0s5Y6ir5vt9lD1JwBDIwOMJKHpHlpr69KfdHjyxSmriSfYz+USnWPY7AufNIadK6MEJMx9ApD/oDOlTrorhX2lFEilmcO2RdNtjC5xDF9pCuTyYBB5bi6bQ4syoJ3g9WQ0ymaiLzg5KdCXlKLjvcW893SUOqXwnz5DrgnHtJTxOsQfEKIT7DmDSUCaxw7Rqn8787ZsmRM9e2VmPeBN4uqYvTtW7jvijg9N/yJsXecLq0q+WD6m8AAAD//wMAUEsDBBQABgAIAAAAIQA4/SH/1gAAAJQBAAALAAAAX3JlbHMvLnJlbHOkkMFqwzAMhu+DvYPRfXGawxijTi+j0GvpHsDYimMaW0Yy2fr2M4PBMnrbUb/Q94l/f/hMi1qRJVI2sOt6UJgd+ZiDgffL8ekFlFSbvV0oo4EbChzGx4f9GRdb25HMsYhqlCwG5lrLq9biZkxWOiqY22YiTra2kYMu1l1tQD30/bPm3wwYN0x18gb45AdQl1tp5j/sFB2T0FQ7R0nTNEV3j6o9feQzro1iOWA14Fm+Q8a1a8+Bvu/d/dMb2JY5uiPbhG/ktn4cqGU/er3pcvwCAAD//wMAUEsDBBQABgAIAAAAIQCK3k6NOAYAAHUxAAAOAAAAZHJzL2Uyb0RvYy54bWzsW21v2zYQ/j5g/4HQ98R6oV5sxCmSNCkGtFuxdNtnRpItrZKoUXLsbNh/3/EoqXKoJHXbCO5iGzAkkeK98PjweHc+ebXJM3Ibiyrlxdywjk2DxEXIo7RYzo3fPlwdBQapalZELONFPDfu4sp4dfrjDyfrchbbPOFZFAsCgxTVbF3OjaSuy9lkUoVJnLPqmJdxAY0LLnJWw61YTiLB1jB6nk1s0/Qmay6iUvAwrip4+lo1Gqc4/mIRh/Uvi0UV1ySbG8Bbjb8Cf2/k7+T0hM2WgpVJGjZssC/gImdpAUS7oV6zmpGVSLWh8jQUvOKL+jjk+YQvFmkYowwgjWXek+aN4KsSZVnO1suyUxOo9p6evnjY8Ofb94Kk0dxwqUEKlsMcIVniOlI563I5gz5vRHldvhdKQrh8y8OPFTRP7rfL+6XqTG7W73gE47FVzVE5m4XI5RAgNtngHNx1cxBvahLCQ9dxLOrBVIXQ5jg0CKitZilMYCrlexb1waqg2Q4oMslmYXLZvB84U0+9TC0f53fCZoowMtswJyUDi6s+KbX6OqVeJ6yMca4qqbBWqW6r1DNQAvYhNnIlyUO/VquVUikp+EXCimV8JgRfJzGLgC1Lyg/M916QNxVMyJM6HtBVq2nbc/xGU56PJFpFsVkpqvpNzHMiL+YG2GER/QqLCaeR3b6tajSFqLEYFv1pkEWewdK5ZRmxPK8bsekMk9CO2SyT6CrNMiJ4/UdaJ6gZaQvYWLXjV6TkoAD1GDEhvsgEARpgVWEYF7WDb2SrHExNPfdM+CiLgcfSZLA7bR8DJ91IoFZYspUiqmi52E8+6Xo9Ts+SLwwQbG2vG2aAWPPuDtS+SDoUstFplhYEDEyud8U4qUKWxQAAyswQwnBuJFdZQdbQYvsgIXLJs7Rr7CT7lgqq+hTQ7hCi5VK4LCK8rlmaqWsQLCskXzFCfSMiX9WxuE6iNYlSab02YAIARpQC7juB6ZlTsHuWLWHDCmthDNrgZ8qmrAW56hvb8Nx3fKEl9FjGtS2Xs0KlenOzQUi2AmnHcq3f8OgOVjusFrka5IYLFwkXfxtkDZvX3Kj+WjERGyT7qYAFM7Uolbsd3lDXB8ghot9y029hRQhDzY0atIKXF7XaIVelSJcJULJw8gsuQWyR1sAUsqy4am4AS8cCVQB4tVP1QBWtdwsjYQU/E6hSalm4AVETIBRnXwdV1/xuQZWODKo6vecEVZ3a3oOqzvJuCtpnUNVle2ZQnR5AdchThT1RA1X0vEcCVd+k9716HVRp51e2Z4nWq9x7T9UeGVR1erthxrZb/JSnqlPbe1DVWd5NQfsMqrpszwuq4GAePNWB4z8gmgaqTVyld5p/Pk/V9qYOeqqOjKlseapOd/oHZ1Z69A+e/iO+LjAegQg2ePoHd/jT8b9nastehMDu93FMOm1PSc8cIvBGBl6d3m64shvw6tT2Hnh1lndT0Bbw5ikc9kmW5nMj6EVi9iJeoAvaWxrfLl4wGByI2e8QJHiR4YHpAOjSdn8aIebqupYCXep73gF0R4nL6kttN0w5gG4XKW+35S4Eir7BAXTbnMsjEdmXC7oyY6d5uu6IoBvYgYrJHjzd0ZJhB9B9Ihn2tQo6gO4BdLGuZbi6wAPE00AXPc6RYrYW5FIfSoTZARz4ZRGH5TrI08MBhm9eXrC1bjo/RqWps1plM/s1A7v5ilujqwy558DJDsTNywjyqFBL9PFD0lQEbfW+x8tDNQxfwc/uKfM2KtRkz2XQHSuX/jm7ghwmdYIj33edI+pcmkfnwdXF0dkFFHj4l+cX55fWvzK4YtFZkkZRXFxiGr5qC6ks+nk1NU1JlyqB6kqpeglyKBm6l9N33KkN1o85fVmdAJ+nc/piedOVjwSe/DaBr250dHV7hCeabKrHBupfwJ5BV6i1hxL4wOIhLKqHRT1ABg23MFs+Em5RF4rKZAWZa0+b6rIu1+SYcHhXuOU+ERh94bilZ24PuPVULdJ3gltd4ncwtvhSC488QAYNt7oarREiiz51ofYJcGug8IhCtRjilj31231trCT5Yz7O/vlbenL0gFv/E9zqcqvfC26B54i1/ehONv9DkH8e6N/Ddf/fEqf/AQAA//8DAFBLAwQUAAYACAAAACEAkaGzaeAAAAAJAQAADwAAAGRycy9kb3ducmV2LnhtbEyPQWuDQBSE74X+h+UVektWTWzFuIYQ2p5CIUmh5PaiLypxd8XdqPn3fT21x2GGmW+y9aRbMVDvGmsUhPMABJnClo2pFHwd32cJCOfRlNhaQwru5GCdPz5kmJZ2NHsaDr4SXGJcigpq77tUSlfUpNHNbUeGvYvtNXqWfSXLHkcu162MguBFamwML9TY0bam4nq4aQUfI46bRfg27K6X7f10jD+/dyEp9fw0bVYgPE3+Lwy/+IwOOTOd7c2UTrQKZlG05KiChC+xn4SvEYizgngRL0Hmmfz/IP8BAAD//wMAUEsBAi0AFAAGAAgAAAAhALaDOJL+AAAA4QEAABMAAAAAAAAAAAAAAAAAAAAAAFtDb250ZW50X1R5cGVzXS54bWxQSwECLQAUAAYACAAAACEAOP0h/9YAAACUAQAACwAAAAAAAAAAAAAAAAAvAQAAX3JlbHMvLnJlbHNQSwECLQAUAAYACAAAACEAit5OjTgGAAB1MQAADgAAAAAAAAAAAAAAAAAuAgAAZHJzL2Uyb0RvYy54bWxQSwECLQAUAAYACAAAACEAkaGzaeAAAAAJAQAADwAAAAAAAAAAAAAAAACSCAAAZHJzL2Rvd25yZXYueG1sUEsFBgAAAAAEAAQA8wAAAJ8JAAAAAA==" style="width: 439.55pt; height: 294.65pt; margin-top: 20.5pt; margin-left: -4.35pt; position: absolute; z-index: 251673600;"> <v:roundrect arcsize="10923f" fillcolor="#c2d69b [1942]" id="AutoShape_x0020_20" o:gfxdata="UEsDBBQABgAIAAAAIQDw94q7/QAAAOIBAAATAAAAW0NvbnRlbnRfVHlwZXNdLnhtbJSRzUrEMBDH74LvEOYqbaoHEWm6B6tHFV0fYEimbdg2CZlYd9/edD8u4goeZ+b/8SOpV9tpFDNFtt4puC4rEOS0N9b1Cj7WT8UdCE7oDI7ekYIdMayay4t6vQvEIrsdKxhSCvdSsh5oQi59IJcvnY8TpjzGXgbUG+xJ3lTVrdTeJXKpSEsGNHVLHX6OSTxu8/pAEmlkEA8H4dKlAEMYrcaUSeXszI+W4thQZudew4MNfJUxQP7asFzOFxx9L/lpojUkXjGmZ5wyhjSRJQ8YKGvKv1MWzIkL33VWU9lGfl98J6hz4cZ/uUjzf7PbbHuj+ZQu9z/UfAMAAP//AwBQSwMEFAAGAAgAAAAhADHdX2HSAAAAjwEAAAsAAABfcmVscy8ucmVsc6SQwWrDMAyG74O9g9G9cdpDGaNOb4VeSwe7CltJTGPLWCZt376mMFhGbzvqF/o+8e/2tzCpmbJ4jgbWTQuKomXn42Dg63xYfYCSgtHhxJEM3Elg372/7U40YalHMvokqlKiGBhLSZ9aix0poDScKNZNzzlgqWMedEJ7wYH0pm23Ov9mQLdgqqMzkI9uA+p8T9X8hx28zSzcl8Zy0Nz33r6iasfXeKK5UjAPVAy4LM8w09zU50C/9q7/6ZURE31X/kL8TKv1x6wXNXYPAAAA//8DAFBLAwQUAAYACAAAACEAMy8FnkEAAAA5AAAAEAAAAGRycy9zaGFwZXhtbC54bWyysa/IzVEoSy0qzszPs1Uy1DNQUkjNS85PycxLt1UKDXHTtVBSKC5JzEtJzMnPS7VVqkwtVrK34+UCAAAA//8DAFBLAwQUAAYACAAAACEACT0SocMAAADbAAAADwAAAGRycy9kb3ducmV2LnhtbESP0WrDMAxF3wf7B6NB31ang2xdVreUlULowyDJPkDEWhway2nsJunf14PBHsXRPdLd7GbbiZEG3zpWsFomIIhrp1tuFHxXx+c1CB+QNXaOScGNPOy2jw8bzLSbuKCxDI2IEvYZKjAh9JmUvjZk0S9dTxzZjxsshjgOjdQDTlFuO/mSJK/SYsvxgsGePg3V5/Jq4xv5+9vapKvL4XzKI6iK6/Q1K7V4mvcfIALN4X/5L51rBWkKv12iAOT2DgAA//8DAFBLAQItABQABgAIAAAAIQDw94q7/QAAAOIBAAATAAAAAAAAAAAAAAAAAAAAAABbQ29udGVudF9UeXBlc10ueG1sUEsBAi0AFAAGAAgAAAAhADHdX2HSAAAAjwEAAAsAAAAAAAAAAAAAAAAALgEAAF9yZWxzLy5yZWxzUEsBAi0AFAAGAAgAAAAhADMvBZ5BAAAAOQAAABAAAAAAAAAAAAAAAAAAKQIAAGRycy9zaGFwZXhtbC54bWxQSwECLQAUAAYACAAAACEACT0SocMAAADbAAAADwAAAAAAAAAAAAAAAACYAgAAZHJzL2Rvd25yZXYueG1sUEsFBgAAAAAEAAQA9QAAAIgDAAAAAA==" strokecolor="#9bbb59 [3206]" strokeweight="1pt" style="left: 1478px; top: 2843px; width: 2637px; height: 467px; position: absolute;"> <v:fill color2="#9bbb59 [3206]" focus="50%" type="gradient"> <v:shadow color="#4e6128 [1606]" offset="1pt" on="t"> <v:textbox><font color="#000000"><font face="Times New Roman"><font size="3"> </font></font></font></v:textbox></v:shadow></v:fill></v:roundrect></v:group></a></p><table style="border: rgb(0, 0, 0);" width="100%">	<tbody>		<tr>			<td style="border: rgb(0, 0, 0);">			<div>			<p align="center" style="margin: 0in 0in 10pt; text-align: center;"><font face="Gill Sans MT"><font size="3"><font color="#000000">PSICOL&Oacute;GICO</font></font></font></p>			</div>			</td>		</tr>	</tbody></table><p><a><font face="Times New Roman"><font size="3"><font color="#000000"> </font></font></font> <v:roundrect arcsize="10923f" fillcolor="#b2a1c7 [1943]" id="AutoShape_x0020_21" o:gfxdata="UEsDBBQABgAIAAAAIQDw94q7/QAAAOIBAAATAAAAW0NvbnRlbnRfVHlwZXNdLnhtbJSRzUrEMBDH74LvEOYqbaoHEWm6B6tHFV0fYEimbdg2CZlYd9/edD8u4goeZ+b/8SOpV9tpFDNFtt4puC4rEOS0N9b1Cj7WT8UdCE7oDI7ekYIdMayay4t6vQvEIrsdKxhSCvdSsh5oQi59IJcvnY8TpjzGXgbUG+xJ3lTVrdTeJXKpSEsGNHVLHX6OSTxu8/pAEmlkEA8H4dKlAEMYrcaUSeXszI+W4thQZudew4MNfJUxQP7asFzOFxx9L/lpojUkXjGmZ5wyhjSRJQ8YKGvKv1MWzIkL33VWU9lGfl98J6hz4cZ/uUjzf7PbbHuj+ZQu9z/UfAMAAP//AwBQSwMEFAAGAAgAAAAhADHdX2HSAAAAjwEAAAsAAABfcmVscy8ucmVsc6SQwWrDMAyG74O9g9G9cdpDGaNOb4VeSwe7CltJTGPLWCZt376mMFhGbzvqF/o+8e/2tzCpmbJ4jgbWTQuKomXn42Dg63xYfYCSgtHhxJEM3Elg372/7U40YalHMvokqlKiGBhLSZ9aix0poDScKNZNzzlgqWMedEJ7wYH0pm23Ov9mQLdgqqMzkI9uA+p8T9X8hx28zSzcl8Zy0Nz33r6iasfXeKK5UjAPVAy4LM8w09zU50C/9q7/6ZURE31X/kL8TKv1x6wXNXYPAAAA//8DAFBLAwQUAAYACAAAACEAMy8FnkEAAAA5AAAAEAAAAGRycy9zaGFwZXhtbC54bWyysa/IzVEoSy0qzszPs1Uy1DNQUkjNS85PycxLt1UKDXHTtVBSKC5JzEtJzMnPS7VVqkwtVrK34+UCAAAA//8DAFBLAwQUAAYACAAAACEAvmZyNMUAAADbAAAADwAAAGRycy9kb3ducmV2LnhtbESPQWsCMRSE74X+h/AKXqRmK6zoahQp1ErrQa0Hj4/Nc7N087Ikqa7++qYg9DjMzDfMbNHZRpzJh9qxgpdBBoK4dLrmSsHh6+15DCJEZI2NY1JwpQCL+ePDDAvtLryj8z5WIkE4FKjAxNgWUobSkMUwcC1x8k7OW4xJ+kpqj5cEt40cZtlIWqw5LRhs6dVQ+b3/sQpwmOfvG3v0ZnXtb3e3djn5/KiU6j11yymISF38D9/ba60gH8Hfl/QD5PwXAAD//wMAUEsBAi0AFAAGAAgAAAAhAPD3irv9AAAA4gEAABMAAAAAAAAAAAAAAAAAAAAAAFtDb250ZW50X1R5cGVzXS54bWxQSwECLQAUAAYACAAAACEAMd1fYdIAAACPAQAACwAAAAAAAAAAAAAAAAAuAQAAX3JlbHMvLnJlbHNQSwECLQAUAAYACAAAACEAMy8FnkEAAAA5AAAAEAAAAAAAAAAAAAAAAAApAgAAZHJzL3NoYXBleG1sLnhtbFBLAQItABQABgAIAAAAIQC+ZnI0xQAAANsAAAAPAAAAAAAAAAAAAAAAAJgCAABkcnMvZG93bnJldi54bWxQSwUGAAAAAAQABAD1AAAAigMAAAAA" strokecolor="#8064a2 [3207]" strokeweight="1pt" style="left: 4411px; top: 4037px; width: 2637px; height: 507px; position: absolute;"> <v:fill color2="#8064a2 [3207]" focus="50%" type="gradient"> <v:shadow color="#3f3151 [1607]" offset="1pt" on="t"> <v:textbox><font color="#000000"><font face="Times New Roman"><font size="3"> </font></font></font></v:textbox></v:shadow></v:fill></v:roundrect></a></p><table style="border: rgb(0, 0, 0);" width="100%">	<tbody>		<tr>			<td style="border: rgb(0, 0, 0);">			<div>			<p align="center" style="margin: 0in 0in 10pt; text-align: center;"><font face="Gill Sans MT"><font size="3"><font color="#000000">GNOSEOL&Oacute;GICO</font></font></font></p>			</div>			</td>		</tr>	</tbody></table><p><a> <font face="Times New Roman"><font size="3"><font color="#000000"> </font></font></font> <v:roundrect arcsize="10923f" fillcolor="#d99594 [1941]" id="AutoShape_x0020_22" o:gfxdata="UEsDBBQABgAIAAAAIQDw94q7/QAAAOIBAAATAAAAW0NvbnRlbnRfVHlwZXNdLnhtbJSRzUrEMBDH74LvEOYqbaoHEWm6B6tHFV0fYEimbdg2CZlYd9/edD8u4goeZ+b/8SOpV9tpFDNFtt4puC4rEOS0N9b1Cj7WT8UdCE7oDI7ekYIdMayay4t6vQvEIrsdKxhSCvdSsh5oQi59IJcvnY8TpjzGXgbUG+xJ3lTVrdTeJXKpSEsGNHVLHX6OSTxu8/pAEmlkEA8H4dKlAEMYrcaUSeXszI+W4thQZudew4MNfJUxQP7asFzOFxx9L/lpojUkXjGmZ5wyhjSRJQ8YKGvKv1MWzIkL33VWU9lGfl98J6hz4cZ/uUjzf7PbbHuj+ZQu9z/UfAMAAP//AwBQSwMEFAAGAAgAAAAhADHdX2HSAAAAjwEAAAsAAABfcmVscy8ucmVsc6SQwWrDMAyG74O9g9G9cdpDGaNOb4VeSwe7CltJTGPLWCZt376mMFhGbzvqF/o+8e/2tzCpmbJ4jgbWTQuKomXn42Dg63xYfYCSgtHhxJEM3Elg372/7U40YalHMvokqlKiGBhLSZ9aix0poDScKNZNzzlgqWMedEJ7wYH0pm23Ov9mQLdgqqMzkI9uA+p8T9X8hx28zSzcl8Zy0Nz33r6iasfXeKK5UjAPVAy4LM8w09zU50C/9q7/6ZURE31X/kL8TKv1x6wXNXYPAAAA//8DAFBLAwQUAAYACAAAACEAMy8FnkEAAAA5AAAAEAAAAGRycy9zaGFwZXhtbC54bWyysa/IzVEoSy0qzszPs1Uy1DNQUkjNS85PycxLt1UKDXHTtVBSKC5JzEtJzMnPS7VVqkwtVrK34+UCAAAA//8DAFBLAwQUAAYACAAAACEAKbZJBcMAAADbAAAADwAAAGRycy9kb3ducmV2LnhtbESPQYvCMBSE74L/ITxhb5pa0JVqFBVkFxFE7UFvj+bZFpuX0mS1/nsjLHgcZuYbZrZoTSXu1LjSsoLhIAJBnFldcq4gPW36ExDOI2usLJOCJzlYzLudGSbaPvhA96PPRYCwS1BB4X2dSOmyggy6ga2Jg3e1jUEfZJNL3eAjwE0l4ygaS4Mlh4UCa1oXlN2OfyZQtj+r/WR19ek4Hj3Pl+gW73epUl+9djkF4an1n/B/+1crGH3D+0v4AXL+AgAA//8DAFBLAQItABQABgAIAAAAIQDw94q7/QAAAOIBAAATAAAAAAAAAAAAAAAAAAAAAABbQ29udGVudF9UeXBlc10ueG1sUEsBAi0AFAAGAAgAAAAhADHdX2HSAAAAjwEAAAsAAAAAAAAAAAAAAAAALgEAAF9yZWxzLy5yZWxzUEsBAi0AFAAGAAgAAAAhADMvBZ5BAAAAOQAAABAAAAAAAAAAAAAAAAAAKQIAAGRycy9zaGFwZXhtbC54bWxQSwECLQAUAAYACAAAACEAKbZJBcMAAADbAAAADwAAAAAAAAAAAAAAAACYAgAAZHJzL2Rvd25yZXYueG1sUEsFBgAAAAAEAAQA9QAAAIgDAAAAAA==" strokecolor="#c0504d [3205]" strokeweight="1pt" style="left: 7048px; top: 2843px; width: 2637px; height: 467px; position: absolute;"> <v:fill color2="#c0504d [3205]" focus="50%" type="gradient"> <v:shadow color="#622423 [1605]" offset="1pt" on="t"> <v:textbox><font color="#000000"><font face="Times New Roman"><font size="3"> </font></font></font></v:textbox></v:shadow></v:fill></v:roundrect></a></p><table style="border: rgb(0, 0, 0);" width="100%">	<tbody>		<tr>			<td style="border: rgb(0, 0, 0);">			<div>			<p align="center" style="margin: 0in 0in 10pt; text-align: center;"><font face="Gill Sans MT"><font size="3"><font color="#000000">METAF&Iacute;SICO</font></font></font></p>			</div>			</td>		</tr>	</tbody></table><p><a> <font face="Times New Roman"><font size="3"><font color="#000000"> </font></font></font> </a><font color="#000000"><b><span lang="ES-MX" style="font-size: 12pt;"><span style="line-height: 115%;"><span mt="" style="font-family:;">TIPOS DE EMPIRISMO</span></span></span></b> </font></p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p><font color="#000000"><img alt="" src="Img/1/ContTEST_1_2_16.png" style="width: 500px; height: 352px;" /></font></p><p>&nbsp;</p><p><b><font face="Gill Sans MT"><font size="3"><font color="#000000">REPRESENTANTES DESTACADOS DEL EMPIRISMO</font></font></font></b></p><table border="1" cellpadding="1" cellspacing="1" style="width: 700px;">	<tbody>		<tr>			<td><img alt="" src="Img/1/ContTEST_1_2_17.jpg" style="width: 183px; height: 145px;" /></td>			<td>			<p style="margin: 0in 0in 10pt;"><font face="Gill Sans MT"><font size="3"><font color="#000000">El origen del conocimiento es la experiencia, a todo lo que la mente percibe se le llama idea. Se tienen 2 Tipos de percepci&oacute;n:</font></font></font></p>			<ul>				<li style="margin: 0in 0in 10pt;"><font color="#000000"><font face="Gill Sans MT"><font size="3">Percepci&oacute;n externa: Se origina por medio de los sentidos </font></font></font></li>				<li><font size="3"><font color="#000000"><span lang="ES-MX" style="font-size: 12pt;"><span style="line-height: 115%;"><span mt="" style="font-family:;">Percepci&oacute;n Interna: Estados ps&iacute;quicos o reflexi&oacute;n</span></span></span></font></font></li>			</ul>			</td>		</tr>		<tr>			<td><img alt="" src="Img/1/ContTEST_1_2_18.jpg" style="width: 190px; height: 130px;" /></td>			<td>			<p align="center" style="margin: 0in 0in 10pt; text-align: center;"><b><font face="Gill Sans MT"><font size="3"><font color="#000000">&ldquo;Asociaci&oacute;n de las ideas&rdquo;</font></font></font></b></p>			<font color="#000000"><span lang="ES-MX" style="font-size: 12pt;"><span style="line-height: 115%;"><span mt="" style="font-family:;">Ideas son copias borrosasy sin viveza. No existen las ideas innatas, ya que todo proviene de</span></span></span></font><span lang="ES-MX" style="font-size: 12pt;"><span style="line-height: 115%;"><span mt="" style="font-family:;"><span style="color: rgb(0, 0, 0);"> la </span><a><span style="color: rgb(0, 0, 0);">experiencia</span></a></span></span></span><span style="color: rgb(0, 0, 0);"><font size="3"><font face="Times New Roman">&nbsp;</font></font></span></td>		</tr>	</tbody></table><p>&nbsp;</p><p><a href="ACT/ActTEST_1_2_2.docx"><span style="color: rgb(255, 0, 0);"><b><font face="Gill Sans MT"><font size="3">ACTIVIDAD DE APRENDIZAJE 1.2</font></font></b></span></a></p><p><a href="ActCmp/ActCmpTEST_1_2_2.docx"><span style="color: rgb(255, 0, 0);"><b><font face="Gill Sans MT"><font size="3">ACTIVIDAD COMPLEMENTARIA 1.2</font></font></b></span></a></p> 	 	 	
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
        <td class="label_Conceptual">1.2 EL ORIGEN DEL CONOCIMIENTO</td>
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
