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
 	<h2><strong>2.3.3 CONDICIONAMIENTO OPERANTE O INSTRUMENTAL&nbsp;</strong></h2>
<div align="center">
  <table width="70%" align="center" border="0" cellspacing="0" cellpadding="15">
    <tr>
      <td width="115" align="right"><img src="Img/UNIDAD 2/Intentodegif.gif" width="157" height="144" /></td>
      <td width="407"><p align="justify"><strong>I</strong><strong>dea Relevante</strong></p>
        <p align="justify">Mientras el <strong>condicionamiento cl&aacute;sico</strong> se refiere a las conductas que son producidas por un est&iacute;mulo autom&aacute;ticamente, como la salivaci&oacute;n en presencia de comida, el <strong>condicionamiento operante</strong> se refiere al comportamiento que el organismo emite porque se le ha ense&ntilde;ado que haci&eacute;ndolo (operando en el ambiente) obtendr&aacute; una recompensa o evitar&aacute; el castigo. La recompensa viene despu&eacute;s del comportamiento.</p></td>
    </tr>
  </table>
</div>
<p><strong>Thorndike y la Ley del efecto</strong>
</p>
<p align="center"><img src="Img/UNIDAD 2/pcb_un2img35.jpg" width="198" height="254" /></p>
<p align="justify">Los experimentos de Thorndike, a comienzos de siglo, consist&iacute;an en encerrar gatos en una complicada caja-problema. El gato pod&iacute;a ver y oler la comida pero no pod&iacute;a conseguirla hasta que no aprendiese la forma de salir de la caja, que era apretando una palanca.&nbsp; Inicialmente los gatos operaban por ensayo-error, pero al tocar repetidamente la palanca que pod&iacute;a abrir la puerta donde estaba el alimento, aprend&iacute;an la conexi&oacute;n y mejoraban su actuaci&oacute;n en t&eacute;rminos de conseguir el alimento. </p>
<p align="justify">Thorndike denomin&oacute; Ley del Efecto,&nbsp; el fen&oacute;meno por el cual el animal aprend&iacute;a que tirar de la cuerda o apretar una palanca determinada se acompa&ntilde;aba de una recompensa.&nbsp; Es decir, cuando las acciones del animal en cualquier situaci&oacute;n dada son seguidas de una experiencia satisfactoria, el animal relaciona tal ejecuci&oacute;n con la satisfacci&oacute;n obtenida, y estar&aacute; m&aacute;s propenso a hacer lo mismo. Dedujo que los actos son eliminados o fijados en funci&oacute;n de sus consecuencias: los que conducen a un estado de cosas satisfactorio son aprendidos, mientras los que llevan a un&nbsp; estado de insatisfacci&oacute;n, son eliminados. Por tanto, el aprendizaje supone la gradual eliminaci&oacute;n de ciertas respuestas y la gradual adquisici&oacute;n de otras.</p>
<p align="center"><img src="Img/UNIDAD 2/pcb_un2img36.jpg" width="312" height="225" /></p>
<p>&nbsp;</p>
<p>El  siguiente video muestra los experimentos realizados por &eacute;ste excelente  cient&iacute;fico:</p>
<p><em><a href="http://youtu.be/jehHs2rhmvk" target="_blank"><strong>Thorndike  - Law of Effect.</strong></a></em> (s/f). Recuperado con fines did&aacute;cticos el 6 de Marzo de  2015, de: https://www.youtube.com/watch?v=Vk6H7Ukp6To&amp;NR=1<br />
  </p>
<p><strong>Para revisar el material indicado da clic en el siguiente enlace o bien, revisa la secci&oacute;n de Descargables en la plataforma.</strong></p>
<p>&nbsp;</p>
<p><br />
</p>
<p>&nbsp;</p>
<p><strong>S</strong><strong>kinner <br />
</strong></p>
<p align="center"><img src="Img/UNIDAD 2/pcb_un2img37.jpg" width="319" height="316" /></p>
<p align="justify">Es el m&aacute;s riguroso y sistem&aacute;tico de los investigadores de esta l&iacute;nea.&nbsp; El distingue entre condicionamiento cl&aacute;sico (o respondiente) y condicionamiento operante o instrumental. El plantea que ambos condicionamientos plantean una diferente relaci&oacute;n E.R. y diferentes procedimientos de control.<strong></strong><br />
</p>
<p align="justify">Est&aacute; de acuerdo en que las consecuencias inmediatas de cualquier conducta, aumentan, disminuyen o mantienen constante la probabilidad de que dicha persona vuelva a realizar esa conducta. Las diferencias que observa entre CC y CO (operante) pueden sintetizarse de la sigue forma:</p>
<div>
  <div></div>
