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
 	<h2><strong>4.1.4 MEMORIA A LARGO PLAZO</strong><br />
 	  </h2>
 	<p align="justify">La memoria a largo plazo (MLP) es el dep&oacute;sito permanente de la informaci&oacute;n que hemos ido acumulando a lo largo de la vida.<br />
 	  </p>
 	<p align="justify">Tambi&eacute;n se hallan codificados en la MLP los recuerdos que nos permiten reconocer a las personas y los objetos familiares, conducir, lavarnos los dientes o escribir una carta en el ordenador.<br />
 	  </p>
 	<p align="justify">La repetici&oacute;n y repaso constantes, cruciales para conservar la informaci&oacute;n en la memoria de trabajo, son menos decisivos en la MLP, sin embargo, el significado y la organizaci&oacute;n son importantes para la MLP. El recuerdo depende de que comprendamos lo que significa la informaci&oacute;n y seamos capaces de encontrarla.<br />
 	  </p>
 	<p align="justify">Este almac&eacute;n hace referencia a lo que com&uacute;nmente se entiende por memoria, la estructura en la que se almacenan recuerdos vividos, conocimiento acerca del mundo, im&aacute;genes, conceptos, estrategias de actuaci&oacute;n, etc.<br />
 	  </p>
 	<p align="justify">Es un almac&eacute;n de capacidad ilimitada (o desconocida) y contiene informaci&oacute;n de distinta naturaleza. Se considera como la &ldquo;base de datos&rdquo; en la que se inserta la informaci&oacute;n a trav&eacute;s de la Memoria Operativa, para poder posteriormente hacer uso de ella.<br />
 	  </p>
 	<p align="justify">A los psic&oacute;logos cognitivos les resulta &uacute;til establecer la diferencia entre los distintos tipos de conocimiento que hay en la memoria. Las clasificaciones que realizan tienen una base l&oacute;gica y neurofisiol&oacute;gica.<br />
 	  </p>
 	<p align="justify">Quiz&aacute; la distinci&oacute;n m&aacute;s b&aacute;sica sea la que se establece entre conocimiento declarativo, conocimiento procedimental y actitudinal. Da clic en la imagen </p>
 	<div align="center"><marquee direction="up" width="500"><img src="Img/UNIDAD 4/pcb_un4img14.jpg" height="355" /></marquee></div>
    <div>
      <div> </div>
    </div>
    <p align="justify">Desde el punto de vista educativo, la distinci&oacute;n entre el conocimiento declarativo y el conocimiento procedimental es importante para describir los tipos de aprendizaje que logran los estudiantes.</p>
    <div align="center"><img src="Img/UNIDAD 4/pcb_un4img15.jpg" width="660" height="495" />
    </div>
    <p align="justify">Los te&oacute;ricos cognitivos han establecido distinciones que resultan &uacute;tiles a los educadores, como el contraste entre conocimiento declarativo y conocimiento procedimental, entre memoria epis&oacute;dica y memoria sem&aacute;ntica y entre representaci&oacute;n verbal&nbsp; y representaci&oacute;n mediante im&aacute;genes.<br />
      </p>
    <p align="justify">En el intento de describir la memoria correctamente, tambi&eacute;n han propuesto la existencia de unidades cognitivas.<br />
      </p>
    <p align="justify">Las m&aacute;s &uacute;tiles son las proposiciones, los conceptos, los esquemas, las producciones y los guiones. Para el modelo global, desde la memoria constituyen bloques constructivos.<br />
      </p>
    <p align="justify">Un concepto relacionado con la MLP es el recuerdo, a continuaci&oacute;n se profundiza en el concepto (da clic en la imagen para ver la informaci&oacute;n).</p>
    <p><strong>Recuerdo</strong></p>
<h2 align="center"><img src="Img/UNIDAD 4/pcb_un4img16.jpg" width="359" height="382" /></h2>
<p>Existen dos formas de traer el recuerdo una de forma libre en la cual el recuerdo no debe llevar un orden. El recuerdo seriado que es el que tiene que llevar un orden y secuencia l&oacute;gica.<br />
  </p>
<p>Dentro de la psicolog&iacute;a existen diferentes tipos de recuerdos como son:</p>



<script> 
function remplazarImgn(id,nueva){
mostrado=0;
elem = document.getElementById(id);
elem.src=nueva;
}

</script>


<table width="50%" align="center" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="40%"><img src="Img/UNIDAD 4/pcb_un4img17_1.jpg" width="224" height="136" id="img1" onmousemove="remplazarImgn('img1','Img/UNIDAD 4/pcb_un4img17_5.jpg')" onmouseout="remplazarImgn('img1','Img/UNIDAD 4/pcb_un4img17_1.jpg')" /></td>
    <td width="60%"><img src="Img/UNIDAD 4/pcb_un4img17_2.jpg" width="226" height="134" id="img2" onmousemove="remplazarImgn('img2','Img/UNIDAD 4/pcb_un4img17_6.jpg')" onmouseout="remplazarImgn('img2','Img/UNIDAD 4/pcb_un4img17_2.jpg')" /></td>
  </tr>
  <tr>
    <td><img src="Img/UNIDAD 4/pcb_un4img17_3.jpg" width="224" height="180" id="img3" onmousemove="remplazarImgn('img3','Img/UNIDAD 4/pcb_un4img17_7.jpg')" onmouseout="remplazarImgn('img3','Img/UNIDAD 4/pcb_un4img17_3.jpg')" /></td>
    <td><img src="Img/UNIDAD 4/pcb_un4img17_4.jpg" width="226" height="180" id="img4" onmousemove="remplazarImgn('img4','Img/UNIDAD 4/pcb_un4img17_8.jpg')" onmouseout="remplazarImgn('img4','Img/UNIDAD 4/pcb_un4img17_4.jpg')" /></td>
  </tr>
</table>
<p align="center">&nbsp;</p>
<p align="justify">Es momento de  reforzar los aprendizajes logrados hasta el momento a gracias a la realizaci&oacute;n  de la actividad complementaria 4.1. Sigue adelante.</p>
<a href="SwfCont/ActComLPSBC03PBC01_4_1.swf" target="_blank"><h2>ACTIVIDAD  COMPLEMENTARIA 4.1</h2>
</a>
<p align="justify">Despu&eacute;s de haber  realizado la actividad complementaria que te ayud&oacute;&nbsp; a repasar los contenidos, te invitamos a que  realices la actividad de aprendizaje correspondiente.</p>

<a href="../../../../ActApart.jsp?unidad=4&amp;apartado=1">
 <h2>ACTIVIDAD DE APRENDIZAJE 4.1<br /></h2></a>
  </p><table width="100%" border="0" height="100%">
      <tr>
        <td width="20%"><div align="center"><a href= "ContLPSBC03PBC01_4_1_3.jsp" ><img src="Img/REGRESAR.png" width="99" height="32" /></a></div></td>
        <td class="label_Conceptual"><strong>4.1 MEMORIA</strong></td>
        <td width="20%"><div align="center"><a href= "ContLPSBC03PBC01_4_2_0.jsp" ><img src="Img/AVANZAR.png" width="99" height="32"/></a></div></td>
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
