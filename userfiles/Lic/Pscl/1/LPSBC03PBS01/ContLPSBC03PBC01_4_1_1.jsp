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
 	<h2><strong>4.1.1 COMPONENTES O FASES DE LA MEMORIA</strong></h2>
    <p align="justify">Algunos investigadores han dividido los procesos memor&iacute;sticos en estadios de adquisici&oacute;n, almacenamiento y recuperaci&oacute;n para que se forme un recuerdo, debe adquirirse nueva informaci&oacute;n e introducirla en el sistema.</p>
    <p align="justify">En los a&ntilde;os cincuenta del siglo XX, los cient&iacute;ficos cognitivos comenzaron&nbsp; a crear modelos que conten&iacute;an dichos estadios y que tambi&eacute;n reflejaban claramente la influencia creciente del ordenador como met&aacute;fora de la cognici&oacute;n humana. Estos modelos recibieron la denominaci&oacute;n colectiva de <strong>&laquo;Modelos de procesamiento de informaci&oacute;n&raquo; o &laquo;modelo modal&raquo; </strong>(Bruning, 2002).</p>
    <p align="justify">En los primeros a&ntilde;os de la vida, la memoria es de car&aacute;cter sensitivo, guarda sensaciones o emociones. M&aacute;s tarde aparece la memoria de las conductas: se ensayan movimientos, se repiten y, poco a poco, se van grabando. De esa forma, los ni&ntilde;os van reteniendo y aprendiendo experiencias que permiten que progrese y se adapte al entorno. Finalmente, se  desarrolla la memoria del conocimiento, o capacidad de introducir datos,  almacenarlos correctamente y evocarlos cuando sea oportuno.    </p>
    <p align="justify">El sistema de la  memoria est&aacute; integrado por tres procesos b&aacute;sicos, para que se despliegue la  informaci&oacute;n da clic en el t&iacute;tulo:    </p>
    <p align="center"><strong>TABLA1. PROCESOS B&Aacute;SICOS DE LA MEMORIA        </strong>    </p>
    <table width="85%" align="center" border="2" cellspacing="0" cellpadding="15">
      <tr>
        <td width="33%" bgcolor="#FED47A"><a href="#" onclick="mostrarOcultarTablas('evento1');mostrarOcultarTablas('evento2');" title="Haz clic sobre el texto"><p align="center"><strong><em>1. Codificaci&oacute;n (adquisici&oacute;n) <br />
            de</em></strong><strong><em>la informaci&oacute;n</em></strong> </p>   </a>
         
       
     </td>
     
     
        <td width="33%" bgcolor="#FED47A"><a href="#" onclick="mostrarOcultarTablas('evento3');mostrarOcultarTablas('evento4');" title="Haz clic sobre la imagen"><p align="center"><strong><em>2. Almacenamiento <br />
          de la informaci&oacute;n</em></strong></p></a></td>
          
          
        <td width="33%" bgcolor="#FED47A"><a href="#" onclick="mostrarOcultarTablas('evento5');mostrarOcultarTablas('evento6');" title="Haz clic sobre la imagen"><p align="center"><strong><em>3. Evocaci&oacute;n o recuperaci&oacute;n <br />
          de la informaci&oacute;n</em></strong></p></a></td>
      </tr>
      <tr>
        <td><div id="evento1" style="display:none"><p align="center"><img src="Img/UNIDAD 4/pcb_un4img4.jpg" width="237" height="155" /></p></div></td>
        
        <td><div id="evento3" style="display:none"><p align="center"><img src="Img/UNIDAD 4/pcb_un4img5.jpg" width="237" height="169" /></p></div></td>
        
        <td><div id="evento5" style="display:none"><p align="center"><img src="Img/UNIDAD 4/pcb_un4img6.jpg" width="200" height="190" /></p></div></td>
      </tr>
      <tr>
        <td><div id="evento2" style="display:none"><p align="justify"><strong>La codificaci&oacute;n o adquisici&oacute;n</strong> es el proceso en donde se prepara la informaci&oacute;n para que se pueda guardar. La informaci&oacute;n puede codificarse como una imagen, sonidos, experiencias, acontecimientos o ideas significativas. Las circunstancias que rodean este momento resultan fundamentales para el &eacute;xito o fracaso de la memoria. Es importante en este proceso inicial, la atenci&oacute;n, la concentraci&oacute;n y el estado emocional del sujeto.</p></div></td>
        <td><div id="evento4" style="display:none"><p align="justify">Esta etapa se caracteriza por el <strong>ordenamiento, categorizaci&oacute;n o simple titulaci&oacute;n de la informaci&oacute;n </strong>mientras se desarrolla el proceso en curso (proceso perfuncional). Esto requiere tanto como de una metodolog&iacute;a como de estructuras intelectuales que ayuden a la persona a clasificar los datos. Una vez &nbsp;codificada la experiencia y almacenada por cierto tiempo, &eacute;sta se presenta de manera autom&aacute;tica. El almacenamiento es un sistema complejo y din&aacute;mico que cambia con las experiencias a las que el sujeto es expuesto.</p></div></td>
        <td><div id="evento6" style="display:none"><p align="justify">Es el proceso por el cual recuperamos la informaci&oacute;n. Si &eacute;sta ha sido bien almacenada y <strong>clasificada</strong> ser&aacute; m&aacute;s f&aacute;cil <strong>localizarla </strong>y utilizarla en el momento en que se solicita.</p></div></td>
      </tr>
    </table>
    <p align="justify">El sistema de la memoria est&aacute; integrado por tres procesos b&aacute;sicos, para que se despliegue la informaci&oacute;n da clic en el t&iacute;tulo:</p>
    
    <p align="justify">En La figura 1 se muestra un diagrama esquem&aacute;tico de este modelo. El supuesto principal es que la informaci&oacute;n se procesa a trav&eacute;s de una serie de sistemas de memoria discretos, cada uno de los cuales desempe&ntilde;a una funci&oacute;n espec&iacute;fica. Aunque esta concepci&oacute;n se remonta a la distinci&oacute;n que efectu&oacute; William James entre memoria primaria y memoria secundaria.<br />
      </p>
    <p align="justify">En este marco, la <strong>&laquo;memoria sensorial&raquo;</strong> se refiere al procesamiento perceptivo inicial que identifica los est&iacute;mulos que llegan.<br />
      </p>
    <p align="justify">La informaci&oacute;n que se ha procesado en la memoria sensorial pasa despu&eacute;s a la memoria a corto plazo, donde se ve sometida a un procesamiento adicional basado en el significado. Seguidamente, la informaci&oacute;n que se relaciona con las metas personales se almacena de manera indefinida en la memoria a largo plazo, hasta que se vuelva a necesitar (Bruning, 2002).</p>
<h2 align="center"><img src="Img/UNIDAD 4/pcb_un4img7.jpg" width="600" height="450" /></h2><table width="100%" border="0" height="100%">
      <tr>
        <td width="20%"><div align="center"><a href= "ContLPSBC03PBC01_4_1_0.jsp" ><img src="Img/REGRESAR.png" width="99" height="32" /></a></div></td>
        <td class="label_Conceptual"><strong>4.1 MEMORIA</strong></td>
        <td width="20%"><div align="center"><a href= "ContLPSBC03PBC01_4_1_2.jsp" ><img src="Img/AVANZAR.png" width="99" height="32"/></a></div></td>
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
