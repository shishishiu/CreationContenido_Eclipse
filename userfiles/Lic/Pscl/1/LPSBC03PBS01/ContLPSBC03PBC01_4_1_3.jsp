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
 	<h2><strong>4.1.3 MEMORIA A CORTO PLAZO</strong></h2>
    <p align="justify">La memoria a corto plazo es el lugar donde se procesa la informaci&oacute;n para hallar su significado. Se supone que la informaci&oacute;n llega a la memoria a corto plazo despu&eacute;s de haber sido inicialmente procesada por la memoria sensorial. Al igual que &eacute;sta &uacute;ltima, la memoria a corto plazo es limitada en lo que respecta a su capacidad y duraci&oacute;n. <br />
      </p>
    <p align="justify">Los investigadores tambi&eacute;n se han centrado en la manera en que se accede a la informaci&oacute;n desde la memoria a corto plazo. M&aacute;s recientemente se ha puesto en duda el propio concepto de memoria a corto plazo como sistema unitario. Muchos investigadores prefieren denominarla <em>memoria de trabajo.</em><br />
      </p>
    <p align="justify">La primera vez que la memoria a corto plazo recibi&oacute; tratamiento serio como entidad cognitiva fue en el art&iacute;culo de Miller (1956) sonde sosten&iacute;a que, en el sistema de la memoria, el procesamiento de la informaci&oacute;n se halla restringido por un estrecho cuello de botella. En la mayor parte de las circunstancias, no se pueden retener m&aacute;s de siete agrupamientos &laquo;<em>chunks</em>&raquo; (unidades de informaci&oacute;n significativas) al mismo tiempo. </p>
    <p align="justify">Una manera de procesar la informaci&oacute;n con mayor eficacia seg&uacute;n Miller, consiste en aumentar el tama&ntilde;o de los agrupamientos de informaci&oacute;n. </p>
    <p align="justify">Por ejemplo aunque el n&uacute;mero 4727211 carezca de significado para el lector y, por tanto lo recuerde como siete agrupamientos de informaci&oacute;n, para nosotros es el n&uacute;mero principal de la centralita de la universidad y lo recordamos como tres agrupamientos 472, 72, 11. La parte del cap&iacute;tulo de Miller que m&aacute;s induce a la reflexi&oacute;n es que la memoria a corto plazo &uacute;nicamente es sensible al n&uacute;mero de agrupamientos, no a su tama&ntilde;o. En consecuencia, se pueden retener en la memoria grandes cantidades de informaci&oacute;n y, por tanto, mejorar su procesamiento de modo espectacular simplemente agrupando la informaci&oacute;n en unidades de significado cada vez m&aacute;s grandes.<br />
      </p>
    <p align="justify">Otro aspecto importante de la memoria a corto plazo es la duraci&oacute;n de la informaci&oacute;n. Los primeros estudios de Peterson y Peterson, demostraron que, en la memoria a corto plazo, la informaci&oacute;n se olvida con mucha rapidez.<br />
      </p>
    <p align="justify">Si no se realiza ning&uacute;n esfuerzo para almacenar informaci&oacute;n presenteen la mente (por ejemplo, repitiendo la informaci&oacute;n), esta informaci&oacute;n desaparecer&aacute; muy r&aacute;pidamente y se olvidar&aacute; en un minuto.<br />
      </p>
    <p align="justify">Tradicionalmente, la memoria de corto plazo fue simplemente considerada un &aacute;rea de almacenamiento pasiva y temporal para la informaci&oacute;n que se transferir&aacute; al &aacute;rea de la memoria de largo plazo.<br />
      </p>
    <p align="justify">La memoria de trabajo es un concepto m&aacute;s reciente que surge de la mejor comprensi&oacute;n de la memoria de corto plazo.<br />
      </p>
    <p align="justify">Los estudios que demuestran que el almacenamiento temporal de informaci&oacute;n no es necesariamente una funci&oacute;n pasiva han llevado al concepto de la memoria de trabajo. Adem&aacute;s de almacenar informaci&oacute;n de forma temporal, la memoria de trabajo es capaz de procesar los datos que ha almacenado. Por ejemplo, la memoria de trabajo no s&oacute;lo nos permite recordar un n&uacute;mero telef&oacute;nico, sino que tambi&eacute;n nos deja repetir el n&uacute;mero en sentido inverso. Por lo tanto, la memoria de trabajo no es simplemente un lugar de almacenamiento temporal, sino que es tambi&eacute;n un &aacute;rea que podemos utilizar para interactuar con la informaci&oacute;n all&iacute; almacenada.<strong></strong><br />
      </p>
    <p align="justify">Un proceso relacionado con la memoria a corto plazo es <strong>el olvido</strong>; al principio se atribu&iacute;a el olvido en la memoria a corto plazo al desvanecimiento; es decir, a que la informaci&oacute;n se perd&iacute;a con el paso del tiempo. Estudios posteriores revelaron que el olvido procede en mayo medida de la interferencia causada por otra informaci&oacute;n que del paso del tiempo.</p>
    <table width="688" border="0" align="center">
      <tr>
        <td width="132" align="right"><img src="Img/UNIDAD 4/Intentodegif.gif" alt="" width="157" height="144" /></td>
        <td width="546"><table width="100%" border="0" cellspacing="10" cellpadding="10">
          <tr>
            <td><p align="justify"><strong>I</strong><strong>dea Relevante</strong></p>
              <p align="justify">Por ejemplo: Waught y Norman, modificaron la cantidad de informaci&oacute;n que interven&iacute;a en un intervalo fijo despu&eacute;s de estudiar cada lista. Sus resultados confirmaron que<strong> la cantidad de informaci&oacute;n que interviene aumenta el olvido, </strong>con independencia del tiempo. Estos resultados y otros similares llevaron a los investigadores a la conclusi&oacute;n de que el olvido deriva de la interferencia, no del desvanecimiento relacionado con el tiempo.</p></td>
          </tr>
        </table></td>
      </tr>
    </table>
    <div align="center">
      <p align="justify">En conjunto, muchos estudios realizados indicaban que la capacidad de la memoria a corto plazo se limitaba aproximadamente a siete agrupaciones, como Miller hab&iacute;a predicho. La informaci&oacute;n se olvida con mucha rapidez, sobre todo cuando va seguida de nueva informaci&oacute;n en el ciclo de procesamiento. As&iacute;, aunque hay datos que indican que la informaci&oacute;n se desvanece en la memoria a corto plazo, hay pruebas s&oacute;lidas que apoyan la idea de que el olvido generalmente deriva de la interferencia y de la sobrecarga de capacidad.<br />
      </p>
      <p align="justify">Cuando hablamos de memoria sensorial y memoria de trabajo, solemos examinar hechos recientemente experimentados o presentes en la conciencia.<br />
        </p>
      <p align="justify">En cambio en la memoria a largo plazo (MLP) intervienen las huellas de la memoria que se han desarrollado durante periodo de d&iacute;as, semanas, meses y a&ntilde;os, a continuaci&oacute;n lo abordaremos.<br />
  <br />
</p>
  </div>
<div align="center">
</div><table width="100%" border="0" height="100%">
      <tr>
        <td width="20%"><div align="center"><a href= "ContLPSBC03PBC01_4_1_2.jsp" ><img src="Img/REGRESAR.png" width="99" height="32" /></a></div></td>
        <td class="label_Conceptual"><strong>4.1 MEMORIA</strong></td>
        <td width="20%"><div align="center"><a href= "ContLPSBC03PBC01_4_1_4.jsp" ><img src="Img/AVANZAR.png" width="99" height="32"/></a></div></td>
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