</div>
<div>
  <div>
    <p align="center"><img src="Img/UNIDAD 2/pcb_un2img38.jpg" width="720" height="540" /></p>
    <p>&nbsp;</p>
    <p align="center"><strong>Cuadro 1. Diferencias entre el C. Cl&aacute;sico y C. Operante</strong>    </p>
  </div>
  <div>
    <div align="center">
      <table width="75%" border="2" cellspacing="0" cellpadding="10">
        <tr>
          <td bgcolor="#fed47a" width="26%"><p align="center"><strong>ASPECTO</strong></p></td>
          <td bgcolor="#fed47a" width="32%"><p align="center"><strong>C. CLASICO</strong></p></td>
          <td width="42%" bgcolor="#fed47a"><p align="center"><strong>C. OPERANTE</strong></p></td>
          </tr>
        <tr>
          <td><p align="center">Relaci&oacute;n que se logra</p></td>
          <td><p align="center">Est&iacute;mulo&nbsp;&nbsp;&nbsp;&nbsp; Respuesta</p>
            <p align="center">(Cond.)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (Cond.)</p></td>
          <td><p align="center">Resp/ Est&iacute;m./Consecuencia </p></td>
          </tr>
        <tr>
          <td><p align="center">Origen de la respuesta</p></td>
          <td><p align="center">El est&iacute;mulo (reflejo)</p></td>
          <td><p align="center">Organismo, respuesta activa</p></td>
          </tr>
        <tr>
          <td><p align="center">Sistema nervioso</p></td>
          <td><p align="center">Aut&oacute;nomo</p></td>
          <td><p align="center">Central</p></td>
          </tr>
        <tr>
          <td><p align="center">Respuestas</p></td>
          <td><p align="center">Viscerales</p></td>
          <td><p align="center">Esquel&eacute;ticas</p></td>
          </tr>
        <tr>
          <td><p align="center">Asociaci&oacute;n</p></td>
          <td><p align="center">E&nbsp;&nbsp; - &nbsp;&nbsp;E</p></td>
          <td><p align="center">R&nbsp;&nbsp;&nbsp; -&nbsp;&nbsp;&nbsp; E</p></td>
          </tr>
        <tr>
          <td><p align="center">Refuerzo</p></td>
          <td><p align="center">E.I. pr&oacute;ximo a E.C.</p></td>
          <td><p align="center">Presentaci&oacute;n o eliminaci&oacute;n <br />
            de consecuencias </p></td>
          </tr>
        <tr>
          <td><p align="center">Leyes</p></td>
          <td><p align="center">Contig&uuml;idad</p></td>
          <td><p align="center">Efecto</p></td>
          </tr>
      </table>
    </div>
  </div>
