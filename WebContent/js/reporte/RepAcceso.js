/**
 * Inicio
 */
$(function(){
	var focusElem = document.getElementById("fechaEntradaInicial");
	if(focusElem){
		focusElem.focus();
	}
	
	iniciaMessageDialog();
	funcResizeMain();
	
	$( "tr.datarow" ).hover(
		function() {
		  $(this).addClass("highlight");
		}, 
		function(){
			$(this).removeClass("highlight");
		});
	
	$('#fechaEntradaInicial').datepicker({
		onSelect: function(dateStr) {
			var min = $(this).datepicker('getDate') || new Date();
	        $('#fechaEntradaTerminal').datepicker('option', {minDate: min});
	    	if(dateStr != null){
	    		$("#fechaEntradaTerminal").focus();
	    	}

	    }
	});
	$('#fechaEntradaTerminal').datepicker({
		onSelect: function(dateStr) {
			var max = $(this).datepicker('getDate') || new Date();
	        $('#fechaEntradaInicial').datepicker('option', {maxDate: max});

	    }
	});
	
	$('#fechaEntradaInicial').change(function() {
		var txt = $("#fechaEntradaInicial").val();
		if(txt == ""){
			$('#fechaEntradaTerminal').datepicker('option', {minDate: null});	
		}
	})
	$('#fechaEntradaTerminal').change(function() {
		var txt = $("#fechaEntradaTerminal").val();
		if(txt == ""){
			$('#fechaEntradaInicial').datepicker('option', {maxDate: '0'});	
		}
	})

	
	$('#fechaSalidaInicial').datepicker({
		onSelect: function(dateStr) {
			var min = $(this).datepicker('getDate') || new Date();
	        $('#fechaSalidaTerminal').datepicker('option', {minDate: min});
	    	if(dateStr != null){
	    		$("#fechaSalidaTerminal").focus();
	    	}

	    }
	});
	$('#fechaSalidaTerminal').datepicker({
		onSelect: function(dateStr) {
			var max = $(this).datepicker('getDate') || new Date();
	        $('#fechaSalidaInicial').datepicker('option', {maxDate: max});

	    }
	});
	
	$('#fechaSalidaInicial').change(function() {
		var txt = $("#fechaSalidaInicial").val();
		if(txt == ""){
			$('#fechaSalidaTerminal').datepicker('option', {minDate: null});	
		}
	})
	$('#fechaSalidaTerminal').change(function() {
		var txt = $("#fechaSalidaTerminal").val();
		if(txt == ""){
			$('#fechaSalidaInicial').datepicker('option', {maxDate: '0'});	
		}
	})
	
});

function funcBuscar(){
	if($('#fechaEntradaInicial').val() == "" && $('#fechaEntradaTerminal').val() == "" && $('#fechaSalidaInicial').val() == "" && $('#fechaSalidaTerminal').val() == "" && 
			$('#usuario').val() == ""){
		alert("Ingresa algun texto");
		document.getElementById("fechaEntradaInicial").focus();
		return false;
	}
}


