
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
 	<!-- InstanceBeginEditable name="Trabajo" --><p align="center" style="margin: 0in 0in 10pt; text-align: center;"><u><strong>Glosario</strong></u></p>

<p style="margin: 6pt 0in; text-align: justify;"><span style="line-height: normal;"><font face="Gill Sans MT"><font size="3"><font color="#000000"><b>Aprovechamiento acad&eacute;mico: </b>Consiste en reconocer la dedicaci&oacute;n, empe&ntilde;o y trayectoria del egresado durante los estudios profesionales.</font></font></font></span></p>

<p style="margin: 0in 0in 10pt; text-align: justify;"><span style="line-height: normal;"><font face="Gill Sans MT"><font size="3"><font color="#000000"><b>Asesor: </b>El asesor es un profesor experto en el contenido del curso o de la asignatura que no s&oacute;lo resuelve dudas, sino que orienta el aprendizaje de los contenidos, aporta cuando es necesario materiales adicionales, eval&uacute;a y retroalimenta al estudiante sobre su desempe&ntilde;o y le sugiere acciones para asegurar su comprensi&oacute;n y desarrollo de habilidades. A trav&eacute;s de su retroalimentaci&oacute;n, el alumno puede conocer el grado de conocimientos y habilidades adquiridos, as&iacute; como los que le falta desarrollar a&uacute;n m&aacute;s.</font></font></font></span></p>

<p style="margin: 0in 0in 10pt; text-align: justify;"><span style="line-height: normal;"><font face="Gill Sans MT"><font size="3"><font color="#000000"><b>Autorregulaci&oacute;n:</b> es el proceso psicol&oacute;gico que te permite supervisar todas tus actividades. La mayor parte de las veces este proceso se realiza sin tomar consciencia de ello.</font></font></font></span></p>

<p style="margin: 0in 0in 10pt; text-align: justify;"><span style="line-height: normal;"><font face="Gill Sans MT"><font size="3"><font color="#000000"><b>Bibliotecas digitales: </b>Son acervos de informaci&oacute;n en formato digital para su consulta a trav&eacute;s de una red, algunas est&aacute;n disponibles a trav&eacute;s de Web y otras solamente a trav&eacute;s de una red privada. </font></font></font></span></p>

<p style="margin: 0in 0in 10pt; text-align: justify;"><span style="line-height: normal;"><font face="Gill Sans MT"><font size="3"><font color="#000000"><b>Buscadores: </b>Estos permiten ubicar un sitio en la Web utilizando diversos criterios para su b&uacute;squeda. Los m&aacute;s comunes son las coincidencias textuales y las categor&iacute;as tem&aacute;ticas.</font></font></font></span></p>

<p style="margin: 0in 0in 10pt; text-align: justify;"><span style="line-height: normal;"><font face="Gill Sans MT"><font size="3"><font color="#000000"><b>Chat: </b>Es un medio de comunicaci&oacute;n en tiempo real (sincr&oacute;nico) que puedes utilizar para preguntar a tu asesor, ponerte de acuerdo con tus compa&ntilde;eros para hacer un trabajo en equipo, o simplemente charlar como en una cafeter&iacute;a, siempre y cuando coincidan al mismo tiempo o se pongan de acuerdo previamente para encontrarse en la sala.</font></font></font></span></p>

<p style="margin: 0in 0in 10pt; text-align: justify;"><span style="line-height: normal;"><font face="Gill Sans MT"><font size="3"><font color="#000000"><b>Conclusi&oacute;n:</b> permite al lector extraer la base del tema desarrollado. </font></font></font></span></p>

<p style="margin: 0in 0in 10pt; text-align: justify;"><span style="line-height: normal;"><font face="Gill Sans MT"><font size="3"><font color="#000000"><b>Contenido Declarativo:</b> Se dice de los temas que incluyen datos, principios, conceptos y teor&iacute;as. Como resultado de haberlas aprendido, t&uacute; sabes algo.</font></font></font></span></p>

<p style="margin: 0in 0in 10pt; text-align: justify;"><span style="line-height: normal;"><font face="Gill Sans MT"><font size="3"><font color="#000000"><b>Contenido Procedimental:</b> Se dice de los temas que incluyen procedimientos para &ldquo;saber hacer&rdquo; o &ldquo;resolver&rdquo;. Como resultado de haberlos aprendido sabes hacer o resolver.</font></font></font></span></p>