</div>
<p>El siguiente video te permitir&aacute; profundizar en ambos tipos de condicionamiento:</p>
<div>
  <div>
    <p>Saieed Hasnoo. (2011).&nbsp;<a href="http://youtu.be/xWPj4i1udrw" target="_blank"> <em><strong>BF Skinner's Operant Conditioning  Chamber.</strong></em> </a>Recuperado con  fines did&aacute;cticos el 6 de Marzo de 2015, de: http://www.youtube.com/watch?v=SUwCgFSb6Nk&amp;feature=related    </p>
    <p><strong>Para revisar el material indicado da clic en el siguiente enlace o bien, revisa la secci&oacute;n de Descargables en la plataforma.</strong></p>
    <p align="justify">La conducta que est&aacute; influida por el reforzamiento se llama operante.&nbsp; Skinner dise&ntilde;&oacute; una caja est&aacute;ndar, conocida como la caja de Skinner, que consiste en una jaula equipada con un mecanismo simple que el mismo animal pod&iacute;a activar para conseguir su recompensa.<br />
  </p>
    <p align="justify">El siguiente gr&aacute;fico muestra el <em>programa est&aacute;ndar para el estudio del condicionamiento operante:</em></p>
    <div>
      <div>
        <p align="center"><img src="Img/UNIDAD 2/pcb_un2img39.jpg" width="540" height="625" /></p>
        <p align="center">&nbsp;</p>
        <p align="center"><img src="Img/UNIDAD 2/pcb_un2img39_1.jpg" alt="" width="600" height="200" /></p>
        <p align="justify">Los reforzadores a su vez pueden ser:</p>
        <div align="justify">
          <ol>
            <li><em>Primarios:&nbsp; </em>importantes biol&oacute;gicamente, p/ej, agua, comida.<br />
              <br />
            </li>
            <li><em>Secundarios: </em>son aprendidos y llegan a ser reforzantes por su asociaci&oacute;n con reforzadores primarios, p/ej, dinero, calificaciones escolares. </li>
            </ol>
          <p>Para que el refuerzo sea efectivo, debe ser inmediato, si se administra mucho despu&eacute;s de la conducta, no habr&aacute; aprendizaje.</p>
        </div>
