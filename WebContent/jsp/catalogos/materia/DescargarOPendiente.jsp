<%-- 
    Document   : index
    Created on : 1/03/2016, 01:26:58 PM
    Author     : UDEM
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/jsp/Master.jsp">
	<jsp:param name="title" value="Validar Liberaci�n" /> 
	<jsp:param name="content">
		<jsp:attribute name="value">
    		<script src="js/materia/DescargarOPendiente.js"></script>		
			<section style="clear: both">

            <form action="DescargarOPendiente" method="post" name="form1" id="form1">
           		<div class="ui-widget" id="message">
					<div class="ui-state-highlight ui-corner-all msg" >
						<p><span class="ui-icon ui-icon-info" style="float: left; margin-right: .3em;"></span>
						<strong id="innerMessage">${message}</strong></p>
					</div>
				</div>
                <div style="text-align: center; margin-bottom: 30px">
					<c:if test="${tieneAutoridad == true}">

	                    <h3>Descargar los documentos O Pendiente</h3>
	                    <div id="dialog"></div>
	                    
	                    <table class="list1 green" style="width:55%25">
	                       <tr>
	                           <th width="30%25" class="right"></th>
	                           <td width="50%25" class="left">
	                               <input type="radio" class="resultado" name="resultado" value="${radioDescargar}" id="resulDescargar" onclick="javascript:funcMostrar()" checked>
	                               <label for="resulDescargar">Descargar los documentos</label>
	                               <input type="radio" class="resultado" name="resultado" value="${radioPendiente}" id="resulPendiente" onclick="javascript:funcMostrar()">
	                               <label for="resulPendiente">Pendiente</label>
	                           </td>
	                       </tr>

	                         <tr class="descargar">
	                            <th width="30%25" class="right">Fecha de Registro</th>
	                            <td width="70%25" class="left">${fechaSolicitud}</td>
	                        </tr>
	                        <tr class="descargar">
	                            <th width="30%25" class="right">Persona de Liberaci�n</th>
	                            <td width="70%25" class="left">
	                            	<input type="text" value="${nombreLiberacion}" size="70" name="nombreLiberacion"/>
	                            	<input type="text" value="${cargoLiberacion}" size="70" name="cargoLiberacion"/>
	                            </td>
	                       </tr>
	                         <tr class="descargar">
	                            <th width="30%25" class="right">Fecha de Ponerse en Producci�n</th>
	                            <td width="70%25" class="left"><input type="text" id="fechaProduccion"/></td>
	                        </tr>
	                         <tr class="descargar">
	                            <th width="30%25" class="right">URL de Producci�n</th>
	                            <td width="70%25" class="left"><input type="text" size="70" name="url" value="${url}"/></td>
	                        </tr>
	                        <tr class="descargar">
	                            <th width="30%25" class="right">Persona de Firma</th>
	                            <td width="70%25" class="left">
	                            	<input type="text" value="${personaFirma}" size="70" name="personaFirma"/>
	                            	<input type="text" value="${cargoFirma}" size="70" name="cargoFirma"/>
	                            </td>
	                       </tr>
	                        <tr class="descargar">
	                           <th width="30%25" class="right">Nota de cambios de informaci�n</th>
	                           <td width="70%25" class="left">
	                                <textarea cols="50" rows="6" id="nota2" name="nota2">${nota2}</textarea>
	                                <input type="button" value="Vista Previa" class="botonimagenchico" onclick="funcPreviewNota2()"/>
	                           </td>
	                       </tr>
	                       <tr class="pendiente" style="display:none">
	                           <th width="30%25" class="right">Nota</th>
	                           <td width="50%25" class="left">
	                                <textarea cols="50" rows="5" id="nota" name="nota">${nota}</textarea>
	                           </td>
	                       </tr>
	                       <tr>
	                           <th width="30%25" class="right" colspan="2">
	                               La materia
	                           </th>
	                       </tr>
	                        <tr>
	                            <th width="30%25" class="right">Clave</th>
	                            <td width="70%25" class="left">${materia.cveMat}</td>
	                        </tr>
	                        <tr>
	                            <th width="30%25" class="right">Materia</th>
	                            <td width="70%25" class="left">${materia.nomMat}</td>
	                        </tr>
	                        <tr>
	                            <th width="30%25" class="right">Nivel</th>
	                            <td width="70%25" class="left">${materia.nomNivel}</td>
	                        </tr>
	                        <tr>
	                            <th width="30%25" class="right">Modulo</th>
	                            <td width="70%25" class="left">${materia.modulo}</td>
	                        </tr>
	                    </table>                   
	 
	                    <div class="bastidor">
	                    	<span id="loading" style="display:none"><img src="images/loading.gif" style="width:30px; hight:30px; vertical-align: middle" /></span>
	                        <input type="button" value="Enviar" class="botonimagenchico" onclick="funcEnviar()"/>
                    		<input type="button" value="Ver Historia" onclick="funcMostrarSolicitarHistoria()" class="botonimagenchico"/>
	                        <input type="button" value="Regresar" class="botonimagenchico" onclick="funcRegreso()" />
	                    </div>

					</c:if>
	
	                </div>

	            	<input type="hidden" id="hiddenCveMat" name="hiddenCveMat" value="${materia.cveMat}"/>
	            	<input type="hidden" id="hiddenTipo" name="hiddenTipo" value=""/>
            </form>
        </section>
		</jsp:attribute>
	</jsp:param>
</jsp:include>