<p style="margin: 6pt 0in 10pt; text-align: justify;"><span style="line-height: normal;"><font face="Gill Sans MT"><font size="3"><font color="#000000"><b>Coordinador de Licenciatura: </b>Realizar la planeaci&oacute;n de actividades para los asesores, as&iacute; como para el auxiliar y tutor, planea y activa ex&aacute;menes finales. Adem&aacute;s debe tener una estrecha comunicaci&oacute;n con el asesor y el tutor para dar seguimiento acad&eacute;mico a los estudiantes.</font></font></font></span></p>

<p style="margin: 0in 0in 10pt; text-align: justify;"><span style="line-height: normal;"><font face="Gill Sans MT"><font size="3"><font color="#000000"><b>Correo electr&oacute;nico: </b>Es un medio de gran utilidad para la comunicaci&oacute;n entre el asesor y el alumno o entre los alumnos. Permite enviar archivos adjuntos al mensaje y ofrece la posibilidad de enviar un mensaje a varios destinatarios a la vez.</font></font></font></span></p>

<p class="MsoCommentText" style="margin: 0in 0in 10pt; text-align: justify;"><span style="tab-stops: right 441.9pt;"><font face="Gill Sans MT"><font color="#000000"><b><span lang="ES-MX" style="font-size: 12pt;">Cuadro Sin&oacute;ptico:</span></b> <span lang="ES-MX" style="font-size: 12pt;">Representaci&oacute;n grafica del las ideas principales de un texto</span></font></font></span></p>

<ol start="2" style="list-style-type: lower-roman;">
	<li style="margin: 0in 0in 1.2pt; text-align: justify;" value="2147483647"><span style="line-height: normal;"><font face="Gill Sans MT"><font size="3"><font color="#000000"><b>De Tiempo (DDT)</b>: Es cualquier cosa que impida que una persona alcance sus objetivos de la manera m&aacute;s efectiva posible. </font></font></font></span></li>
</ol>

<p style="margin: 0in 0in 10pt; text-align: justify;"><span style="line-height: normal;"><font face="Gill Sans MT"><font size="3"><font color="#000000"><b>D</b><b>iagrama de flujo</b>: es la representaci&oacute;n de un procedimiento e indica la secuencia de pasos del mismo, as&iacute; como el conjunto de decisiones que se deben tomar para seguir cada uno.</font></font></font></span></p>

<p style="margin: 0in 0in 10pt; text-align: justify;"><span style="line-height: normal;"><font face="Gill Sans MT"><font size="3"><font color="#000000"><b>Estrategia de Aprendizaje:</b> es un procedimiento (conjunto de pasos o habilidades) que un alumno adquiere y emplea de forma intencional para aprender de manera significativa</font></font></font></span></p>

<p style="margin: 6pt 0in 10pt; text-align: justify;"><span style="line-height: normal;"><font face="Gill Sans MT"><font size="3"><font color="#000000"><b>Estudiantes: </b>Para ser alumno a distancia se requiere tener la necesidad y el deseo de aprender no s&oacute;lo para obtener un certificado, sino para hacerse un mejor individuo, ciudadano, alumno, trabajador, hijo o padre de familia.</font></font></font></span></p>

<p style="margin: 6pt 0in 10pt; text-align: justify;"><span style="line-height: normal;"><font face="Gill Sans MT"><font size="3"><font color="#000000"><b>Evaluaci&oacute;n continua: </b>Se realizar&aacute; a trav&eacute;s de la resoluci&oacute;n de actividades de aprendizaje e integradoras con la intenci&oacute;n de que el estudiante aplique los conocimientos adquiridos durante cada unidad tem&aacute;tica.</font></font></font></span></p>

<p style="margin: 6pt 0in 10pt; text-align: justify;"><span style="line-height: normal;"><font face="Gill Sans MT"><font size="3"><font color="#000000"><b>Evaluaci&oacute;n diagn&oacute;stica: </b>Considera la acreditaci&oacute;n de un curso de &quot;Habilidades b&aacute;sicas del modelo en l&iacute;nea de la educaci&oacute;n superior&quot;.</font></font></font></span></p>

