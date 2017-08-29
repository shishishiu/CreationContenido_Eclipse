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
 	<h1 align="center"><strong>RESUMEN</strong><br />
 	  </h1>
 	<p align="justify">Percepci&oacute;n, atenci&oacute;n y aprendizaje, todos ellos conceptos interrelacionados e indispensables para el estudio de la conducta del hombre.</p>
<p align="justify">A lo largo de los contenidos tem&aacute;ticos has aprendido que los procesos psicol&oacute;gicos b&aacute;sicos son la sensaci&oacute;n, percepci&oacute;n, atenci&oacute;n y memoria, cada uno de ellos elementos fundamentales para que se lleve a cabo el aprendizaje.</p>
    <p align="justify">Recordemos que la percepci&oacute;n es una actividad que el organismo realiza para extraer del medio ambiente la informaci&oacute;n que necesita para su funcionamiento normal, el sujeto que percibe es el auto de su propia experiencia. Mencionamos que existen cuatro tipos de percepci&oacute;n: forma, movimiento, del tiempo y social, describiendo cada uno de sus principios.</p>
    <p align="justify">Revisamos la definici&oacute;n, caracter&iacute;sticas de la atenci&oacute;n y los modelos que tratan de explicar el impacto que tiene sobre el aprendizaje, asimismo, se mencionaron los tipos de atenci&oacute;n que existen y ejemplo con las situaciones m&aacute;s representativas de los mismos.</p>
    <p align="justify">Analizamos mediante la revisi&oacute;n y reflexi&oacute;n del condicionamiento cl&aacute;sico y operante el proceso de aprendizaje, sin olvidar las disposiciones innatas de conducta que intervienen en el mismo.</p>
    <p align="justify">Espero que cada tema haya sido introyectado en tu vida personal y profesional, te invito a seguir con mucho &aacute;nimo.<strong> </strong></p>
    <table width="55%" border="1" cellspacing="0" cellpadding="10" align="center">
      <tr>
        <th width="49%" bgcolor="#FED47A" scope="col"><p>UNIDAD</p></th>
        <th width="37%" bgcolor="#FED47A" scope="col"><p>ACTIVIDAD DE APRENDIZAJE</p></th>
        <th width="14%" bgcolor="#FED47A" scope="col"><p>VALOR</p></th>
      </tr>
      <tr>
        <td width="49%"><p align="center">2.1. Percepci&oacute;n</p></td>
        <td><p align="center">Resumen</p></td>
        <td><p align="center">2.5</p></td>
      </tr>
      <tr>
        <td><p align="center">2.2. Atenci&oacute;n</p></td>
        <td><p align="center">Cuadro sin&oacute;ptico</p></td>
        <td><p align="center">2.5</p></td>
      </tr>
      <tr>
        <td><p align="center">2.3. Aprendizaje</p></td>
        <td><p align="center">Mapa conceptual</p></td>
        <td><p align="center">2.5</p></td>
      </tr>
      <tr>
        <td><p align="center">2.4. Aprendizaje y Disposiciones Innatas de Conducta</p></td>
        <td><p align="center">Cuadro comparativo</p></td>
        <td><p align="center">2.5</p></td>
      </tr>
      <tr>
        <td><p align="center"><strong>TOTAL<br />
          UNIDAD 2</strong></p></td>
        <td><div align="center">
          <p><strong>ACTIVIDADES DE APRENDIZAJE</strong></p>
        </div></td>
        <td><div align="center">
          <p><strong>10%</strong></p>
        </div></td>
      </tr>
    </table>
    <p align="justify">&nbsp;</p>
    <p align="center"><strong>REFERENCIAS DE CONSULTA</strong></p>
    <ol>
      <li>Bustos, F. (2010). <em>Proceso de ense&ntilde;anza aprendizaje.</em>&nbsp; Consultado el 15 de Abril del 2011, en:  http://prezi.com/eodwyim7k9cz/proceso-de-ensenanza-aprendizaje/<br />
        <br />
      </li>
      <li>Kubrick, S. (1962).<a href="http://youtu.be/P-lW1QBQk_4" target="_blank"> <em><strong>Naranja mec&aacute;nica</strong></em></a>. Extracto recuperado  con fines did&aacute;cticos el 6 de Marzo de 2015, de:  https://www.youtube.com/watch?v=jyXqT4yptvI<br />
        <br />
      </li>
      <li>Montalvo,  C., Hern&aacute;ndez, A., Ibarra, Y. y Mart&iacute;nez. (s/f). <em>Cap&iacute;tulo #4. La percepci&oacute;n.</em> Consultado el 15 de Abril de 2011, en:  http://www.slideshare.net/cecy8505/4-6-tipos-de-percepcin 4. Saieed Hasnoo. (2011).&nbsp; <em>BF  Skinner's Operant Conditioning Chamber.</em> Recuperado  con fines did&aacute;cticos el 6 de Marzo de 2015, de:  http://www.youtube.com/watch?v=SUwCgFSb6Nk&amp;feature=related<br />
        <br />
      </li>
      <li>Saieed Hasnoo.  (2011).<a href="http://youtu.be/xWPj4i1udrw" target="_blank">&nbsp; <em><strong>BF Skinner's Operant Conditioning Chamber</strong>.</em></a> Recuperado con fines did&aacute;cticos el 6 de Marzo de  2015, de: http://www.youtube.com/watch?v=SUwCgFSb6Nk&amp;feature=related<br />
        <br />
      </li>
      <li>Tecnolog&iacute;a  m&eacute;dica. (2009). <em>El aprendizaje.</em> Consultado el 15 de Abril de 20111, en:  http://www.slideshare.net/tmedicauss/concepto-de-aprendizaje 6. <em>Thorndike  - Law of Effect.</em> (s/f). Recuperado con fines  did&aacute;cticos el 6 de Marzo de 2015, de: https://www.youtube.com/watch?v=Vk6H7Ukp6To&amp;NR=1<br />
        <br />
      </li>
      <li><em><a href="http://youtu.be/jehHs2rhmvk" target="_blank"><strong>Thorndike - Law of Effect</strong>.</a></em> (s/f). Recuperado  con fines did&aacute;cticos el 6 de Marzo de 2015, de: https://www.youtube.com/watch?v=Vk6H7Ukp6To&amp;NR=1<br />
        <br />
      </li>
      <li><a href="http://youtu.be/poZcOdPZwbw" target="_blank"><strong>Transporte de  Londres. (s/f). <em>Test de percepci&oacute;n</em></strong><em>.</em></a> Recuperado con fines did&aacute;cticos el 6 de Marzo de 2015, de:  http://www.youtube.com/watch?v=sOZ71QscGJY<br />
        <br />
      </li>
      <li>Universidad de  Alicante. (2007). <em><a href="Desc/pcb_un2des5.pdf" target="_blank"><strong>Sensaci&oacute;n, Percepci&oacute;n y  Atenci&oacute;n</strong>.</a></em>&nbsp; Recuperado el 15 de Abril  de 2011, de:  http://rua.ua.es/dspace/bitstream/10045/4298/2/TEMA%202_SENSACION,PERCEPCION,ATENCI%C3%93N.pdf<br />
        <br />
        <p><strong>Para revisar el material indicado da clic en el siguiente enlace o bien, revisa la secci&oacute;n de Descargables en la plataforma.</strong></p>
      </li>
      </ol>
    <p><strong>REFERENCIAS SUGERIDAS:</strong></p>
    <p>En la  siguiente p&aacute;gina puedes encontrar algunos juegos para desarrollas habilidades  mentales:</p>
    <ol>
      <li>Jugar con juegos. (s/f).  Juegos brain. Consultado el 6 de Marzo de 2015, en:<strong> <a href="http://www.jugarconjuegos.com/JUEGOS%20BRAIN.htm" target="_blank">http://www.jugarconjuegos.com/JUEGOS%20BRAIN.htm</a></strong><a href="http://www.jugarconjuegos.com/JUEGOS%20BRAIN.htm" target="_blank"></a><br />
        <br />
      </li>
      <li>Oviedo, G. (2004). <em><a href="Desc/pcb_un2des6.pdf" target="_blank"><strong>La definici&oacute;n del concepto de percepci&oacute;n en  psicolog&iacute;a&nbsp; con base en la teor&iacute;a  Gestalt.</strong></a></em> Recuperado el 30 de Abril de 2011, de: file:///C:/Users/Alumno/Downloads/-data-Revista_No_18-10_Dossier8.pdf<br />
        <br />
        <p><strong>Para revisar el material indicado da clic en el siguiente enlace o bien, revisa la secci&oacute;n de Descargables en la plataforma.</strong><br />
      </p></li>
      <li>Kubrick, S. (1962). <em>Naranja mec&aacute;nica</em>. <br />
        <br />
      </li>
      <li>Romero, A. y Jara, P. (s/f). <em>Introducci&oacute;n: Concepto y marco disciplinar del aprendizaje.</em> Recuperado el 5 de Marzo de 2015, de: http://www.um.es/docencia/agustinr/ac/ac0506Cap1.pdf<br />
        <p><strong>Para revisar el material indicado da clic en el siguiente enlace o bien, revisa la secci&oacute;n de Descargables en la plataforma.</strong><br />
        </p>
      </li>
      <li>Universidad de  Espa&ntilde;a. (2011)<a href="Desc/pcb_un2des8.pdf" target="_blank">. <em><strong>Percepci&oacute;n</strong>.</em> </a>Recuperado el 15 de Diciembre de 2011,&nbsp;  de: http://www.um.es/docencia/pguardio/documentos/percepcion.pdf<br />
        <br />
        <p><strong>Para revisar el material indicado da clic en el siguiente enlace o bien, revisa la secci&oacute;n de Descargables en la plataforma.</strong>        <br />
  <br />
</p>
      </li>
    </ol>
<table width="100%" border="0" height="100%">
      <tr>
        <td width="20%"><div align="center"><a href= "ContLPSBC03PBC01_2_4_0.jsp" ><img src="Img/REGRESAR.png" width="99" height="32" /></a></div></td>
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
