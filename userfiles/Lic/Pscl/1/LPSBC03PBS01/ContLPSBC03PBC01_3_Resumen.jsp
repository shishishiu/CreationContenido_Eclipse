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
    <p align="justify">Es importante que realices una reflexi&oacute;n de los t&eacute;rminos vistos a lo largo de la Unidad 3, si recuerdas, analizamos que el pensamiento es una experiencia interna e intrasubjetiva a trav&eacute;s de la cual podemos inventar, encontrar respuestas, resolver problemas y mucho m&aacute;s. Se caracteriza porque opera mediante conceptos y razonamientos, originado por el ambiente natural, social o cultural, la necesidad exige satisfacci&oacute;n.</p>
    <p align="justify">Si deseas conocer m&aacute;s sobre el lenguaje y su g&eacute;nesis te sugerimos ver la pel&iacute;cula&nbsp; Wittgenstein. En ella, encontrar&aacute;s una reflexi&oacute;n primordial que radica en que esta gran habilidad cognitiva es &uacute;nica en los seres humanos y ponen de manifiesto las investigaciones te&oacute;ricas al respecto.</p>
    <p align="justify">La habilidad comunicativa es el intercambio verbal&nbsp; entre un hablante, que produce un enunciado&nbsp; destinado a otro hablante, y un interlocutor del que solicita la escucha y /o respuesta expl&iacute;cita o impl&iacute;cita (seg&uacute;n el tipo de enunciado). Influye en ella los siguientes determinantes: h&aacute;bitos y las costumbres culturales y los denominados sistemas de comunicaci&oacute;n no verbal y verbal.</p>
    <p align="justify">La siguiente figura refiere gr&aacute;ficamente lo expuesto a lo largo de &eacute;stas p&aacute;ginas.</p>
    <p align="center"><img src="Img/UNIDAD 3/pcb_un3img20.jpg" width="360" height="354" /></p>
    <table width="55%" border="1" cellspacing="0" cellpadding="10" align="center">
      <tr>
        <th width="49%" bgcolor="#FED47A" scope="col"><p>UNIDAD</p></th>
        <th width="37%" bgcolor="#FED47A" scope="col"><p>ACTIVIDAD DE APRENDIZAJE</p></th>
        <th width="14%" bgcolor="#FED47A" scope="col"><p>VALOR</p></th>
      </tr>
      <tr>
        <td width="49%"><p align="center">3.1. Pensamiento</p></td>
        <td><p align="center">Resumen</p></td>
        <td><p align="center">2.5</p></td>
      </tr>
      <tr>
        <td><p align="center">3.2. Lenguaje</p></td>
        <td><p align="center">Ensayo</p></td>
        <td><p align="center">2.5</p></td>
      </tr>
      <tr>
        <td><p align="center">3.3. Lenguaje como conjunto<br />