<p style="margin: 6pt 0in 10pt; text-align: justify;"><span style="line-height: normal;"><font face="Gill Sans MT"><font size="3"><font color="#000000"><b>Evaluaci&oacute;n sumativa: </b>Consistir&aacute; en la aplicaci&oacute;n de un examen final en l&iacute;nea, el cual deber&aacute; incluir reactivos de cada unidad tem&aacute;tica.</font></font></font></span></p>

<p style="margin: 0in 0in 10pt; text-align: justify;"><span style="line-height: normal;"><font face="Gill Sans MT"><font size="3"><font color="#000000"><b>Expresi&oacute;n escrita: </b>se define como cualquier escrito cuyo contenido desarrolla siempre una idea. </font></font></font></span></p>

<p style="margin: 0in 0in 10pt; text-align: justify;"><span style="line-height: normal;"><font face="Gill Sans MT"><font size="3"><font color="#000000"><b>Foros de discusi&oacute;n o debate: </b>Es el espacio virtual donde se debaten las ideas, se aclaran dudas, se aportan ideas y se confirma la adquisici&oacute;n de conocimientos. Es el equivalente al sal&oacute;n de clases, donde se encuentran &ldquo;reunidos&rdquo; los alumnos y el asesor, s&oacute;lo con la diferencia de que participan juntos de la discusi&oacute;n sin hacerlo al mismo tiempo ni en el mismo sitio, la conversaci&oacute;n se va generando conforme se realiza cada participaci&oacute;n, que se agrega a la conversaci&oacute;n y permanece ah&iacute; para ser respondida.</font></font></font></span></p>

<p style="margin: 0in 0in 0pt; text-align: justify;"><span style="line-height: normal;"><font face="Gill Sans MT"><font size="3"><font color="#000000">I<b>ntroducci&oacute;n:</b> sirve para informar el tema a tratar en el texto. </font></font></font></span></p>

<p style="margin: 0in 0in 0pt; text-align: justify;">&nbsp;</p>

<p class="MsoCommentText" style="margin: 0in 0in 10pt; text-align: justify;"><font face="Gill Sans MT"><font color="#000000"><b><span lang="ES-MX" style="font-size: 12pt;">L&iacute;nea de Tiempo</span></b><span lang="ES-MX" style="font-size: 12pt;">: </span><span lang="ES-MX" style="font-size: 12pt;">Son representaciones de acontecimientos a lo largo de un periodo.</span></font></font></p>

<p class="MsoCommentText" style="margin: 0in 0in 10pt; text-align: justify;"><font face="Gill Sans MT"><font color="#000000"><b><span lang="ES-MX" style="font-size: 12pt;">Mapa Conceptual:</span></b><span lang="ES-MX" style="font-size: 12pt;"> Es un medio de representaci&oacute;n que permite visualizar los conceptos y proposiciones de un texto, as&iacute; como la relaci&oacute;n que existe entre ellos.</span></font></font></p>

<p style="margin: 6pt 0in; text-align: justify;"><span style="line-height: normal;"><font face="Gill Sans MT"><font size="3"><font color="#000000"><b>Memoria de pr&aacute;ctica profesional: </b>Consiste en la elaboraci&oacute;n de un trabajo escrito, basado en el ejercicio profesional del egresado, que permita evaluar su capacidad de aplicar sus conocimientos a la pr&aacute;ctica. El trabajo ser&aacute; realizado y sustentado oralmente de manera individual ante un jurado. </font></font></font></span></p>

<p style="margin: 0in 0in 10pt; text-align: justify;"><span style="line-height: normal;"><font face="Gill Sans MT"><font size="3"><font color="#000000"><b>Par&aacute;frasis:</b> La par&aacute;frasis consiste en la explicaci&oacute;n o interpretaci&oacute;n del texto para lograr que &eacute;ste sea m&aacute;s claro comprensible. Siempre deber&aacute;s elaborarla usando tus palabras y sin agregar ning&uacute;n punto de vista personal.</font></font></font></span></p>