<p align="justify">Existen diversos programas de reforzamiento de conducta, la tabla muestra sus principales caracter&iacute;sticas:</p>
<p align="center">&nbsp;</p>
        <p align="center"><strong>Tabla 2. Programas de reforzamiento de conducta</strong></p>
        <div align="center">
          <table width="75%" border="2" cellspacing="0" cellpadding="10">
            <tr>
              <td width="48%"><p align="justify"><strong>a) Programa de reforzamiento parcial</strong></p></td>
              <td width="52%"><p align="justify">Tambi&eacute;n se conoce como &quot;<em>refuerzo intermitente&quot;, </em>se demora m&aacute;s en aprender pero es m&aacute;s duradero (Ej. m&aacute;quinas tragamonedas)</p></td>
              </tr>
            <tr>
              <td bgcolor="#fed47a"><p align="justify"><strong>b) Programa de reforzamiento continuo</strong></p></td>
              <td bgcolor="#fed47a"><p align="justify">El animal aprende m&aacute;s r&aacute;pidamente pero es menos duradero, ya que cuando deja de recibir recompensa, deja de responder.&nbsp;</p></td>
              </tr>
          </table>
        </div>
        <p>&nbsp;</p>
        <p><strong>Conceptos importantes del Condicionamiento Operante (Da clic en la imagen para visualizar el contenido):</strong></p>
        <div>
          <div> </div>
        </div>
        <div align="center">
          <table width="95%" border="2" cellspacing="0" cellpadding="10">
            <tr>
              <td width="29%"><p align="center"><a href="#" onclick="mostrarOcultarTablas('evento1');mostrarOcultarTablas('evento2');" title="Haz clic sobre la imagen"><img src="Img/UNIDAD 2/pcb_un2img40.jpg" width="192" height="138" /></a></p></td>
              <td width="21%"><div id="evento1" style="display:none"><p align="center"><strong>a) Generalizaci&oacute;n de Est&iacute;mulo</strong></p></div></td>
              <td width="50%"><div id="evento2" style="display:none"><p align="justify">Fen&oacute;meno por el cual un animal o persona ha aprendido a responder a un est&iacute;mulo y aplica lo aprendido a otro est&iacute;mulo similar.&nbsp; Por ejemplo, paloma que picotea una tarjeta roja tambi&eacute;n aprende a picotear la tarjeta verde.&nbsp; Si no estuvi&eacute;semos capacitados para generalizar el aprendizaje de un est&iacute;mulo a otro, ser&iacute;a muy dif&iacute;cil desenvolverse en la vida, p/ej, aprender a conducir de nuevo cada vez que estamos en otro auto.</p></div></td>
              </tr>
            <tr>
              <td><p align="center"><a href="#" onclick="mostrarOcultarTablas('evento3');mostrarOcultarTablas('evento4');" title="Haz clic sobre la imagen"><img src="Img/UNIDAD 2/pcb_un2img41.jpg" width="192" height="240" /></a></p></td>
              <td><div id="evento3" style="display:none"><p align="center"><strong>b) Extinci&oacute;n</strong></p></div></td>
              <td><div id="evento4" style="display:none"><p align="justify">La rapidez para que se extinga una respuesta depende del tipo de programa de reforzamiento, por lo tanto, conductas reforzadas continuamente, se extinguen m&aacute;s f&aacute;cilmente que las reforzadas intermitentemente, y de &eacute;stas, las que fueron reforzadas mediante un programa fijo, se extinguen m&aacute;s f&aacute;cilmente que las con programa variable.</p></div></td>
              </tr>
            <tr>
              <td><p align="center"><a href="#" onclick="mostrarOcultarTablas('evento5');mostrarOcultarTablas('evento6');" title="Haz clic sobre la imagen"><img src="Img/UNIDAD 2/pcb_un2img42.jpg" width="192" height="192" /></a></p></td>
              <td><div id="evento5" style="display:none"><p align="center"><strong>c) Castigo</strong></p></div></td>
              <td><div id="evento6" style="display:none"><p align="justify">Suceso que cuando es administrado inmediatamente despu&eacute;s de una respuesta, disminuye la probabilidad de que esta respuesta ocurra de nuevo, p/ej, un ni&ntilde;o recibe una palmada por cruzar la calle corriendo sin mirar.<br />
                </p>
                <p align="justify">El castigo es diferente del reforzamiento negativo, ya que el castigo es administrado con el prop&oacute;sito expreso de disminuir una conducta.&nbsp; No siempre el castigo es tan efectivo, p/ej, los ladrones que han ido a la c&aacute;rcel por sus delitos muchas veces vuelven a robar cuando salen.&nbsp; Para que un castigo sea efectivo, es necesario que existan dos factores:</p>
                <p align="justify"><em>Constancia: </em>los castigos irregulares prolongan la conducta indeseada.</p>
                <p align="justify"><em>Contingencia temporal: es</em> mejor pronto que tarde, cuanto m&aacute;s peque&ntilde;o sea el intervalo de tiempo entre un comportamiento dado y su castigo, m&aacute;s efectivo ser&aacute; este.</p>
                <p align="justify">El castigo siempre es menos deseable que el refuerzo.&nbsp; No se aprende ninguna respuesta nueva y aceptable mediante el castigo, no ense&ntilde;a a la gente lo que ha de hacer, les indica s&oacute;lo lo que no deber&aacute; hacer</p>
                <p align="justify">Como modo de aprender de acuerdo a esta teor&iacute;a, el refuerzo negativo, o retiro del refuerzo positivo, tiene m&aacute;s efecto que el castigo.              </p>              <p align="center">&nbsp;</p></div></td>
              </tr>
          </table>
        </div>
        <p align="justify">Si  deseas profundizar en el tema te invito a que revises la siguiente presentaci&oacute;n  interactiva <em>sobre El proceso de ense&ntilde;anza  aprendizaje </em>(Bustos, F., 2010). <a href="http://prezi.com/eodwyim7k9cz/proceso-de-ensenanza-aprendizaje/" target="_blank"><strong>Da clic aqu&iacute;.</strong></a></p>
        <p>Te invitamos a  resolver la actividad de aprendizaje 2.3, la cual forma parte de tu  calificaci&oacute;n. Mucho &eacute;xito.</p>
<div>
  <div></div>
      </div>
      </div>
    </div>
  </div>
</div>
<a href="../../../../ActApart.jsp?unidad=2&amp;apartado=3">
 <h2>ACTIVIDAD DE APRENDIZAJE 2.3<br /></h2></a>
  </p><div>
</div><table width="100%" border="0" height="100%">
      <tr>
        <td width="20%"><div align="center"><a href= "ContLPSBC03PBC01_2_3_2.jsp" ><img src="Img/REGRESAR.png" width="99" height="32" /></a></div></td>
        <td class="label_Conceptual"><p><strong>2.3 APRENDIZAJE</strong></p></td>
        <td width="20%"><div align="center"><a href= "ContLPSBC03PBC01_2_4_0.jsp" ><img src="Img/AVANZAR.png" width="99" height="32"/></a></div></td>
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