de operaciones</p></td>
        <td><p align="center">Mapa conceptual</p></td>
        <td><p align="center">2.5</p></td>
      </tr>
      <tr>
        <td><p align="center">3.4. Comunicaci&oacute;n</p></td>
        <td><p align="center">Proyecto</p></td>
        <td><p align="center">2.5</p></td>
      </tr>
      <tr>
        <td><p align="center"><strong>TOTAL<br />
          UNIDAD 3</strong></p></td>
        <td><div align="center">
          <p><strong>ACTIVIDADES DE APRENDIZAJE</strong></p>
        </div></td>
        <td><div align="center">
          <p><strong>10%</strong></p>
        </div></td>
      </tr>
    </table>
    <p align="center"><strong>Si deseas la versi&oacute;n imprimible del documento da clic en el bot&oacute;n de Generalidades y Descargables.</strong></p>
    <p align="left">&nbsp;</p>
    <p align="left"><strong>REFERENCIAS DE CONSULTA</strong></p>
    <ol>
      <li>Alvarado, G., De  Jes&uacute;s, G. y Villalobos, J. (2012).<strong> <em><a href="http://youtu.be/dqaPY75qnfE" target="_blank">Proceso  de la comunicaci&oacute;n.</a></em></strong> Recuperado con fines did&aacute;cticos el 9 de Marzo de 2015,  de: http://www.youtube.com/watch?v=vWv33ZGubts<br />
        <p><strong>Para revisar el material indicado da clic en el siguiente enlace o bien, revisa la secci&oacute;n de Descargables en la plataforma.</strong><br />
      </p></li>
      <li>Bonilla, A. (2010). <em><a href="http://youtu.be/2KpShRFjQ24" target="_blank"><strong>Lenguaje del cuerpo. Episodio 1</strong></a></em><strong><a href="http://youtu.be/2KpShRFjQ24">.</a> </strong>Recuperado con fines did&aacute;cticos el 9 de Marzo de 2015, de:  http://www.youtube.com/watch?v=xeMue_PHCJg<br />
        <br />
        <p><strong>Para revisar el material indicado da clic en el siguiente enlace o bien, revisa la secci&oacute;n de Descargables en la plataforma.</strong></p>
      </li>
      <li>Cestero, A. (2006). <em><a href="../LPSBC03PBC01/Desc/pcb_un3des9.pdf" target="_blank"><strong>La comunicaci&oacute;n no verbal y el estudio de su  incidencia en fen&oacute;menos discursivos como la iron&iacute;a.</strong></a></em> Recuperado el 9 de  Marzo de 2015, de:&nbsp;  http://rua.ua.es/dspace/bitstream/10045/6074/1/ELUA_20_03.pdf<br />
        <br />
        <p><strong>Para revisar el material indicado da clic en el siguiente enlace o bien, revisa la secci&oacute;n de Descargables en la plataforma.</strong></p>
      </li>
      <li><em><a href="http://youtu.be/9DHllT7otAM" target="_blank"><strong>Comunicaci&oacute;n No Verbal- Comunicaci&oacute;n en los Negocios.</strong></a></em> (s/f). Recuperado con fines did&aacute;cticos el 9 de  Marzo de 2015, de:  http://www.youtube.com/watch?v=BF1e9i5Dv6M&amp;feature=related<br />
        <br />
        <p><strong>Para revisar el material indicado da clic en el siguiente enlace o bien, revisa la secci&oacute;n de Descargables en la plataforma.</strong></p>
      </li>
      <li>Emecad&oacute;s. (2007). <em><a href="http://youtu.be/vZS9SuUyaWU" target="_blank"><strong>Viaje a trav&eacute;s de la comunicaci&oacute;n.</strong></a></em>Recuperado  con fines did&aacute;cticos el 9 de Marzo de 2015, de:  http://www.youtube.com/watch?v=nKofKgZD-60<br />
        <br />
        <p><strong>Para revisar el material indicado da clic en el siguiente enlace o bien, revisa la secci&oacute;n de Descargables en la plataforma.</strong></p>
      </li>
      <li>Herrera, M. (2009). <em>M&eacute;todos y Pensamiento Cr&iacute;tico 1. Pienso,  hago y aprendo. </em>Esfinge. M&eacute;xico<br />
        <br />
      </li>
      <li>Itriago, P. (2007). <strong><em><a href="http://youtu.be/v3YGyIXnIg4" target="_blank">El Lenguaje: Tipos y funciones.</a></em> </strong>Recuperado con fines did&aacute;cticos el 9 de Marzo de 2015, de:  https://www.youtube.com/watch?v=vGThUpi898w<br />
        <br />
        <p><strong>Para revisar el material indicado da clic en el siguiente enlace o bien, revisa la secci&oacute;n de Descargables en la plataforma.</strong></p>
      </li>
      <li><em><a href="http://youtu.be/s2hTjXHZLvw" target="_blank"><strong>La comunicaci&oacute;n no verbal en las pel&iacute;culas de  Charlie Chaplin.</strong></a></em><strong><a href="http://youtu.be/s2hTjXHZLvw">&nbsp;</a></strong> (s/f). Recuperado con fines did&aacute;cticos el 9  de Marzo de 2015, de: http://www.youtube.com/watch?v=FEb43BePDcU<br />
        <br />
        <p><strong>Para revisar el material indicado da clic en el siguiente enlace o bien, revisa la secci&oacute;n de Descargables en la plataforma.</strong></p>
      </li>
      <li>Morgan, G. (2007).<strong> <em><a href="http://youtu.be/7oliqCgoHMo" target="_blank">Les Luthiers - Radio Tertulia - Parte VI</a></em><a href="http://youtu.be/7oliqCgoHMo">.</a> </strong>Recuperado con fines did&aacute;cticos el 9 de Marzo de 2015, de:  http://www.youtube.com/watch?v=MW9GxhBZVMQ<br />
        <br />
        <p><strong>Para revisar el material indicado da clic en el siguiente enlace o bien, revisa la secci&oacute;n de Descargables en la plataforma.</strong></p>
      </li>
      <li>
        <p>10. Navarro, M. (2003). <em><strong><a href="Desc/pcb_un3des15.pdf" target="_blank">Adquisici&oacute;n del lenguaje. El principio de la comunicaci&oacute;n</a>.</strong></em> Recuperado el 15 de Abril de 2011, de: http://cvc.cervantes.es/literatura/cauce/pdf/cauce26/cauce26_13.pdf<br />
          <br />
        <strong>Para revisar el material indicado da clic en el siguiente enlace o bien, revisa la secci&oacute;n de Descargables en la plataforma</strong> <br />
        </p>
      </li>
      <li>Petrovski, A. (1980). <em>Psicolog&iacute;a general.</em> Mosc&uacute;: Progreso.<br />
        <br />
        <p><strong>Para revisar el material indicado da clic en el siguiente enlace o bien, revisa la secci&oacute;n de Descargables en la plataforma.</strong></p>
      </li>
      <li>PsicoActiva.com.  (1998). <em>&iquest;Te comunicas bien?</em> Consultado el 12 de Diciembre de 2012, en: <a href="http://www.psicoactiva.com/tests/test2.htm" target="_blank"><strong>http://www.psicoactiva.com/tests/test2.htm</strong></a><br />
        <br />
        <p><strong>Para revisar el material indicado da clic en el siguiente enlace o bien, revisa la secci&oacute;n de Descargables en la plataforma.</strong></p>
      </li>
      <li>Richmond, P. (1981). <em>Introducci&oacute;n a Piaget.</em> Espa&ntilde;a:  Fundamentos.<br />
        <br />
      </li>
      <li>S&aacute;nchez, G. (2009). <em><a href="../LPSBC03PBC01/Desc/pcb_un3des10.pdf" target="_blank"><strong>La comunicaci&oacute;n no verbal.</strong></a></em>Recuperado el  9 de Marzo de 2015, de:&nbsp;&nbsp;  http://www.marcoele.com/descargas/china/g.sanchez_comunicacionnoverbal.pdf<br />
        <br />
        <p><strong>Para revisar el material indicado da clic en el siguiente enlace o bien, revisa la secci&oacute;n de Descargables en la plataforma.</strong></p>
      </li>
      <li>SHVOONG.com. (s/f). <em>El concepto de lenguaje.</em> Consultado el  13 de Febrero de 2012, en:  <a href="http://es.shvoong.com/social-sciences/1917720-el-concepto-lenguaje/#ixzz1g99EYffB" target="_blank"><strong>http://es.shvoong.com/social-sciences/1917720-el-concepto-lenguaje/#ixzz1g99EYffB</strong></a><strong><br />
        </strong><br />
        <p><strong>Para revisar el material indicado da clic en el siguiente enlace o bien, revisa la secci&oacute;n de Descargables en la plataforma.</strong></p>
      </li>
      <li><em><a href="http://youtu.be/XLFfTjyLN2g" target="_blank"><strong>Sordo_Mimo_Signos</strong></a></em> (s/f). Recuperado con fines did&aacute;cticos el 9 de  Marzo de 2015, de: http://www.youtube.com/watch?v=L2YFaz8sUFI<br />
        <br />
        <p><strong>Para revisar el material indicado da clic en el siguiente enlace o bien, revisa la secci&oacute;n de Descargables en la plataforma.</strong></p>
      </li>
      <li>Universidad de Buenos  Aires. (2008). <em><a href="http://youtu.be/jdIb4s08AEg" target="_blank"><strong>El Lenguaje (2da parte):  Adquisici&oacute;n del lenguaje.</strong></a></em> Recuperado con fines did&aacute;cticos el 9 de Marzo de  2015, de: http://www.youtube.com/watch?v=U-1RwMCzSq4&amp;feature=related<br />
        <br />
        <p><strong>Para revisar el material indicado da clic en el siguiente enlace o bien, revisa la secci&oacute;n de Descargables en la plataforma.</strong></p>
      </li>
      <li>Universidad de Buenos  Aires. (2008). <em><a href="http://youtu.be/7S9YHgdjPfI" target="_blank"><strong>El Lenguaje (3era parte):  El camino hacia el lenguaje.</strong></a></em> Recuperado con fines did&aacute;cticos el 9 de Marzo  de 2015, de: http://www.youtube.com/watch?v=coi9erJhUgQ&amp;feature=related<br />
        <br />
        <p><strong>Para revisar el material indicado da clic en el siguiente enlace o bien, revisa la secci&oacute;n de Descargables en la plataforma.</strong></p>
      </li>
      <li>Universidad de Buenos  Aires. (2008). <em><a href="http://youtu.be/8Pbu2OasQVY" target="_blank"><strong>El Lenguaje (6ta parte):  C&oacute;mo ayudan los adultos.</strong></a></em> Recuperado con fines did&aacute;cticos el 9 de Marzo de  2015, de:  http://www.youtube.com/watch?v=0dn6-vqrFeI&amp;NR=1&amp;feature=endscreen<br />
        <br />
        <p><strong>Para revisar el material indicado da clic en el siguiente enlace o bien, revisa la secci&oacute;n de Descargables en la plataforma.</strong></p>
      </li>
      <li>Universidad de Buenos  Aires. (2008). <em><a href="http://youtu.be/E8d5hhdTd08" target="_blank"><strong>El Lenguaje (7ma parte).  Caracter&iacute;sticas Formatos.</strong></a> Conclusiones.</em> Recuperado con fines did&aacute;cticos el  9 de Marzo de 2015, de:  http://www.youtube.com/watch?v=svOF1UYiLw8&amp;feature=related<br />
        <br />
        <p><strong>Para revisar el material indicado da clic en el siguiente enlace o bien, revisa la secci&oacute;n de Descargables en la plataforma.</strong></p>
      </li>
      <li>www.profesorenlinea.cl.  (s/f). <em>Comunicaci&oacute;n.</em> Consultado el 12 de  Mayo de 2012, en: <a href="http://www.profesorenlinea.cl/castellano/Comunicacion.htm" target="_blank"><strong>http://www.profesorenlinea.cl/castellano/Comunicacion.htm</strong></a><br />
        <br />
        <p><strong>Para revisar el material indicado da clic en el siguiente enlace o bien, revisa la secci&oacute;n de Descargables en la plataforma.</strong></p>
      </li>
      </ol>
    <p align="justify"><strong>REFERENCIAS ANEXAS AL PROGRAMA</strong></p>
    <ol>
      <li>Bluedorn, H. (1995). <em><a href="../LPSBC03PBC01/Desc/pcb_un3des16.pdf" target="_blank"><strong>Dos m&eacute;todos de razonamiento</strong></a></em><strong><a href="../LPSBC03PBC01/Desc/pcb_un3des9.pdf">.</a> </strong>Recuperado  el 15 de&nbsp; Diciembre del 2011, de:&nbsp;  http://www.contra-mundum.org/castellano/bluedorn/Met_Razonamiento.pdf<br />
        <br />
        <p><strong>Para revisar el material indicado da clic en el siguiente enlace o bien, revisa la secci&oacute;n de Descargables en la plataforma.</strong></p>
      </li>
      <li>D&aacute;vila, G. (2006). <em><a href="../LPSBC03PBC01/Desc/pcb_un3des17.pdf" target="_blank"><strong>El razonamiento inductivo y deductivo dentro  del proceso investigativo en ciencias experimentales y sociales.</strong></a></em> Recuperado  el 15 de&nbsp; Diciembre del 2011, de:  http://redalyc.uaemex.mx/pdf/761/76109911.pdf<br />
        <br />
        <p><strong>Para revisar el material indicado da clic en el siguiente enlace o bien, revisa la secci&oacute;n de Descargables en la plataforma.</strong><br align="left" />
      </p></li>
  </ol>
    <div>
      <div></div>
</div><table width="100%" border="0" height="100%">
      <tr>
        <td width="20%"><div align="center"><a href= "ContLPSBC03PBC01_3_4_1.jsp" ><img src="Img/REGRESAR.png" width="99" height="32" /></a></div></td>
        <td class="label_Conceptual"><p><strong>RESUMEN</strong></p></td>
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