<p style="margin: 0in 0in 3.5pt; text-align: justify;"><span style="line-height: normal;"><span style="tab-stops: 81.0pt;"><font face="Gill Sans MT"><font size="3"><font color="#000000"><b>P</b><b>ortal educativo</b>: Ofrece otros servicios en l&iacute;nea, como son: consulta de historial y calificaciones de los alumnos, documentos de inter&eacute;s para el estudio, revistas y boletines electr&oacute;nicos, programas educativos de asignaturas, biblioteca digital, etc.</font></font></font></span></span></p>

<p style="margin: 6pt 0in; text-align: justify;"><span style="line-height: normal;"><font face="Gill Sans MT"><font size="3"><font color="#000000"><b>Publicaci&oacute;n de art&iacute;culo en revista especializada: </b>Comprender&aacute; la realizaci&oacute;n y publicaci&oacute;n de un trabajo escrito relacionado con la aplicaci&oacute;n o generaci&oacute;n del conocimiento en el &aacute;rea de la disciplina correspondiente.</font></font></font></span></p>

<p class="MsoCommentText" style="margin: 0in 0in 10pt; text-align: justify;"><font face="Gill Sans MT"><font color="#000000"><b><span lang="ES-MX" style="font-size: 12pt;">Resumen:</span></b> <span lang="ES-MX" style="font-size: 12pt;">son exposiciones abreviadas en las que se identifican los elementos esenciales y relevantes del material estudiado.</span></font></font></p>

<p style="margin: 0in 0in 10pt; text-align: justify;"><span style="line-height: normal;"><font face="Gill Sans MT"><font size="3"><font color="#000000"><b>Sitio Educativo:</b> La informaci&oacute;n que contiene un sitio de este tipo es b&aacute;sicamente de difusi&oacute;n, por ejemplo: estudios que ofrece, requisitos de ingreso, planes de estudio, modalidades de estudio, costos, calendario de inscripci&oacute;n, eventos acad&eacute;micos, servicios a los alumnos, etc. </font></font></font></span></p>

<p class="MsoCommentText" style="margin: 0in 0in 10pt; text-align: justify;"><font face="Gill Sans MT"><font color="#000000"><b><span lang="ES-MX" style="font-size: 12pt;">Subordinados:</span></b> <span lang="ES-MX" style="font-size: 12pt;">Son los elementos m&aacute;s particulares que se encuentran englobados dentro de otros elementos supraordinados.</span></font></font></p>

<p class="MsoCommentText" style="margin: 0in 0in 10pt; text-align: justify;"><span style="tab-stops: 357.75pt;"><font face="Gill Sans MT"><font color="#000000"><b><span lang="ES-MX" style="font-size: 12pt;">Supraordinados:</span></b> <span lang="ES-MX" style="font-size: 12pt;">Son los elementos generales que incluyen a otros particulares.</span></font></font></span></p>

<p style="margin: 6pt 0in; text-align: justify;"><span style="line-height: normal;"><font face="Gill Sans MT"><font size="3"><font color="#000000"><b>Tesina: </b>Consiste en un trabajo escrito donde el estudiante desarrolla un tema relacionado con el &aacute;mbito profesional, con sistematizaci&oacute;n y coherencia metodol&oacute;gica, pero sin llegar a la profundidad, amplitud y rigor de una tesis. Ser&aacute; desarrollada de manera individual y sustentada en forma oral ante un jurado. </font></font></font></span></p>

<p style="margin: 6pt 0in; text-align: justify;"><span style="line-height: normal;"><font face="Gill Sans MT"><font size="3"><font color="#000000"><b>Tesis: </b>Consiste en la elaboraci&oacute;n de un trabajo de investigaci&oacute;n en torno a una o varias hip&oacute;tesis, sobre un tema vinculado al plan de estudios cursado y que causa controversia o ante el cual se puede sostener una postura original. El trabajo de tesis tendr&aacute; las siguientes modalidades: individual y de grupo (m&aacute;ximo tres sustentantes). Ser&aacute; sustentada en examen oral ante un jurado. </font></font></font></span></p>

<p class="MsoCommentText" style="margin: 0in 0in 10pt; text-align: justify;"><span style="tab-stops: 357.75pt;"><font face="Gill Sans MT"><font color="#000000"><b><span lang="ES-MX" style="font-size: 12pt;">Textos:</span></b><span lang="ES-MX" style="font-size: 12pt;"> son registro y veh&iacute;culo de lo que pretende comunicar quien escribe.</span></font></font></span></p>

