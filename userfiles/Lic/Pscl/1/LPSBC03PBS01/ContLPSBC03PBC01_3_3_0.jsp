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
 	<h1 align="center"><strong>3.3 LENGUAJE COMO CONJUNTO DE OPERACIONES</strong>    </h1>
 	<h2><strong>&iquest;Primero est&aacute; el lenguaje o el pensamiento?</strong><strong> </strong><br />
 	  </h2>
    <p align="justify">Para dar respuesta a la pregunta, primero debemos analizar: si para el pol&eacute;mico Noam Chomsky, el idioma es una especie de computadora que funciona de manera autom&aacute;tica, como los procesos de asociaci&oacute;n antes de pensar, entonces habr&iacute;a que suponer que el lenguaje est&aacute; primero. La &quot;teor&iacute;a reguladora&quot; explica que la acci&oacute;n y el pensamiento dependen de la capacidad ling&uuml;&iacute;stica de la persona, en tanto el psic&oacute;logo suizo Jean Piaget, cuya teor&iacute;as cognitivas son ampliamente conocidas, sostiene que el lenguaje es, en gran medida, el producto del desarrollo de la acci&oacute;n y el pensamiento, ya que tanto la palabra como la idea son im&aacute;genes observadas y no a la inversa. Empero, no faltan quienes aseveran que durante el desarrollo intelectual del individuo hay una interrelaci&oacute;n dial&eacute;ctica entre el lenguaje y el pensamiento. De modo que responder a la pregunta si primero est&aacute; el lenguaje o el pensamiento, es lo mismo que responder a la pregunta si primero est&aacute; el huevo o la gallina.<br />
    </p>
    <p align="justify">De cualquier modo, las tres teor&iacute;as fundamentales que responden a la pregunta de si primero est&aacute; el lenguaje o el pensamiento se pueden sintetizar as&iacute;:    </p>
    <div align="center">
      <table width="90%" border="2" cellspacing="0" cellpadding="20">
        <tr>
          <td width="33%" bgcolor="#FED47A"><p align="center">&nbsp;</p>
            <a href="#" onclick="mostrarOcultarTablas('evento1');" title="Haz clic sobre el texto"><p align="center" ><strong>LA TEOR&Iacute;A DE: &quot;EL LENGUAJE EST&Aacute; ANTES</strong><strong> QUE<br />
              EL PENSAMIENTO</strong>&quot;</p></a>
            <div>
              <div> </div>
              </div></td>
          <td width="33%" bgcolor="#FED47A"><a href="#" onclick="mostrarOcultarTablas('evento2');" title="Haz clic sobre el texto"><p align="center"><strong>LA TEOR&Iacute;A DE:<br />&quot;EL PENSAMIENTO EST&Aacute;<br /> 
            ANTES QUE EL LENGUAJE</strong>&quot;</p></a></td>
            
          <td width="33%" bgcolor="#FED47A"><a href="#" onclick="mostrarOcultarTablas('evento3');" title="Haz clic sobre el texto"><p align="center"><strong>LA &quot;TEOR&Iacute;A SIMULT&Aacute;NEA&quot;</strong></p></a></td>
          </tr>
        <tr>
          <td><div id="evento1" style="display:none"><p align="center">Plantea que el idioma influye o determina la capacidad mental (pensamiento). En esta corriente ling&uuml;&iacute;stica incid5 la &quot;gram&aacute;tica generativa&quot; de Noam Chomsky, para quien existe un mecanismo idiom&aacute;tico innato, que hace suponer que el pensamiento se desarrolla como consecuencia del desarrollo idiom&aacute;tico. Por lo tanto, si se considera que el lenguaje es un estado interior del cerebro del hablante, independiente de otros elementos adquiridos del entorno social, entonces es f&aacute;cil suponer que primero est&aacute; el lenguaje y despu&eacute;s el pensamiento; m&aacute;s todav&iacute;a, si se parte del criterio de que el lenguaje acelera nuestra actividad te&oacute;rica, intelectual y nuestras funciones ps&iacute;quicas superiores (percepci&oacute;n, memoria, pensamiento, etc).            </p></div></td>
          <td><div id="evento2" style="display:none"><p align="center">Sostiene que la capacidad de pensar influye en el idioma. No en vano Ren&eacute; Descartes acu&ntilde;&oacute; la frase: &quot;primero pienso, luego existo&quot;. Asimismo, muchas actitudes cotidianas se expresan con la frase: &quot;tengo dificultad de decir lo que pienso&quot;. Algunos psicoling&uuml;istas sostienen que el lenguaje se desarrolla a partir del pensamiento, por cuanto no es casual que se diga: &quot;Una psiquis debidamente desarrollada da un idioma efectivo&quot;. En esta corriente ling&uuml;&iacute;stica esta la llamada &quot;The cognition hypothesis&quot; (La hip&oacute;tesis cognitiva), cuya teor&iacute;a se resume en el concepto de que el &quot;pensamiento est&aacute; antes que el lenguaje&quot;. Pero quiz&aacute;s uno de sus mayores representantes sea Jean Piaget, para quien el pensamiento se produce de la acci&oacute;n, y que el lenguaje es una m&aacute;s de las formas de liberar el pensamiento de la acci&oacute;n. &quot;Piaget indica que el grado de asimilaci&oacute;n del lenguaje por parte del ni&ntilde;o, y tambi&eacute;n el grado de significaci&oacute;n y utilidad que reporte el lenguaje a su actividad mental depende hasta cierto punto de las acciones mentales que desempe&ntilde;e; es decir, que depende de que el ni&ntilde;o piense con preconceptos, operaciones concretas u operaciones formales. (Richmond, P., 1981, p&aacute;g. 139).</p></div></td>
          <td><div id="evento3" style="display:none"><p align="center">Define que tanto el lenguaje como el pensamiento est&aacute;n ligados entre s&iacute;. Esta teor&iacute;a fue dada a conocer ampliamente por el psic&oacute;logo ruso L.S. Vigotsky (autor de la teor&iacute;a sociocultural para explicar el desarrollo del lenguaje), quien explicaba que el pensamiento y el lenguaje se desarrollaban en una interrelaci&oacute;n dial&eacute;ctica, aunque considera que las estructuras del habla se convierten en estructuras b&aacute;sicas del pensamiento, as&iacute; como la conciencia del individuo es primordialmente ling&uuml;&iacute;stica, debido al significado que tiene el lenguaje o la actividad ling&uuml;&iacute;stica en la realizaci&oacute;n de las funciones ps&iacute;quicas superiores del hombre. Asimismo, &quot;El lenguaje est&aacute; particularmente ligado al pensamiento. Sin embargo, entre ellos no hay una relaci&oacute;n de paralelismo, como frecuentemente consideran los l&oacute;gicos y ling&uuml;istas tratando de encontrar en el pensamiento equivalentes exactos a las unidades ling&uuml;&iacute;sticas y viceversa; al contrario, el pensamiento es ling&uuml;&iacute;stico por su naturaleza, el lenguaje es el instrumento del pensamiento. Lazos no menos fuertes ligan al lenguaje con la memoria. La verdadera memoria humana (intermediadora) m&aacute;s frecuentemente se apoya en el lenguaje que en otras formas de intermediaci&oacute;n. En igual medida se realiza la percepci&oacute;n con la ayuda de la actividad ling&uuml;&iacute;stica&quot; (Petrovski, A. 1980,, p&aacute;g. 205). </p></div></td>
          </tr>
      </table>
    </div>
    <p align="justify">As&iacute; pues, las diversas teor&iacute;as que pretenden explicar el origen del lenguaje, las funciones del pensamiento y sus operaciones concretas, son motivos de controversias entre los estudiosos de estas ramas del conocimiento humano. Empero, cualquier esfuerzo por echar nuevas luces sobre este tema, tan fascinante como explicarse los misterios del universo, es siempre un buen pretexto para volver a estudiar las ciencias que conciernen al lenguaje y el pensamiento de todo ser dotado de capacidad racional y sentido l&oacute;gico (Montoya, V., 2001).</p>
    <p align="justify">Es momento de  realizar la actividad de aprendizaje 3.3. Mucho &eacute;xito.</p>
<a href="../../../../ActApart.jsp?unidad=3&amp;apartado=3">
 <h2>ACTIVIDAD DE APRENDIZAJE 3.3<br /></h2></a>
  </p><table width="100%" border="0" height="100%">
      <tr>
        <td width="20%"><div align="center"><a href= "ContLPSBC03PBC01_3_2_1.jsp" ><img src="Img/REGRESAR.png" width="99" height="32" /></a></div></td>
        <td class="label_Conceptual"><p><strong>3.3 LENGUAJE COMO CONJUNTO DE OPERACIONES</strong></p></td>
        <td width="20%"><div align="center"><a href= "ContLPSBC03PBC01_3_4_0.jsp" ><img src="Img/AVANZAR.png" width="99" height="32"/></a></div></td>
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
