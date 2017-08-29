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
    <p align="justify">Se revis&oacute; que la memoria sensorial y a corto plazo son sistemas de capacidad limitadas y de duraci&oacute;n breve. Por el contrario la memoria a largo plazo retiene mucha informaci&oacute;n de modo indefinido. Creemos que hay tres obst&aacute;culos que se interponen&nbsp; en el camino al aprendizaje eficaz: el primero es el atasco de informaci&oacute;n que se produce en la memoria sensorial y en la memoria a corto plazo (solo se pueden procesar una cantidad peque&ntilde;a de informaci&oacute;n cada vez); el segundo consiste en adquirir y organizar una base de conocimiento en la memoria a largo plazo; y el tercero, en construir conocimiento metacognitivo que permita a los aprendices utilizar la memoria con la m&aacute;xima eficacia (Bruning, 2002).<br />
      </p>
    <p align="justify">Al aprender m&aacute;s cosas sobre los procesos memor&iacute;sticos, como el de la memoria impl&iacute;cita, y al proponerse nuevos modelos, como los conexionistas, nuestra comprensi&oacute;n de la memoria contin&uacute;a ampli&aacute;ndose, as&iacute; como nuestra capacidad de mejorar las capacidades de los alumnos para aprender, recordar y emplear la informaci&oacute;n que aprenden.<br />
      </p>
    <p align="justify">Recordando, la motivaci&oacute;n es la condici&oacute;n que inicia, gu&iacute;a y mantiene una conducta hacia una meta espec&iacute;fica, y posibilita el desarrollo bio-psico-social del hombre.</p>
    <div align="justify">
      <p>En alg&uacute;n momento hemos sentido, tristeza, enojo, amor, todas ellas emociones que nos hacen sentir vivos, deseo que a lo largo de la revisi&oacute;n de los contenidos hayas adquirido las competencias necesarias en tu ejercicio profesional.</p>
      <p>Hemos  llegado al t&eacute;rmino de la unidad de aprendizaje. Te invitamos a poner en  pr&aacute;ctica los conocimientos adquiridos resolviendo la actividad integradora, la  cual tiene un peso de 40% sobre tu calificaci&oacute;n final. Recuerda que puedes  acercarte a tu asesor en caso de tener alguna duda. </p>
      <p>Deseamos que a lo largo de la revisi&oacute;n de los  contenidos hayas adquirido las competencias necesarias en tu ejercicio  profesional.
        
      </p>
      <a href="../../../../ActApartInt.jsp">
      <h2>ACTIVIDAD INTEGRADORA<br />
  <br />
</h2></a>
</p>
      <table width="55%" border="1" cellspacing="0" cellpadding="10" align="center">
        <tr>
          <th width="49%" bgcolor="#FED47A" scope="col"><p>UNIDAD</p></th>
          <th width="37%" bgcolor="#FED47A" scope="col"><p>ACTIVIDAD DE APRENDIZAJE</p></th>
          <th width="14%" bgcolor="#FED47A" scope="col"><p>VALOR</p></th>
        </tr>
        <tr>
          <td width="49%"><p align="center">4.1 Memoria</p></td>
          <td><p align="center">Ensayo</p></td>
          <td><p align="center">2.5</p></td>
        </tr>
        <tr>
          <td><p align="center">4.2 Funciones de la memoria</p></td>
          <td><p align="center">Crucigrama</p></td>
          <td><p align="center">2.5</p></td>
        </tr>
        <tr>
          <td><p align="center">4.3 Motivaci&oacute;n</p></td>
          <td><p align="center">Mapa conceptual</p></td>
          <td><p align="center">2.5</p></td>
        </tr>
        <tr>
          <td><p align="center">4.4 Emoci&oacute;n</p></td>
          <td><p align="center">Resumen</p></td>
          <td><p align="center">2.5</p></td>
        </tr>
        <tr>
          <td><p align="center"><strong>TOTAL<br />
            UNIDAD 4</strong></p></td>
          <td><div align="center">
            <p><strong>ACTIVIDADES DE APRENDIZAJE</strong></p>
          </div></td>
          <td><div align="center">
            <p><strong>10%</strong></p>
          </div></td>
        </tr>
  </table>
      <p align="center"><strong>Si deseas la versi&oacute;n imprimible del documento da clic en el bot&oacute;n de Generalidades y Descargables.</strong></p>
      <p align="justify"><strong>&nbsp;</strong><strong>REFERENCIAS DE CONSULTA</strong></p>
      <ol>
        <li>Ballesteros, S.  (1999). <em><a href="Desc/pcb_un4des3.pdf" target="_blank"><strong>Memoria Humana: Investigaci&oacute;n y  Teor&iacute;a</strong></a></em><strong><a href="../LPSBC03PBC01/Desc/">.</a></strong> Recuperado el 20 de Abril del 2011, de:&nbsp;<br /> 
          http://www.psicothema.com/pdf/323.pdf<br />
          <p><strong>Para revisar el material indicado da clic en el siguiente enlace o bien, revisa la secci&oacute;n de Descargables en la plataforma.</strong><br />
        </p></li>
        <li><em>CogniFit. Entrenador personal</em>. (2001). Consultado con fines  did&aacute;cticos el 9 de Marzo de 2015, en:<br />