<p style="margin: 0in 0in 3.5pt; text-align: justify;"><span style="line-height: normal;"><font face="Gill Sans MT"><font size="3"><font color="#000000"><b>Textos Cient&iacute;ficos:</b> Es aquel cuya informaci&oacute;n se presenta de manera sistem&aacute;tica y normalmente presenta el resultado de investigaciones basadas en el m&eacute;todo cient&iacute;fico. El lenguaje de este texto es muy espec&iacute;fico, utiliza t&eacute;rminos t&eacute;cnicos, requieren de un conocimiento amplio y generalmente el lector es un especialista en la materia</font></font></font></span></p>

<p style="margin: 0in 0in 3.5pt; text-align: justify;">&nbsp;</p>

<p class="MsoCommentText" style="margin: 0in 0in 10pt; text-align: justify;"><font face="Gill Sans MT"><font color="#000000"><b><span lang="ES-MX" style="font-size: 12pt;">T</span></b><b><span lang="ES-MX" style="font-size: 12pt;">exto</span></b><span lang="ES-MX" style="font-size: 12pt;"> <b>Expositivo Declarativo:</b> es aqu&eacute;l en el que el autor tiene como objetivo definir, describir, mostrar o demostrar qu&eacute; o c&oacute;mo son las personas, objetos ambientes o asuntos a que se refiere: las caracter&iacute;sticas que poseen, la forma en que se comportan, las reglas por las que se rigen.</span></font></font></p>

<p class="MsoCommentText" style="margin: 0in 0in 10pt; text-align: justify;"><font face="Gill Sans MT"><font color="#000000"><b><span lang="ES-MX" style="font-size: 12pt;">Textos Literarios:</span></b><span lang="ES-MX" style="font-size: 12pt;"> Son aquellos escritos donde se plasma en cada palabra emociones, sentimientos e ideas</span></font></font></p>

<p class="MsoCommentText" style="margin: 0in 0in 10pt; text-align: justify;"><font face="Gill Sans MT"><font color="#000000"><b><span lang="ES-MX" style="font-size: 12pt;">Texto Narrativo: </span></b><span lang="ES-MX" style="font-size: 12pt;">cuando en &eacute;l se enuncian sucesos acontecidos durante un periodo determinado. <b> </b></span></font></font></p>

<p class="MsoCommentText" style="margin: 0in 0in 10pt; text-align: justify;"><font face="Gill Sans MT"><font color="#000000"><b><span lang="ES-MX" style="font-size: 12pt;">Textos Period&iacute;sticos: </span></b><span lang="ES-MX" style="font-size: 12pt;">Lo encontramos publicado en diarios o revistas de temas generales, el contenido lo encontramos generalmente en columnas y tipograf&iacute;a diversa. Su prop&oacute;sito fundamental es brindar informaci&oacute;n actual, ver&iacute;dica, oportuna y de inter&eacute;s social.</span></font></font></p>

<p style="margin: 6pt 0in 10pt; text-align: justify;"><span style="line-height: normal;"><font face="Gill Sans MT"><font size="3"><font color="#000000"><b>Tutor: </b>El tutor es un experto que da seguimiento a los estudiantes. Contacta v&iacute;a telef&oacute;nica, por correo electr&oacute;nico o por chat a los estudiantes que tienen alg&uacute;n rezago en su avance as&iacute; como a los que muestran un bajo desempe&ntilde;o en las actividades de aprendizaje. A trav&eacute;s de un di&aacute;logo directo, el tutor contribuye a que el estudiante construya soluciones que le permitan ser exitoso en su proceso de aprender. Adamas asesora al estudiante en cuanto a la normatividad</font></font></font></span></p>

<p style="margin: 6pt 0in 10pt; text-align: justify;">&nbsp;</p>

<p style="margin: 6pt 0in 10pt; text-align: justify;">&nbsp;</p>

<p style="margin: 6pt 0in 10pt; text-align: justify;">&nbsp;</p>

<p style="margin: 0in 0in 10pt; text-align: justify;">&nbsp;</p>

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
        <td class="label_Conceptual">Glosario</td>
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
