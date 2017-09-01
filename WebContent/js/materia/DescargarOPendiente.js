$(function() {
	iniciaMessageDialog();
	funcResizeMain();

	$('#fechaProduccion').datepicker();

	
});

$("textarea").resizable({
    resize: function() {
    	funcResizeMain();
    }
});

function funcRegreso(){
    location.href = "BusMat"
}

function funcMostrar(){
	
	$(".descargar").toggle();
	$(".pendiente").toggle();
	
}

function funcEnviar(){
	$("#innerMessage").html("");
	$("#message").hide();

	var resultados = document.getElementsByName("resultado");
	var resultado;
	var flag = false;
	if(resultados.length) {
		var i;
		for(i = 0; i < resultados.length; i ++){

			if(resultados[i].checked){
				flag = true;
				resultado = resultados[i].value;
				break;
			}
		}
	}

	if(!flag){
		alert("Elige Descargar o Pendiente, pof favor");
		resultados[0].focus();
		return false;
	}
	var cveMat = document.getElementById("hiddenCveMat").value;

	if(resultado==9){
		funcImprimir();
	}else{
		funcPendiente();
	}
	
}

function funcPendiente(){
	$.ajax({
		  method: "POST",
		  url: "DescargarOPendiente",
		  data: { hiddenCveMat: cveMat,
			  	  hiddenTipo: 	1,
			  	  nota2:document.getElementById("nota2").value,
			  	  resultado:resultado
			  	},
		  async: true,
		  headers: {"HTTP_X_REQUESTED_WITH": "xmlhttprequest"},
		  beforeSend:function( xhr ) {
		    	$(".botonimagenchico").prop("disabled", true);
		    	$("#loading").show();
	  		},
		  success: function(data){
			  if(data['status'] == "error"){
				  if(data['message'].length > 0){
						$("#innerMessage").html(data['message']);
						$("#message").show();
				  }
	
			  }else if(data['status'] == "success"){
				  
				  if(data['message'].length > 0){
						$("#innerMessage").html(data['message']);
						$("#message").show();
				  }
				  
				  
			  }else if(data['status'] == "noAutorizado"){
				 location.href = "AutentificaError";
			  }

		  },
		  error : function(xhr, ajaxOptions, thrownError) {
			  alert("Error. No pudo continuar.");
		  },
		  complete: function(xhr){
		    	$(".botonimagenchico").prop("disabled", false);
		    	$("#loading").hide();
		  }
	})
	
}

function funcImprimir(){
	document.getElementById("hiddenTipo").value = 1;
	document.forms["form1"].action = "DescargarOPendiente";
    document.forms["form1"].submit();
}

function funcPreviewNota2(){
	var nota = document.getElementById("nota2").value;
	PreviewNota(4, nota);
}
function PreviewNota(tipo, nota){

	document.getElementById("hiddenTipo").value = tipo;
	document.forms["form1"].action = "DescargarOPendiente";
    document.forms["form1"].submit();

}