http://www.cognifitpersonalcoach.com/cognifit.php 3. <em>La  qu&iacute;mica de las emociones.</em> (s/f). Recuperado con fines did&aacute;cticos el 9 de  Marzo de 2015, de:  http://www.youtube.com/watch?v=ULT1F3vvzrU&amp;feature=related<br />
          <br />
        </li>
        <li><em><a href="http://youtu.be/VnLyGqXoMe0" target="_blank"><strong>La qu&iacute;mica de las emociones.</strong></a></em> (s/f). Recuperado con fines did&aacute;cticos el 9 de  Marzo de 2015, de:<br />
http://www.youtube.com/watch?v=ULT1F3vvzrU&amp;feature=related<br />
<p><strong>Para revisar el material indicado da clic en el siguiente enlace o bien, revisa la secci&oacute;n de Descargables en la plataforma.</strong><br />
        </p></li>
        <li><em><a href="http://youtu.be/NSc_nHP48LM" target="_blank"><strong>Motivaci&oacute;n Extraterrestres.</strong></a></em> (2008). Recuperado con fines did&aacute;cticos el 9 de  Marzo de 2015, de:<br />
http://www.youtube.com/watch?v=pQCFybFPnnY<br />
<p><strong>Para revisar el material indicado da clic en el siguiente enlace o bien, revisa la secci&oacute;n de Descargables en la plataforma.</strong><strong align="justify"><br />
        </strong></p>
        </li>
      </ol>
      <p><strong>REFERENCIAS ANEXAS AL PROGRAMA</strong></p>
      <ol>
        <li>Etchepareborda, M.  (2005). <em><a href="Desc/pcb_un4des4.pdf" target="_blank"><strong>Memoria de trabajo en los  procesos b&aacute;sicos del aprendizaje.</strong></a></em> Recuperado el 20 de Abril del 2011, de:<br />
http://www.lafun.com.ar/PDF/21-MT_en_los_procesos_de_48C50.pdf<br />
<p><strong>Para revisar el material indicado da clic en el siguiente enlace o bien, revisa la secci&oacute;n de Descargables en la plataforma.</strong><br />
        </p></li>
        <li>Ch&oacute;liz, M. (2005). <em><a href="Desc/pcb_un4des5.pdf" target="_blank"><strong>Psicolog&iacute;a de la emoci&oacute;n.</strong></a></em> Recuperado el  16 de Diciembre del 2011, de:<br />
            http://www.uv.es/choliz/Proceso%20emocional.pdf<br />
            <p><strong>Para revisar el material indicado da clic en el siguiente enlace o bien, revisa la secci&oacute;n de Descargables en la plataforma.</strong><br />
        </p></li>
        <li>D&iacute;az,  A. (2009). <em><a href="Desc/pcb_cibdes1.pdf" target="_blank"><strong>Desarrollo de habilidades  adaptativas: autonom&iacute;a y vida diaria en adolescentes con discapacidad  intelectual</strong>.</a></em> <br />
          Recuperado el 8 de Mayo de 2012, de:  http://200.23.113.59/pdf/26180.pdf <br />
          <p><strong>Para revisar el material indicado da clic en el siguiente enlace o bien, revisa la secci&oacute;n de Descargables en la plataforma.</strong><br/>
        </p></li>
      </ol>
    </div>
    <div>
      </div>

<table width="100%" border="0" height="100%">
      <tr>
        <td width="20%"><div align="center"><a href= "ContLPSBC03PBC01_4_4_2.jsp" ><img src="Img/REGRESAR.png" width="99" height="32" /></a></div></td>
        <td class="label_Conceptual"><strong>RESUMEN</strong></td>
        <td width="20%"></td>
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
