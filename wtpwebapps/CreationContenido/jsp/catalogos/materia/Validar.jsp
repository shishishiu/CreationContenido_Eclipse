<%-- 
    Document   : index
    Created on : 1/03/2016, 01:26:58 PM
    Author     : UDEM
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/jsp/Master.jsp">
	<jsp:param name="title" value="Validar Revisi�n" /> 
	<jsp:param name="content">
		<jsp:attribute name="value">
    		<script src="js/materia/Validar.js"></script>		
			<section style="clear: both">

            <form action="Validar" method="post" name="form1" id="form1">
           		<div class="ui-widget" id="message">
					<div class="ui-state-highlight ui-corner-all msg" >
						<p><span class="ui-icon ui-icon-info" style="float: left; margin-right: .3em;"></span>
						<strong id="innerMessage">${message}</strong></p>
					</div>
				</div>
                <div style="text-align: center; margin-bottom: 30px">
					<c:if test="${tieneAutoridad == true}">

	                    <h3>Resultado de Validaci�n</h3>
	                    <div id="dialog"></div>
	                    
	                    <table class="list1 green" style="width:50%25">
	                         <tr>
	                            <th width="30%25" class="right">Fecha de Validar</th>
	                            <td width="70%25" class="left">${fechaSolicitud}</td>
	                        </tr>
	                        <tr>
	                            <th width="30%25" class="right">Persona de Validar</th>
	                            <td width="70%25" class="left">${usuario.cveUsu} ${usuario.nomUsu}</td>
	                       </tr>
	                        <tr>
	                           <th width="30%25" class="right">Resultado</th>
	                           <td width="50%25" class="left">
	                               <input type="radio" class="resultado" name="resultado" value="${radioValidado}" id="resulValidado"><label for="resulValidado">Validado</label>
	                               <input type="radio" class="resultado" name="resultado" value="${radioSolicitado}" id="resulSolicitado"><label for="resulSolicitado">Solicitado</label>
	                               <input type="radio" class="resultado" name="resultado" value="${radioPendiente}" id="resulPend"><label for="resulPend">Pendiente</label>
	                           </td>
	                       </tr>
	                        <tr>
	                           <th width="30%25" class="right">Nota</th>
	                           <td width="70%25" class="left">
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
	                        <input type="button" value="Validar" class="botonimagenchico" onclick="funcValidar()"/>
                    		<input type="button" value="Ver Historia" onclick="funcMostrarSolicitarHistoria()" class="botonimagenchico"/>
	                        <input type="button" value="Regresar" class="botonimagenchico" onclick="funcRegreso()" />
	                    </div>

					</c:if>
	
	                </div>

	            	<input type="hidden" id="hiddenCveMat" name="hiddenCveMat" value="${materia.cveMat}"/>
	            	<input type="hidden" id="hiddenTipo" name="hiddenTipo" value=""/>
	            	<input type="hidden" id="hiddenFlgOpenWindow" name="hiddenFlgOpenWindow" value="${flgOpenWindow}"/>
	            	<input type="hidden" id="hiddenUrl" name="hiddenUrl" value="${urlPrueba}"/>
            </form>
        </section>
		</jsp:attribute>
	</jsp:param>
</jsp:include>
